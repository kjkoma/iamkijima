// Draw the Google Map
function drawMap(address) {
    var geocoder = new google.maps.Geocoder();
    //住所から座標を取得する
    geocoder.geocode(
            {
                'address': address,//検索する住所　〒◯◯◯-◯◯◯◯ 住所　みたいな形式でも検索できる
                'region': 'jp'
            },
            function (results, status) {
                if (status == google.maps.GeocoderStatus.OK) {
                    google.maps.event.addDomListener(window, 'load', function () {
                        var map_tag = document.getElementById('map');
                        // 取得した座標をセット緯度経度をセット
                        var map_location = new google.maps.LatLng(results[0].geometry.location.lat(),results[0].geometry.location.lng());
                        //マップ表示のオプション
                        var map_options =
                        {
                            zoom: 15,//縮尺
                            center: map_location,//地図の中心座標
                            //ここをfalseにすると地図上に人みたいなアイコンとか表示される
                            disableDefaultUI: true,
                            mapTypeId: google.maps.MapTypeId.ROADMAP//地図の種類を指定
                        };

                        //マップを表示する
                        var map = new google.maps.Map(map_tag, map_options);

                        //地図上にマーカーを表示させる
                        var marker = new google.maps.Marker({
                            position: map_location,//マーカーを表示させる座標
                            map: map//マーカーを表示させる地図
                        });
                    });
                }
            }
    );
}

// Search Youtube Movies
function search(q) {
  var request = gapi.client.youtube.search.list({
    q: q,
    part: 'snippet',
    maxResults : 9
  });

  request.execute(function(response) {
    var str = JSON.stringify(response.result);
    // $('#youtube_container').html('<pre>' + str + '</pre>');
    renderYoubeSeachList(JSON.parse(str));
  });
}
// Render the Youtube Search List document
function renderYoubeSeachList(rso)
{
  var videoList = parseYoutubeResultObject(rso);
  $.each(videoList,function(index,obj){
    $('#youtube_container').append(
       '<div class="col-md-4 col-sm-4">' +
         '<a href="' + obj.videoUrl + '" target="blank">' + 
           '<img src="' + obj.imageUrl + '" class="img-rounded">' +
           '<p>' + obj.title + '</p>' +
         '</a>' +
       '</div>');
  });
}
// Parse for Youtube Search Result Object
function parseYoutubeResultObject(rso)
{
  var ary = new Array();
  var items = rso.items;

  for (var i = 0; i < items.length; i++) {
    var videoId = items[i].id.videoId;
    var title = items[i].snippet.title;
    var thumbnail = items[i].snippet.thumbnails.medium.url;
    var item = {
      "videoUrl"  : "https://www.youtube.com/watch?v=" + videoId,
      "title"     : title,
      "imageUrl"  : thumbnail
    }
    ary.push(item);
  }

  return ary;
}