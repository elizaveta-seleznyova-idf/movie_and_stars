class DetailsModel {
  const DetailsModel({
    required this.title,
    required this.overview,
    required this.image,
    required this.runTime,
    required this.rating,
    required this.genres,
    required this.certification,
  });

  final String title;
  final String overview;
  final String image;
  final String runTime;
  final double rating;
  final String genres;
  final String certification;
}
