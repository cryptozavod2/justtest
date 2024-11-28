push_to_github() {
    local repo_dir=$1
    local git_user=$2
    local git_email=$3
    local ssh_key=$4
    local remote_url=$5

    cp "$ssh_key" '/root/.ssh/id_rsa'

    rm -r .git

    git config --global user.name "$git_user"
    git config --global user.email "$git_email"

    ssh -T git@github.com

    git init
    git add .
    git checkout -b main
    git commit -m "Automated commit"
    git push -f "$remote_url" main
}


while true; do
    push_to_github "justtest" "cryptozavod2" "cryptozavod24+2@gmail.com" "/root/.ssh/id_rsa1" "git@github.com:cryptozavod2/justtest.git"
    push_to_github "justtest" "lanatwinkle" "lanatwinkle.ee@gmail.com" "/root/.ssh/id_rsa2" "git@github.com:lanatwinkle/justtest.git"
    echo "sleep 300"
    sleep 300
done
