#!/usr/bin/env bash
source $HOME/.bashrc
source /etc/profile.d/rvm.sh
rvm use jruby --default

# First, we'll install the provided gems.
cd /cucumber/gems
find . -type f -name "*gem" | \
perl -ane 'system("gem install " . @F[0])'

# Next, we'll install gems required by the Gemfile
cd /cucumber
if [ -e "Gemfile" ]; then
  # Gemfile provided
  bundle install  
else
  echo "No Gemfile provided! Skipping Gemfile installation."
fi
