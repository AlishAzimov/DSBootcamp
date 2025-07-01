class Movie:

    GENRES = ['Action', 'Adventure', 'Animation', "Children's", 'Comedy',
              'Crime', 'Documentary', 'Drama', 'Fantasy', 'Film-Noir',
              'Horror', 'Musical', 'Mystery', 'Romance', 'Sci-Fi', 'Thriller',
              'War', 'Western', '(no genres listed)']
    
    SPLIT = '|'

    def __init__(self, title):
        self.title = title
        self.__genre = []
        self.__movieID = None

    @property
    def genres(self):
        return tuple(Movie.GENRES)

    @property
    def genre(self):
        return self.__genre

    @classmethod
    def add_available_genre(cls, value):
        if not value or not isinstance(value, str) or value.strip() == "":
            raise ValueError("Нельзя добавить пустой или недопустимый жанр")
        if value in cls.GENRES:
            raise ValueError("Такой жанр уже есть")
        cls.GENRES.append(value)

    def add_genre(self, value):
        if value not in Movie.GENRES:
            raise ValueError("Такого жанра нет в списке допустимых")
        if value in self.__genre:
            raise ValueError("Жанр уже добавлен этому фильму")
        self.__genre.append(value)

    @property
    def total_genres(self):
        return Movie.SPLIT.join(self.__genre) if self.__genre else "(no genres listed)"

    def __str__(self):
        base = f"[ID: {self.__movieID}] " if self.__movieID is not None else ""
        return f"{base}Фильм: {self.title} | Жанры: {self.total_genres}"

    def add_base(self, path='./ml-latest-small/movies.csv'):
        with open(path, 'r', encoding='utf-8') as f:
            last_line = None
            for line in f:
                fields = line.strip().split(',', maxsplit=2)
                if len(fields) > 1 and fields[1].strip().lower() == self.title.lower():
                    raise ValueError("Такой фильм уже существует в базе")
                last_line = line

        self.__movieID = int(last_line.strip().split(',')[0]) + 1 if last_line else 1

        with open(path, 'a', encoding='utf-8') as f:
            f.write(f"{self.__movieID},{self.title},{self.total_genres}\n")