String upperCaseFirstLetter(List<String>? genres) {
  if (genres != null) {
    return genres.first.substring(0, 1).toUpperCase() +
        genres.first.substring(1);
  } else {
    return 'None';
  }
}
