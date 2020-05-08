Global globalData;

class Global {
  int newConfirmed;
  int totalConfirmed;
  int newDeaths;
  int totalDeaths;
  int newRecovered;
  int totalRecovered;
  String lastUpdated;

  Global({
    this.newConfirmed,
    this.totalConfirmed,
    this.newDeaths,
    this.totalDeaths,
    this.newRecovered,
    this.totalRecovered,  
  });

  factory Global.fromJson(Map<String, dynamic> json) {
    return Global(
      newConfirmed: json['NewConfirmed'],
      totalConfirmed: json['TotalConfirmed'],
      newDeaths: json['NewDeaths'],
      totalDeaths: json['TotalDeaths'],
      newRecovered: json['NewRecovered'],
      totalRecovered: json['TotalRecovered'],
    );
  }
}
