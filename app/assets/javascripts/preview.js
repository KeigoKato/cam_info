$(function(){
  //画像ファイルプレビュー表示のイベント追加 fileを選択時に発火するイベントを登録
  console.log("page was loaded")
  $('form').on('change', 'input[type="file"]', function(e) {
    console.log("file was changed")
    var file = e.target.files[0],
        reader = new FileReader(),
        $preview = $("#preview");
        t = this;

    // 画像ファイル以外の場合は何もしない
    if(file.type.indexOf("image") < 0){
      return false;
    }

    // ファイル読み込みが完了した際のイベント登録
    reader.onload = (function(file) {
      return function(e) {
        //既存のプレビューを削除
        $preview.empty();
        // .prevewの領域の中にロードした画像を表示するimageタグを追加
        $preview.append($('<img>').attr({
                  src: e.target.result,
                  width: "100%",
                  class: "preview",
                  title: file.name
        }));

        var data = file;

        // EXIF.getDataでexif情報を解析
        EXIF.getData(data, function() {
          var DateTimeOriginal = EXIF.getTag(this,'DateTimeOriginal');
          var Make = EXIF.getTag(this, "Make");
          var Model = EXIF.getTag(this,'Model');
          var LensType = EXIF.getTag(this, "undefined")
          var MeteringMode = EXIF.getTag(this, "MeteringMode")
          var PixelXDimension= EXIF.getTag(this,'PixelXDimension');
          var PixelYDimension= EXIF.getTag(this,'PixelYDimension');
          var ExposureTime = EXIF.getTag(this,'ExposureTime');
          var ExposureBias = EXIF.getTag(this,'ExposureBias');
          var ISOSpeedRatings = EXIF.getTag(this,'ISOSpeedRatings');
          var FNumber = EXIF.getTag(this,'FNumber');
          var FocalLength = EXIF.getTag(this,'FocalLength');
          var WhiteBalance = EXIF.getTag(this,'WhiteBalance');
          var Flash = EXIF.getTag(this,'Flash');
          $("#exif").html('<p>' +
            '撮影日時 : ' + DateTimeOriginal + '<br>' +
            'カメラメーカー : ' + Make + '<br>' +
            'カメラモデル : ' + Model + '<br>' +
            'レンズ : ' + LensType + '<br>' +
            '測光モード : ' + MeteringMode + '<br>' +
            'イメージサイズ : ' + PixelXDimension + ' x ' + PixelYDimension + '<br>' +
            '露出時間 : ' + ExposureTime + ' (1/' + (1 / ExposureTime) + ') 秒<br>' +
            '露光感度 : ' + ExposureBias + '<br>' +
            'ISO感度 : ' + ISOSpeedRatings + '<br>' +
            '絞り : ' + FNumber + '<br>' +
            '焦点距離 : ' + FocalLength + '<br>' +
            'ホワイトバランス : ' + WhiteBalance + '<br>' +
            'フラッシュ : ' + Flash +
          '</p>');
        });
      };
    })(file);

    reader.readAsDataURL(file);
  });
});
