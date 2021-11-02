String replaceStringSpace(String value) {
  return value.replaceAll(' ', '%20');
}

String replaceURLSpace(String value) {
  return value.replaceAll('%20', ' ');
}
