var pageBoarding =[
  OnBoardingModel(
    imageUrl: "assets/images/image1.svg",
    title: "Training",
    body: "create you own calendar to organice your personal life your goals, your projects and all you need to be ordered"
  ),
  OnBoardingModel(
      imageUrl: "assets/images/image2.svg",
      title: "Knowledge Base",
      body: "create you own calendar to organice your personal life your goals, your projects and all you need to be ordered"
  ),
  OnBoardingModel(
      imageUrl: "assets/images/image3.svg",
      title: "ONDODC",
      body: "create you own calendar to organice your personal life your goals, your projects and all you need to be ordered"
  ),
];

class OnBoardingModel {
  var imageUrl;
  var title;
  var body;

  OnBoardingModel({
    this.imageUrl,
    this.title,
    this.body
  });
}