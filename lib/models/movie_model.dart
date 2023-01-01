class Movie {
  final String name;
  final String imagePath;
  final String videoPath;
  final String category;
  final int year;
  final Duration duration;
  //creating constructor
  const Movie({
    required this.name,
    required this.imagePath,
    required this.videoPath,
    required this.year,
    required this.category,
    required this.duration,
  });
  //for sample data we will create listview
  static const List<Movie> movies = [
    Movie(
      name: 'The Northman',
      imagePath:
          'https://image.tmdb.org/t/p/original/fgV3euqscwTSD87v4pQYAq7vYoQ.jpg',
      videoPath: 'assets/videos/example.mov',
      category: 'Action',
      year: 2022,
      duration: Duration(hours: 2, minutes: 23),
    ),
    Movie(
      name: 'Benediction',
      imagePath:
          'https://th.bing.com/th/id/R.196a6b185f401df16839d5bfc5ac688d?rik=67yag2CpJ%2f0TpA&pid=ImgRaw&r=0',
      videoPath: 'assets/videos/example.mov',
      category: 'Action',
      year: 2022,
      duration: Duration(hours: 5, minutes: 3),
    ),
    Movie(
      name: 'Top Gun: Maverick ',
      imagePath:
          'https://th.bing.com/th/id/R.f856d58d6bc87357470c538412bb0d6a?rik=qJaXH3rmGtj6sw&pid=ImgRaw&r=0',
      videoPath: 'assets/videos/example.mov',
      category: 'Action',
      year: 2022,
      duration: Duration(hours: 5, minutes: 3),
    ),
    Movie(
      name: 'Money Heist',
      imagePath:
          'https://dnm.nflximg.net/api/v6/BvVbc2Wxr2w6QuoANoSpJKEIWjQ/AAAAQfRXg647q7YQYhqoKr69Eky0HUXXw0KtcqpXR9ptpiTyeD5ODZHtc4Wu7K-v_TBHcn3rUFgM95u7i1sAeKkcC1X99SMskRzi9UNaR2fCXM5B_HGoSQwA9wKe5V1_68g_rGUetD6Lwkl1FzZwh0W2lRlZNeg.jpg?r=a9b',
      videoPath: 'assets/videos/example.mov',
      category: 'Action',
      year: 2022,
      duration: Duration(hours: 5, minutes: 3),
    ),
    Movie(
      name: 'Hustle',
      imagePath:
          'https://i0.wp.com/www.thegoodviewer.com/wp-content/uploads/2022/06/Hustle_Poster.jpg?fit=933%2C1383&ssl=1',
      videoPath: 'assets/videos/example.mov',
      category: 'Thriller',
      year: 2022,
      duration: Duration(hours: 2, minutes: 9),
    ),
    Movie(
      name: 'Extraction',
      imagePath:
          'https://static1.colliderimages.com/wordpress/wp-content/uploads/2021/09/extraction-2.jpg',
      videoPath: 'assets/videos/example.mov',
      category: 'Action',
      year: 2022,
      duration: Duration(hours: 3, minutes: 10),
    ),
    Movie(
      name: 'The last Kingdom',
      imagePath:
          'https://image.tmdb.org/t/p/original/eb8JI0HArfuVMSXDnUXFJJBhzCY.jpg',
      videoPath: 'assets/videos/example.mov',
      category: 'Action',
      year: 2022,
      duration: Duration(hours: 1, minutes: 10),
    ),
    Movie(
      name: 'The Black Crab',
      imagePath: 'https://dl.moviesr.net/images/foXxs.jpg',
      videoPath: 'assets/videos/example.mov',
      category: 'Action',
      year: 2022,
      duration: Duration(hours: 2, minutes: 15),
    ),
    Movie(
      name: 'The Grey Man',
      imagePath:
          'https://occ-0-114-358.1.nflxso.net/dnm/api/v6/6AYY37jfdO6hpXcMjf9Yu5cnmO0/AAAABdy-faTwQD7YK6tirPkhmsovv6blu05YcjEwFCYGa_ToIxtusZGR-edOY-bHfyYNyVo5w46tWCW3IV5Cgx4G196M-V6d-b5FMRNZ.jpg?r=d7f',
      videoPath: 'assets/videos/example.mov',
      category: 'Action',
      year: 2022,
      duration: Duration(hours: 3, minutes: 23),
    ),
    Movie(
      name: 'The Warriors of Future',
      imagePath:
          'https://occ-0-2433-987.1.nflxso.net/dnm/api/v6/E8vDc_W8CLv7-yMQu8KMEC7Rrr8/AAAABUwhhtpU8facQRctkDu3O7R3gIl6R63IXws4uxK_YO28IF8EPx19Xw3W7zHZx4MsVmXsY06vJWhKBGLWz-ci3f6R7YCfjJ9N2v9_.jpg?r=035',
      videoPath: 'assets/videos/example.mov',
      category: 'Action',
      year: 2022,
      duration: Duration(hours: 3, minutes: 23),
    ),
  ];
}
