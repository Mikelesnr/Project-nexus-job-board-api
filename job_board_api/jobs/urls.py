from django.urls import path, include
from rest_framework.routers import DefaultRouter
from rest_framework_simplejwt.views import TokenObtainPairView
from .views import JobCategoryViewSet, JobPostViewSet, RegisterView

router = DefaultRouter()
router.register(r'categories', JobCategoryViewSet)
router.register(r'jobs', JobPostViewSet)

urlpatterns = [
    path('', include(router.urls)),
    path('auth/login/', TokenObtainPairView.as_view(), name='token_obtain_pair'),
    path('auth/register/', RegisterView.as_view(), name='auth_register'),
]
