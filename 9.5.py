#Part1

def sum_function(x, y, z):
    return x+y+z
print(sum_function(1, 2, 3))

def product_function(x,y,z):
    return x*y*z
print(product_function(4, 5, 6))

def average_function(x, y, z):
    return (x+y+z)/3
print(average_function(7, 8, 9))

#Part2

add_numbers = lambda x, y, z: x+y+z
print(add_numbers(1, 2, 3))

multiply_numbers = lambda x, y, z: x*y*z
print(multiply_numbers(4, 5, 6))

average_numbers = lambda x, y, z: (x+y+z)/3
print(average_numbers(7, 8, 9))

#Part3

list_one = [4, 6, 88, 24]
list_two = [17, 34, 9, 5]
list_three = [63, 20, 98, 4]

average_maker = lambda x, y, z: (x+y+z)/3

map_results = map(average_maker, list_one, list_two, list_three)

print(list(map_results))
