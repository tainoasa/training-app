# Generated by Django 3.0.5 on 2023-10-04 05:25

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('todo', '0003_training_list'),
    ]

    operations = [
        migrations.CreateModel(
            name='Recommend_history',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('input_txt', models.TextField()),
                ('recommend_name', models.CharField(max_length=30)),
            ],
        ),
    ]