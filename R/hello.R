potencia <- function(x, y) {
  if (y == 0) {
    return(1)
  } else if (y < 0) {
    return(1 / potencia(x, -y))
  } else {
    mitad <- potencia(x, y %/% 2)
    if (y %% 2 == 0) {
      return(mitad * mitad)
    } else {
      return(x * mitad * mitad)
    }
  }
}

calcular_potencia_compuesta <- function(x, y, z) {
  resultado_xy <- potencia(x, y)
  return(potencia(resultado_xy, z))
}

calcular_potencia_compuesta(2,3,2)

