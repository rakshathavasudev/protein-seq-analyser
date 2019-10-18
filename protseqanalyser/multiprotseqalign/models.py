from django.db import models

# Create your models here.
class ProteinSequence(models.Model):
    # id_no = models.AutoField(primary_key=True)
    sequence = models.TextField()
    completed = models.BooleanField(default=False)
    

# class jobs(models.Model):
#     completed = models.Bool