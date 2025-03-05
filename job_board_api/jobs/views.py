from rest_framework import viewsets, generics, status
from rest_framework.permissions import IsAuthenticated, AllowAny
from .models import JobCategory, JobPost
from .serializers import JobCategorySerializer, JobPostSerializer, RegisterSerializer, UserProfileSerializer
from django.contrib.auth.models import User
from rest_framework_simplejwt.tokens import RefreshToken
from rest_framework.response import Response
from rest_framework.decorators import api_view
from django_filters.rest_framework import DjangoFilterBackend
from .filters import JobPostFilter
from django.shortcuts import render
from django.core.mail import send_mail
from django.template.loader import render_to_string
from django.http import HttpResponse
from django.utils.http import urlsafe_base64_decode,urlsafe_base64_encode
from django.urls import reverse
from job_board_api.settings import EMAIL_HOST_USER
from django.utils.encoding import force_str,force_bytes
from django.contrib.auth import get_user_model
from .tokens import account_activation_token
from datetime import datetime
import os
from dotenv import load_dotenv

# Create your views here.

User = get_user_model()

# views.py

User = get_user_model()

@api_view(['GET'])
def activate(request, uidb64, token):
    try:
        uid = force_str(urlsafe_base64_decode(uidb64))
        user = User.objects.get(pk=uid)
    except (TypeError, ValueError, OverflowError, User.DoesNotExist):
        user = None

    if user is not None and account_activation_token.check_token(user, token):
        user.is_active = True
        user.save()
        return Response({'message': 'Account activated successfully.'}, status=status.HTTP_200_OK)
    else:
        return Response({'error': 'Activation link is invalid!'}, status=status.HTTP_400_BAD_REQUEST)


#test smtp email configuration
def send_test_email(request):
    subject = 'Test Email'
    message = 'This is a test email sent from Django.'
    from_email = 'ivhuourpride@gmail.com'
    recipient_list = ['mwanza.n.m@gmail.com']
    
    send_mail(subject, message, from_email, recipient_list)
    
    return HttpResponse('Email sent successfully!')


def home(request):
    return render(request, 'home.html')

class RegisterView(generics.CreateAPIView):
    queryset = User.objects.all()
    permission_classes = (AllowAny,)
    serializer_class = RegisterSerializer

    def post(self, request, *args, **kwargs):
        serializer = self.get_serializer(data=request.data)
        serializer.is_valid(raise_exception=True)
        
        try:
            user = serializer.save()
            refresh = RefreshToken.for_user(user)

            return Response({
                'refresh': str(refresh),
                'access': str(refresh.access_token),
            }, status=status.HTTP_201_CREATED)

        except Exception as e:
            return Response({"error": str(e)}, status=status.HTTP_400_BAD_REQUEST)

class UserProfileView(generics.RetrieveUpdateAPIView):
    queryset = User.objects.all()
    serializer_class = UserProfileSerializer
    permission_classes = [IsAuthenticated]

    def get_object(self):
        return self.request.user

class JobCategoryViewSet(viewsets.ModelViewSet):
    queryset = JobCategory.objects.all()
    serializer_class = JobCategorySerializer

class JobPostViewSet(viewsets.ModelViewSet):
    queryset = JobPost.objects.all()
    serializer_class = JobPostSerializer
    filter_backends = [DjangoFilterBackend]
    filterset_class = JobPostFilter

    def get_permissions(self):
        if self.action in ['create', 'update', 'partial_update', 'destroy']:
            self.permission_classes = [IsAuthenticated]
        else:
            self.permission_classes = [AllowAny]
        return super().get_permissions()

    def perform_create(self, serializer):
        serializer.save(created_by=self.request.user)


account_activation_token

class RegisterView(generics.CreateAPIView):
    queryset = User.objects.all()
    permission_classes = (AllowAny,)
    serializer_class = RegisterSerializer

    def post(self, request, *args, **kwargs):
        serializer = self.get_serializer(data=request.data)
        serializer.is_valid(raise_exception=True)
        
        try:
            user = serializer.save()
            user.is_active = False
            user.save()

            # Generate token
            token = account_activation_token.make_token(user)
            uid = urlsafe_base64_encode(force_bytes(user.pk))
            activation_link = request.build_absolute_uri(
                reverse('activate', kwargs={'uidb64': uid, 'token': token})
            )

            # Render email template
            email_subject = 'Activate Your Job Board Account'
            email_body = render_to_string('activation_email.html', {
                'user': user,
                'activation_link': activation_link,
                'year': datetime.now().year
            })

            # Send activation email
            send_mail(
                email_subject,
                email_body,
                os.getenv('EMAIL_HOST_USER'),
                [user.email],
                fail_silently=False,
                html_message=email_body
            )

            return Response({
                'message': 'User registered successfully. Please check your email to activate your account.'
            }, status=status.HTTP_201_CREATED)

        except Exception as e:
            return Response({"error": str(e)}, status=status.HTTP_400_BAD_REQUEST)
