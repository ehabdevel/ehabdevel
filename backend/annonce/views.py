import os
from django.shortcuts import get_object_or_404, render
from django.http import HttpResponseRedirect
from django.urls import reverse
from django.views import generic
from django.utils import timezone

from annonce.models import Demand

# Create your views here.
class IndexView(generic.ListView):
    template_name = 'annonce/index.html'
    context_object_name = 'latest_demand_list'

    def get_queryset(self):
        return Demand.objects.filter(
            publish_date__lte=timezone.now()
        ).order_by('-publish_date')[:5]


class DetailView(generic.DetailView):
    model = Demand
    template_name = 'annonce/detail.html'

    def get_queryset(self):
        return Demand.objects.filter(publish_date__lte=timezone.now())