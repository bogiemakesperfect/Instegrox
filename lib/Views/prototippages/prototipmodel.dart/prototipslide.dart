
class Slide {
  final String imageUrl;
  final String title;
  final String titleiki;
  final String description;

  Slide(
      {
        required this.imageUrl,
        required this.title,
        required this.titleiki,
        required this.description});
}

final slideList = [
  Slide(
      imageUrl: 'assets/images/backgrounds/prototipbir.png',
      title: 'Profilinin Günlük',
      titleiki: 'Analizleri',
      description: 'Hikayeni görenler özelliği ile hikayeni görenler arasında daha esnek şekilde arama ve sıralama yapabilir, onları yakından inceleyebilirsin.'
  ),
  Slide(
      imageUrl: 'assets/images/backgrounds/prototipiki.png',
      title: 'Hikayeleri Gizli',
      titleiki: 'İzle',
      description: 'Tüm hikayeleri sınırsız olarak gizli olarak izleyebilirsiniz.'
  ),
  Slide(
      imageUrl: 'assets/images/backgrounds/prototipiuc.png',
      title: 'Gizli Profilleri Görüntüle',
      titleiki: ' ',
      description: 'Gizli hesapların gönderilerini ve hikayelerini sınırsız olarak görüntüleyin.'
  ),
  Slide(
      imageUrl: 'assets/images/backgrounds/prototipikidort.png',
      title: 'Gizli Mod',
      titleiki: ' ',
      description: 'Hesabınızı kimlerin görüntülediğini öğrenin ve tüm hesaplara gizli modda bakın. Hedef kullanıcı bu konuda bilgilendirilmez.'
  ),
  Slide(
      imageUrl: 'assets/images/backgrounds/prototipbes.png',
      title: 'Kayıp Raporu',
      titleiki: ' ',
      description: 'Seni takip etmeyi bırakanları, engelleyenleri, hatta gönderilerine bıraktığı yorumlarını silen veye beğenen geri çekenleri görebilirsin.'
  ),
  Slide(
      imageUrl: 'assets/images/backgrounds/prototipalti.png',
      title: 'Self Control Paketi',
      titleiki: '',
      description: 'En popüler gönderilerini keşfet, davranış verilerine bakarak takipçilerini daha iyi anla. Gizli hayranlarını gör'
  ),
  Slide(
      imageUrl: 'assets/images/backgrounds/prototipyedi.png',
      title: 'Profil Etkileşimcileri',
      titleiki: 'Paketi',
      description: 'Profiline en çok ilgi gösteren kişilerin listesini gör.'
  ),
  Slide(
      imageUrl: 'assets/images/backgrounds/prototipbir.png',
      title: 'Gönderileri İndirin',
      titleiki: ' ',
      description: 'Sınırsız olarak görselleri, videoları, hikayeleri indirme.'
  ),
  Slide(
      imageUrl: 'assets/images/backgrounds/prototipsekiz.png',
      title: 'Reklamları Devre Dışı',
      titleiki: 'Bırak',
      description: 'Uygulamayı reklamsız olarak kullanmanın tadını çıkar'
  ),
];