# Toonflix

Lean Flutter by making a Webtoon App

[Watch now (무료 강의)](https://nomadcoders.co/flutter-for-beginners)


# 엡은 2개 화면이 있어야 합니다: Home 그리고 Detail.

## Home 스크린은 아래와 같은 기능을 갖고있어야 합니다.
* 가장 인기 있는 영화 목록이 표시되어야 합니다. https://movies-api.nomadcoders.workers.dev/popular

1. 이미지

* 극장에서 상영 중인 영화 목록이 표시되어야 합니다. https://movies-api.nomadcoders.workers.dev/now-playing

1. 이미지
2. 제목

* 곧 개봉할 영화 목록이 표시되어야 합니다.

1. 이미지
2. 제목

## movie를 탭하면 세부정보 화면으로 이동해야 합니다.
세부정보 화면에는 다음이 표시되어야 합니다.
* 영화의 포스터. -  "https://image.tmdb.org/t/p/w500/" + "backdrop_path"
* 영화의 제목. - String "original_title"
* 영화의 등급. - double "vote_average"
* 영화의 개요. - String "overview"
* 영화의 장르. - List<Map<string,dynamic>> "generes" ?

### 가장 인기 있는 영화를 보려면 이 엔드포인트를 방문하세요: https://movies-api.nomadcoders.workers.dev/popular

* bool "adult"
* String "backdrop_path" "/경로"
* List<int> "genere_ids"
* int "id"
* String "original_language"
* String "original_title"
* String "overview"

### 극장에서 상영 중인 영화를 보려면 이 엔드포인트를 방문하세요: https://movies-api.nomadcoders.workers.dev/now-playing

### 곧 개봉하는 영화를 보려면 이 엔드포인트를 방문하세요: https://movies-api.nomadcoders.workers.dev/coming-soon

### 영화에 대한 세부 정보를 보려면 이 엔드포인트를 방문하세요: https://movies-api.nomadcoders.workers.dev/movie?id=1 (아이디를 세부 정보를 보려는 영화의 아이디로 바꾸세요).

# Notes.
* 영화 데이터베이스에서 이미지를 표시할 때는 https://image.tmdb.org/t/p/w500/ + 이미지 경로와 같은 URL을 사용해야 합니다.
* 예를 들어 이미지 경로가 "/vZloFAK7NmvMGKE7VkF5UHaz0I.jpg"인 경우 전체 URL은 https://image.tmdb.org/t/p/w500/vZloFAK7NmvMGKE7VkF5UHaz0I.jpg 입니다.
