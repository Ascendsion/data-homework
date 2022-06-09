#PArt1
name_list = ["Kurt", "David", "Katherine"]

for name in name_list:
    print("Where is " + name + " today?")

#Part2

my_favorite_cars = ["Toyota", "Honda", "Nissan"]
my_favorite_flowers = ["Lotus", "Rose", "Sunflower", "Tulip"]
my_favorite_animals = ["Octopus", "Fox", "Owl", "Dog", "Platypus"]
my_favorite_things = my_favorite_cars + my_favorite_flowers + my_favorite_animals

for thing in my_favorite_things:
    if len(thing) % 2 == 0:
        print(thing)

#Part 3

number_range = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20]

for number in number_range:
    if number % 3 == 0 and number % 5 == 0:
        print('ZipZap')
    elif number % 3 == 0:
        print('Zip')
    elif number % 5 == 0:
        print('Zap')
    else:
        print(number)