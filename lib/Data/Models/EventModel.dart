class EventModel {
  int? _id;
  String? _title;
  String? _description;
  String? _thumbnailSrc;
  String? _address;
  Coordinates? _coordinates;
  int? _participantCount;
  bool? _isUserParticipant;
  DateTime? _startAt;
  DateTime? _endAt;
  DateTime? _createdAt;

  EventModel(
      {int? id,
        String? title,
        String? description,
        String? thumbnailSrc,
        String? address,
        Coordinates? coordinates,
        int? participantCount,
        bool? isUserParticipant,
        DateTime? startAt,
        DateTime? endAt,
        DateTime? createdAt}) {
    if (id != null) {
      this._id = id;
    }
    if (title != null) {
      this._title = title;
    }
    if (description != null) {
      this._description = description;
    }
    if (thumbnailSrc != null) {
      this._thumbnailSrc = thumbnailSrc;
    }
    if (address != null) {
      this._address = address;
    }
    if (coordinates != null) {
      this._coordinates = coordinates;
    }
    if (participantCount != null) {
      this._participantCount = participantCount;
    }
    if (isUserParticipant != null) {
      this._isUserParticipant = isUserParticipant;
    }
    if (startAt != null) {
      this._startAt = startAt;
    }
    if (endAt != null) {
      this._endAt = endAt;
    }
    if (createdAt != null) {
      this._createdAt = createdAt;
    }
  }

  int? get id => _id;
  set id(int? id) => _id = id;
  String? get title => _title;
  set title(String? title) => _title = title;
  String? get description => _description;
  set description(String? description) => _description = description;
  String? get thumbnailSrc => _thumbnailSrc;
  set thumbnailSrc(String? thumbnailSrc) => _thumbnailSrc = thumbnailSrc;
  String? get address => _address;
  set address(String? address) => _address = address;
  Coordinates? get coordinates => _coordinates;
  set coordinates(Coordinates? coordinates) => _coordinates = coordinates;
  int? get participantCount => _participantCount;
  set participantCount(int? participantCount) =>
      _participantCount = participantCount;
  bool? get isUserParticipant => _isUserParticipant;
  set isUserParticipant(bool? isUserParticipant) =>
      _isUserParticipant = isUserParticipant;
  DateTime? get startAt => _startAt;
  set startAt(DateTime? startAt) => _startAt = startAt;
  DateTime? get endAt => _endAt;
  set endAt(DateTime? endAt) => _endAt = endAt;
  DateTime? get createdAt => _createdAt;
  set createdAt(DateTime? createdAt) => _createdAt = createdAt;

  EventModel.fromJson(Map<String, dynamic> json) {
    _id = json['id'];
    _title = json['title'];
    _description = json['description'];
    _thumbnailSrc = json['thumbnail_src'];
    _address = json['address'];
    _coordinates = json['coordinates'] != null
        ? new Coordinates.fromJson(json['coordinates'])
        : null;
    _participantCount = json['participant_count'];
    _isUserParticipant = json['is_user_participant'];
    _startAt = DateTime.parse(json['start_at']);
    _endAt = DateTime.parse(json['end_at']);
    _createdAt = DateTime.parse(json['created_at']);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this._id;
    data['title'] = this._title;
    data['description'] = this._description;
    data['thumbnail_src'] = this._thumbnailSrc;
    data['address'] = this._address;
    if (this._coordinates != null) {
      data['coordinates'] = this._coordinates!.toJson();
    }
    data['participant_count'] = this._participantCount;
    data['is_user_participant'] = this._isUserParticipant;
    data['start_at'] = this._startAt;
    data['end_at'] = this._endAt;
    data['created_at'] = this._createdAt;
    return data;
  }

  String timeLeft({bool numericDates = true}) {
    DateTime? date = this.startAt!.toUtc();
    final date2 = DateTime.now().toUtc();
    final difference = date.difference(date2); // DÜZENLEE

    if (difference.inSeconds < 5) {
      return 'Şimdi başlıyor';
    } else if (difference.inSeconds <= 60) {
      return '${difference.inSeconds} saniye kaldı';
    } else if (difference.inMinutes <= 1) {
      return  '1 dakika kaldı';
    } else if (difference.inMinutes <= 60) {
      return '${difference.inMinutes} dakika kaldı';
    } else if (difference.inHours <= 1) {
      return '1 saat kaldı';
    } else if (difference.inHours <= 24) {
      return '${difference.inHours} saat kaldı';
    } else if (difference.inDays <= 1) {
      return  '1 gün kaldı';
    } else if (difference.inDays <= 6) {
      return '${difference.inDays} gün kaldı';
    } else if ((difference.inDays / 7).ceil() <= 1) {
      return '1 hafta kaldı' ;
    } else if ((difference.inDays / 7).ceil() <= 4) {
      return '${(difference.inDays / 7).ceil()} hafta kaldı';
    } else if ((difference.inDays / 30).ceil() <= 1) {
      return '1 ay kaldı';
    } else if ((difference.inDays / 30).ceil() <= 30) {
      return '${(difference.inDays / 30).ceil()} ay kaldı';
    } else if ((difference.inDays / 365).ceil() <= 1) {
      return '1 yıl kaldı';
    }
    return '${(difference.inDays / 365).floor()} yıl kaldı';
  }
}

class Coordinates {
  double? _lat;
  double? _long;

  Coordinates({double? lat, double? long}) {
    if (lat != null) {
      this._lat = lat.toDouble();
    }
    if (long != null) {
      this._long = long.toDouble();
    }
  }

  double? get lat => _lat;
  set lat(double? lat) => _lat = lat;
  double? get long => _long;
  set long(double? long) => _long = long;

  Coordinates.fromJson(Map<String, dynamic> json) {
    _lat = double.parse(json['lat'].toString());
    _long = double.parse(json['lat'].toString());
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['lat'] = this._lat;
    data['long'] = this._long;
    return data;
  }
}
