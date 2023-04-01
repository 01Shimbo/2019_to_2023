import random


def main():
    while True:
        ai_play = ''
        rock_prob = 0.34
        scissors_prob = 0.33
        paper_prob = 0.33
        greatest_prob = max(rock_prob, scissors_prob, paper_prob)

        if greatest_prob == rock_prob and greatest_prob == scissors_prob and greatest_prob == paper_prob:
            ai_play = random.choice(['rock', 'scissors', 'paper'])

        elif greatest_prob == rock_prob and greatest_prob == scissors_prob:
            ai_play = random.choice(['rock', 'scissors'])

        elif greatest_prob == rock_prob and greatest_prob == paper_prob:
            ai_play = random.choice(['rock', 'paper'])

        elif greatest_prob == scissors_prob and greatest_prob == paper_prob:
            ai_play = random.choice(['scissors', 'paper'])

        elif greatest_prob == rock_prob:
            ai_play = 'rock'

        elif greatest_prob == scissors_prob:
            ai_play = 'paper'

        elif greatest_prob == paper_prob:
            ai_play = 'scissors'

        else:
            print("AI did not pick")

        print(ai_play)
        while True:
            print ('Rock     [r]')
            print ('Paper    [p]')
            print ('Scissors [s]')
            print ('What will you play?')
            player_choice = input()
            if player_choice == 'r':
                rock_prob += 0.01
                break
            elif player_choice == 'p':
                paper_prob += 0.01
                break
            elif player_choice == 's':
                scissors_prob += 0.01
                break
            else:
                print ("Please type 'r', 'p', or, 's'")
                continue
        while True:
            print ('Do you want to play agian?')
            print ('Yes [y]')
            print ('No  [n]')
            play_again = input()
            if play_again == 'y':
                pass
                


if __name__ == '__main__':
    main()
