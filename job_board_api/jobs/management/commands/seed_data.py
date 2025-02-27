# jobs/management/commands/seed_data.py

from django.core.management.base import BaseCommand
from jobs.models import JobCategory, JobPost
from django.contrib.auth.models import User
import random

class Command(BaseCommand):
    help = 'Seed database with initial data'

    def handle(self, *args, **kwargs):
        self.stdout.write('Seeding database...')
        self.seed_categories()
        self.seed_jobs()
        self.stdout.write('Database seeded successfully.')

    def seed_categories(self):
        categories = ['Engineering', 'Marketing', 'Finance', 'Sales', 'Human Resources']
        for category_name in categories:
            JobCategory.objects.get_or_create(name=category_name)
        self.stdout.write('Job categories seeded.')

    def seed_jobs(self):
        user = User.objects.first()  # Get the first user
        categories = JobCategory.objects.all()
        for i in range(10):
            job_post = JobPost(
                title=f'Job Title {i+1}',
                description='This is a sample job description.',
                location='Sample Location',
                company_name='Sample Company',
                category=random.choice(categories),
                created_by=user
            )
            job_post.save()
        self.stdout.write('Job posts seeded.')
