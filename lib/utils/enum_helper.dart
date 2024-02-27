class EnumHelper {
  static T fromName<T>(List<T> values, String name, T defaultValue) {
    return values.firstWhere(
      (e) => e.toString().split('.').last == name,
      orElse: () => defaultValue,
    );
  }

  static List<String> getList<T>(List<T> values) {
    return values.map((e) => e.toString().split('.').last).toList();
  }
}
