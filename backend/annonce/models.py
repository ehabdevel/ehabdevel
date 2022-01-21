from django.db import models
from django.conf import settings


# Create your models here.
class Profile(models.Model):
    BLOOD_CHOICES = [
        ('N', 'NONE'),
        ('AP', 'A+'),
        ('AN', 'A-'),
        ('BP', 'B+'),
        ('BN', 'B-'),
        ('ABP', 'AB+'),
        ('ABN', 'AB-'),
        ('OP', 'O+'),
        ('ON', 'O-'),
    ]

    user = models.OneToOneField(
        settings.AUTH_USER_MODEL,
        on_delete=models.PROTECT,
    )
    isDonator = models.BooleanField(default=False)
    phone = models.CharField(max_length=20, blank=True)
    city = models.CharField(max_length=50, blank=True)
    country = models.CharField(max_length=50, blank=True)
    blood_type = models.CharField(max_length=3, choices=BLOOD_CHOICES, default='N')
    # picture = models.ImageField(upload_to='profile_pics', blank=True)
    website = models.URLField(blank=True)
    bio = models.CharField(max_length=240, blank=True)

    def __str__(self):
        return self.user.get_username()


class Demand(models.Model):
    BLOOD_CHOICES = [
        ('N', 'NONE'),
        ('AP', 'A+'),
        ('AN', 'A-'),
        ('BP', 'B+'),
        ('BN', 'B-'),
        ('ABP', 'AB+'),
        ('ABN', 'AB-'),
        ('OP', 'O+'),
        ('ON', 'O-'),
    ]
    id = models.AutoField(primary_key=True)
    title = models.CharField(max_length=100)
    notes = models.TextField(blank=True)
    blood_type = models.CharField(
        max_length=3, choices=BLOOD_CHOICES, default='N')
    address1 = models.CharField(max_length=100, blank=False)
    address2 = models.CharField(max_length=100)
    address3 = models.CharField(max_length=100)
    city = models.CharField(max_length=50, blank=False)
    country = models.CharField(max_length=50, blank=False)
    demander_name = models.CharField(max_length=50)
    contact_name = models.CharField(max_length=50, blank=False)
    contact_tel = models.CharField(max_length=50, blank=False)
    status = models.BooleanField()
    date_created = models.DateTimeField(auto_now_add=True)
    publish_date = models.DateTimeField(blank=True, null=True)
    published = models.BooleanField(default=False)
    author = models.ForeignKey(Profile, on_delete=models.PROTECT)

    class Meta:
        ordering = ['-publish_date']

    def __init__(self, *args):
        super(Demand, self).__init__(*args)

