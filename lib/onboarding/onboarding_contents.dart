
class OnboardingContents {
  final String title;
  final String image;
  final String desc;

  OnboardingContents(
      {required this.title, required this.image, required this.desc});
}

List<OnboardingContents> contents = [
  OnboardingContents(
    title: "Monitoring",
    image: "assets/images/image1.png",
    desc:
        "Pemantauan kualitas air tambak udang lebih mudah cukup dengan satu aplikasi saja!",
  ),
  OnboardingContents(
    title: "Control",
    image: "assets/images/image2.png",
    desc:
        "Lakukan kontrol kincir air tanpa harus repot datang ke tambak udang!",
  ),
  OnboardingContents(
    title: "Laporan Siklus",
    image: "assets/images/image3.png",
    desc:
        "Evaluasi Budidaya per siklus untuk perencanaan siklus yang lebih optimal!",
  ),
];
