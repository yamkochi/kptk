import 'package:av_net_shop/kpakka_kacheri/view/disp_future_kacheri.dart';
import 'package:av_net_shop/kpakka_kacheri/view/disp_next_kacheri.dart';
import 'package:av_net_shop/kpakka_kacheri/view/disp_past_kacheri.dart';
import 'package:av_net_shop/kptk_login/view/sign_form_kptk.dart';
import 'package:av_net_shop/routs.dart';
import 'package:av_net_shop/screens/home/home_screen.dart';
import 'package:av_net_shop/screens/login_success/login_success_screen.dart';
import 'package:av_net_shop/screens/sign_in/sign_in_screen.dart';
import 'package:av_net_shop/screens/sign_up/sign_up_screen.dart';
import 'package:av_net_shop/songs_of_raga/view/add_song_raga.dart';
import 'package:av_net_shop/songs_of_raga/view/disp_song_raga.dart';
import 'package:av_net_shop/songs_of_raga/view/edit_song_raga.dart';
import 'package:av_net_shop/sub_ragam/bindings/sub_bindings.dart';
import 'package:av_net_shop/sub_ragam/view/add_sub_form.dart';
import 'package:av_net_shop/sub_ragam/view/disp_sub_raga.dart';
import 'package:av_net_shop/sub_ragam/view/edit_sub_form.dart';
import 'package:av_net_shop/sub_ragam/view/edit_sub_screen.dart';
import 'package:av_net_shop/mela_ragam/view/disp_mela_raga.dart';
import 'package:flutter/material.dart';
import 'screens/splash/splash_screen.dart';
import 'screens/theme.dart';
import 'package:get/get.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: theme(),
      home: SplashScreen(),
      //initialRoute: SplashScreen.routName,
      getPages: [
        GetPage(
            name: '/login_success_screen', page: () => LoginSuccessScreen()),
        GetPage(name: '/home_screen', page: () => HomeScreen()),
        GetPage(name: '/sign_up_screen', page: () => SignUpScreen()),
        GetPage(name: '/sign_in_screen', page: () => SignInScreen()),
        GetPage(name: '/disp_mela_raga', page: () => MelaRagaPage()),
        GetPage(name: '/disp_sub_raga', page: () => SubRagaPage()),
        GetPage(name: '/disp_song_raga', page: () => SongRagaPage()),
        GetPage(name: '/edit_sub_screen', page: () => EditSubScreen()),
        GetPage(
            name: '/edit_sub_form',
            page: () => EditSubForm(),
            binding: SubBinding()),
        GetPage(name: '/add_sub_form', page: () => AddSubForm()),
        GetPage(name: '/add_song_raga', page: () => AddSongForm()),
        GetPage(name: '/edit_song_raga', page: () => EditSongForm()),
        GetPage(name: '/disp_next_kacherry', page: () => DispNextKacherry()),
        GetPage(name: '/disp_past_kacherry', page: () => DispPastKacherry()),
        GetPage(name: '/disp_future_kacherry', page: () => DispFutureKacherry()),
        GetPage(name: '/sign_form_kptk', page: () => SignFormKptk()),
        

      
      ],

      routes: ourRouts,
    );
  }
}
