# Generated by Django 2.1 on 2019-11-07 05:49

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('secstructclasspred', '0001_initial'),
    ]

    operations = [
        migrations.CreateModel(
            name='SecondaryStructureClassPrediction',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('sequence', models.TextField()),
                ('completed', models.BooleanField(default=False)),
            ],
        ),
        migrations.DeleteModel(
            name='ProteinSequence',
        ),
    ]