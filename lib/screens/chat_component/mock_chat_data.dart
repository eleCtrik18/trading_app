class Chat {
  final String name, lastMessage, image, time;
  final bool isActive;

  Chat({
    this.name = '',
    this.lastMessage = '',
    this.image = '',
    this.time = '',
    this.isActive = false,
  });
}

List chatsData = [ //List
  Chat(
    name: "Rishi",
    lastMessage: "Hey there..",
    image: "assets/rishi.png",
    time: "3m ago",
    isActive: false,
  ),
  Chat(
    name: "Chetan Singh",
    lastMessage: "Alright",
    image: "assets/user.png",
    time: "8m ago",
    isActive: true,
  ),
];
