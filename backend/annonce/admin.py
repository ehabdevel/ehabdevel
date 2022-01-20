from django.contrib import admin
from .models import Demand, Profile

# Register your models here.
@admin.register(Demand)
class DemandAdmin(admin.ModelAdmin):
    list_display = ('title', 'notes', 'blood_type', 'address1', 'address2', 'address3', 'city', 'country', 'demander_name', 'contact_name', 'contact_tel', 'status', 'date_created', 'publish_date', 'published', 'author')
    list_filter = ('status', 'date_created', 'publish_date', 'published')
    search_fields = ('title', 'notes', 'blood_type', 'address1', 'address2', 'address3', 'city', 'country', 'demander_name', 'contact_name', 'contact_tel', 'status', 'date_created', 'publish_date', 'published', 'author')
    date_hierarchy = 'publish_date'
    save_on_top = True

@admin.register(Profile)
class ProfileAdmin(admin.ModelAdmin):
    model = Profile