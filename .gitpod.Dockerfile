FROM rocker/tidyverse:latest
RUN R -e 'install.packages("remotes")'
RUN R -e 'remotes::install_github("r-lib/remotes", ref = "6c8fdaa")'
RUN R -e 'remotes::install_cran("tibble")'
RUN R -e 'remotes::install_cran("dockerfiler", dependencies = TRUE)'
COPY gapminder_*.tar.gz /app.tar.gz
RUN remotes::install_local('/app.tar.gz')
EXPOSE 8787
ENV "PASSWORD"="password"
