
class Slide {
  final String imageUrl;
  final String text1;
  final String text2;
  final String text3;

  Slide(
      {
        required this.imageUrl,
        required this.text1,
        required this.text2,
        required this.text3,
        });
}

final slideList = [
  Slide(
      imageUrl: 'assets/images/backgrounds/loginpageback.png',
      text1: 'SOSYAL MEDYANIN',
      text2: 'KONTROLÜNÜ ELİNE AL',
      text3: 'Hesabını Daha verimli Kullanman için Araçlarımız Her Zaman Burada Seni Bekliyor...',
  ),
  Slide(
      imageUrl: 'assets/images/backgrounds/loginpagebackiki.jpg',
      text1: 'KENDİ PROFİLİNİ',
      text2: 'ANALİZ ET',
      text3: 'Kazandığın, Kaybettiğin Takipçilerin,Seni Takipten Çıkanlar,Engelleyenler ve Gizli Hayranların... Hepsini Görübtile',
  ),
  Slide(
      imageUrl: 'assets/images/backgrounds/loginpagebackuc.jpg',
      text1: 'İMKANSIZ',
      text2: 'YOK',
      text3: 'Social X gücü ile Sosyal Medya da yapamadığın bir çok şeyi gerçekleştirebilirsin',
  ),
];