file = open('Login.csv')
reader_1 = csv.reader(file)
data_1 = list(reader_1)
file = open('Songs.csv')
reader_2 = csv.reader(file)
data_2 = list(reader_2)
for i in range(0,300):
	x = random.randint(1,len(data_1)-1)
	y = random.randint(1,len(data_2)-1)
	num = random.randint(0,10)
	val=data_1[x][0]
	val+=","
	val+=data_2[y][0]
	val+=","
	val+=str(num)
	print val
