FROM bioconductor/bioconductor_docker:devel

USER root

RUN apt-get update && apt-get install -y openssl libssl-dev curl libcurl4-openssl-dev libxml2-dev git tcl tk
RUN Rscript -e "library(BiocManager); install(c('magicaxis','AnnotationDbi','org.Hs.eg.db','annotate', 'genefilter', 'sva', 'dplyr', 'curl', 'openssl', 'git2r', 'httr', 'httpuv', 'devtools', 'XML'))"
RUN Rscript -e "install.packages('http://www.cbs.dtu.dk/biotools/jetset/current/jetset_3.4.0.tar.gz', repos = NULL, type = 'source')"
RUN Rscript -e "install.packages('XML', repos = 'https://cran.r-project.org/')"
RUN Rscript -e "library(BiocManager); install(c('caTools', 'piano', 'downloader', 'RColorBrewer', 'magicaxis', 'WriteXLS', 'gdata', 'R.utils','Hmisc', 'affy', 'affxparser', 'affyio', 'frma', 'hthgu133afrmavecs', 'hthgu133acdf', 'hthgu133a.db', 'hgu133a.db', 'hgu133afrmavecs', 'hgu133plus2frmavecs', 'hgu133plus2.db','PharmacoGx', 'lsa'))"
RUN Rscript -e "install.packages('readr')"
RUN Rscript -e "install.packages('gdata')"
RUN Rscript -e "install.packages('openxlsx')"
RUN Rscript -e "install.packages('readxl')"
RUN Rscript -e "install.packages('stringi')"
RUN Rscript -e "install.packages('stringr')"
RUN Rscript -e "install.packages('reshape2')"
RUN Rscript -e "install.packages('abind')"
RUN Rscript -e "install.packages('data.table')"
RUN Rscript -e "install.packages('biocompute')"
RUN Rscript -e "install.packages('plyr')"
RUN Rscript -e "library(BiocManager); install(c('CoreGx','tximport','rhdf5','hgu133plus2frmavecs','SummarizedExperiment','multtest','NMF','rmarkdown','limma','RaggedExperiment'))"
RUN wget 'https://filesforpublic.blob.core.windows.net/pgxprivate/genefu.tar.gz'
RUN Rscript -e "library(devtools); install.packages('genefu.tar.gz', repos = NULL, type='source')"
RUN wget 'https://filesforpublic.blob.core.windows.net/pgxprivate/compareDrugScreens_current.tar.gz'
RUN Rscript -e "install.packages('https://cran.r-project.org/src/contrib/Archive/glmnet/glmnet_2.0-16.tar.gz', repos=NULL, type='source')"
RUN Rscript -e "install.packages('caret')"
RUN Rscript -e "install.packages('DT')"
RUN Rscript -e "install.packages('compareDrugScreens_current.tar.gz', repos = NULL)"
