FROM python:3.6

RUN apt-get update && \
    apt-get install -y mecab \
    libmecab-dev \
    mecab-ipadic \
    mecab-ipadic-utf8 \
    git \
    sudo \
    vim

RUN apt-get clean && \
    rm -rf /var/lib/apt/lists/*

RUN git clone --depth 1 https://github.com/neologd/mecab-ipadic-neologd.git
RUN mecab-ipadic-neologd/bin/install-mecab-ipadic-neologd -n -y && \
    rm -rf mecab-ipadic-neologd

RUN pip --no-cache-dir install \
    jupyter \
    pandas \
    matplotlib \
    sklearn \
    numpy \
    scipy \
    gensim \
    mecab-python3 \
    tensorflow

COPY jupyter_notebook_config.py /root/.jupyter/

ENV IPYTHON_KERNEL_CONFIG /root/.ipython/profile_default/ipython_kernel_config.py
RUN ipython profile create
RUN echo "c.IPKernelApp.matplotlib = 'inline'" >>${IPYTHON_KERNEL_CONFIG}

WORKDIR /notebooks
CMD jupyter notebook --allow-root
