from . import views
from django.urls import path

urlpatterns = [
    path('', views.SerialsView.as_view()),
    path('<slug>', views.SerialDetailView.as_view(), name='serial'),

]
