part of 'post_bloc.dart';

@immutable
sealed class PostState {}

final class PostInitial extends PostState {}

abstract class PostActionState extends PostState {}

class PostLoadingState extends PostState {}

class PostLoadedState extends PostState {
  final List<PostDataUiModel> posts;
  PostLoadedState({required this.posts});
}

class PostLoadingErrorState extends PostState {
  final String errorMsg;
  PostLoadingErrorState({required this.errorMsg});
}
