class DateFormatter {
  static const List<String> _monthsFr = [
    'janvier',
    'février',
    'mars',
    'avril',
    'mai',
    'juin',
    'juillet',
    'août',
    'septembre',
    'octobre',
    'novembre',
    'décembre',
  ];

  /// Méthode pour formatter les dates dans un format français (Date)
  static String formatDateFr(DateTime date) {
    final day = date.day;
    final month = _monthsFr[date.month - 1];
    final year = date.year;
    return '$day $month $year';
  }

  /// Méthode pour formatter les dates dans un format français (Date + heure)
  static String formatDateTimeFr(DateTime date) {
    final day = date.day;
    final month = _monthsFr[date.month - 1];
    final year = date.year;
    final hour = date.hour.toString().padLeft(2, '0');
    final minute = date.minute.toString().padLeft(2, '0');
    return 'le $day $month $year à ${hour}h$minute';
  }
}
