from django.db import models

# Create your models here.
class ProteinSequence(models.Model):
    sequence = models.CharField(max_length=100)