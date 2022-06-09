#Part1
class Stadium:
    """This class represents a stadium."""

    def __init__(self, name, city_state, capacity):
        """Initialize attributes to decribe the stadium."""

        self.name = name
        self.city_state = city_state
        self.capacity = capacity

    def describe_stadium(self):

        print("The", self.name, "is located in", self.city_state, "and holds", self.capacity, "fans")

stadium1 = Stadium("Mercedez Benz Arena", "Atlanta, GA", "70,000")
stadium1.describe_stadium()

#Part2

class Stadium:
    
    def __init__(self, sport_played, seats_available):

        self.sport_played = sport_played
        self.seats_available = seats_available

    def describe_stadium(self):

        print("The following sport is mainly played in this stadium:", self.sport_played, "There are", self.seats_available, "seats still available for tonight's game.")

stadium1 = Stadium("Football", "15000")
stadium1.describe_stadium()
