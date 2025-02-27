
from rest_framework import viewsets
from rest_framework.permissions import IsAuthenticated  # Import the IsAuthenticated permission
from .models import JobCategory, JobPost
from .serializers import JobCategorySerializer, JobPostSerializer

# Create your views here.
class JobCategoryViewSet(viewsets.ModelViewSet):
    queryset = JobCategory.objects.all()
    serializer_class = JobCategorySerializer

class JobPostViewSet(viewsets.ModelViewSet):
    queryset = JobPost.objects.all()
    serializer_class = JobPostSerializer
    permission_classes = [IsAuthenticated]  # Require authentication for job posts

    def perform_create(self, serializer):
        serializer.save(created_by=self.request.user)  # Automatically set the created_by field
