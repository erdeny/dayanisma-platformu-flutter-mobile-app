class DetailedPetitionModel {
  String? answer;
  List<Comments>? comments;
  DateTime? createdAt;
  int? dislikes;
  int? id;
  List<dynamic>? images;
  int? likes;
  String? petition;
  int? petitionerId;
  String? petitionerName;
  String? petitionerProfilePhotoSrc;
  bool? userReview;

  DetailedPetitionModel(
      {this.answer,
        this.comments,
        this.createdAt,
        this.dislikes,
        this.id,
        this.images,
        this.likes,
        this.petition,
        this.petitionerId,
        this.petitionerName,
        this.petitionerProfilePhotoSrc,
        this.userReview});

  DetailedPetitionModel.fromJson(Map<String, dynamic> json) {
    answer = json['answer'];
    if (json['comments'] != null) {
      comments = <Comments>[];
      json['comments'].forEach((v) {
        comments!.add(new Comments.fromJson(v));
      });
    }
    createdAt = DateTime.parse(json['created_at']);
    dislikes = json['dislikes'];
    id = json['id'];
    images = json['images'];
    likes = json['likes'];
    petition = json['petition'];
    petitionerId = json['petitioner_id'];
    petitionerName = json['petitioner_name'];
    petitionerProfilePhotoSrc = json['petitioner_profile_photo_src'];
    userReview = json['user_review'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['answer'] = this.answer;
    if (this.comments != null) {
      data['comments'] = this.comments!.map((v) => v.toJson()).toList();
    }
    data['created_at'] = this.createdAt;
    data['dislikes'] = this.dislikes;
    data['id'] = this.id;
    data['images'] = this.images;
    data['likes'] = this.likes;
    data['petition'] = this.petition;
    data['petitioner_id'] = this.petitionerId;
    data['petitioner_name'] = this.petitionerName;
    data['petitioner_profile_photo_src'] = this.petitionerProfilePhotoSrc;
    data['user_review'] = this.userReview;
    return data;
  }
}

class Comments {
  int? commenterId;
  String? commenterName;
  String? commenterProfilePhotoSrc;
  String? content;
  DateTime? createdAt;
  int? id;

  Comments(
      {this.commenterId,
        this.commenterName,
        this.commenterProfilePhotoSrc,
        this.content,
        this.createdAt,
        this.id});

  Comments.fromJson(Map<String, dynamic> json) {
    commenterId = json['commenter_id'];
    commenterName = json['commenter_name'];
    commenterProfilePhotoSrc = json['commenter_profile_photo_src'];
    content = json['content'];
    createdAt = DateTime.parse(json['created_at']);
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['commenter_id'] = this.commenterId;
    data['commenter_name'] = this.commenterName;
    data['commenter_profile_photo_src'] = this.commenterProfilePhotoSrc;
    data['content'] = this.content;
    data['created_at'] = this.createdAt;
    data['id'] = this.id;
    return data;
  }
}
