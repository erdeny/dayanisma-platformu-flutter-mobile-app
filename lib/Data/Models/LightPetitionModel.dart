class LightPetitionModel {
  int? commentCount;
  DateTime? createdAt;
  int? dislikes;
  int? id;
  int? likes;
  String? petition;
  int? petitionerId;
  String? petitionerName;
  String? petitionerProfilePhotoSrc;
  List<dynamic>? images;
  bool? userReview;

  LightPetitionModel(
      {this.commentCount,
        this.createdAt,
        this.dislikes,
        this.id,
        this.likes,
        this.petition,
        this.petitionerId,
        this.petitionerName,
        this.petitionerProfilePhotoSrc,
        this.images,
        this.userReview});

  LightPetitionModel.fromJson(Map<String, dynamic> json) {
    commentCount = json['comment_count'];
    createdAt = DateTime.parse(json['created_at']);
    dislikes = json['dislikes'];
    id = json['id'];
    likes = json['likes'];
    petition = json['petition'];
    petitionerId = json['petitioner_id'];
    petitionerName = json['petitioner_name'];
    petitionerProfilePhotoSrc = json['petitioner_profile_photo_src'];
    images = json['images'];
    userReview = json['user_review'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['comment_count'] = this.commentCount;
    data['created_at'] = this.createdAt;
    data['dislikes'] = this.dislikes;
    data['id'] = this.id;
    data['likes'] = this.likes;
    data['petition'] = this.petition;
    data['petitioner_id'] = this.petitionerId;
    data['petitioner_name'] = this.petitionerName;
    data['petitioner_profile_photo_src'] = this.petitionerProfilePhotoSrc;
    data['images'] = this.images;
    data['user_review'] = this.userReview;
    return data;
  }
}
