# Generated by Django 2.2.8 on 2020-02-26 11:35

from django.db import migrations, models


class Migration(migrations.Migration):

    initial = True

    dependencies = [
    ]

    operations = [
        migrations.CreateModel(
            name='DeepLocSubCellLocation',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('sequence', models.TextField()),
                ('completed', models.BooleanField(default=False)),
            ],
        ),
    ]
