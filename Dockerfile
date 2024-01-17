FROM rust:bookworm

RUN apt-get update 

RUN curl -fsSL https://deb.nodesource.com/setup_current.x | bash - && \
    apt-get install -y nodejs \
    build-essential && \
    node --version && \ 
    npm --version

RUN npm install --global yarn
RUN git config --global core.symlinks true
# RUN git clone https://github.com/toeverything/AFFiNE.git
# RUN cd AFFiNE

WORKDIR AFFiNE

COPY . .

RUN yarn workspace @affine/native build

RUN yarn workspace @affine/storage build

CMD ["yarn", "workspace", "@affine/server"" , "dev"]

