//extention in photo

extension Photo on String {
  String png() => "assets/images/$this.png";
  String svg() => "assets/icons/$this.svg";
}
