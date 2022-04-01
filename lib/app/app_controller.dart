import 'package:mobx/mobx.dart';

part 'app_controller.g.dart';

class AppController = _AppControllerBase with _$AppController;

///Here can be some global methods, datas, section informations, utilities and others
abstract class _AppControllerBase with Store {}
