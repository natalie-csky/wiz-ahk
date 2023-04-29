import configparser
from sys import argv

parser = configparser.ConfigParser()

parser.read_file(open("config.ini"))

output = parser[argv[1]][argv[2]]

with open("temp.txt", "w") as f:
	print(output, file=f)