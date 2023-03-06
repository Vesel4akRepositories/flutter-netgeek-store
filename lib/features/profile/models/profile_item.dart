class ProfileItem {
  final String title;
  final String description;
  final String url;

  ProfileItem({
    required this.title,
    required this.description,
    required this.url,
  });

  factory ProfileItem.fromJson(Map<String, dynamic> json) {
    return ProfileItem(
      title: json['title'],
      description: json['description'],
      url: json['url'],
    );
  }
}
