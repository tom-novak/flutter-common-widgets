class CommonRoutePath {
  final bool isUnknown;
  final String? selectedMainTab;
  final int? selectedItemId;
  final bool showProfile;

  CommonRoutePath.home({this.selectedMainTab})
      : isUnknown = false,
        selectedItemId = null,
        showProfile = false;

  CommonRoutePath.item({this.selectedItemId})
      : selectedMainTab = null,
        isUnknown = false,
        showProfile = false;

  CommonRoutePath.login()
      : selectedMainTab = null,
        isUnknown = false,
        selectedItemId = null,
        showProfile = false;

  CommonRoutePath.profile()
      : selectedMainTab = null,
        isUnknown = false,
        selectedItemId = null,
        showProfile = true;

  CommonRoutePath.unknown()
      : selectedMainTab = null,
        isUnknown = false,
        selectedItemId = null,
        showProfile = false;
}
