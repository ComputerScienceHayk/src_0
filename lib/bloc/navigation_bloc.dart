import 'package:flutter_bloc/flutter_bloc.dart';

class NavigationBlocObserver extends BlocObserver {
  @override
  void onEvent(Bloc bloc, Object event) {
    super.onEvent(bloc, event);
    print(event);
  }

  @override
  void onTransition(Bloc bloc, Transition transition) {
    super.onTransition(bloc, transition);
    print(transition);
  }

  @override
  void onError(BlocBase bloc, Object error, StackTrace stackTrace) {
    print(error);
    super.onError(bloc, error, stackTrace);
  }
}

enum NavigationEvent {
  home,
  profile,
  coupons,
  cards,
  notifications,
  settings,
  editPage,
  supportPage,
  langPage,
  companiesPage,
  privacyPage,
  notificationsSettingsPage,
  referralsPage,
  appInfoPage,
  suggestCompanyPage,
  createMyCardPage,
  filterPage,
  addNewCardPage,
  currentCardPage,
  couponsReadMorePage,
}

class NavigationBloc extends Bloc<NavigationEvent, String> {
  NavigationBloc() : super("home");
  String navName = "home";
  bool appBarExist;

  @override
  Stream<String> mapEventToState(NavigationEvent event) async* {
    switch (event) {
      case NavigationEvent.home:
        yield navName = "home";
        appBarExist = true;
        break;
      case NavigationEvent.profile:
        yield navName = "profile";
        appBarExist = true;
        break;
      case NavigationEvent.coupons:
        yield navName = "coupons";
        appBarExist = true;
        break;
      case NavigationEvent.cards:
        yield navName = "cards";
        appBarExist = true;
        break;
      case NavigationEvent.notifications:
        yield navName = "notifications";
        appBarExist = true;
        break;
      case NavigationEvent.settings:
        yield navName = "settings";
        appBarExist = true;
        break;
      case NavigationEvent.editPage:
        yield navName = "edit_page";
        appBarExist = false;
        break;
      case NavigationEvent.supportPage:
        yield navName = "support_page";
        appBarExist = false;
        break;
      case NavigationEvent.langPage:
        yield navName = "lang_page";
        appBarExist = false;
        break;
      case NavigationEvent.companiesPage:
        yield navName = "companies_page";
        appBarExist = false;
        break;
      case NavigationEvent.appInfoPage:
        yield navName = "app_info_page";
        appBarExist = false;
        break;
      case NavigationEvent.referralsPage:
        yield navName = "referrals_page";
        appBarExist = false;
        break;
      case NavigationEvent.notificationsSettingsPage:
        yield navName = "notifications_settings_page";
        appBarExist = false;
        break;
      case NavigationEvent.privacyPage:
        yield navName = "privacy_page";
        appBarExist = false;
        break;
      case NavigationEvent.suggestCompanyPage:
        yield navName = "suggest_company_page";
        appBarExist = true;
        break;
      case NavigationEvent.createMyCardPage:
        yield navName = "create_my_card_page";
        appBarExist = true;
        break;
      case NavigationEvent.filterPage:
        yield navName = "filter_page";
        appBarExist = true;
        break;
      case NavigationEvent.addNewCardPage:
        yield navName = "add_new_card_page";
        appBarExist = true;
        break;
      case NavigationEvent.currentCardPage:
        yield navName = "current_card_page";
        appBarExist = true;
        break;
      case NavigationEvent.couponsReadMorePage:
        yield navName = "coupons_read_more_page";
        appBarExist = true;
        break;
    }
  }
}