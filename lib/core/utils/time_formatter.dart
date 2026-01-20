class TimeFormatter {
  static String? timeAgo(DateTime createdTime) {
    try {
      final now = DateTime.now();
      final diff = now.difference(createdTime);

      if (diff.inSeconds < 60) {
        return 'Just now';
      } else if (diff.inMinutes < 60) {
        return '${diff.inMinutes} min ago';
      } else if (diff.inHours < 24) {
        return '${diff.inHours} hour${_s(diff.inHours)} ago';
      } else if (diff.inDays < 7) {
        return '${diff.inDays} day${_s(diff.inDays)} ago';
      } else if (diff.inDays < 30) {
        final weeks = (diff.inDays / 7).floor();
        return '$weeks week${_s(weeks)} ago';
      } else if (diff.inDays < 365) {
        final months = (diff.inDays / 30).floor();
        return '$months month${_s(months)} ago';
      } else {
        final years = (diff.inDays / 365).floor();
        return '$years year${_s(years)} ago';
      }
    } catch (err) {
      return null;
    }
  }

  static String _s(int value) => value == 1 ? '' : 's';
}
