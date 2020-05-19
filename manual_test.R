# To use this file, first build and install nimbleTestPkg as follows
# In the outer directory,
#   R CMD build nimbleTestPkg
#   R CMD install nimbleTextPkg_0.0.1.tar.gz

# Make sure to start in a new session so things aren't preloaded

# Load the package
require(nimbleTestPkg)

# Make
toyCode <- nimbleCode({
  x ~ dnorm(0, 1)
})
toyModel <- nimbleModel(code = toyCode, data = list(x = 1))

# This one breaks.
toyModel$x
my_addone <- toyNimbleFun(model = toyModel, node = "x")
my_addone$addOne()
toyModel$x


# This should work, because it sources the function into .GlobalEnv
source("R/toyNimbleFun.R")
toyModel$x
my_addone_sourced <- toyNimbleFun(model = toyModel, node = "x")
my_addone_sourced$addOne()
toyModel$x
