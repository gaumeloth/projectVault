
# Task 1: Backend Django - Struttura dei Modelli e Logica di Aggregazione dei Dati

## Struttura dei Modelli

Nel backend Django, uno dei primi passi è la definizione dei modelli per memorizzare i dati relativi ai KPI. Ecco un esempio più dettagliato di come potrebbe apparire un modello per un task:

```python
from django.db import models
from django.contrib.auth.models import User

class Task(models.Model):
    user = models.ForeignKey(User, on_delete=models.CASCADE)
    name = models.CharField(max_length=255)
    description = models.TextField()
    start_time = models.DateTimeField()
    end_time = models.DateTimeField()
    status = models.CharField(max_length=50)  # Completed, In Progress, etc.
    priority = models.IntegerField()  # 1=High, 2=Medium, 3=Low
```

## Logica di Aggregazione dei Dati

Una volta definiti i modelli, il passo successivo è l'aggregazione dei dati. Django ORM offre metodi di aggregazione come `annotate()` e `aggregate()` che possono essere utili in questo contesto. Per esempio:

```python
from django.db.models import Count, Avg

# Calcolare il numero medio di task completati per utente
average_tasks_completed = Task.objects.filter(status='Completed').values('user').annotate(average=Avg('priority')).aggregate(Avg('average'))
```
