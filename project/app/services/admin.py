from django.contrib import admin
from .models import Service

# Register your models here.
class ServiceAdmin(admin.ModelAdmin):
    read_only_fields = ('created', 'updated')

admin.site.register(Service, ServiceAdmin)