#' @name toyNimbleFun
#' @title toyNimbleFun
#' @author Ben Goldstein
#' @details 
#' This function tests whether there's an issue with nimbleFunction namespacing
#' when making packages with NIMBLE. This comes up if you're trying to define
#' and use a NIMBLE class.
#' 
#' @param model a nimbleModel
#' @param node a character string naming a single node in the provided nimbleModel
#' @return NULL
#' @export
toyNimbleFun <- nimbleFunction(
  name = "toyNimbleFun",
  setup = function(model, node){
  },
  methods = list(
    addOne = function(){
      model[[node]] <<- model[[node]] + 1
    }
  ),
  where = getLoadingNamespace()
)

