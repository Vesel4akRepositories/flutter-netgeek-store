// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:flutter_secure_storage/flutter_secure_storage.dart' as _i6;
import 'package:freekassa/core/injection/register_module.dart' as _i103;
import 'package:freekassa/core/mediator/components/api_manager.dart' as _i20;
import 'package:freekassa/core/mediator/components/authorization_component.dart'
    as _i17;
import 'package:freekassa/core/mediator/madiator_interface.dart' as _i7;
import 'package:freekassa/core/mediator/mediator.dart' as _i8;
import 'package:freekassa/core/network/api_client_interface.dart' as _i19;
import 'package:freekassa/core/notifications/notifications_manager.dart'
    as _i77;
import 'package:freekassa/core/notifications/notifications_mediator/notifications_mediator.dart'
    as _i10;
import 'package:freekassa/core/notifications/notifications_mediator/notifications_mediator_interface.dart'
    as _i9;
import 'package:freekassa/core/notifications/notifications_repository.dart'
    as _i26;
import 'package:freekassa/core/storage/database_handler.dart' as _i18;
import 'package:freekassa/core/storage/pincode_storage.dart' as _i14;
import 'package:freekassa/core/storage/selected_shop_state_manager.dart'
    as _i15;
import 'package:freekassa/core/utils/theme/cubit/dynamic_theme_cubit.dart'
    as _i5;
import 'package:freekassa/feature/analytics/logic/repositories/analytics_repository.dart'
    as _i48;
import 'package:freekassa/feature/analytics/ui/bloc/analytics_bloc.dart'
    as _i94;
import 'package:freekassa/feature/auth/repository/auth_repository.dart' as _i49;
import 'package:freekassa/feature/bottom_navigation/data/order_repository.dart'
    as _i30;
import 'package:freekassa/feature/bottom_navigation/domen/other_pages_manager.dart'
    as _i31;
import 'package:freekassa/feature/bottom_navigation/logic/bill/bill_bloc.dart'
    as _i96;
import 'package:freekassa/feature/bottom_navigation/logic/bill/bill_repository.dart'
    as _i52;
import 'package:freekassa/feature/bottom_navigation/logic/bill/bill_send_email.dart'
    as _i53;
import 'package:freekassa/feature/bottom_navigation/logic/news/new_repository.dart'
    as _i25;
import 'package:freekassa/feature/bottom_navigation/logic/news/news_cubit.dart'
    as _i75;
import 'package:freekassa/feature/bottom_navigation/logic/news/news_manager.dart'
    as _i12;
import 'package:freekassa/feature/bottom_navigation/logic/order/log_list_bloc.dart'
    as _i69;
import 'package:freekassa/feature/bottom_navigation/logic/order/order_domain.dart'
    as _i79;
import 'package:freekassa/feature/bottom_navigation/logic/order/order_model.dart'
    as _i80;
import 'package:freekassa/feature/bottom_navigation/logic/order/order_notify.dart'
    as _i29;
import 'package:freekassa/feature/bottom_navigation/logic/payment/cubit/payment_provider.dart'
    as _i82;
import 'package:freekassa/feature/bottom_navigation/logic/payment/repository/payment_repository.dart'
    as _i33;
import 'package:freekassa/feature/chat/logic/repositories/chat_repository.dart'
    as _i56;
import 'package:freekassa/feature/chat/ui/bloc/chats_bloc.dart' as _i57;
import 'package:freekassa/feature/chat/ui/bloc/messages_bloc.dart' as _i74;
import 'package:freekassa/feature/home/repository/home_repository.dart' as _i62;
import 'package:freekassa/feature/home/view/home_controller.dart' as _i102;
import 'package:freekassa/feature/login/ui/bloc/login_bloc.dart' as _i70;
import 'package:freekassa/feature/login/ui/bloc/login_repository.dart' as _i11;
import 'package:freekassa/feature/make_widget/logic/repositories/make_widget_repository.dart'
    as _i24;
import 'package:freekassa/feature/make_widget/ui/bloc/make_widget_bloc.dart'
    as _i72;
import 'package:freekassa/feature/notifications/logic/repositories/notifications_repository.dart'
    as _i27;
import 'package:freekassa/feature/notifications/ui/bloc/notifications_bloc.dart'
    as _i76;
import 'package:freekassa/feature/partners/logic/repositories/balance_repository.dart'
    as _i51;
import 'package:freekassa/feature/partners/logic/repositories/invites_repository.dart'
    as _i21;
import 'package:freekassa/feature/partners/logic/repositories/statistics_repository.dart'
    as _i40;
import 'package:freekassa/feature/partners/ui/bloc/income_history_bloc.dart'
    as _i63;
import 'package:freekassa/feature/partners/ui/bloc/income_tab_bloc.dart'
    as _i64;
import 'package:freekassa/feature/partners/ui/bloc/invites_bloc.dart' as _i65;
import 'package:freekassa/feature/partners/ui/bloc/statistics_bloc.dart'
    as _i87;
import 'package:freekassa/feature/partners/ui/bloc/withdraw_balance_bloc.dart'
    as _i91;
import 'package:freekassa/feature/profile/logic/repositories/profile_repository.dart'
    as _i35;
import 'package:freekassa/feature/profile/ui/bloc/profile_bloc.dart' as _i84;
import 'package:freekassa/feature/registration/legal_data_entry/ui/bloc/legal_data_bloc.dart'
    as _i67;
import 'package:freekassa/feature/registration/logic/registation_repository.dart'
    as _i36;
import 'package:freekassa/feature/registration/register_verify_email/ui/bloc/verify_code_bloc.dart'
    as _i44;
import 'package:freekassa/feature/registration/site_credentials/ui/bloc/site_credentials_bloc.dart'
    as _i38;
import 'package:freekassa/feature/registration/site_credentials/ui/bloc/site_verify_bloc.dart'
    as _i39;
import 'package:freekassa/feature/registration/ui/bloc/register_credentials_bloc.dart'
    as _i85;
import 'package:freekassa/feature/security/change_pasword/logic/repositories/change_password_repository.dart'
    as _i54;
import 'package:freekassa/feature/security/change_pasword/ui/bloc/change_password_bloc.dart'
    as _i97;
import 'package:freekassa/feature/security/change_phone/logic/repositories/change_phone_repository.dart'
    as _i55;
import 'package:freekassa/feature/security/change_phone/ui/bloc/change_phone_bloc.dart'
    as _i98;
import 'package:freekassa/feature/security/change_phone/ui/bloc/fetch_phone_bloc.dart'
    as _i61;
import 'package:freekassa/feature/security/ip_security/logic/repositories/ip_security_repository.dart'
    as _i22;
import 'package:freekassa/feature/security/ip_security/ui/bloc/ip_security_bloc.dart'
    as _i66;
import 'package:freekassa/feature/security/two_step_auth/logic/repositories/two_step_auth_repository.dart'
    as _i43;
import 'package:freekassa/feature/security/two_step_auth/ui/bloc/two_step_auth_bloc.dart'
    as _i90;
import 'package:freekassa/feature/settings/auto_payout/logic/repositories/auto_payout_repository.dart'
    as _i50;
import 'package:freekassa/feature/settings/auto_payout/ui/bloc/auto_payout_bloc.dart'
    as _i95;
import 'package:freekassa/feature/settings/currency_accept/logic/repositories/currecy_accept_repository.dart'
    as _i59;
import 'package:freekassa/feature/settings/currency_accept/logic/settings_navigator_manager.dart'
    as _i16;
import 'package:freekassa/feature/settings/currency_accept/ui/bloc/currency_accept_bloc.dart'
    as _i100;
import 'package:freekassa/feature/settings/main_settings/logic/repositories/main_settings_repository.dart'
    as _i23;
import 'package:freekassa/feature/settings/main_settings/ui/bloc/main_settings_bloc.dart'
    as _i71;
import 'package:freekassa/feature/settings/notifications_settings/logic/repositories/notifications_settings_resository.dart'
    as _i28;
import 'package:freekassa/feature/settings/notifications_settings/ui/bloc/notifications_settings_bloc.dart'
    as _i78;
import 'package:freekassa/feature/settings/payment_page/logic/repositories/payment_page_repository.dart'
    as _i32;
import 'package:freekassa/feature/settings/payment_page/ui/bloc/light_logo_bloc.dart'
    as _i68;
import 'package:freekassa/feature/settings/payment_page/ui/bloc/merchant_files_bloc.dart'
    as _i73;
import 'package:freekassa/feature/settings/payment_page/ui/bloc/payment_page_bloc.dart'
    as _i81;
import 'package:freekassa/feature/shops/logic/repositories/activate_shop_repository.dart'
    as _i47;
import 'package:freekassa/feature/shops/logic/repositories/shops_repository.dart'
    as _i37;
import 'package:freekassa/feature/shops/logic/repositories/withdrawal_funds_repository.dart'
    as _i45;
import 'package:freekassa/feature/shops/ui/bloc/activate_shop_bloc.dart'
    as _i93;
import 'package:freekassa/feature/shops/ui/bloc/shops_bloc.dart' as _i86;
import 'package:freekassa/feature/shops/ui/bloc/withdrawal_funds_bloc.dart'
    as _i92;
import 'package:freekassa/feature/shops/ui/bloc/withdrawal_list_bloc.dart'
    as _i46;
import 'package:freekassa/feature/static_pages/ad_banners/ui/bloc/ad_banners_bloc.dart'
    as _i3;
import 'package:freekassa/feature/static_pages/cms_modules/logic/cms_modules_repository.dart'
    as _i58;
import 'package:freekassa/feature/static_pages/cms_modules/ui/bloc/cms_modules_bloc.dart'
    as _i99;
import 'package:freekassa/feature/static_pages/common/ui/navigation/common_pages_router.dart'
    as _i4;
import 'package:freekassa/feature/static_pages/faq/logic/faq_page_repository.dart'
    as _i60;
import 'package:freekassa/feature/static_pages/faq/ui/bloc/faq_page_bloc.dart'
    as _i101;
import 'package:freekassa/feature/static_pages/partnership/ui/bloc/partnership_bloc.dart'
    as _i13;
import 'package:freekassa/feature/static_pages/payment_verification/logic/payment_verify_repository.dart'
    as _i34;
import 'package:freekassa/feature/static_pages/payment_verification/ui/bloc/payment_verify_bloc.dart'
    as _i83;
import 'package:freekassa/feature/static_pages/tariffs/logic/tariffs_page_repository.dart'
    as _i41;
import 'package:freekassa/feature/static_pages/tariffs/ui/bloc/tariffs_page_bloc.dart'
    as _i88;
import 'package:freekassa/feature/static_pages/tech_support/logic/tech_support_repository.dart'
    as _i42;
import 'package:freekassa/feature/static_pages/tech_support/ui/bloc/tech_support_bloc.dart'
    as _i89;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart'
    as _i2; // ignore_for_file: unnecessary_lambdas

// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
_i1.GetIt $initGetIt(
  _i1.GetIt get, {
  String? environment,
  _i2.EnvironmentFilter? environmentFilter,
}) {
  final gh = _i2.GetItHelper(
    get,
    environment,
    environmentFilter,
  );
  final registerModule = _$RegisterModule();
  gh.factory<_i3.AdBannersBloc>(() => _i3.AdBannersBloc());
  gh.lazySingleton<_i4.CommonPagesRouter>(() => _i4.CommonPagesRouter());
  gh.singleton<_i5.DynamicThemeCubit>(_i5.DynamicThemeCubit());
  gh.factory<_i6.FlutterSecureStorage>(() => registerModule.secureStorage);
  gh.singleton<_i7.IMediator>(_i8.Mediator());
  gh.lazySingleton<_i9.INotificationsMediator>(
      () => _i10.NotificationsMediator());
  gh.singleton<_i11.LoginRepository>(_i11.LoginRepository());
  gh.factory<_i12.NewsManager>(() => _i12.NewsManager());
  gh.factory<_i13.PartnershipBloc>(() => _i13.PartnershipBloc());
  gh.factory<_i14.PinCodeStorage>(
      () => _i14.PinCodeStorage(get<_i6.FlutterSecureStorage>()));
  gh.singleton<_i15.SelectedShopStateManager>(
      _i15.SelectedShopStateManager(get<_i7.IMediator>()));
  gh.factory<_i16.SettingsNavigatorManager>(
      () => _i16.SettingsNavigatorManager());
  gh.singleton<_i17.AuthBloc>(_i17.AuthBloc(get<_i7.IMediator>()));
  gh.singleton<_i18.DatabaseHandler>(_i18.DatabaseHandler(
    get<_i7.IMediator>(),
    get<_i6.FlutterSecureStorage>(),
  ));
  gh.singleton<_i19.IApiManager>(_i20.ApiManager(get<_i7.IMediator>()));
  gh.factory<_i21.InvitesRepository>(
      () => _i21.InvitesRepository(get<_i19.IApiManager>()));
  gh.factory<_i22.IpSecurityRepository>(
      () => _i22.IpSecurityRepository(get<_i19.IApiManager>()));
  gh.factory<_i23.MainSettingsRepository>(
      () => _i23.MainSettingsRepository(get<_i19.IApiManager>()));
  gh.factory<_i24.MakeWidgetRepository>(
      () => _i24.MakeWidgetRepository(get<_i19.IApiManager>()));
  gh.factory<_i25.NewsRepository>(
      () => _i25.NewsRepository(get<_i19.IApiManager>()));
  gh.factory<_i26.NotificationsRepository>(
      () => _i26.NotificationsRepository(get<_i19.IApiManager>()));
  gh.lazySingleton<_i27.NotificationsRepository>(
      () => _i27.NotificationsRepository(get<_i19.IApiManager>()));
  gh.factory<_i28.NotificationsSettingsRepository>(
      () => _i28.NotificationsSettingsRepository(get<_i19.IApiManager>()));
  gh.factory<_i29.OrderNotify>(() => _i29.OrderNotify(get<_i19.IApiManager>()));
  gh.factory<_i30.OrderRepository>(
      () => _i30.OrderRepository(get<_i19.IApiManager>()));
  gh.factory<_i31.OtherPagesManager>(() => _i31.OtherPagesManager(
        get<_i4.CommonPagesRouter>(),
        get<_i16.SettingsNavigatorManager>(),
      ));
  gh.factory<_i32.PaymentPageRepository>(
      () => _i32.PaymentPageRepository(get<_i19.IApiManager>()));
  gh.factory<_i33.PaymentRepository>(
      () => _i33.PaymentRepository(get<_i19.IApiManager>()));
  gh.factory<_i34.PaymentVerifyRepository>(
      () => _i34.PaymentVerifyRepository(get<_i19.IApiManager>()));
  gh.factory<_i35.ProfileRepository>(
      () => _i35.ProfileRepository(get<_i19.IApiManager>()));
  gh.factory<_i36.RegistrationRepository>(
      () => _i36.RegistrationRepository(get<_i19.IApiManager>()));
  gh.factory<_i37.ShopsRepository>(() => _i37.ShopsRepository(
        get<_i19.IApiManager>(),
        get<_i15.SelectedShopStateManager>(),
      ));
  gh.factory<_i38.SiteCredentialsBloc>(
      () => _i38.SiteCredentialsBloc(get<_i36.RegistrationRepository>()));
  gh.factory<_i39.SiteVerifyBloc>(
      () => _i39.SiteVerifyBloc(get<_i36.RegistrationRepository>()));
  gh.lazySingleton<_i40.StatisticsRepository>(
      () => _i40.StatisticsRepository(get<_i19.IApiManager>()));
  gh.factory<_i41.TariffsPageRepository>(
      () => _i41.TariffsPageRepository(get<_i19.IApiManager>()));
  gh.factory<_i42.TechSupportRepository>(
      () => _i42.TechSupportRepository(get<_i19.IApiManager>()));
  gh.factory<_i43.TwoStepAuthRepository>(
      () => _i43.TwoStepAuthRepository(get<_i19.IApiManager>()));
  gh.factory<_i44.VerifyCodeBloc>(
      () => _i44.VerifyCodeBloc(get<_i36.RegistrationRepository>()));
  gh.factory<_i45.WithdrawalFundsRepository>(
      () => _i45.WithdrawalFundsRepository(get<_i19.IApiManager>()));
  gh.singleton<_i46.WithdrawalListBloc>(_i46.WithdrawalListBloc(
    get<_i37.ShopsRepository>(),
    get<_i15.SelectedShopStateManager>(),
  ));
  gh.factory<_i47.ActivateShopRepository>(
      () => _i47.ActivateShopRepository(get<_i19.IApiManager>()));
  gh.factory<_i48.AnalyticsRepository>(
      () => _i48.AnalyticsRepository(get<_i19.IApiManager>()));
  gh.factory<_i49.AuthRepository>(
      () => _i49.AuthRepository(get<_i19.IApiManager>()));
  gh.factory<_i50.AutoPayoutRepository>(
      () => _i50.AutoPayoutRepository(get<_i19.IApiManager>()));
  gh.factory<_i51.BalanceRepository>(
      () => _i51.BalanceRepository(get<_i19.IApiManager>()));
  gh.factory<_i52.BillRepository>(
      () => _i52.BillRepository(get<_i19.IApiManager>()));
  gh.factory<_i53.BillSendEmail>(
      () => _i53.BillSendEmail(get<_i19.IApiManager>()));
  gh.factory<_i54.ChangePasswordRepository>(
      () => _i54.ChangePasswordRepository(get<_i19.IApiManager>()));
  gh.factory<_i55.ChangePhoneRepository>(
      () => _i55.ChangePhoneRepository(get<_i19.IApiManager>()));
  gh.factory<_i56.ChatRepository>(
      () => _i56.ChatRepository(get<_i19.IApiManager>()));
  gh.factory<_i57.ChatsBloc>(() => _i57.ChatsBloc(get<_i56.ChatRepository>()));
  gh.factory<_i58.CmsModulesRepository>(
      () => _i58.CmsModulesRepository(get<_i19.IApiManager>()));
  gh.factory<_i59.CurrencyAcceptRepository>(
      () => _i59.CurrencyAcceptRepository(get<_i19.IApiManager>()));
  gh.factory<_i60.FaqPageRepository>(
      () => _i60.FaqPageRepository(get<_i19.IApiManager>()));
  gh.factory<_i61.FetchPhoneBloc>(
      () => _i61.FetchPhoneBloc(get<_i55.ChangePhoneRepository>()));
  gh.factory<_i62.HomeRepository>(
      () => _i62.HomeRepository(get<_i19.IApiManager>()));
  gh.factory<_i63.IncomeHistoryBloc>(
      () => _i63.IncomeHistoryBloc(get<_i51.BalanceRepository>()));
  gh.factory<_i64.IncomeTabBloc>(
      () => _i64.IncomeTabBloc(get<_i51.BalanceRepository>()));
  gh.factory<_i65.InvitesBloc>(
      () => _i65.InvitesBloc(get<_i21.InvitesRepository>()));
  gh.factory<_i66.IpSecurityBloc>(() => _i66.IpSecurityBloc(
        get<_i22.IpSecurityRepository>(),
        get<_i15.SelectedShopStateManager>(),
      ));
  gh.factory<_i67.LegalDataBloc>(
      () => _i67.LegalDataBloc(get<_i36.RegistrationRepository>()));
  gh.factory<_i68.LightLogoBloc>(() => _i68.LightLogoBloc(
        get<_i32.PaymentPageRepository>(),
        get<_i15.SelectedShopStateManager>(),
      ));
  gh.factory<_i69.LogListBloc>(() => _i69.LogListBloc(
        get<_i30.OrderRepository>(),
        get<_i15.SelectedShopStateManager>(),
      ));
  gh.factory<_i70.LoginBloc>(() => _i70.LoginBloc(
        get<_i49.AuthRepository>(),
        get<_i17.AuthBloc>(),
        get<_i11.LoginRepository>(),
      ));
  gh.factory<_i71.MainSettingsBloc>(() => _i71.MainSettingsBloc(
        get<_i23.MainSettingsRepository>(),
        get<_i15.SelectedShopStateManager>(),
      ));
  gh.factory<_i72.MakeWidgetBloc>(() => _i72.MakeWidgetBloc(
        get<_i24.MakeWidgetRepository>(),
        get<_i15.SelectedShopStateManager>(),
      ));
  gh.factory<_i73.MerchantFilesBloc>(() => _i73.MerchantFilesBloc(
        get<_i32.PaymentPageRepository>(),
        get<_i15.SelectedShopStateManager>(),
      ));
  gh.factory<_i74.MessagesBloc>(() => _i74.MessagesBloc(
        get<_i56.ChatRepository>(),
        get<_i15.SelectedShopStateManager>(),
      ));
  gh.factory<_i75.NewsProvier>(
      () => _i75.NewsProvier(get<_i25.NewsRepository>()));
  gh.lazySingleton<_i76.NotificationsBloc>(() => _i76.NotificationsBloc(
        get<_i27.NotificationsRepository>(),
        get<_i15.SelectedShopStateManager>(),
        get<_i56.ChatRepository>(),
        get<_i17.AuthBloc>(),
      ));
  gh.lazySingleton<_i77.NotificationsManager>(() => _i77.NotificationsManager(
        get<_i26.NotificationsRepository>(),
        get<_i9.INotificationsMediator>(),
        get<_i7.IMediator>(),
      ));
  gh.factory<_i78.NotificationsSettingsBloc>(
      () => _i78.NotificationsSettingsBloc(
            get<_i28.NotificationsSettingsRepository>(),
            get<_i15.SelectedShopStateManager>(),
          ));
  gh.factory<_i79.OrderDomain>(
      () => _i79.OrderDomain(get<_i30.OrderRepository>()));
  gh.factory<_i80.OrderModel>(
      () => _i80.OrderModel(get<_i30.OrderRepository>()));
  gh.factory<_i81.PaymentPageBloc>(() => _i81.PaymentPageBloc(
        get<_i32.PaymentPageRepository>(),
        get<_i15.SelectedShopStateManager>(),
      ));
  gh.factory<_i82.PaymentProvider>(
      () => _i82.PaymentProvider(get<_i33.PaymentRepository>()));
  gh.factory<_i83.PaymentVerifyBloc>(
      () => _i83.PaymentVerifyBloc(get<_i34.PaymentVerifyRepository>()));
  gh.factory<_i84.ProfileBloc>(
      () => _i84.ProfileBloc(get<_i35.ProfileRepository>()));
  gh.factory<_i85.RegisterCredentialsBloc>(
      () => _i85.RegisterCredentialsBloc(get<_i36.RegistrationRepository>()));
  gh.factory<_i86.ShopsBloc>(() => _i86.ShopsBloc(
        get<_i37.ShopsRepository>(),
        get<_i15.SelectedShopStateManager>(),
      ));
  gh.factory<_i87.StatisticsBloc>(
      () => _i87.StatisticsBloc(get<_i40.StatisticsRepository>()));
  gh.factory<_i88.TariffsPageBloc>(
      () => _i88.TariffsPageBloc(get<_i41.TariffsPageRepository>()));
  gh.factory<_i89.TechSupportBloc>(
      () => _i89.TechSupportBloc(get<_i42.TechSupportRepository>()));
  gh.factory<_i90.TwoStepAuthBloc>(() => _i90.TwoStepAuthBloc(
        get<_i43.TwoStepAuthRepository>(),
        get<_i15.SelectedShopStateManager>(),
      ));
  gh.factory<_i91.WithdrawBalanceBloc>(
      () => _i91.WithdrawBalanceBloc(get<_i51.BalanceRepository>()));
  gh.factory<_i92.WithdrawalFundsBloc>(() => _i92.WithdrawalFundsBloc(
        get<_i45.WithdrawalFundsRepository>(),
        get<_i15.SelectedShopStateManager>(),
      ));
  gh.factory<_i93.ActivateShopBloc>(
      () => _i93.ActivateShopBloc(get<_i47.ActivateShopRepository>()));
  gh.factory<_i94.AnalyticsBloc>(() => _i94.AnalyticsBloc(
        get<_i48.AnalyticsRepository>(),
        get<_i15.SelectedShopStateManager>(),
      ));
  gh.factory<_i95.AutoPayoutBloc>(() => _i95.AutoPayoutBloc(
        get<_i50.AutoPayoutRepository>(),
        get<_i15.SelectedShopStateManager>(),
      ));
  gh.factory<_i96.BillBloc>(() => _i96.BillBloc(
        get<_i52.BillRepository>(),
        get<_i15.SelectedShopStateManager>(),
      ));
  gh.factory<_i97.ChangePasswordBloc>(
      () => _i97.ChangePasswordBloc(get<_i54.ChangePasswordRepository>()));
  gh.factory<_i98.ChangePhoneBloc>(() => _i98.ChangePhoneBloc(
        get<_i55.ChangePhoneRepository>(),
        get<_i15.SelectedShopStateManager>(),
      ));
  gh.factory<_i99.CmsModulesBloc>(() => _i99.CmsModulesBloc(
        get<_i58.CmsModulesRepository>(),
        get<_i19.IApiManager>(),
      ));
  gh.factory<_i100.CurrencyAcceptBloc>(() => _i100.CurrencyAcceptBloc(
        get<_i59.CurrencyAcceptRepository>(),
        get<_i15.SelectedShopStateManager>(),
      ));
  gh.factory<_i101.FaqPageBloc>(
      () => _i101.FaqPageBloc(get<_i60.FaqPageRepository>()));
  gh.factory<_i102.HomeController>(
      () => _i102.HomeController(get<_i62.HomeRepository>()));
  return get;
}

class _$RegisterModule extends _i103.RegisterModule {}
