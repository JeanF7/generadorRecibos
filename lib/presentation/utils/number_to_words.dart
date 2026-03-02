class NumberToWords {
  static const _unidades = [
    '', 'UN ', 'DOS ', 'TRES ', 'CUATRO ', 'CINCO ', 'SEIS ', 'SIETE ', 'OCHO ', 'NUEVE '
  ];

  static const _diez = [
    'DIEZ ', 'ONCE ', 'DOCE ', 'TRECE ', 'CATORCE ', 'QUINCE ', 'DIECISIEIS ', 
    'DIECISIETE ', 'DIECIOCHO ', 'DIECINUEVE '
  ];

  static const _decenas = [
    '', 'DIEZ ', 'VEINTE ', 'TREINTA ', 'CUARENTA ', 'CINCUENTA ', 'SESENTA ', 'SETENTA ', 'OCHENTA ', 'NOVENTA '
  ];

  static const _centenas = [
    '', 'CIENTO ', 'DOSCIENTOS ', 'TRESCIENTOS ', 'CUATROCIENTOS ', 'QUINIENTOS ', 
    'SEISCIENTOS ', 'SETECIENTOS ', 'OCHOCIENTOS ', 'NOVECIENTOS '
  ];

  static String convert(double number) {
    int wholePart = number.truncate();
    int decimalPart = ((number - wholePart) * 100).round();
    
    String text = _convertNumber(wholePart);
    
    if (wholePart == 0) text = "CERO ";
    if (wholePart == 1) text = "UN ";
    
    text += "SOLES ";
    
    if (decimalPart > 0) {
      // Use "CON XX/100 SOLES" format often used in Peru/Receipts or spec "con cuarenta y tres céntimos"
      // User asked for "con cuarenta y tres céntimos"
      text += "CON ${_convertNumber(decimalPart).trim()} CÉNTIMOS";
    } else {
       text += "EXACTOS";
    }
    
    return text.toUpperCase(); // User example was lowercase/mixed? "veintiseis soles con..."
    // Let's check user example: "veintiseis soles con cuarenta y tres céntimos"
    // I will return standard capitalized case or lower case as per requirement.
    // User request: "(veintiseis soles con cuarenta y tres céntimos)"
  }

  static String convertLower(double number) {
    int wholePart = number.truncate();
    int decimalPart = ((number - wholePart) * 100).round();
    
    String text = _convertNumber(wholePart);
    if (wholePart == 0) text = "CERO ";
    if (wholePart == 1 && text != "UN ") text = "UN "; // Handle specific case if needed, but _convertNumber handles it usually as UN
    
    String decimalText;
    if (decimalPart > 0) {
      decimalText = "${_convertNumber(decimalPart).trim().toLowerCase()} céntimos";
    } else {
      decimalText = "cero céntimos";
    }

    return "${text.toLowerCase()}soles con $decimalText";
  }
  
  static String convertToCustomFormat(double number) {
      int wholePart = number.truncate();
      int decimalPart = ((number - wholePart) * 100).round();
      
      String wholeWords = _convertNumber(wholePart).trim().toLowerCase();
      if (wholePart == 1) wholeWords = "un";
      if (wholeWords.endsWith("uno")) wholeWords = wholeWords.substring(0, wholeWords.length - 1);
      if (wholePart == 100) wholeWords = "cien";
      
      // Siempre mostrar céntimos en formato XX/100
      final centsStr = decimalPart.toString().padLeft(2, '0');
      return "$wholeWords soles con $centsStr/100";
  }

  static String _convertNumber(int number) {
    if (number == 0) return "";
    
    if (number < 10) return _unidades[number];
    
    if (number < 20) return _diez[number - 10];
    
    if (number < 30) {
       if (number == 20) return "VEINTE ";
       return "VEINTI${_unidades[number - 20]}";
    }
    
    if (number < 100) {
       int ten = number ~/ 10;
       int unit = number % 10;
       if (unit == 0) return _decenas[ten];
       return "${_decenas[ten]}Y ${_unidades[unit]}";
    }
    
    if (number < 1000) {
       if (number == 100) return "CIEN ";
       int hundred = number ~/ 100;
       int rest = number % 100;
       return "${_centenas[hundred]}${_convertNumber(rest)}";
    }
    
    if (number < 1000000) {
       if (number == 1000) return "MIL ";
       int thousand = number ~/ 1000;
       int rest = number % 1000;
       String thousandText = "";
       if (thousand == 1) thousandText = "MIL ";
       else thousandText = "${_convertNumber(thousand)}MIL ";
       
       return "$thousandText${_convertNumber(rest)}";
    }
    
    return ""; // For now limit to millions for receipts
  }
}
