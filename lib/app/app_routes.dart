enum AppRoute {
  mandalaHeartApp('/', 'mandalaheartapp'),
  onboarding('/onboarding', 'onboarding'),
  signIn('/sign_in', 'sign_in'),
  signUp('/sign_up', 'sign_up'),
  addProfile('/addprofile', 'addprofile'),
  dashboard('/dashboard', 'dashboard'),
  username('/username', 'username'),
  addPostScreen('/add_post', 'add_post'),
  profileViewScreen('/profile_view', 'profile_view');

  final String path;
  final String name;

  const AppRoute(this.path, this.name);
}
