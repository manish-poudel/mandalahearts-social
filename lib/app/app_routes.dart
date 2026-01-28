enum AppRoute {
  mandalaHeartApp('/', 'mandalaheartapp'),
  onboarding('/onboarding', 'onboarding'),
  signIn('/sign_in', 'sign_in'),
  signUp('/sign_up', 'sign_up'),
  passwordResetScreen("/passwordResetScreen", "passwordResetScreen"),
  addProfile('/addprofile', 'addprofile'),
  dashboard('/dashboard', 'dashboard'),
  username('/username', 'username'),
  addPostScreen('/add_post', 'add_post'),
  profileViewScreen('/profile_view', 'profile_view'),
  publicProfileViewScreen('/public_profile/:userId', 'public_profile'),
  editProfileScreen('/edit_profile', 'edit_profile'),
  editUsername('/edit_username', 'edit_username'),
  editSpiritualDetails('/edit_spiritual_details', 'edit_spiritual_details'),
  photoPicker('/photo_picker', 'photo_picker'),
  addSpiritualMater('/add_spiritual_master', 'add_spiritual_master'),
  editSpiritualMater('/edit_spiritual_master', 'edit_spiritual_master'),
  postViewScreen('/post_view', 'post_view');

  final String path;
  final String name;

  const AppRoute(this.path, this.name);
}
