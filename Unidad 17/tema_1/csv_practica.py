

import csv


path = "unidad_17/tema_1/docs/test.csv"

# Data
headers = ['name', 'age']
data = [
        {'name':'Bob', 'age':23},
        {'name':'Jerry', 'age':44},
        {'name':'Tom', 'age':15}
        ]

# Write data
with open(path, 'w', newline='') as f:
    writer = csv.DictWriter(f, headers)
    writer.writeheader()

    for row in data:
        writer.writerow(row)

# Read data
with open(path) as f:
    reader = csv.DictReader(f)
    for row in reader:
        name = row['name']
        print(name)
