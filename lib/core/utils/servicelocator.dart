import 'package:bookly/Features/home/data/repos/home_repo_implement.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;
void setup(){
    getIt.registerSingleton<homerepoimplement>(homerepoimplement());

}
