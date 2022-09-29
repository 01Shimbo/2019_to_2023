game =  [[0, 0, 0],
         [0, 0, 0],
         [0, 0, 0]]     
row = 0
def displayGame(row):
    print('   a  b  c')
    for count, row in enumerate(game):
        print(count, row)
        count += 1
displayGame
displayGame(row)
print('Enter player 1 move')
row = input('row: ')
column = input('column: ')
player = 0
