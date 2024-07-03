class MovieGenreHelper {
  static final genres = {
    28: "Akcija",
    12: "Avantura",
    16: "Animacija",
    35: "Komedija",
    80: "Kriminalistički",
    99: "Dokumentarni",
    18: "Drama",
    10751: "Obiteljski",
    14: "Fantazija",
    36: "Povijesni",
    27: "Horor",
    10402: "Glazbeni",
    9648: "Misterij",
    10749: "Romantika",
    878: "Znanstvena fantastika",
    10770: "TV film",
    53: "Triler",
    10752: "Ratni",
    37: "Vestern"
  };

  static String? getFromId(int id) {
    return genres[id];
  }

  static List<String> getFromIds(List<int> ids) {
    final genres = ids
        .map((id) => getFromId(id))
        .where((genre) => genre != null)
        .map((genre) => genre as String)
        .toList();

    return genres;
  }
}
