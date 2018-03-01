typedef void PageChangedListener(int newPage);

class ProfileModel {
  String firstName;
  String lastName;
  String location;
  String about;

  int numFollowers;
  int numPosts;
  int numFollowing;
  bool isFollowing = false;
  String imageAsset;

  String get numFollowersAsString {
    return _numberAsString(numFollowers);
  }

  String get numPostsAsString {
    return _numberAsString(numPosts);
  }

  String get numFollowingAsString {
    return _numberAsString(numFollowing);
  }

  String _numberAsString(int num) {
    if (num < 1000) return "$num";
    if (num >= 1000 && num < 1000000) {
      String s = (num / 1000).toStringAsFixed(1);
      if (s.endsWith(".0")) {
        int idx = s.indexOf(".0");
        s = s.substring(0, idx);
      }
      return "${s}k";
    }
    return "";
  }
}

List<ProfileModel> getProfiles() {
  return <ProfileModel>[
    new ProfileModel()
      ..firstName = "Lori"
      ..lastName = "Perez"
      ..about = "Photographer, blogger and foodie. I love travelling."
      ..location = "Canada, Montreal"
      ..imageAsset = "assets/profile/images/2.jpg"
      ..numFollowers = 689
      ..numPosts = 135
      ..numFollowing = 485,
    new ProfileModel()
      ..firstName = "Lauren"
      ..lastName = "Turner"
      ..about = "Photographer, blogger and foodie. I love travelling."
      ..location = "USA, Texas"
      ..imageAsset = "assets/profile/images/1.jpg"
      ..numFollowers = 1500
      ..numPosts = 86
      ..numFollowing = 353,
    new ProfileModel()
      ..firstName = "Christine"
      ..lastName = "Wallace"
      ..about = "Photographer, blogger and foodie. I love travelling."
      ..location = "France, Nantes"
      ..imageAsset = "assets/profile/images/3.jpg"
      ..numFollowers = 2800
      ..numPosts = 346
      ..numFollowing = 845,
    new ProfileModel()
      ..firstName = "Lisa"
      ..lastName = "Avery"
      ..about = "Photographer, blogger and foodie. I love travelling."
      ..location = "United Kingdom, Manchester"
      ..imageAsset = "assets/profile/images/5.jpg"
      ..numFollowers = 2000
      ..numPosts = 500
      ..numFollowing = 700,
  ];
}