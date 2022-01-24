
import 'package:av_net_shop/screens/cart/cart_screen.dart';
import 'package:av_net_shop/screens/complete_profile/complete_profile_screen.dart';
import 'package:av_net_shop/screens/details/details_screen.dart';
import 'package:av_net_shop/screens/forgot_password/forgot_password_screen.dart';
import 'package:av_net_shop/screens/home/home_screen.dart';
import 'package:av_net_shop/screens/login_success/login_success_screen.dart';
import 'package:av_net_shop/screens/otp/otp_screen.dart';
import 'package:av_net_shop/screens/profile/profile_screen.dart';
import 'package:av_net_shop/screens/sign_in/sign_in_screen.dart';
import 'package:av_net_shop/screens/sign_up/sign_up_screen.dart';
import 'package:av_net_shop/screens/splash/splash_screen.dart';
import 'package:flutter/widgets.dart';

final Map<String, WidgetBuilder> ourRouts = {
  SplashScreen.routName:(context)=>SplashScreen(),
  SignInScreen.routName:(context)=>SignInScreen(),
  ForgotPasswordScreen.routName:(context)=>ForgotPasswordScreen(),
  LoginSuccessScreen.routName:(context)=>LoginSuccessScreen(),
  SignUpScreen.routName:(context)=>SignUpScreen(),
  CompleteProfileScreen.routName:(context)=>CompleteProfileScreen(),
  OtpScreen.routName:(context)=>OtpScreen(),
  HomeScreen.routName:(context)=>HomeScreen(),
  DetailsScreen.routName:(context)=>DetailsScreen(),
  CartScreen.routName:(context)=>CartScreen(),
  ProfileScreen.routName:(context)=>ProfileScreen(),

  

  
};
