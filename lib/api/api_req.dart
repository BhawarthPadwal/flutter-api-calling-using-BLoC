import 'package:api_calling_using_bloc/api/api_env.dart';

class ApiReq {

  static getPostsData() {
    return '${ApiEnv.getAppEnvironment()}/posts';
  }

}