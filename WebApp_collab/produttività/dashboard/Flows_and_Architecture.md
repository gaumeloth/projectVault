
# Task 3: Flusso di Dati e Architettura Generale del Progetto

## Architettura Monolitica vs Architettura a Microservizi

### Architettura Monolitica

#### Flusso di Dati

1. **Raccolta Dati**: Il backend Django raccoglie i dati dai vari modelli e li aggrega secondo le specifiche dei KPI.
2. **Esposizione API**: Il backend espone questi dati attraverso un API RESTful.
3. **Chiamate API**: Il frontend React effettua chiamate all'API per ottenere i dati necessari.
4. **Rendering**: Una volta ottenuti i dati, i componenti React li utilizzano per renderizzare i vari grafici e tabelle.

#### Codice di Esempio per l'API RESTful in Django

```python
from rest_framework import serializers, viewsets
from .models import Task

class TaskSerializer(serializers.ModelSerializer):
    class Meta:
        model = Task
        fields = '__all__'

class TaskViewSet(viewsets.ModelViewSet):
    queryset = Task.objects.all()
    serializer_class = TaskSerializer
```

#### Codice di Esempio per la Chiamata API in React

```javascript
import axios from 'axios';

axios.get('/api/tasks/')
     .then(response => {
         const tasks = response.data;
         // Aggiornare lo stato del componente con i dati ricevuti
     });
```

### Architettura a Microservizi

#### Flusso di Dati

1. **Raccolta Dati**: Ogni microservizio è responsabile per una specifica funzionalità.
2. **Comunicazione tra Microservizi**: I microservizi comunicano tra loro utilizzando protocolli come HTTP/REST o messaggistica asincrona come RabbitMQ o Kafka.
3. **Esposizione API**: Ogni microservizio espone la propria API.
4. **API Gateway**: Un API Gateway funge da punto unico di ingresso per tutte le chiamate esterne.
5. **Chiamate API dal Frontend**: Il frontend effettua chiamate all'API Gateway.
6. **Rendering nel Frontend**: I dati recuperati vengono utilizzati per il rendering dei componenti React.

#### Codice di Esempio per la Comunicazione tra Microservizi in Django

```python
import requests

def fetch_aggregated_task_data():
    response = requests.get('http://task-service/api/tasks/aggregated')
    if response.status_code == 200:
        return response.json()
```

#### Considerazioni di Scalabilità e Distribuzione

In un'architettura a microservizi, ogni servizio può essere scalato indipendentemente. Per la distribuzione, potresti utilizzare container Docker e orchestrazione con Kubernetes.
