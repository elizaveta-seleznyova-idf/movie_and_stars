class Comments {
  const Comments({
    this.comment,
    this.dateComment,
    this.rating,
    this.user,
  });

  final String? comment;
  final String? dateComment;
  final int? rating;
  final User? user;

  factory Comments.fromJson(Map<String, dynamic> json) {
    return Comments(
      comment: json['comment'],
      dateComment: json['created_at'],
      rating: json['user_rating'],
      user: json['user'] == null
          ? null
          : User.fromJson(
              json['user'] as Map<String, dynamic>,
            ),
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['comment'] = comment;
    data['created_at'] = dateComment;
    data['user_rating'] = rating;
    if (user != null) {
      data['user'] = user!.toJson();
    }

    return data;
  }
}

class User {
  const User({
    this.userName,
    this.userImage,
  });

  final String? userName;
  final Images? userImage;

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      userName: json['username'],
      userImage: json['images'] == null
          ? null
          : Images.fromJson(
              json['images'] as Map<String, dynamic>,
            ),
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['username'] = userName;

    if (userImage != null) {
      data['images'] = userImage!.toJson();
    }
    return data;
  }
}

class Images {
  const Images({
    this.avatar,
  });

  final Avatar? avatar;

  factory Images.fromJson(Map<String, dynamic> json) {
    return Images(
      avatar: json['avatar'] == null
          ? null
          : Avatar.fromJson(
              json['avatar'] as Map<String, dynamic>,
            ),
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (avatar != null) {
      data['avatar'] = avatar!.toJson();
    }
    return data;
  }
}

class Avatar {
  const Avatar({this.full});

  final String? full;

  factory Avatar.fromJson(Map<String, dynamic> json) {
    return Avatar(
      full: json['full'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['full'] = full;
    return data;
  }
}
