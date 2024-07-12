import 'package:api_calling_using_bloc/features/post/bloc/post_bloc.dart';
import 'package:api_calling_using_bloc/features/post/ui/post_data_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PostsPage extends StatefulWidget {
  const PostsPage({super.key});

  @override
  State<PostsPage> createState() => _PostsPageState();
}

class _PostsPageState extends State<PostsPage> {
  final PostBloc postBloc = PostBloc();

  @override
  void initState() {
    super.initState();
    postBloc.add(PostInitialFetchEvent());
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<PostBloc, PostState>(
      bloc: postBloc,
      listenWhen: (previous, current) => current is PostActionState,
      buildWhen: (previous, current) => current is !PostActionState,
      listener: (context, state) {},
      builder: (context, state) {
        switch (state.runtimeType) {
          case PostLoadingState:
            return Scaffold(
              appBar: AppBar(
                title: const Text('Posts Page',
                  style: TextStyle(color: Colors.white, fontFamily: 'Kanit'),),
                backgroundColor: Colors.blue,
                centerTitle: true,
              ),
              body: const Center(
                child: CircularProgressIndicator(),
              ),
            );
          case PostLoadedState:
            final successState = state as PostLoadedState;
            return Scaffold(
              appBar: AppBar(
                title: const Text('Posts Page',
                  style: TextStyle(color: Colors.white, fontFamily: 'Kanit'),),
                backgroundColor: Colors.blue,
                centerTitle: true,
              ),
              body: PostDataTileWidget(posts: successState.posts),
            );
          case PostLoadingState:
            final errorState = state as PostLoadingErrorState;
            return Scaffold(
              appBar: AppBar(
                title: const Text('Posts Page',
                  style: TextStyle(color: Colors.white, fontFamily: 'Kanit'),),
                backgroundColor: Colors.blue,
                centerTitle: true,
              ),
              body: Center(child: Text(errorState.errorMsg),),
            );
          default:
            return const SizedBox();
        }
      },
    );
  }
}
