class AppStrings {
//----------------------------------Api Constants------------
  static const String appBaseUrl =
      "http://110.93.244.74/api/resource/"; //real database

  static const String appBaseUrlimage =
      "http://110.93.244.74/api/resource"; //live database

  static const String LOGIN_URI = "login";
  static const String ATTENDANCE_MARK_ATTENDANCE = "attendance/mark_attendance";

  static const String STATUSES = "statuses";
  static const String COMPLAINT_STATUSES = "dashboard/dashboard_list/assigned";
  static const String CATEGORY = "categories";
  static const String SUB_CATEGORY = "SubCategories/";
  static const String ASSIGNED_TASK_LIST = "assigned/complaint_list";
  static const String ASSIGNED_TASK_DETAILS = "assigned/complaint_detail/";
  static const String START_TASK = "assigned/task_start";
  static const String END_TASK = "assigned/task_end";
  static const String END_TASK_STATUSES = "end_task_statuses";
  static const String ASSIGNED_TASK_LIST_POST = "assigned/task_list";

  static const String All_COMPLAINT_LIST = "complaint/complaint_list";
  static const String COMPLAINT_DETAILS = "complaint/complaint_detail/";
  static const String DASHBOARD_NEWS = "dashboard/news";
  static const String COMPLAINT_REOPEN = "complaint/complaint_reopen";

  static const String STORE_NEW_COMPLAINT = "complaint/complaint_store";

  static const String COMPLAINT_FEEDBACK = "complaint/complaint_feedback";
  static const String ASSIGNED_TASK_FILE_UPLOAD = "assigned/task_fileupload";

  static const String COMPLAINT_CANCEL = "complaint/complaint_cancel";
  static const String COMPLAINT_RESOLVED = "assigned/complaint_resolved";
}

class LocalDBStrings {
  static const String login_user = "login_user";
}
