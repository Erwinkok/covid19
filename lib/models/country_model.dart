List<Country> countries = new List();
List<Country> mostAffectedCountries = new List();

class Country {
  String country;
  String countryCode;
  String slug;
  int newConfirmed;
  int totalConfirmed;
  int newDeaths;
  int totalDeaths;
  int newRecovered;
  int totalRecovered;
  String date;

  Country({
    this.country,
    this.countryCode,
    this.slug,
    this.newConfirmed,
    this.totalConfirmed,
    this.newDeaths,
    this.totalDeaths,
    this.newRecovered,
    this.totalRecovered,
    this.date,
  });

  factory Country.fromJson(Map<String, dynamic> json) {
    return Country(
      country: json['Country'],
      countryCode: json['CountryCode'],
      slug: json['Slug'],
      newConfirmed: json['NewConfirmed'],
      totalConfirmed: json['TotalConfirmed'],
      newDeaths: json['NewDeaths'],
      totalDeaths: json['TotalDeaths'],
      newRecovered: json['NewRecovered'],
      totalRecovered: json['TotalRecovered'],
      date: json['Date'],
    );
  }
}
