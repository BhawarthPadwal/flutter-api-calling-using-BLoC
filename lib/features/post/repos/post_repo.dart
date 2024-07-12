import 'package:api_calling_using_bloc/api/api_req.dart';
import 'package:api_calling_using_bloc/features/post/models/post_models.dart';
import 'package:http/http.dart' as http;
import 'package:logger/logger.dart';

/// For handling all network logic of the page
class PostRepo {

  static Future<List<PostDataUiModel>> fetchPost() async {
    var client = http.Client();
    var logger = Logger();
    try {
      var response = await client.get(Uri.parse(ApiReq.getPostsData()));
      if (response.statusCode == 200) {
        var decodedResponse = postDataUiModelFromJson(response.body);
        logger.d(decodedResponse);
        return decodedResponse;
      } else {
        logger.e('Failed to fetch posts: ${response.statusCode}');
        return [];  // Return an empty list on failure
      }
    } catch (e) {
      logger.e(e);
      return [];  // Return an empty list on exception
    } finally {
      client.close();
    }
  }
}
