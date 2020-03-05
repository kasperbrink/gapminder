#' Create a gitpod ready dockerfile from a R description file
#'
#' @param FROM \code{character} FROM of the Dockerfile
#' @param AS \code{character} AS of the Dockerfile
#' @param rstudio \code{logical} if using a rstudio server image open ports
#'
#' @return A Dockerfile Object.
#' @export
#'
#' @examples
create_gp_dockerfile <- function(FROM, AS = NULL, rstudio = TRUE){
  # create a dockerfile
  dfile <- dockerfiler::dock_from_desc(FROM = FROM, AS = AS)
  # if using a rstudio image open port 8787 and set password
  if(rstudio){
    dfile$EXPOSE(8787)
    dfile$ENV("PASSWORD", "password")
  }
  # write file
  dfile$write(as = ".gitpod.Dockerfile")
}


create_gp_yml <- function(){
  writeLines(c("image:",
               "  file: .gitpod.Dockerfile",
               "ports:",
               "  - port: 8787",
               "onOpen: open-preview",
               "tasks:",
               "  - command: /usr/lib/rstudio-server/bin/rstudio-server start",
               "vscode:",
               "  extensions:",
               "  - Ikuyadeu.r@1.2.1:z5vr1v1bfS++U/aHLSXQ6Q=="),
             ".gitpod.yml"
  )
}


create_gp_dockerfile(FROM = "rocker/tidyverse:latest")


create_gp_yml()


