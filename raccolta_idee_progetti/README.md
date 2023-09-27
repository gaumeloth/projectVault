# raccolta idee progetti

idee e documentazione riguardante la gestione dell'itera repository

# Spiegazione dello Script `add_project.sh`

Questo documento fornisce una spiegazione dettagliata del funzionamento e dell'utilizzo dello script `add_project.sh`, che è stato creato per automatizzare l'aggiunta di nuove idee di progetto al repository.

## Come Funziona

Lo script `add_project.sh` è uno script Bash che esegue le seguenti operazioni:

1. **Controllo dei Parametri**: Verifica che siano forniti sia il nome del progetto sia una breve descrizione. Se uno dei due è mancante, lo script terminerà mostrando un messaggio d'uso.

2. **Creazione della Cartella**: Crea una nuova cartella con il nome del progetto fornito come parametro.

3. **Generazione del README**: Crea un file `README.md` nella nuova cartella e vi inserisce il nome e la descrizione del progetto.

4. **Aggiornamento del README Principale**: Aggiorna il `README.md` principale del repository per includere un link alla nuova idea di progetto.

5. **Commit Git**: Aggiunge i nuovi file al repository Git e crea un nuovo commit con un messaggio descrittivo.

## Come Utilizzarlo

Per utilizzare lo script, segui i passaggi seguenti:

1. **Rendere lo Script Eseguibile**: Prima di tutto, rendi lo script eseguibile con il comando seguente:
    ```bash
    chmod +x add_project.sh
    ```

2. **Esecuzione dello Script**: Esegui lo script utilizzando il comando seguente:
    ```bash
    ./add_project.sh "Nome del Progetto" "Breve descrizione del progetto"
    ```

### Esempio

```bash
chmod +x add_project.sh
./add_project.sh "Progetto di Esempio" "Questo è un progetto di esempio."
