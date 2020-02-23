from django.db import models

class Visitors(models.Model):
	visitor_count = models.IntegerField(default=0)
