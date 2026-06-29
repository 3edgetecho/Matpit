class RemoteUrls {
  // static const String rootUrl = "https://mamunuiux.com/homeco/"; //test url
  //static const String rootUrl = "https://homeco.mamunuiux.com/"; //test url
  //static const String rootUrl = "https://matpit.com/api/"; //test url
  static const String rootUrl = "https://homeco.mamunuiux.com/"; //test url
  static const String brochureURL = "https://matpit.com/assets/img/project/pdf/"; //test url
  static const String rootUrl2 = "https://matpit.com/api/"; //test url
  //static const String rootUrl = "https://casasemangola.com/"; //test url
  static const String baseUrl = '${rootUrl}api/';
  static const String homeUrl = "${rootUrl2}property-overview?pageCount=20&";
  static const String recommendProperty = "${rootUrl2}recommend-for-you?";
  static const String projectGetURL = "${rootUrl2}projects-get";
  static const String locationGetURL = "${rootUrl2}location-by-properties";
  static const String featureGetURL = "${rootUrl2}get-featured-properties";
  static const String bannerURl = "${rootUrl2}banners";
  static const String userRegister = '${rootUrl2}signup';
  static const String userLogin = '${rootUrl2}login';
  static const String vendorPropertyStoreURL = '${rootUrl2}vendor/property-store';
  static const String vendorProjectStoreURL = '${rootUrl2}vendor/project-store';
  static const String imageUploadURL = '${rootUrl2}/image-upload';
  // static const String websiteSetup = '${baseUrl}website-setup';
  static const String websiteSetup = '${rootUrl2}website-setup';
  static String propertyCategoryURL = "https://matpit.com/assets/img/property-category/";
  static String propertyFeatureURL = "https://matpit.com/assets/img/property/featureds/";
  static String vendorImagePhotoURL = "https://matpit.com/assets/admin/img/vendor-photo/";
  static String adminImageURl = "https://matpit.com/assets/img/admins/";
  static String propertyVideoURL = "https://matpit.com/assets/img/property/video/";
  static String propertyFeatureURL2 = "https://matpit.com/assets/img/property/slider-images/";
  static String projectGalleryURL = "https://matpit.com/assets/img/project/gallery-images/";
  static String floorPlanImageURL = "https://matpit.com/assets/img/project/floor-paln-images/";
  static String planningFeatureURL = "https://matpit.com/assets/img/property/plannings/";
  static String projectFeatureURL = "https://matpit.com/assets/img/project/featured/";
  static String bannerImageURL = "https://matpit.com/assets/img/project/banner/";

  static String createPropertyInfoUrl(String token, String purpose) =>
      '${baseUrl}user/property/create?token=$token&purpose=$purpose';

  static String editInfoUrl(String id, String token) =>
      '${baseUrl}user/property/$id/edit?token=$token';

  static String getPropertyChooseInfo(String token) =>
      '${rootUrl2}category';

  static String changePassword(String token) =>
      '${baseUrl}user/update-password?token=$token';

  static String userLogOut(String token) =>
      '${baseUrl}user/logout?token=$token';
  static const String sendForgetPassword = '${baseUrl}send-forget-password';
  static const String resendRegisterCode = '${baseUrl}resend-register-code';

  static String storeResetPassword = '${baseUrl}store-reset-password';

  static String userVerification = '${baseUrl}user-verification';
  static String resendVerificationCode = '${baseUrl}resend-register';

  static String singlePropertyDetailsUrl(String slug) {
    print( '${rootUrl2}property-details/$slug');
     return  '${rootUrl2}property-details/$slug';
  }

  static String singleProjectDetailsUrl(String slug) {
    print( '${rootUrl2}project-details/$slug');
     return  '${rootUrl2}project-details/$slug';
  }

  static String contactUsProperty(String slug) {
    print( '${rootUrl2}vendor/contact');
     return  '${rootUrl2}vendor/contact';
  }

  static String createPropertyUrl(String token) =>
      '${baseUrl}user/property?token=$token';

  static String deleteAccount(String token) =>
      '${baseUrl}user/delete-account?token=$token';

  static String updatePropertyUrl(String id, String token) =>
      '${rootUrl2}vendor/property-update';

  static String updateProjectUrl(String id, String token) =>
      '${rootUrl2}vendor/project-update';

  static String amenitiesURL() =>
      '${rootUrl2}vendor/amenities';

  static String removeSliderImageUrl(String id, String token) =>
      '${baseUrl}user/remove-property-slider/$id?token=$token';

  static String removeSingleNearestLocationUrl(String id, String token) =>
      '${baseUrl}user/remove-nearest-location/$id?token=$token';

  static String removeSingleAddInfoUrl(String id, String token) =>
      '${baseUrl}user/remove-add-infor/$id?token=$token';

  static String removeSinglePlanUrl(String id, String token) =>
      '${baseUrl}user/remove-plan/$id?token=$token';

  static String deletePropertyUrl(String id, String token) =>
      '${baseUrl}user/property/$id?token=$token';

  static String getAgentDashboardInfo(String token) =>
      '${rootUrl2}vendor/profile/$token';

  static String getMyEnquiry(String id) =>
      '${rootUrl2}vendor/vendor-message-get/$id';

  static String getMyProperty(String token) =>
      '${rootUrl2}vendor/property-get/$token';

  static String getMyProject(String token) =>
      '${rootUrl2}vendor/project-get/$token';

  static String getAgentProfile(String token) =>
      '${rootUrl2}vendor/profile/$token';


  static String getuserProfile(String token) =>
      '${rootUrl2}user-profile/$token';


  static String getAgencyAgentList(String token) =>
      '${baseUrl}user/my-team?token=$token';

  static String createAgencyAgent(String token) =>
      '${baseUrl}user/store-agent?token=$token';

  static String createCompany(String token) =>
      '${baseUrl}user/apply-company?token=$token';

  static String getCompanyProfile(String token) =>
      '${baseUrl}user/company-profile?token=$token';

  static String updateCompanyProfile(String id, String token) =>
      '${baseUrl}user/update-agency-information/$id?token=$token';

  static String getEditAgencyAgent(String id, String token) =>
      '${baseUrl}user/agency-agent-edit/$id?token=$token';

  static String updateAgencyAgent(String id, String token) =>
      '${baseUrl}user/agency-agent-update/$id?token=$token';

  static String deleteAgencyAgent(String id, String token) =>
      '${baseUrl}user/agency-agent-delete/$id?token=$token';

  static String getAllAgent() => '${baseUrl}agents';

  static String getAllAgency() => '${baseUrl}agency-list';

  static String getAgentDetails(String userName) =>
      '${baseUrl}agent?agent_type=agent&user_name=$userName';

  static String getUserDetails(String userName) =>
      '${baseUrl}agent?agent_type=agent&user_name=$userName';

  // static String getAgentDetails(String userName) =>
  //     '${baseUrl}agent?agent_type=agent&user_name=$userName';

  static String getAgencyDetails(String id, String token) =>
      '${baseUrl}agency-details/$id?token=$token';

  static String sendMessageToAgent() => '${baseUrl}send-mail-to-agent';

  static String updateAgentProfileInfo(String token) =>
      '${rootUrl2}vendor/profile-update/$token';

  static String updateUserProfileInfo(String token) =>
      '${rootUrl2}user-profile-update/$token';

  static String getFaqContent() => '${baseUrl}faq';

  static String getPrivacyPolicy() => '${baseUrl}privacy-policy';

  static String getTermsAndCondition() => '${baseUrl}terms-and-conditions';

  static String getReviewList(String token) =>
      '${baseUrl}user/my-reviews?token=$token';

  static String storeReview(String token) =>
      '${baseUrl}store-property-review?token=$token';

  static String getWishListProperties(String token,String type) =>
      '${rootUrl2}wishlist/$token/$type';

  static String addToWishlist(String token, String id) =>
      '${rootUrl2}add-to-wishlist/$token/$id';

  static String removeFromWishlist(String token, String id) =>
      '${rootUrl2}add-to-wishlist/$token/$id';

  static String getContactUs() => '${baseUrl}contact-us';
  static String sendContactUsMessage = '${baseUrl}send-contact-message';

  static String getAboutUs() => '${baseUrl}about-us';

  static String getAllOrders(String token) =>
      '${baseUrl}user/orders?token=$token';

  static String getOrderDetails(String token, String orderId) =>
      '${baseUrl}user/order/$orderId?token=$token';

  static String getPricePlan() => '${rootUrl2}vendor/package-list/';

  static String getPaymentPageInformation(String token, String planSlug) =>
      '${baseUrl}payment/$planSlug?token=$token';

  // support urls

  static String getAllTickets(String token) =>
      '${baseUrl}user/support-tickets?token=$token';

  static String showTicket(String token, String id) =>
      '${baseUrl}user/support-tickets/$id?token=$token';

  static String getPriorityList(String token) =>
      '${baseUrl}user/support-tickets/create?token=$token';

  static String createTicket(String token) =>
      '${baseUrl}user/support-tickets?token=$token';

  static String sendMessage(String token, String id) =>
      '${baseUrl}user/send-support-message/$id?token=$token';

  //kyc urls
  static String submitKyc(String token) =>
      '${baseUrl}user/kyc-submit?token=$token';

  static String getKycInfo(String token) => '${baseUrl}user/kyc?token=$token';

  static String getAgencyKyc = '${baseUrl}kyc-list';

  //booking urls

  static String getBookings(String token, String page) =>
      '${baseUrl}user/my-booking?token=$token&page=$page';

  static String bookingReq(String token, String page) =>
      '${baseUrl}user/property-booking?token=$token&page=$page';

  static String bookingReqDetails(String token, String id) =>
      '${baseUrl}user/property-booking/show/$id&token=$token';

  static String bookingStatusUpdate(String token, String id) =>
      '${baseUrl}user/property-booking/edit/$id?token=$token';

  static String createBooking(String token) =>
      '${baseUrl}user/booking?token=$token';

  static String addToCompare(token, id) =>
      '${baseUrl}user/add-to-compare/$id?token=$token';

  static String compareList(token) => '${baseUrl}user/compare?token=$token';

  static String removeCompare(token, id) =>
      '${baseUrl}user/remove-compare/$id?token=$token';

  //payment urls start

  static String freeEnrollment(String token, String planSlug) =>
      '${baseUrl}free-enroll/$planSlug?token=$token';

  static String bankPayment(String token, String planSlug) =>
      '${baseUrl}bank-payment/$planSlug?token=$token';

  static String stripePayment(String token, String planSlug) =>
      '${baseUrl}pay-with-stripe/$planSlug?token=$token';

  static String payWithFlutterWave(String token, String planSlug) =>
      '${rootUrl}flutterwave-webview/$planSlug?token=$token';

  static String payWithPayStack(String token, String planSlug) =>
      '${rootUrl}paystack-webview/$planSlug?token=$token';

  static String payWithMolli(String token, String planSlug) =>
      '${rootUrl}mollie-webview/$planSlug?token=$token';

  static String payWithInstamojo(String token, String planSlug) =>
      '${rootUrl}instamojo-webview/$planSlug?token=$token';

  static String payWithRazorpay(String token, String planSlug) =>
      '${rootUrl}razorpay-webview/$planSlug?token=$token';

  static String payWithPaypal(String token, String planSlug) =>
      '${rootUrl}paypal-webview/$planSlug?token=$token';

  //payment urls end

  static String getSearchProperty = '${rootUrl2}search-overview?';
  static String getAllProperty = '${baseUrl}properties';
  static String getFilterProperty = '${rootUrl2}properties-by-category?';

  static imageUrl(String imageUrl) => rootUrl + imageUrl;
}
