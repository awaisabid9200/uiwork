class DummyData {
  final String imageUrl;
  final String title;
  final String subtitle;
  final String description;
  final String backgroundText;
  final double rating;
  final String about;
  final String Urls;

  DummyData({
    required this.imageUrl,
    required this.title,
    required this.subtitle,
    required this.description,
    required this.backgroundText,
    required this.rating,
    required this.about,
    required this.Urls,
  });
}
// medical its not used
class DummyDataMedical {
  final String imageUrl;
  final String title;
  final String description;
  final String backgroundText;
  final double rating;
  final String about;
  final String Urls;

  DummyDataMedical({
    required this.imageUrl,
    required this.title,
    required this.description,
    required this.backgroundText,
    required this.rating,
    required this.about,
    required this.Urls, required List<String> subImages,
  });
}