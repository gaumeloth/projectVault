# Archivio Idee di Progetto
Questo repository è una raccolta delle mie idee per vari progetti. Ogni idea è organizzata in una cartella separata e contiene ulteriori dettagli e appunti.

## Indice dei Progetti
1. [raccolta_idee_progetti](./raccolta_idee_progetti/README.md) **[D]**: Idee e documentazione riguardante la gestione dell'itera repository
2. [WebApp_collab](./WebApp_collab/README.md) **[IC]**: Progetto per un applicazione web da sviluppare assieme
3. [archphone](./archphone/README.md) **[IC]**: Arch Linux su Dispositivi Mobili: Una Guida Completa alla Telefonia e alla Messaggistica
4. [Godot_2D_topdown_shooter](./Godot_2D_topdown_shooter/README.md): mio primo progetto con il motore grafico FOSS Godot per imparare a sviluppare videogiochi
<!-- PROJECTS_LIST -->

## Come Utilizzare Questo Repository Per aggiungere una nuova idea:
### Aggiungere una Nuova Idea Manualmente
1. Crea una nuova cartella con un nome descrittivo.
2. Aggiungi un `README.md` nella cartella con dettagli e appunti relativi all'idea.
3. Aggiorna questo README principale per includere un link alla nuova idea.

### Aggiungere una Nuova Idea Utilizzando lo Script di Automazione
Se sei su un sistema Unix-like, puoi utilizzare lo script di automazione `add_project.sh` per aggiungere una nuova idea in modo più rapido e strutturato. Ecco come fare:
1. Apri il terminale e naviga alla cartella del repository.
2. Esegui lo script utilizzando il comando seguente:
```bash
./add_project.sh "Nome del Progetto" "Breve descrizione del progetto"
``` 

Questo creerà una nuova cartella con il nome del progetto, aggiungerà un file `README.md` con la descrizione fornita e aggiornerà automaticamente questo README principale.

**Nota**: Assicurati di rendere lo script eseguibile prima di utilizzarlo. Puoi farlo con il comando `chmod +x add_project.sh`. 

Esempio:
```bash
chmod +x add_project.sh ./add_project.sh "Progetto di Esempio" "Questo è un progetto di esempio."
```

## Struttura del Repository

La struttura di questa repository è progettata per facilitare la gestione e la navigazione di vari progetti e idee. Di seguito sono presentati i principali componenti:

- `README.md`: Fornisce una panoramica generale del repository, inclusi i dettagli su come contribuire e navigare nella struttura.
- `LICENSE`: Contiene le informazioni sulla licenza sotto la quale sono rilasciati i contenuti della repository.
- `scripts/`: Una cartella che racchiude vari script di utilità per la gestione dei progetti e delle idee.
  
Ogni progetto o idea è contenuto in una sua cartella separata, che include un file `README.md` specifico per quel progetto. Questo file `README.md` fornisce informazioni dettagliate sul progetto, incluso il suo stato, come contribuire, e altri dettagli pertinenti.

### Logica di Organizzazione delle Cartelle

- Cartelle come `WebApp_collab/`, `archphone/`, `raccolta_idee_progetti/`, etc.: Ogni cartella rappresenta un progetto o un'idea in fase iniziale di esplorazione o valutazione.
  - Queste cartelle contengono un file `README.md` specifico che fornisce informazioni preliminari sull'idea o sul progetto. Si prega di notare che questi progetti sono in una fase di definizione e non sono ancora stati promossi a progetti indipendenti con una propria repository.

### Script di Utilità

La cartella `scripts/` contiene vari script di utilità che automatizzano e facilitano la gestione della repository. Di seguito è fornito un elenco completo:

- `add_project.sh`: Utilizzato per aggiungere nuovi progetti o idee all'indice nel README principale. Questo script aggiorna automaticamente l'elenco, permettendo una facile gestione delle idee e dei progetti contenuti nella repository.
- `transition_project.sh`: Guida l'utente attraverso il processo di promozione di un progetto da un'idea in fase iniziale a un progetto indipendente con una propria repository. Include passaggi come la creazione di una nuova repository, la migrazione dei file e l'aggiornamento dell'indice nel README principale.

Ogni script è documentato in dettaglio, sia all'interno dello script stesso che in documenti separati, per facilitare la comprensione e l'utilizzo.

## Stato del Progetto

Questa sezione serve come legenda per comprendere lo stato attuale di tutte le idee e progetti contenuti in questa repository. L'obiettivo è fornire un modo rapido e intuitivo per discernere la fase di sviluppo di ciascun elemento elencato, e per tracciare quelli che sono stati spostati in repository separate.

### Indice dei Progetti nel README Principale

L'indice nel README principale elenca tutte le idee e i progetti. Ogni voce sarà accompagnata da uno o più dei seguenti tag per indicare il suo stato:

- **[IC]**: **Initial Conception** - L'idea è in fase di valutazione e potrebbe diventare un progetto in futuro.
- **[D]**: **In Development** - Il progetto è attivamente in fase di sviluppo.
- **[C]**: **Completed** - Il progetto è stato completato.
- **[P]**: **On Pause** - Lo sviluppo del progetto è momentaneamente sospeso.
- **[A]**: **Archived** - Il progetto è stato abbandonato o completato e non sarà ulteriormente sviluppato.
- **[SR]**: **Separate Repository** - Questo progetto è ora ospitato in una propria repository.

## Licenza
Questo progetto è distribuito sotto la Licenza GPLv3 - vedi il file [LICENSE](LICENSE) per i dettagli.
