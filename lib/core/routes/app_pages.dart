import 'package:aura/presentation/authscreen/login.dart';
import 'package:aura/presentation/authscreen/newpassword.dart';
import 'package:aura/presentation/authscreen/resetpassword.dart';
import 'package:aura/presentation/authscreen/singup.dart';
import 'package:aura/presentation/profile/profile.dart';
import 'package:aura/presentation/screeen_ui/action/action.dart';
import 'package:aura/presentation/screeen_ui/aicreate/CreateScriptScreen.dart';
import 'package:aura/presentation/screeen_ui/aicreate/aicreate.dart';
import 'package:aura/presentation/screeen_ui/aicreate/startwithai.dart';
import 'package:aura/presentation/screeen_ui/aicreate/writemyscript.dart';
import 'package:aura/presentation/screeen_ui/home/home.dart';
import 'package:aura/presentation/screeen_ui/motivation/motivation.dart';
import 'package:get/get.dart';
import '../../presentation/profile/subscription.dart';
import '../../presentation/screeen_ui/home/widget/seealldata.dart';
import '../../presentation/screeen_ui/library/vsualisation.dart';
import '../../presentation/screeen_ui/musicPlayerScreen/musicPlayerScreen.dart';
import '../../presentation/splash_screen/PrePerformanceFocusdetelsscreen.dart';
import '../../presentation/splash_screen/onlodaingScreen4.dart';
import '../../presentation/splash_screen/onlodaingScreen5.dart';
import '../../presentation/splash_screen/onlodaingscreen2.dart';
import '../../presentation/splash_screen/onlodingScreen.dart';
import '../../presentation/splash_screen/onlodingScreen3.dart';
import '../../presentation/splash_screen/onlodingScreen6.dart';
import '../../presentation/splash_screen/splash_screen.dart';
import '../../presentation/authscreen/Joinuser .dart';
import 'app_routes.dart';

class AppPages {
  static const initial = AppRoutes.splash;

  static final routes = [
    GetPage(name: AppRoutes.splash, page: () => const SplashScreen()),
    GetPage(name: AppRoutes.onlodingscreen, page: () => const Onlodingscreen()),
    GetPage(name: AppRoutes.onlodaingscreen2, page: () => const Onlodaingscreen2()),
    GetPage(name: AppRoutes.onlodaingscreen3, page: () => const Onlodingscreen3()),
    GetPage(name: AppRoutes.onlodaingscreen4, page: () => const Onlodaingscreen4()),
    GetPage(name: AppRoutes.onlodaingscreen5, page: () => const Onlodaingscreen5()),
    GetPage(name: AppRoutes.onlodaingscreen6, page: () => const Onlodingscreen6()),
    GetPage(name: AppRoutes.preperformancefocusdetelsscreen, page: () =>  Preperformancefocusdetelsscreen()),







    GetPage(name: AppRoutes.joinuser, page: () => const Joinuser ()),
    GetPage(name: AppRoutes.singup, page: () => const Singup()),
    GetPage(name: AppRoutes.login, page: () => const Login()),
    GetPage(name: AppRoutes.forgotpassword, page: () => const Resetpassword ()),
    GetPage(name: AppRoutes.newpassword, page: ()=>Newpassword()),




    //====================Screen__ui========================================
    GetPage(name: AppRoutes.home, page: () => const Home(),transition: Transition.noTransition),
    GetPage(name: AppRoutes.seealldata, page: () => const Seealldata()),
    GetPage(name: AppRoutes.vsualisation, page: () => const Vsualisation(),transition: Transition.noTransition),
    GetPage(name: AppRoutes.motivation, page: () => const Motivation(),transition: Transition.noTransition),
    GetPage(name: AppRoutes.action, page: () => const Action(),transition: Transition.noTransition),
    GetPage(name: AppRoutes.aicreate, page: () =>  Aicreate(),transition: Transition.noTransition),

    //==============profile================================
GetPage(name: AppRoutes.profile, page: () => const Profile()),
    GetPage(name: AppRoutes.subcription, page: () => const SubscriptionScreen()),



    //========================================Ai-create========================================

    GetPage(name: AppRoutes.startwithai, page: () => const Startwithai()),
    GetPage(name: AppRoutes.writemyscript, page: () => const Writemyscript()),
    GetPage(name: AppRoutes.musicPlayerScreen, page: () =>  MusicPlayerScreen()),
    GetPage(name: AppRoutes.createScriptScreen, page:()=>CreateScriptScreen()),








  ];
}
