import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:trading_app/services/post.dart';

import '../cubit/posts_cubit.dart';

class PostsView extends StatelessWidget {
  final scrollController = ScrollController();

  void setupScrollController(context) {
    scrollController.addListener(() {
      if (scrollController.position.atEdge) {
        if (scrollController.position.pixels != 0) {
          BlocProvider.of<PostsCubit>(context).loadPosts();
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    setupScrollController(context);
    BlocProvider.of<PostsCubit>(context).loadPosts();

    return Scaffold(
        appBar: PreferredSize(
          preferredSize: Size(double.infinity, kToolbarHeight),
          child: ClipRRect(
            borderRadius: BorderRadius.vertical(bottom: Radius.circular(20)),
            child: AppBar(
              brightness: Brightness.light,
              backgroundColor: Colors.green.withOpacity(.5),
              elevation: 0,
              title: Text(
                ' Trading App',
                style: TextStyle(
                  fontSize: MediaQuery.of(context).size.width / 17,
                  color: Colors.black.withOpacity(.7),
                  fontWeight: FontWeight.w400,
                ),
              ),
              centerTitle: true,
              actions: [
                IconButton(
                  tooltip: 'User',
                  splashColor: Colors.transparent,
                  highlightColor: Colors.orange,
                  icon: Icon(Icons.person, color: Colors.black.withOpacity(.7)),
                  onPressed: () {
                    HapticFeedback.lightImpact();
                    // Navigator.push(
                    //   context,
                    //   MaterialPageRoute(
                    //     builder: (context) {
                    //       return
                    //     }
                    //   ),
                    // );
                  },
                ),
                Text('  '),
              ],
            ),
          ),
        ),
        drawer: Drawer(),
        body: _postList());
  }

  Widget _postList() {
    return BlocBuilder<PostsCubit, PostsState>(builder: (context, state) {
      if (state is PostsLoading && state.isFirstFetch) {
        return _loadingIndicator();
      }

      List<Post> posts = [];
      bool isLoading = false;

      if (state is PostsLoading) {
        posts = state.oldPosts;
        isLoading = true;
      } else if (state is PostsLoaded) {
        posts = state.posts;
      }

      return ListView.separated(
        controller: scrollController,
        itemBuilder: (context, index) {
          if (index < posts.length)
            return _post(posts[index], context);
          else {
            Timer(Duration(milliseconds: 30), () {
              scrollController
                  .jumpTo(scrollController.position.maxScrollExtent);
            });

            return _loadingIndicator();
          }
        },
        separatorBuilder: (context, index) {
          return Divider(
            color: Colors.white,
          );
        },
        itemCount: posts.length + (isLoading ? 1 : 0),
      );
    });
  }

  Widget _loadingIndicator() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Center(child: CircularProgressIndicator()),
    );
  }

  Widget _post(Post post, BuildContext context) {
    double _w = MediaQuery.of(context).size.width;

    return Stack(children: [
      Container(
        padding: EdgeInsets.fromLTRB(_w / 20, _w / 5, _w / 20, _w / 20),

        child: Container(
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            Padding(
              padding: EdgeInsets.fromLTRB(_w / 20, 0, _w / 20, _w / 30),
            ),
            Container(
              width: _w / 1.16,
              height: _w / 0.4,
              decoration: BoxDecoration(
                color: Color(0xffFFE5B4),
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                      color: Colors.black.withOpacity(.05),
                      blurRadius: 90,
                      offset: Offset(2, 2)),
                ],
              ),
              child: Column(
                children: [
                  Container(
                    width: _w / 0.16,
                    height: _w / 1.6,
                    decoration: BoxDecoration(
                      color: Color(0xff5C71F3),
                      borderRadius: BorderRadius.vertical(
                        top: Radius.circular(20),
                      ),
                    ),
                    child: ClipRRect(
                      borderRadius:
                          BorderRadius.vertical(top: Radius.circular(15)),
                      child: Image.network(post.thumbnailUrl,
                          fit: BoxFit.fill, width: _w / 1.36, height: _w / 2.6),
                    ),
                  ),
                  Container(
                    alignment: Alignment.bottomCenter,
                    height: _w / 6.2,
                    width: _w / 1.36,
                    padding: EdgeInsets.symmetric(horizontal: _w / 25),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          (post.title),
                          style: TextStyle(
                            color: Colors.black.withOpacity(.8),
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        // Text(
                        //   ('SubInfo'),
                        //   style: TextStyle(
                        //     fontWeight: FontWeight.w600,
                        //     color: Colors.black.withOpacity(.7),
                        //   ),
                        // ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ]),
        ),
        // child: Image.network(
        //   dogImages[index],
        //   fit: BoxFit.fitWidth,
        // ),
      ),
      Container(alignment: Alignment.center, child: searchBar(context))
    ]);
  }
}

Widget searchBar(BuildContext context) {
  double _w = MediaQuery.of(context).size.width;
  return Padding(
    padding: EdgeInsets.fromLTRB(_w / 20, _w / 25, _w / 20, 0),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          alignment: Alignment.center,
          height: _w / 8.5,
          width: _w / 1.36,
          padding: EdgeInsets.symmetric(horizontal: _w / 60),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(99),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(.1),
                blurRadius: 30,
                offset: Offset(0, 15),
              ),
            ],
          ),
          child: TextField(
            maxLines: 1,
            decoration: InputDecoration(
              fillColor: Colors.transparent,
              filled: true,
              hintStyle: TextStyle(
                  color: Colors.black.withOpacity(.4),
                  fontWeight: FontWeight.w600,
                  fontSize: _w / 22),
              prefixIcon:
                  Icon(Icons.search, color: Colors.black.withOpacity(.6)),
              hintText: 'Search anything.....',
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide.none),
              contentPadding: EdgeInsets.zero,
            ),
          ),
        ),
        SizedBox(height: _w / 14),
      ],
    ),
  );
}
