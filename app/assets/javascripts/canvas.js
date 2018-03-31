// $(function() {
//   var file = null; // 選択されるファイル
//   var blob = null; // 大容量のデータの扱いではBlob形式を使う。メモリを節約できる？
//   const THUMBNAIL_WIDTH = 740; // 画像リサイズ後の横の長さの最大値
//   const THUMBNAIL_HEIGHT = 555; // 画像リサイズ後の縦の長さの最大値
//
//
//   function sleep(waitMsec) {
//     var startMsec = new Date();
//     // 指定ミリ秒間、空ループ。CPUは常にビジー。
//     while (new Date() - startMsec < waitMsec);
//   }
//
//   console.log("page was loaded")
//   // ファイルが選択されたら
//   $('input[type=file]').change(function() {
//     console.log("file was changed")
//
//     // ファイルを取得
//     file = $(this).prop('files')[0];
//     var data = file;
//     // 選択されたファイルが画像かどうか判定
//     if (file.type != 'image/jpeg' && file.type != 'image/png') {
//       // 画像でない場合は終了
//       file = null;
//       blob = null;
//       return;
//     }
//
//     // 画像をリサイズする
//     var image = new Image();  // <img>タグになる
//     var reader = new FileReader();
//     reader.onload = function(e) {
//       image.onload = function() {
//         var width, height;
//         if(image.width > image.height){
//           // 横長の画像は横のサイズを指定値にあわせる
//           var ratio = image.height/image.width;
//           width = THUMBNAIL_WIDTH;
//           height = THUMBNAIL_WIDTH * ratio;
//         } else {
//           // 縦長の画像は縦のサイズを指定値にあわせる
//           var ratio = image.width/image.height;
//           width = THUMBNAIL_HEIGHT * ratio;
//           height = THUMBNAIL_HEIGHT;
//         }
//         // サムネ描画用canvasのサイズを上で算出した値に変更
//         var canvas = $('#canvas')
//                      .attr('width', width)
//                      .attr('height', height);
//
//         console.log("before sleep 500ms")
//
//         sleep(500);
//
//         console.log("after sleep 500ms")
//
//         var ctx = canvas[0].getContext('2d');
//         // canvasに既に描画されている画像をクリア
//         ctx.clearRect(0,0,width,height);
//         // canvasにサムネイルを描画
//         ctx.drawImage(image,0,0,image.width,image.height,0,0,width,height);
//
//         // canvasからbase64画像データを取得
//         var base64 = canvas.get(0).toDataURL('image/jpeg');
//         // base64からBlobデータを作成
//         var barr, bin, i, len;
//         bin = atob(base64.split('base64,')[1]);
//         len = bin.length;
//         barr = new Uint8Array(len);
//         i = 0;
//         while (i < len) {
//           barr[i] = bin.charCodeAt(i);
//           i++;
//         }
//         // blob = new Blob([barr], {type: 'image/jpeg'});
//         // console.log(blob);
//       }
//       image.src = e.target.result;
//     }
//
//     EXIF.getData(data, function() {
//       var DateTimeOriginal = EXIF.getTag(this,'DateTimeOriginal');
//       var Make = EXIF.getTag(this, "Make");
//       var Model = EXIF.getTag(this,'Model');
//       var LensType = EXIF.getTag(this, "undefined")
//       var MeteringMode = EXIF.getTag(this, "MeteringMode")
//       var PixelXDimension= EXIF.getTag(this,'PixelXDimension');
//       var PixelYDimension= EXIF.getTag(this,'PixelYDimension');
//       var ExposureTime = EXIF.getTag(this,'ExposureTime');
//       var ExposureBias = EXIF.getTag(this,'ExposureBias');
//       var ISOSpeedRatings = EXIF.getTag(this,'ISOSpeedRatings');
//       var FNumber = EXIF.getTag(this,'FNumber');
//       var FocalLength = EXIF.getTag(this,'FocalLength');
//       var WhiteBalance = EXIF.getTag(this,'WhiteBalance');
//       var Flash = EXIF.getTag(this,'Flash');
//       $("#exif").html('<p>' +
//         '撮影日時 : ' + DateTimeOriginal + '<br>' +
//         'カメラメーカー : ' + Make + '<br>' +
//         'カメラモデル : ' + Model + '<br>' +
//         'レンズ : ' + LensType + '<br>' +
//         '測光モード : ' + MeteringMode + '<br>' +
//         'イメージサイズ : ' + PixelXDimension + ' x ' + PixelYDimension + '<br>' +
//         '露出時間 : ' + ExposureTime + ' (1/' + (1 / ExposureTime) + ') 秒<br>' +
//         '露光感度 : ' + ExposureBias + '<br>' +
//         'ISO感度 : ' + ISOSpeedRatings + '<br>' +
//         '絞り : ' + FNumber + '<br>' +
//         '焦点距離 : ' + FocalLength + '<br>' +
//         'ホワイトバランス : ' + WhiteBalance + '<br>' +
//         'フラッシュ : ' + Flash +
//       '</p>');
//     });
//
//     reader.readAsDataURL(file);
//   });
// });
