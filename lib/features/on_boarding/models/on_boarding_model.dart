class OnBoardingModel{
  String image;String title;String subtitle;
  double start;double end;//int? index;
  OnBoardingModel({
    required this.image,  // this.index,
    required this.start,required this.end,
    required this.title, required this.subtitle,
});
  static List<OnBoardingModel>boards=[
    OnBoardingModel(
        start: 0.5,
        end: 0.5,
        image: "assets/images/onBoarding1.png",
        title: "Find the item you've \nbeen looking for",
        subtitle: "Here you'll see rich varieties of goods,\n carefully classified for seamless browsing\n experience"),
    OnBoardingModel
      (
        start: 1,
        end: 1,
        image: "assets/images/onBoarding2.png",
        title: "Get those shopping\n bags filled",
        subtitle: "Add any item you want to your cart or save\n it on your wishlist, so you don't miss it in\n your future purchase."),
    OnBoardingModel(
        start: 0.0,
        end: 0.0,
        image: "assets/images/onBoarding3.png",
        title: "Fast & Secure\n payment",
        subtitle: "There are many payment options available\n to speed up and simplify your payment\n process."),
  ];

}