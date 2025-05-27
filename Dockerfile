FROM python:3.10-slim

RUN apt-get update && apt-get install -y \
    curl \
    build-essential \
    libgl1-mesa-glx \
    libx11-6 \
    libxext6 \
    libsm6 \
    libxrender1 && \
    rm -rf /var/lib/apt/lists/*

ENV CONDA_DIR=/opt/conda
ENV PATH=$CONDA_DIR/bin:$PATH

RUN curl -fsSL https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh -o /tmp/miniconda.sh && \
    bash /tmp/miniconda.sh -b -p $CONDA_DIR && \
    rm /tmp/miniconda.sh && \
    conda clean -afy

RUN conda install -y -c conda-forge python=3.10 cadquery ocp typing_extensions && \
    conda clean --all -f -y

WORKDIR /workspace

CMD ["python", "gartenhauts.py"]
