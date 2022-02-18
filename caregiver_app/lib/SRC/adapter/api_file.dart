class ApiFile {
  static String baseUrl = "https://api.givers.health/v1/";

  // static String baseUrl = "http://apidev.givers.health/v1/";

  static String loginApiUrl = baseUrl + "login_user/";
  static String signUpApiUrl = baseUrl + "signup_user/";
  static String signOutApiUrl = baseUrl + "signout_user/";
  static String userDeatilsApiUrl = baseUrl + "update_user_info/";
  static String getNavigatorUrl = baseUrl + "get_available_nav/";
  static String getCareGiverDetailsUrl = baseUrl + "get_caregiver_details/";
  static String getCgProifleUrl = baseUrl + "get_cg_profile/";
  static String getNavProfileUrl = baseUrl + "get_nav_profile/?navid=";
  static String updateLovedOneDetailsApiUrl = baseUrl + "update_lo_info/";
  static String getToolKitApiUrl = baseUrl + "get_toolkit/?toolkit_typeid=";
  static String getLovedOneProfileUrl = baseUrl + "get_lo_profile/?loved_oneid=";
  static String saveToolKitUrl = baseUrl + "save_toolkit/";
  static String selectNavigatorUrl = baseUrl + "select_nav/";
  static String getgetAvailableSlotsUrl = baseUrl + "get_available_slots/";
  static String getBookSlotUrl = baseUrl + "book_slot/";
  static String addTaskUrl = baseUrl + "add_task/";
  static String getResourceBunderUrl = baseUrl + "get_resource/?resource_typeid=";
  static String requestResetPasswordApiUrl = baseUrl + "request_reset_password/";
  static String resetPasswordApiUrl = baseUrl + "reset_password/";
  static String getResourceDetailsApiUrl = baseUrl + "get_resource_detail/?resourceid=";
  static String getSavedToolKitApiUrl = baseUrl + "get_saved_toolkit/";
  static String saveAssessmenApiUrl = baseUrl + "save_assessment/";
  static String getToolKitDetailsApiUrl = baseUrl + "get_toolkit_detail/?toolkitid=";
  static String saveResourceBundelUrl = baseUrl + "save_resource/";
  static String UnSaveToolKitUrl = baseUrl + "unsave_toolkit/";
  static String UnSaveResourceUrl = baseUrl + "unsave_resource//";
  static String CancelMeetingUrl = baseUrl + "unbook_slot/";
  static String GetTaskListUrl = baseUrl + "get_task_list/";
  static String CompleteTaskUrl = baseUrl + "complete_task/";
  static String UnCompleteTaskUrl = baseUrl + "uncomplete_task/";
  static String DeleteTaskUrl = baseUrl + "delete_task/";
  static String GetNotificationUrl = baseUrl + "get_notifications/";
  static String UpdateTaskUrl = baseUrl + "edit_task/";
}
