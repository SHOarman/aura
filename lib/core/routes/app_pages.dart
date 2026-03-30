import 'package:concentrao/presentation/authscreen/login.dart';
import 'package:concentrao/presentation/authscreen/newpassword.dart';
import 'package:concentrao/presentation/authscreen/resetpassword.dart';
import 'package:concentrao/presentation/authscreen/singup.dart';
import 'package:concentrao/presentation/authscreen/join_user.dart';

import 'package:concentrao/presentation/screen_ui/aicreate/create_script_screen.dart';
import 'package:concentrao/presentation/screen_ui/aicreate/aicreate.dart';
import 'package:concentrao/presentation/screen_ui/aicreate/concentrao_script_creator.dart';
import 'package:concentrao/presentation/screen_ui/aicreate/startwithai.dart';
import 'package:concentrao/presentation/screen_ui/aicreate/writemyscript.dart';
import 'package:concentrao/presentation/screen_ui/home/confidence_reset.dart';
import 'package:concentrao/presentation/screen_ui/home/pre_performance_focus.dart';
import 'package:concentrao/presentation/screen_ui/home/home.dart';
import 'package:concentrao/presentation/screen_ui/home/pressure_control.dart';
import 'package:concentrao/presentation/screen_ui/home/pressure_control_details_screen.dart';
import 'package:concentrao/presentation/screen_ui/library/confidence_reinforcement.dart';
import 'package:concentrao/presentation/screen_ui/library/peakstateactivarion.dart';
import 'package:concentrao/presentation/screen_ui/library/pre_performance_rutine.dart';
import 'package:concentrao/presentation/screen_ui/library/see_all.dart';
import 'package:concentrao/presentation/screen_ui/library/pressurcontroller.dart';
import 'package:concentrao/presentation/screen_ui/motivation/motivation.dart';
import 'package:concentrao/presentation/screen_ui/music_player_screen/music_player_screen.dart';
import 'package:concentrao/presentation/screen_ui/profile/action.dart';
import 'package:concentrao/presentation/screen_ui/profile/editprofile.dart';
import 'package:concentrao/presentation/screen_ui/profile/profile/subscription.dart';
import 'package:concentrao/presentation/splash_screen/pre_performance_focus_details_screen.dart';
import 'package:concentrao/presentation/splash_screen/onboarding_screen_1.dart';
import 'package:concentrao/presentation/splash_screen/onboarding_screen_2.dart';
import 'package:concentrao/presentation/splash_screen/onboarding_screen_3.dart';
import 'package:concentrao/presentation/splash_screen/onboarding_screen_4.dart';
import 'package:concentrao/presentation/splash_screen/splash_screen.dart';

import 'package:get/get.dart';
import '../../presentation/screen_ui/library/libary.dart';
import 'app_routes.dart';

class AppPages {
  static const initial = AppRoutes.splash;

  static final routes = [
    GetPage(name: AppRoutes.splash, page: () => const SplashScreen()),
    GetPage(name: AppRoutes.onboardingScreen1, page: () => const OnboardingScreen1()),
    GetPage(name: AppRoutes.onboardingScreen2, page: () => const OnboardingScreen2()),
    GetPage(name: AppRoutes.onboardingScreen3, page: () => const OnboardingScreen3()),
    GetPage(name: AppRoutes.onboardingScreen4, page: () => const OnboardingScreen4()),
    // GetPage(name: AppRoutes.onboardingScreen5, page: () => const OnboardingScreen5()),
    // GetPage(name: AppRoutes.onboardingScreen6, page: () => const OnboardingScreen6()),
    GetPage(name: AppRoutes.prePerformanceFocusDetailsScreen, page: () =>  const PrePerformanceFocusDetailsScreen()),

    GetPage(name: AppRoutes.joinUser, page: () => const JoinUser ()),
    GetPage(name: AppRoutes.singup, page: () => const Singup()),
    GetPage(name: AppRoutes.login, page: () => const Login()),
    GetPage(name: AppRoutes.forgotpassword, page: () => const Resetpassword ()),
    GetPage(name: AppRoutes.newpassword, page: ()=>Newpassword()),

    //====================Screen__ui========================================
    GetPage(name: AppRoutes.home, page: () => const Home(), transition: Transition.noTransition),
    GetPage(name: AppRoutes.motivation, page: () => const Motivation(), transition: Transition.noTransition),
    GetPage(name: AppRoutes.action, page: () => const Action(), transition: Transition.noTransition),
    GetPage(name: AppRoutes.aicreate, page: () =>  Aicreate(), transition: Transition.noTransition),

    //==============profile================================
    GetPage(name: AppRoutes.subcription, page: () => const SubscriptionScreen()),
    GetPage(name: AppRoutes.editProfile, page: () => const Editprofile()),

    //========================================Ai-create========================================
    GetPage(name: AppRoutes.startwithai, page: () => const Startwithai(),transitionDuration: const Duration(milliseconds: 800)),
    GetPage(name: AppRoutes.writemyscript, page: () => const Writemyscript(),transitionDuration: const Duration(milliseconds: 800)),
    GetPage(name: AppRoutes.musicPlayerScreen, page: () =>  MusicPlayerScreen()),
    GetPage(name: AppRoutes.concentraoScriptCreator, page: ()=>ConcentraoScriptCreator(),transitionDuration: const Duration(milliseconds: 1000)),
    
    //======================homedata=======================================
    GetPage(name: AppRoutes.prePerformanceFocus, page: ()=>PrePerformanceFocus(),transitionDuration: const Duration(milliseconds: 800)),
    GetPage(name: AppRoutes.confidenceReset, page: ()=>ConfidenceReset(),transitionDuration: const Duration(milliseconds: 800)),
    GetPage(name: AppRoutes.pressureControl, page: ()=>PressureControl(),transitionDuration: const Duration(milliseconds: 800)),
    GetPage(name: AppRoutes.pressureControlDetailsCard, page: ()=>PressureControlDetailsScreen(),transitionDuration: const Duration(milliseconds: 1000)),

    //====================library========================================
    GetPage(name: AppRoutes.library, page: () => const Library(), transition: Transition.noTransition),
    GetPage(name: AppRoutes.librarydetails, page: ()=>Confidencereinforcement()),
    GetPage(name: AppRoutes.librarydetails2, page: ()=>Pressurcontroller()),
    GetPage(name: AppRoutes.librarydetails3, page: ()=>Peakstateactivarion()),
    GetPage(name: AppRoutes.librarydetails4, page: ()=>PrePerformancerutine()),
    // GetPage(name: AppRoutes.seealldata, page: ()=>SeeAll()),

    // GetPage(name: AppRoutes.SavingScreen1, page: ()=>SavingScreen1()),
    GetPage(name: AppRoutes.aicreatemusicplayer, page: ()=>Createscriptscreen(),transitionDuration: const Duration(milliseconds: 1000)),
  ];
}
