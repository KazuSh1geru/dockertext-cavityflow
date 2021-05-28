# Base Image
FROM jupyter/base-notebook

# Maintainer
LABEL maintainer "Shiho ASA"

# Configure environment
ENV CONDA_DIR=/opt/conda \
    NB_USER=jovyan
    
# Install Jupyter Notebook and Hub
RUN conda install --quiet --yes \
    'numpy=1.20.*' \
    'scipy=1.5.*' \
    'sympy=1.6.*' \
    'matplotlib=2.1.*' \
    && conda clean -tipsy && \
    fix-permissions $CONDA_DIR

# Install Sample Notebook
COPY sample_notebook/CavityFlow_with_Navier-Stokes.ipynb /home/$NB_USER/
