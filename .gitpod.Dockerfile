FROM gitpod/workspace-full
USER gitpod

# Install Ruby version 3.1.2 and set it as default
RUN echo "rvm_gems_path=/home/gitpod/.rvm" > ~/.rvmrc
RUN bash -lc "rvm install ruby-3.1.2 &&               rvm use ruby-ruby-3.1.2 --default"
RUN echo "rvm_gems_path=/workspace/.rvm" > ~/.rvmrc
