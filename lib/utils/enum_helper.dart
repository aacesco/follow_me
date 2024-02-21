class EnumHelper {
  static T fromName<T>(List<T> values, String name, T defaultValue) {
    return values.firstWhere(
      (e) => e.toString().split('.').last == name,
      orElse: () => defaultValue,
    );
  }
}
