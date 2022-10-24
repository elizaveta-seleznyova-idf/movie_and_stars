class CommentsModel {
  const CommentsModel({
    required this.comment,
    required this.dateComment,
    required this.rating,
    required this.userName,
    required this.userImage,
  });

  final String? comment;
  final String? dateComment;
  final double? rating;
  final String? userName;
  final String? userImage;
}
