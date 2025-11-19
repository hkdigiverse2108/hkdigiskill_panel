class AdminRoutes {
  static const login = '/login';
  static const otp = '/otp';
  static const forgotPassword = '/forgot-password/';
  static const resetPassword = '/reset-password/';
  static const dashboard = '/dashboard';
  static const transactions = '/transactions';

  // Category
  static const category = '/category';
  static const createCategory = '/category-create';
  static const editCategory = '/category-edit';

  // Workshop
  static const workshop = '/workshop';
  static const createWorkshop = '/workshop-create';
  static const editWorkshop = '/workshop-edit';

  static const course = '/course';
  static const wWorkshops = '/workshops';
  static const wCurriculum = '/workshopsCurriculum';
  static const wBuy = '$workshop/buy';
  static const wFaq = '/workshopFaq';
  static const wTestimonials = '$workshop/testimonials';
  static const cCourses = '$course/courses';
  static const cLessons = '$course/lessons';
  static const cCurriculum = '$course/curriculum';
  static const cBuy = '$course/buy';
  static const cFaq = '$course/faq';
  static const cTestimonials = '$course/testimonials';
  static const couponCode = '/coupon-code';
  static const deletedAccounts = '/deleted-accounts';
  static const trustedPartners = '/trusted-partners';
  static const faq = '/faq';
  static const testimonials = '/testimonials';
  static const adminUsers = '/admin-users';
  static const blog = '/blog';
  static const getInTouch = '/get-in-touch';
  static const gallery = '/gallery';
  static const newsLetter = '/news-letter';
  static const banners = '/banners';
  static const legality = '/legality';
  static const privacyPolicy = '/privacy-policy';
  static const termsConditions = '/terms-conditions';
  static const addNewUsers = '/add-new-users';
  static const users = '/users';
  static const changePassword = '/change-password';
  static const settings = '/settings';

  static List sidebarMenuItems = [
    dashboard,
    transactions,
    category,
    workshop,
    course,
    couponCode,
    deletedAccounts,
    trustedPartners,
    faq,
    testimonials,
    adminUsers,
    blog,
    getInTouch,
    gallery,
    newsLetter,
    banners,
    legality,
    privacyPolicy,
    termsConditions,
    users,
    settings,
  ];
}
