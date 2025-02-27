from django.urls import path, include
from rest_framework.routers import DefaultRouter
from .views import JobCategoryViewSet, JobPostViewSet

router = DefaultRouter()
router.register(r'categories', JobCategoryViewSet)
router.register(r'jobs', JobPostViewSet)

urlpatterns = [
    path('', include(router.urls)),
]
