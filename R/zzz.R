.onLoad <- function(libname, pkgname) {
  library.dynam("vollib", pkgname, libname)
}

.onUnload <- function(libpath) {
  library.dynam.unload("vollib", libpath)
}





