FROM rocker/tidyverse:latest
RUN R -e 'install.packages("remotes")'
RUN R -e 'remotes::install_github("r-lib/remotes", ref = "6c8fdaa")'
RUN R -e 'remotes::install_cran("attempt")'
RUN R -e 'remotes::install_cran("tibble")'
RUN R -e 'remotes::install_cran("dockerfiler")'
EXPOSE 8787
ENV "PASSWORD"="password"
USER root
