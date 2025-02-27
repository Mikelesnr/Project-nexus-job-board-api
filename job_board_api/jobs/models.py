from django.db import models
from django.contrib.auth.models import User 

# Create your models here.
def get_default_user():
    return User.objects.first().id
class JobCategory(models.Model):
    name = models.CharField(max_length=100)

    def __str__(self):
        return self.name

class JobPost(models.Model):
    title = models.CharField(max_length=255)
    description = models.TextField()
    location = models.CharField(max_length=255)
    company_name = models.CharField(max_length=255)
    category = models.ForeignKey(JobCategory, on_delete=models.CASCADE)
    posted_at = models.DateTimeField(auto_now_add=True)
    created_by = models.ForeignKey(User, on_delete=models.CASCADE) 

    def __str__(self):
        return self.title

