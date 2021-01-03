class fieldTest {
  static String veresiyeContentValidator(String text) {
    print("inside validator");
    if (text.isEmpty) return "Miktar kısmı boş bırakılamaz!";

    Pattern pattern = r"^[1-9]?([1-9]\d*)";
    RegExp regex = RegExp(pattern);
    if (!regex.hasMatch(text)) return "Miktar bilgisi numerik olmalıdır!";
  }

  static String veresiyeTitleValidator(String text) {
    if (text.isEmpty) return "Veresiye Sahibi bilgisi boş bırakılamaz!";

    return "Content is empty";
  }
}
