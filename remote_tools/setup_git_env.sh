# Sets up github on a virtual instance. Copy and run with:
# gcloud compute copy-files setup_git_env.sh my-instance:~/.

git clone https://github.com/tvykruta/gce_test.git
git config --global user.email "tomasv@gmail.com"
git config --global user.name "Tom Vykruta"
