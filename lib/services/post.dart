class Post {
  int albumId;
  int id;
  String title;
  String url;
  String thumbnailUrl;

  Post.fromJson(Map json)
      : albumId = json['albumId'],
        id = json['id'],
        title = json['title'],
        url = json['url'],
        thumbnailUrl = json['thumbnailUrl'];
}
