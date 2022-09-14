import 'package:enviroment_flavor/enviroment_flavor.dart';
import 'package:exemplo/app/constants.dart';
import 'package:exemplo/app/shared/run_app_module.dart';

void main() async {
  EnvironmentFlavor.create(
    Environment.DEV,
    BASE_URL_DEV,
  );

  runAppModule();
}
