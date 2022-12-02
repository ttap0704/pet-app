class MungroadInputFormat {
  String key;
  late String value;
  String inputType;
  String validation;
  String hint;
  int maxLength;

  void updateValue(String currentValue) {
    value = currentValue;
  }

  MungroadInputFormat(
    this.key,
    this.value,
    this.inputType,
    this.validation,
    this.hint,
    this.maxLength,
  );
}
