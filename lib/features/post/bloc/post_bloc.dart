import 'dart:async';
import 'dart:convert';
import 'dart:math';

import 'package:api_calling_using_bloc/features/post/repos/post_repo.dart';
import 'package:bloc/bloc.dart';
import 'package:logger/logger.dart';
import 'package:meta/meta.dart';
import 'package:http/http.dart' as http;

import '../models/post_models.dart';

part 'post_event.dart';
part 'post_state.dart';

class PostBloc extends Bloc<PostEvent, PostState> {
  PostBloc() : super(PostInitial()) {
    on<PostInitialFetchEvent>(postInitialFetchEvent);
  }

  FutureOr<void> postInitialFetchEvent(
      PostInitialFetchEvent event, Emitter<PostState> emit) async {
    emit(PostLoadingState());
    List<PostDataUiModel> posts = await PostRepo.fetchPost();
    if (posts.isEmpty) {
      emit(PostLoadingErrorState(errorMsg: 'Failed to fetch the data'));
    } else {
      emit(PostLoadedState(posts: posts));
    }
  }
}
