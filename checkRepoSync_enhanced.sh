#!/bin/bash

# Esegue un fetch dei dati dal repository remoto
fetch_remote() {
    # Esecuzione del comando
    git fetch origin
    exit_code=$?

    # Verifica del codice di uscita
    if [ $exit_code -ne 0 ]; then
        case $exit_code in
            1)
                echo "Errore durante il fetching da 'origin'. Verifica la tua connessione Internet e assicurati che la repository remota esista."
                ;;
            128)
                echo "Comando sconosciuto o errore di esecuzione. Assicurati di avere una versione compatibile di Git."
                ;;
            129)
                echo "Errore di sintassi nel comando. Verifica il comando Git utilizzato."
                ;;
            *)
                echo "Errore sconosciuto. Codice di uscita: $exit_code"
                ;;
        esac
        return $exit_code  # Uso 'return' invece di 'exit' per non terminare l'intero script
    fi
}

# Ottiene l'ultimo commit del branch locale corrente
get_local_commit() {
    # Esecuzione del comando
    git rev-parse @
    exit_code=$?

    # Verifica del codice di uscita
    if [ $exit_code -ne 0 ]; then
        case $exit_code in
            1)
                echo "Impossibile ottenere l'ultimo commit locale. Assicurati di essere nella directory di una repository Git valida."
                ;;
            128)
                echo "Comando sconosciuto o errore di esecuzione. Assicurati di avere una versione compatibile di Git."
                ;;
            129)
                echo "Errore di sintassi nel comando. Verifica il comando Git utilizzato."
                ;;
            *)
                echo "Errore sconosciuto. Codice di uscita: $exit_code"
                ;;
        esac
        return $exit_code  # Uso 'return' invece di 'exit' per non terminare l'intero script
    fi
}

# Ottiene l'ultimo commit del branch remoto associato al branch locale corrente
get_remote_commit() {
    # Esecuzione del comando
    git rev-parse "@{u}"
    exit_code=$?

    # Verifica del codice di uscita
    if [ $exit_code -ne 0 ]; then
        case $exit_code in
            1)
                echo "Impossibile ottenere l'ultimo commit remoto. Verifica la tua connessione Internet e assicurati che la repository remota sia accessibile."
                ;;
            128)
                echo "Comando sconosciuto o errore di esecuzione. Assicurati di avere una versione compatibile di Git."
                ;;
            129)
                echo "Errore di sintassi nel comando. Verifica il comando Git utilizzato."
                ;;
            *)
                echo "Errore sconosciuto. Codice di uscita: $exit_code"
                ;;
        esac
        return $exit_code  # Uso 'return' invece di 'exit' per non terminare l'intero script
    fi
}

# Ottiene l'ultimo commit comune tra il branch locale e il remoto
get_base_commit() {
    # Esecuzione del comando
    git merge-base @ \@{u}
    exit_code=$?

    # Verifica del codice di uscita
    if [ $exit_code -ne 0 ]; then
        case $exit_code in
            1)
                echo "Impossibile trovare l'ultimo commit comune. Verifica se la repository locale e remota sono sincronizzate."
                ;;
            128)
                echo "Comando sconosciuto o errore di esecuzione. Assicurati di avere una versione compatibile di Git."
                ;;
            129)
                echo "Errore di sintassi nel comando. Verifica il comando Git utilizzato."
                ;;
            *)
                echo "Errore sconosciuto. Codice di uscita: $exit_code"
                ;;
        esac
        return $exit_code  # Uso 'return' invece di 'exit' per non terminare l'intero script
    fi
}

# Calcola il numero di commit di differenza tra due commit
count_commits() {
    # Esecuzione del comando
    git rev-list --count "$1".."$2"
    exit_code=$?

    # Verifica del codice di uscita
    if [ $exit_code -ne 0 ]; then
        case $exit_code in
            1)
                echo "Impossibile contare i commit tra gli hash forniti. Verifica la validità degli hash di commit forniti."
                ;;
            128)
                echo "Comando sconosciuto o errore di esecuzione. Assicurati di avere una versione compatibile di Git."
                ;;
            129)
                echo "Errore di sintassi nel comando. Verifica il comando Git utilizzato."
                ;;
            *)
                echo "Errore sconosciuto. Codice di uscita: $exit_code"
                ;;
        esac
        return $exit_code  # Uso 'return' invece di 'exit' per non terminare l'intero script
    fi
}

# Sincronizza la repository locale con la remota quando la remota è avanti
sync_local_with_remote() {
    echo "Sincronizzazione della repository locale in corso..."
    
    # Precondizione: Verifica se sei in una branch valida
    current_branch=$(git branch --show-current)
    if [ -z "$current_branch" ]; then
        echo "Non sei in una branch git valida."
        return 1  # Uso 'return' invece di 'exit' per non terminare l'intero script
    fi
    
    # Esecuzione del comando
    git pull origin "$current_branch"
    exit_code=$?
    
    # Verifica del codice di uscita
    if [ $exit_code -ne 0 ]; then
        case $exit_code in
            1)
                echo "Pull fallita dalla branch corrente. Verifica la tua connessione Internet e i permessi della repository."
                ;;
            128)
                echo "Comando sconosciuto o errore di esecuzione. Assicurati di avere una versione compatibile di Git."
                ;;
            129)
                echo "Errore di sintassi nel comando. Verifica il comando Git utilizzato."
                ;;
            *)
                echo "Errore sconosciuto. Codice di uscita: $exit_code"
                ;;
        esac
        return $exit_code  # Uso 'return' invece di 'exit' per non terminare l'intero script
    else
        echo "Sincronizzazione completata."
    fi
}

# Sincronizza la repository remota con la locale quando la locale è avanti
sync_remote_with_local() {
    echo "Sincronizzazione della repository remota in corso..."
    
    # Precondizione: Verifica se sei in una branch valida
    current_branch=$(git branch --show-current)
    if [ -z "$current_branch" ]; then
        echo "Non sei in una branch git valida."
        return 1  # Uso 'return' invece di 'exit' per non terminare l'intero script
    fi
    
    # Esecuzione del comando
    git push origin "$current_branch"
    exit_code=$?
    
    # Verifica del codice di uscita
    if [ $exit_code -ne 0 ]; then
        case $exit_code in
            1)
                echo "Push fallita alla branch corrente. Verifica i tuoi permessi di scrittura sulla repository remota."
                ;;
            128)
                echo "Comando sconosciuto o errore di esecuzione. Assicurati di avere una versione compatibile di Git."
                ;;
            129)
                echo "Errore di sintassi nel comando. Verifica il comando Git utilizzato."
                ;;
            *)
                echo "Errore sconosciuto. Codice di uscita: $exit_code"
                ;;
        esac
        return $exit_code  # Uso 'return' invece di 'exit' per non terminare l'intero script
    else
        echo "Sincronizzazione completata."
    fi
}

# Risolve le divergenze tra la repository locale e la remota
resolve_divergence() {
    echo "Rilevate divergenze tra la repository locale e la remota."
    echo "Avvio del procedimento guidato per la risoluzione delle divergenze."
    
    # Breve spiegazione sulle differenze tra git rebase e git merge
    echo "Differenze tra git rebase e git merge:"
    echo "  git merge:"
    echo "    - Crea un nuovo commit che unisce i cambiamenti dei due branch."
    echo "    - Mantiene l'intero storico dei commit e l'ordine cronologico."
    echo "    - Potrebbe complicare la lettura dello storico se ci sono molte fusioni."
    echo ""
    echo "  git rebase:"
    echo "    - Sposta o combina una sequenza di commit a una nuova base di commit."
    echo "    - Crea uno storico dei commit più lineare."
    echo "    - Potrebbe richiedere la risoluzione di conflitti per ogni commit."
    echo ""
    # Mostra un menu per scegliere la strategia di risoluzione delle divergenze
    PS3="Scegli un'opzione per risolvere le divergenze: "
options=("git rebase" "git merge" "Annulla")
select opt in "${options[@]}"
do
    case $opt in
        "git rebase")
            git pull --rebase origin "$(git branch --show-current)"
            exit_code=$?
            if [ $exit_code -ne 0 ]; then
                echo "Pull con rebase fallita dalla branch corrente. Verifica la tua connessione Internet e i permessi della repository."
                break
            fi
            echo "Se ci sono conflitti, risolvili e poi esegui 'git rebase --continue'."
            echo "Dopo aver risolto tutti i conflitti, esegui 'git push' per sincronizzare."
            break
            ;;
        "git merge")
            git pull origin "$(git branch --show-current)"
            exit_code=$?
            if [ $exit_code -ne 0 ]; then
                echo "Pull fallita dalla branch corrente. Verifica la tua connessione Internet e i permessi della repository."
                break
            fi
            echo "Se ci sono conflitti, risolvili e poi esegui 'git commit'."
            echo "Dopo aver risolto tutti i conflitti, esegui 'git push' per sincronizzare."
            break
            ;;
        "Annulla")
            echo "Operazione annullata. Nessuna azione intrapresa."
            break
            ;;
        *) echo "Opzione non valida $REPLY";;
    esac
done
}

# Funzione principale per eseguire la verifica
check_repository_status() {
    fetch_remote

    LOCAL=$(get_local_commit)
    REMOTE=$(get_remote_commit)
    BASE=$(get_base_commit)

    LOCAL_AHEAD=$(count_commits "$BASE" "$LOCAL")
    REMOTE_AHEAD=$(count_commits "$BASE" "$REMOTE")

    if [ "$LOCAL" = "$REMOTE" ]; then
        echo "La repository locale è aggiornata."
    elif [ "$LOCAL" = "$BASE" ]; then
        echo "La repository remota è più avanti di $REMOTE_AHEAD commit(s). Esegui un 'git pull' per aggiornare la locale."
    elif [ "$REMOTE" = "$BASE" ]; then
        echo "La repository locale è più avanti di $LOCAL_AHEAD commit(s). Esegui un 'git push' per aggiornare la remota."
    else
        echo "Le repository hanno divergenze. La locale è avanti di $LOCAL_AHEAD commit(s), mentre la remota è avanti di $REMOTE_AHEAD commit(s). Sarà necessario un merge o un rebase."
    fi
}

# Esegui la funzione principale
check_repository_status
