//This is main Card Widget. 
//It contains a main Container and inside that container we have two containers stacked up in a Column Widget.
//This widget contains alignment and padding properties.
//This Widget has Decoration Properties for Rounded Corners.
//Using media query property in this Widget to assign height and width instead of using a Constant value.
//Using ClipRrect.. ClipRect prevents its child from painting outside its bounds.


Widget _post(Post post, BuildContext context) {
    double _w = MediaQuery.of(context).size.width;

    return Container(
      alignment: Alignment.center,
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
                      Center(
                        child: Text(
                          (post.id.toString()),
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.red.withOpacity(.7),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ]),
      ),
       ),
    );
  }
