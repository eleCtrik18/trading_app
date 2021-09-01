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
