import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:qlns/ui/views/arrive_late_and_come_home_early.dart';
import 'package:qlns/ui/views/complete_the_timekeeping.dart';
import 'package:qlns/ui/views/data_failed.dart';
import 'package:qlns/ui/views/external_work.dart';
import 'package:qlns/ui/views/external_work_registration.dart';
import 'package:qlns/ui/views/ghost_page.dart';
import 'package:qlns/ui/views/home.dart';
import 'package:qlns/ui/views/login.dart';
import 'package:qlns/ui/views/maternity.dart';
import 'package:qlns/ui/views/maternity_registration.dart';
import 'package:qlns/ui/views/monthly_worksheet.dart';
import 'package:qlns/ui/views/personal_timesheets.dart';
import 'package:qlns/ui/views/sabbatical_leave_view.dart';
import 'package:qlns/ui/views/splash_screen.dart';
import 'package:qlns/ui/views/timekeeping.dart';
import 'package:qlns/ui/views/timekeeping_compensation.dart';

class Router {
  static const String main = '/';
  static const String ghost = 'ghost';
  static const String login = 'login';
  static const String home = 'home';
  static const String sabbaticalLeave = 'sabbaticalLeave';
  static const String timekeeping = 'timekeeping';
  static const String monthlyWorksheet = 'monthlyWorksheet';
  static const String dataFailed = 'dataFailed';
  static const String completeTheTimekeeping = 'completeTheTimekeeping';
  static const String arriveLateAndComeHomeEarly = 'arriveLateAndComeHomeEarly';
  static const String personalTimeSheets = 'personalTimeSheets';
  static const String maternity = 'maternity';
  static const String maternityRegistration = 'maternityRegistration';
  static const String externalWork = 'externalWork';
  static const String externalWorkRegistration = 'externalWorkRegistration';
  static const String timekeepingCompensation = 'timekeepingCompensation';


  static Route<dynamic> generateRoute(RouteSettings settings) {
    return MaterialPageRoute(
      builder: (context) => route(settings),
      settings: RouteSettings(name: settings.name),
    );
  }

  static route(RouteSettings settings) {
    switch (settings.name) {
      case main:
        return SplashScreen();
      case ghost:
        return GhostPage();
      case login:
        return Login();
      case home:
        return Home();
      case sabbaticalLeave:
        return SabbaticalLeaveView();
      case timekeeping:
        return Timekeeping();
      case monthlyWorksheet:
        return MonthlyWorksheet();
      case dataFailed:
        return DataFailed();
      case completeTheTimekeeping:
        return CompleteTheTimekeeping();
      case arriveLateAndComeHomeEarly:
        return ArriveLateAndComeHomeEarly();
      case personalTimeSheets:
        return PersonalTimeSheets();
      case maternity:
        return Maternity();
      case maternityRegistration:
        return MaternityRegistration();
      case externalWork:
        return ExternalWork();
      case externalWorkRegistration:
        return ExternalWorkRegistration();
      case timekeepingCompensation:
        return TimekeepingCompensation();
    }
  }
}