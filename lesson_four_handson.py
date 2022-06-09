#Part1

pets_name_1 = {
    'Type': 'Dog', 
    'Color': 'Brown', 
    'Nickname': 'Jace', 
    'Owner': 'Jack'
    }

pets_name_2 = {
    'Type': 'Cat', 
    'Color': 'White',
    'Nickname': 'Pillow',
    'Owner': 'Jill',
    }

pets_info = [pets_name_1, pets_name_2]

for pets_name in pets_info:
    print('Type: ', pets_name['Type'])
    print('Color: ', pets_name['Color'])
    print('Nickname: ', pets_name['Nickname'])
    print('Owner: ', pets_name['Owner'])

#Part2

#England
country_e = {
    'Capital': 'London', 
    'Population': '53.01 million', 
    'Interesting Fact': 'The Queen Has Her Own Poet.', 
    'Top Language': 'English '
    }

#France
country_f = {
    'Capital': 'Paris', 
    'Population': '66.9 million', 
    'Interesting Fact': 'France is the world’s most popular tourist destination.', 
    'Top Language': 'French'
    }

#Belgium
country_b = {
    'Capital': 'Brussels', 
    'Population': '11.35 million', 
    'Interesting Fact': 'In the 1970s, light beer was served during school lunch.', 
    'Top Language': 'Dutch'
    }

countries = [country_e, country_f, country_b]

for country in countries:
    print('Capital: ', country['Capital'])
    print('Population: ', country['Population'])
    print('Interesting Fact: ', country['Interesting Fact'])
    print('Top Language: ', country['Top Language'])

#Part3

pizza_order = {
    'Customers Name': 'Alex', 
    'Pizza Size': 'Large', 
    'Crust': 'Thin', 
    'Toppings': 'Pepperoni, Sausage, Bacon'
    }

print('Thank you for your order, ', pizza_order['Customers Name'])
print('You have ordered a', pizza_order['Pizza Size'], pizza_order['Crust'], 'crust pizza with the following toppings:', pizza_order['Toppings'])