npsurv <- function(formula, data, subset, na.action, ...)
{
  M <- match.call()
  m <- M
  m[[1]] <- as.name('model.frame')
  m[names(m) %nin% c('', 'formula', 'data', 'subset', 'na.action')] <- NULL
  g <- eval(m, sys.parent())
  Y <- model.extract(g, 'response')

  m <- M
  m[[1]] <- as.name('survfit')
  m$formula <- formula
  f <- eval(m, sys.parent())
  f$maxtime <- max(f$time)
  f$units <- units(Y)
  f$time.label  <- label(Y, type='time')
  f$event.label <- label(Y, type='event')
  f$call <- match.call()
  class(f) <- c('npsurv', class(f))
  f
}
