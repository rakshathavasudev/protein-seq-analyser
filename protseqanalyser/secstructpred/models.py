from django.db import models

# Create your models here.
class SecondaryStructurePrediction(models.Model):
    # id_no = models.AutoField(primary_key=True)
    sequence = models.TextField()
    completed = models.BooleanField(default=False)