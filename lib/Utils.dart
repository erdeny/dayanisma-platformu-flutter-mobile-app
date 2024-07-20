String timeAgo(DateTime? dateTime) {
  dateTime = dateTime?.toUtc();
  final date2 = DateTime.now().toUtc();
  final difference = date2.difference(dateTime!);

  if (difference.inSeconds < 5) {
    return 'Şimdi';
  } else if (difference.inSeconds <= 59) {
    return '${difference.inSeconds} saniye önce';
  } else if (difference.inMinutes <= 1) {
    return  '1 dakika önce';
  } else if (difference.inMinutes <= 59) {
    return '${difference.inMinutes} dakika önce';
  } else if (difference.inHours <= 1) {
    return '1 saat önce';
  } else if (difference.inHours <= 23) {
    return '${difference.inHours} saat önce';
  } else if (difference.inDays <= 1) {
    return  '1 gün önce';
  } else if (difference.inDays <= 6) {
    return '${difference.inDays} gün önce';
  } else if ((difference.inDays / 7).ceil() <= 1) {
    return '1 hafta önce' ;
  } else if ((difference.inDays / 7).ceil() <= 4) {
    return '${(difference.inDays / 7).ceil()} hafta önce';
  } else if ((difference.inDays / 30).ceil() <= 1) {
    return '1 ay önce';
  } else if ((difference.inDays / 30).ceil() <= 30) {
    return '${(difference.inDays / 30).ceil()} ay önce';
  } else if ((difference.inDays / 365).ceil() <= 1) {
    return '1 yıl önce';
  }
  return '${(difference.inDays / 365).floor()} yıl önce';
}