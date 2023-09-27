# Archivio Idee di Progetto
Questo repository è una raccolta delle mie idee per vari progetti. Ogni idea è organizzata in una cartella separata e contiene ulteriori dettagli e appunti.

## Indice dei Progetti
2. [raccolta_idee_progetti](raccolta%20idee%20progetti.md): idee e documentazione riguardante la gestione dell'itera repository
3. [Nome del Progetto 2](./NomeCartellaProgetto2/README.md) - Breve descrizione del progetto 2
4. [Nome del Progetto 3](./NomeCartellaProgetto3/README.md) - Breve descrizione del progetto 3

## Come Utilizzare Questo Repository Per aggiungere una nuova idea:
### Aggiungere una Nuova Idea Manualmente
1. Crea una nuova cartella con un nome descrittivo.
2. Aggiungi un `README.md` nella cartella con dettagli e appunti relativi all'idea.
3. Aggiorna questo README principale per includere un link alla nuova idea.

### Aggiungere una Nuova Idea Utilizzando lo Script di Automazione
Se sei su un sistema Unix-like, puoi utilizzare lo script di automazione `add_project.sh` per aggiungere una nuova idea in modo più rapido e strutturato. Ecco come fare:
1. Apri il terminale e naviga alla cartella del repository.
2. Esegui lo script utilizzando il comando seguente:
```bash ./add_project.sh "Nome del Progetto" "Breve descrizione del progetto"
``` 

Questo creerà una nuova cartella con il nome del progetto, aggiungerà un file `README.md` con la descrizione fornita e aggiornerà automaticamente questo README principale.

**Nota**: Assicurati di rendere lo script eseguibile prima di utilizzarlo. Puoi farlo con il comando `chmod +x add_project.sh`. 

Esempio:
```bash chmod +x add_project.sh ./add_project.sh "Progetto di Esempio" "Questo è un progetto di esempio."
```

## Struttura del Repository
- `/NomeCartellaProgetto1/` - Dettagli sul "Nome del Progetto 1"
- `/NomeCartellaProgetto2/` - Dettagli sul "Nome del Progetto 2" -
- `/NomeCartellaProgetto3/` - Dettagli sul "Nome del Progetto 3"

## Stato del Repository
- `master` contiene le idee attualmente in esplorazione.
- `in-progress` contiene idee che sono attivamente in fase di sviluppo.
- `archive` contiene idee che sono state messe in pausa o abbandonate.

## Licenza
Questo progetto è distribuito sotto la Licenza MIT - vedi il file [LICENSE.md](LICENSE.md) per i dettagli.- [WebApp collab](./WebApp collab/): progetto per un applicazione web da sviluppare assieme
