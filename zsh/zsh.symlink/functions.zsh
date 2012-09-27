function put-key () {
   cat ~/.ssh/id_rsa.pub | ssh $1 "[[ -d ~/.ssh ]] || mkdir ~/.ssh && cat >> ~/.ssh/authorized_keys"
}

function add_to_path () {
    export PATH="$1:$PATH"
}

