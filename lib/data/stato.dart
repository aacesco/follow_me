class Stato {
  late final String countryCode;
  late final String countryName;
  String? currencyCode;
  String? population;
  late final String capital;
  late final String continentName;

  Stato({
    required this.countryCode,
    required this.countryName,
    required this.currencyCode,
    required this.population,
    required this.capital,
    required this.continentName,
  });

  Stato.fromMap(Map<String, dynamic> map) {
    countryCode = map['countryCode'] as String;
    countryName = map['countryName'] as String;
    currencyCode = map['currencyCode'] as String?;
    population = map['population'] as String?;
    capital = map['capital'] as String;
    continentName = map['continentName'] as String;
  }
}
