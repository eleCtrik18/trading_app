 Widget box() {
    double _w = MediaQuery.of(context).size.width;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Stack(
            children: [
              Positioned.fill(
                child: Align(
                  alignment: Alignment.topRight,
                  child: Container(
                    height: _w / 1.8,
                    width: 110,
                    decoration: new BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(15)),
                      shape: BoxShape.rectangle,
                      border: new Border.all(
                        color: Colors.green,
                        width: 1.5,
                      ),
                    ),
                  ),
                ),
              ),
              Positioned.fill(
                child: Align(
                  alignment: Alignment.topRight,
                  child: Container(
                    height: _w / 1.8,
                    width: 125,
                    decoration: new BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(15)),
                      shape: BoxShape.rectangle,
                      border: new Border.all(
                        color: Colors.blue,
                        width: 1.5,
                      ),
                    ),
                  ),
                ),
              ),
              Container(
                height: _w / 1.8,
                width: 140,
                decoration: new BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(15)),
                  shape: BoxShape.rectangle,
                  border: new Border.all(
                    color: Colors.red,
                    width: 1.5,
                  ),
                ),
              ),
              Positioned.fill(
                left: 10,
                top: 10,
                child: Align(
                    alignment: Alignment.topRight,
                    child: Container(
                        alignment: Alignment.center,
                        child: Text(
                          "Card Preview",
                          style: TextStyle(color: Colors.grey, fontSize: 18),
                        ))),
              )
            ],
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            "DECK NAME",
            style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
          )
        ],
      ),
    );
