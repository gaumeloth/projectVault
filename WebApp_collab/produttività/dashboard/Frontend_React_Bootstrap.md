
# Task 2: Frontend in React e Bootstrap - Componenti e Visualizzazione dei Dati

## Creazione dei Componenti in React

Nella costruzione del frontend con React, l'obiettivo è creare componenti riutilizzabili che rappresentino le varie parti della dashboard di monitoraggio. Ecco un esempio di un componente per un grafico a torta:

\`\`\`javascript
import React from 'react';
import { Pie } from 'react-chartjs-2';

const TaskPieChart = ({ data }) => {
  const chartData = {
    labels: ['Completati', 'In Corso', 'Pianificati'],
    datasets: [
      {
        data: [data.completed, data.inProgress, data.planned],
        backgroundColor: ['#FF6384', '#36A2EB', '#FFCE56'],
      },
    ],
  };

  return <Pie data={chartData} />;
};

export default TaskPieChart;
\`\`\`

## Utilizzo di Bootstrap per il Design Responsivo

Bootstrap ti permette di creare un'interfaccia utente pulita e responsiva. Ecco un esempio di come utilizzare la griglia di Bootstrap:

\`\`\`html
<div className="container">
  <div className="row">
    <div className="col-md-6">
      <!-- TaskPieChart Component -->
    </div>
    <div className="col-md-6">
      <!-- Another Component -->
    </div>
  </div>
</div>
\`\`\`

## Integrazione tra Backend e Frontend

L'interazione tra backend e frontend avviene generalmente attraverso API RESTful o GraphQL. Ecco un esempio di come recuperare i dati:

\`\`\`javascript
fetch('/api/tasks/')
  .then(response => response.json())
  .then(data => /* utilizzare i dati per aggiornare lo stato del componente */);
\`\`\`
