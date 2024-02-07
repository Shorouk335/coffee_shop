class DefultValidation {

static String? defaultValidation(String? value) {
    if (value != null) {
      if (value.isEmpty) {
        return ('required Field');
      }
      return null;
    }
    return null;
  }

static String? codeValidation (String? value) {
    if (value != null) {
      if (value.isEmpty) {
        return ('');
      }
      return null;
    }
    return null;
  }









}