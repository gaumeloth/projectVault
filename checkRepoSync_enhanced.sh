#!/bin/bash

# Esegue un fetch dei dati dal repository remoto
fetch_remote() {
    git fetch origin
}

# Ottiene l'ultimo commit del branch locale corrente
get_local_commit() {
    git rev-parse @
}

# Ottiene l'ultimo commit del branch remoto associato al branch locale corrente
get_remote_commit() {
    git rev-parse @{u}
}

# Ottiene l'ultimo commit comune tra il branch locale e il remoto
get_base_commit() {
    git merge-base @ @{u}
}

# Calcola il numero di commit di differenza tra due commit
count_commits() {
    git rev-list --count $1..$2
}

# Sincronizza la repository locale con la remota quando la remota è avanti
sync_local_with_remote() {
    echo "Sincronizzazione della repository locale in corso..."
    git pull origin $(git branch --show-current)
    echo "Sincronizzazione completata."
}

# Sincronizza la repository remota con la locale quando la locale è avanti
sync_remote_with_local() {
    echo "Sincronizzazione della repository remota in corso..."
    git push origin $(git branch --show-current)
    echo "Sincronizzazione completata."
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
                git pull --rebase origin $(git branch --show-current)
                echo "Se ci sono conflitti, risolvili e poi esegui 'git rebase --continue'."
                echo "Dopo aver risolto tutti i conflitti, esegui 'git push' per sincronizzare."
                break
                ;;
            "git merge")
                git pull origin $(git branch --show-current)
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

    LOCAL_AHEAD=$(count_commits $BASE $LOCAL)
    REMOTE_AHEAD=$(count_commits $BASE $REMOTE)

    if [ $LOCAL = $REMOTE ]; then
        echo "La repository locale è aggiornata."
    elif [ $LOCAL = $BASE ]; then
        echo "La repository remota è più avanti di $REMOTE_AHEAD commit(s). Esegui un 'git pull' per aggiornare la locale."
    elif [ $REMOTE = $BASE ]; then
        echo "La repository locale è più avanti di $LOCAL_AHEAD commit(s). Esegui un 'git push' per aggiornare la remota."
    else
        echo "Le repository hanno divergenze. La locale è avanti di $LOCAL_AHEAD commit(s), mentre la remota è avanti di $REMOTE_AHEAD commit(s). Sarà necessario un merge o un rebase."
    fi
}

# Esegui la funzione principale
check_repository_status
