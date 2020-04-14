import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:qlns/ui/views/arrive_late_and_come_home_early.dart';
import 'package:qlns/ui/views/complete_the_timekeeping.dart';
import 'package:qlns/ui/views/external_work.dart';
import 'package:qlns/ui/views/external_work_registration.dart';
import 'package:qlns/ui/views/home.dart';
import 'package:qlns/ui/views/login.dart';
import 'package:qlns/ui/views/maternity.dart';
import 'package:qlns/ui/views/maternity_registration.dart';
import 'package:qlns/ui/views/monthly_worksheet.dart';
import 'package:qlns/ui/views/personal_timesheets.dart';
import 'package:qlns/ui/views/sabbatical_leave_view.dart';
import 'package:qlns/ui/views/data_failed.dart';
import 'package:qlns/ui/views/timekeeping.dart';
import 'package:qlns/ui/views/timekeeping_compensation.dart';

class Navigation {
  goToHome(BuildContext context) {
    final homeView = Home();
    return Navigator.of(context)
        .pushReplacement(MaterialPageRoute(builder: (BuildContext context) {
      return homeView;
    }));
  }

  goToLogin(BuildContext context) {
    final loginView = Login();
    return Navigator.of(context)
        .pushReplacement(MaterialPageRoute(builder: (BuildContext context) {
      return loginView;
    }));
  }

  goSabbaticalLeave(BuildContext context) {
    final sabbaticalLeaveView = SabbaticalLeaveView();
    return Navigator.of(context)
        .pushReplacement(MaterialPageRoute(builder: (BuildContext context) {
      return sabbaticalLeaveView;
    }));
  }

  goToTimekeeping(BuildContext context) {
    final timekeeping = Timekeeping();
    return Navigator.of(context)
        .pushReplacement(MaterialPageRoute(builder: (BuildContext context) {
      return timekeeping;
    }));
  }

  goToMonthlyWorksheet(BuildContext context) {
    final monthlyWorksheet = MonthlyWorksheet();
    return Navigator.of(context)
        .pushReplacement(MaterialPageRoute(builder: (BuildContext context) {
      return monthlyWorksheet;
    }));
  }

  goToDataFailed(BuildContext context) {
    final dataFailed = DataFailed();
    return Navigator.of(context)
        .pushReplacement(MaterialPageRoute(builder: (BuildContext context) {
      return dataFailed;
    }));
  }

  goToCompleteTheTimekeeping(BuildContext context) {
    final completeTheTimekeeping = CompleteTheTimekeeping();
    return Navigator.of(context)
        .pushReplacement(MaterialPageRoute(builder: (BuildContext context) {
      return completeTheTimekeeping;
    }));
  }
  goToPersonalTimeSheets(BuildContext context) {
    final personalTimeSheets = PersonalTimeSheets();
    return Navigator.of(context)
        .pushReplacement(MaterialPageRoute(builder: (BuildContext context) {
      return personalTimeSheets;
    }));
  }
  goToArriveLateAndComeHomeEarly(BuildContext context) {
    final arriveLateAndComeHomeEarly = ArriveLateAndComeHomeEarly();
    return Navigator.of(context)
        .pushReplacement(MaterialPageRoute(builder: (BuildContext context) {
      return arriveLateAndComeHomeEarly;
    }));
  }
  goToTimekeepingCompensation(BuildContext context) {
    final timekeepingCompensation = TimekeepingCompensation();
    return Navigator.of(context)
        .pushReplacement(MaterialPageRoute(builder: (BuildContext context) {
      return timekeepingCompensation;
    }));
  }
  goToMaternity(BuildContext context) {
    final maternity = Maternity();
    return Navigator.of(context)
        .pushReplacement(MaterialPageRoute(builder: (BuildContext context) {
      return maternity;
    }));
  }
  goToMaternityRegistration(BuildContext context) {
    final maternityRegistration = MaternityRegistration();
    return Navigator.of(context)
        .pushReplacement(MaterialPageRoute(builder: (BuildContext context) {
      return maternityRegistration;
    }));
  }
  goToExternalWork(BuildContext context) {
    final externalWork = ExternalWork();
    return Navigator.of(context)
        .pushReplacement(MaterialPageRoute(builder: (BuildContext context) {
      return externalWork;
    }));
  }
  goToExternalWorkRegistration(BuildContext context) {
    final externalWorkRegistration = ExternalWorkRegistration();
    return Navigator.of(context)
        .pushReplacement(MaterialPageRoute(builder: (BuildContext context) {
      return externalWorkRegistration;
    }));
  }
}
