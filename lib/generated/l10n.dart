// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class S {
  S();

  static S? _current;

  static S get current {
    assert(_current != null, 'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.');
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false) ? locale.languageCode : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = S();
      S._current = instance;

      return instance;
    });
  }

  static S of(BuildContext context) {
    final instance = S.maybeOf(context);
    assert(instance != null, 'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?');
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `Login`
  String get access_login_TextLogin {
    return Intl.message(
      'Login',
      name: 'access_login_TextLogin',
      desc: '',
      args: [],
    );
  }

  /// `Remember me`
  String get access_login_RememberMe {
    return Intl.message(
      'Remember me',
      name: 'access_login_RememberMe',
      desc: '',
      args: [],
    );
  }

  /// `Forgot password?`
  String get access_login_ForgotPassword {
    return Intl.message(
      'Forgot password?',
      name: 'access_login_ForgotPassword',
      desc: '',
      args: [],
    );
  }

  /// `Login`
  String get access_login_TextLoginButton {
    return Intl.message(
      'Login',
      name: 'access_login_TextLoginButton',
      desc: '',
      args: [],
    );
  }

  /// `You don't have an account yet?`
  String get access_login_YouDontHaveAnAccountYet {
    return Intl.message(
      'You don\'t have an account yet?',
      name: 'access_login_YouDontHaveAnAccountYet',
      desc: '',
      args: [],
    );
  }

  /// `Register`
  String get access_login_Register {
    return Intl.message(
      'Register',
      name: 'access_login_Register',
      desc: '',
      args: [],
    );
  }

  /// `Email`
  String get access_login_form_Email {
    return Intl.message(
      'Email',
      name: 'access_login_form_Email',
      desc: '',
      args: [],
    );
  }

  /// `Password`
  String get access_login_form_Password {
    return Intl.message(
      'Password',
      name: 'access_login_form_Password',
      desc: '',
      args: [],
    );
  }

  /// `Register`
  String get access_register_form_TitleRegister {
    return Intl.message(
      'Register',
      name: 'access_register_form_TitleRegister',
      desc: '',
      args: [],
    );
  }

  /// `Do you already have an account?`
  String get access_register_form_DoYouAlreadyHaveAnAccount {
    return Intl.message(
      'Do you already have an account?',
      name: 'access_register_form_DoYouAlreadyHaveAnAccount',
      desc: '',
      args: [],
    );
  }

  /// `Register information`
  String get access_register_form_RegisterInformation {
    return Intl.message(
      'Register information',
      name: 'access_register_form_RegisterInformation',
      desc: '',
      args: [],
    );
  }

  /// `Email address`
  String get access_register_form_Email {
    return Intl.message(
      'Email address',
      name: 'access_register_form_Email',
      desc: '',
      args: [],
    );
  }

  /// `Password`
  String get access_register_form_Password {
    return Intl.message(
      'Password',
      name: 'access_register_form_Password',
      desc: '',
      args: [],
    );
  }

  /// `Confirm password`
  String get access_register_form_ConfirmPassword {
    return Intl.message(
      'Confirm password',
      name: 'access_register_form_ConfirmPassword',
      desc: '',
      args: [],
    );
  }

  /// `Account type`
  String get access_register_form_AccountType {
    return Intl.message(
      'Account type',
      name: 'access_register_form_AccountType',
      desc: '',
      args: [],
    );
  }

  /// `User information`
  String get access_register_form_UserInformation {
    return Intl.message(
      'User information',
      name: 'access_register_form_UserInformation',
      desc: '',
      args: [],
    );
  }

  /// `Full name`
  String get access_register_form_FullName {
    return Intl.message(
      'Full name',
      name: 'access_register_form_FullName',
      desc: '',
      args: [],
    );
  }

  /// `Gender`
  String get access_register_form_Gender {
    return Intl.message(
      'Gender',
      name: 'access_register_form_Gender',
      desc: '',
      args: [],
    );
  }

  /// `Phone number`
  String get access_register_form_PhoneNumber {
    return Intl.message(
      'Phone number',
      name: 'access_register_form_PhoneNumber',
      desc: '',
      args: [],
    );
  }

  /// `Search`
  String get form_input_TextSearch {
    return Intl.message(
      'Search',
      name: 'form_input_TextSearch',
      desc: '',
      args: [],
    );
  }

  /// `Choose`
  String get form_input_Choose {
    return Intl.message(
      'Choose',
      name: 'form_input_Choose',
      desc: '',
      args: [],
    );
  }

  /// `Enter`
  String get form_input_RulesRequired {
    return Intl.message(
      'Enter',
      name: 'form_input_RulesRequired',
      desc: '',
      args: [],
    );
  }

  /// `Enter`
  String get form_input_Enter {
    return Intl.message(
      'Enter',
      name: 'form_input_Enter',
      desc: '',
      args: [],
    );
  }

  /// `Search`
  String get form_select_Search {
    return Intl.message(
      'Search',
      name: 'form_select_Search',
      desc: '',
      args: [],
    );
  }

  /// `Upload`
  String get form_upload_Upload {
    return Intl.message(
      'Upload',
      name: 'form_upload_Upload',
      desc: '',
      args: [],
    );
  }

  /// `Cancel`
  String get form_upload_Cancel {
    return Intl.message(
      'Cancel',
      name: 'form_upload_Cancel',
      desc: '',
      args: [],
    );
  }

  /// `Select image from gallery`
  String get form_upload_SelectImageFromGallery {
    return Intl.message(
      'Select image from gallery',
      name: 'form_upload_SelectImageFromGallery',
      desc: '',
      args: [],
    );
  }

  /// `Select multiple images from gallery`
  String get form_upload_SelectMultipleImagesFromGallery {
    return Intl.message(
      'Select multiple images from gallery',
      name: 'form_upload_SelectMultipleImagesFromGallery',
      desc: '',
      args: [],
    );
  }

  /// `Take photo`
  String get form_upload_TakePhoto {
    return Intl.message(
      'Take photo',
      name: 'form_upload_TakePhoto',
      desc: '',
      args: [],
    );
  }

  /// `Select video from gallery`
  String get form_upload_SelectVideoFromGallery {
    return Intl.message(
      'Select video from gallery',
      name: 'form_upload_SelectVideoFromGallery',
      desc: '',
      args: [],
    );
  }

  /// `Shoot a movie`
  String get form_upload_ShootAMovie {
    return Intl.message(
      'Shoot a movie',
      name: 'form_upload_ShootAMovie',
      desc: '',
      args: [],
    );
  }

  /// `Log out`
  String get core_drawer_LogOut {
    return Intl.message(
      'Log out',
      name: 'core_drawer_LogOut',
      desc: '',
      args: [],
    );
  }

  /// `Sign out of the app?`
  String get core_drawer_TitleLogOut {
    return Intl.message(
      'Sign out of the app?',
      name: 'core_drawer_TitleLogOut',
      desc: '',
      args: [],
    );
  }

  /// `Oops!, an error occurred...`
  String get core_list_Oops {
    return Intl.message(
      'Oops!, an error occurred...',
      name: 'core_list_Oops',
      desc: '',
      args: [],
    );
  }

  /// `Empty list`
  String get core_list_EmptyList {
    return Intl.message(
      'Empty list',
      name: 'core_list_EmptyList',
      desc: '',
      args: [],
    );
  }

  /// `Notification`
  String get utils_dialogs_TitleSuccess {
    return Intl.message(
      'Notification',
      name: 'utils_dialogs_TitleSuccess',
      desc: '',
      args: [],
    );
  }

  /// `Success`
  String get utils_dialogs_TextSuccess {
    return Intl.message(
      'Success',
      name: 'utils_dialogs_TextSuccess',
      desc: '',
      args: [],
    );
  }

  /// `Confirm`
  String get utils_dialogs_ConfirmSuccess {
    return Intl.message(
      'Confirm',
      name: 'utils_dialogs_ConfirmSuccess',
      desc: '',
      args: [],
    );
  }

  /// `Warning`
  String get utils_dialogs_TitleError {
    return Intl.message(
      'Warning',
      name: 'utils_dialogs_TitleError',
      desc: '',
      args: [],
    );
  }

  /// `Oops!,... An error occurred`
  String get utils_dialogs_TextError {
    return Intl.message(
      'Oops!,... An error occurred',
      name: 'utils_dialogs_TextError',
      desc: '',
      args: [],
    );
  }

  /// `Exit`
  String get utils_dialogs_ConfirmError {
    return Intl.message(
      'Exit',
      name: 'utils_dialogs_ConfirmError',
      desc: '',
      args: [],
    );
  }

  /// `Confirm`
  String get utils_dialogs_TextConfirm {
    return Intl.message(
      'Confirm',
      name: 'utils_dialogs_TextConfirm',
      desc: '',
      args: [],
    );
  }

  /// `Cancel`
  String get utils_dialogs_TextCancel {
    return Intl.message(
      'Cancel',
      name: 'utils_dialogs_TextCancel',
      desc: '',
      args: [],
    );
  }

  /// `Confirm`
  String get utils_dialogs_TextConfirmForm {
    return Intl.message(
      'Confirm',
      name: 'utils_dialogs_TextConfirmForm',
      desc: '',
      args: [],
    );
  }

  /// `Login expired`
  String get utils_dialogs_LoginExpired {
    return Intl.message(
      'Login expired',
      name: 'utils_dialogs_LoginExpired',
      desc: '',
      args: [],
    );
  }

  /// `years ago`
  String get utils_convert_YearsAgo {
    return Intl.message(
      'years ago',
      name: 'utils_convert_YearsAgo',
      desc: '',
      args: [],
    );
  }

  /// `moths ago`
  String get utils_convert_MonthsAgo {
    return Intl.message(
      'moths ago',
      name: 'utils_convert_MonthsAgo',
      desc: '',
      args: [],
    );
  }

  /// `days ago`
  String get utils_convert_DaysAgo {
    return Intl.message(
      'days ago',
      name: 'utils_convert_DaysAgo',
      desc: '',
      args: [],
    );
  }

  /// `hours ago`
  String get utils_convert_HoursAgo {
    return Intl.message(
      'hours ago',
      name: 'utils_convert_HoursAgo',
      desc: '',
      args: [],
    );
  }

  /// `minutes ago`
  String get utils_convert_MinutesAgo {
    return Intl.message(
      'minutes ago',
      name: 'utils_convert_MinutesAgo',
      desc: '',
      args: [],
    );
  }

  /// `million`
  String get utils_convert_Million {
    return Intl.message(
      'million',
      name: 'utils_convert_Million',
      desc: '',
      args: [],
    );
  }

  /// `billion`
  String get utils_convert_Billion {
    return Intl.message(
      'billion',
      name: 'utils_convert_Billion',
      desc: '',
      args: [],
    );
  }

  /// `Agreement`
  String get utils_convert_Agreement {
    return Intl.message(
      'Agreement',
      name: 'utils_convert_Agreement',
      desc: '',
      args: [],
    );
  }

  /// `Empty`
  String get widget_list_details_Empty {
    return Intl.message(
      'Empty',
      name: 'widget_list_details_Empty',
      desc: '',
      args: [],
    );
  }

  /// `Phone number copied`
  String get widget_list_details_PhoneNumberCopied {
    return Intl.message(
      'Phone number copied',
      name: 'widget_list_details_PhoneNumberCopied',
      desc: '',
      args: [],
    );
  }

  /// `Successfully copied`
  String get widget_list_details_SuccessfullyCopied {
    return Intl.message(
      'Successfully copied',
      name: 'widget_list_details_SuccessfullyCopied',
      desc: '',
      args: [],
    );
  }

  /// `Male`
  String get male {
    return Intl.message(
      'Male',
      name: 'male',
      desc: '',
      args: [],
    );
  }

  /// `Female`
  String get female {
    return Intl.message(
      'Female',
      name: 'female',
      desc: '',
      args: [],
    );
  }

  /// `Back`
  String get textBackButton {
    return Intl.message(
      'Back',
      name: 'textBackButton',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
      Locale.fromSubtags(languageCode: 'vi'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);

  @override
  Future<S> load(Locale locale) => S.load(locale);

  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}
