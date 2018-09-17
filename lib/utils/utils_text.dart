class UtilsTexto {

  static isTextoValido(String texto){
    if(texto == null){
      return false;
    }

    if(texto.length == 0){
      return false;
    }

    return true;
  }

}