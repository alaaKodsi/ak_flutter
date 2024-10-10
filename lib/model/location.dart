class Location {
  final String country;
  final String countryCode;
  final String region;
  final String regionName;
  final String city;
  final String zip;
  final double lat;
  final double lon;
  final String timezone;
  final String isp;
  final String org;
  final String as;
  final String query;

  Location({
    required this.country,
    required this.countryCode,
    required this.region,
    required this.regionName,
    required this.city,
    required this.zip,
    required this.lat,
    required this.lon,
    required this.timezone,
    required this.isp,
    required this.org,
    required this.as,
    required this.query,
  });

  factory Location.fromMap(Map<String, dynamic> map) {
    return Location(
      country: map['country'],
      countryCode: map['countryCode'],
      region: map['region'],
      regionName: map['regionName'],
      city: map['city'],
      zip: map['zip'],
      lat: map['lat'].toDouble(),
      lon: map['lon'].toDouble(),
      timezone: map['timezone'],
      isp: map['isp'],
      org: map['org'],
      as: map['as'],
      query: map['query'],
    );
  }
}
