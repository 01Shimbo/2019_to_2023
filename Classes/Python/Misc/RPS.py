import random
import os
import pathlib
import re


def main():

    f = open("rpshistory.txt", "w+")
    f.close()
    history_path = os.path.join(pathlib.Path().resolve(), 'rpshistory.txt')
    player_w = 0
    ai_w = 0
    player_choice = 'y'
    while player_choice != 'q':
        probability = get_probablity(history_path)
        ai_play = get_ai_play(probability)
        # print(ai_play)
        player_choice = get_player_choice(history_path)
        if player_choice == 'q':
            break

        resault = get_results(player_choice, ai_play, player_w, ai_w)
        print('-----------------------------------------------')
        print(f'you played {player_choice} the AI played {ai_play}')
        print(resault)
        if resault == 'PLAYER WON':
            player_w += 1
        elif resault == 'PLAYER LOST':
            ai_w += 1
        print(f'Score: {player_w} - {ai_w}')
        print('-----------------------------------------------')


def get_results(player_choice, ai_play, player_w, ai_w):
    # gets resaults
    if player_choice == 'rock' and ai_play == 'scissors':
        resault = 'PLAYER WON'
    elif player_choice == 'rock' and ai_play == 'paper':
        resault = 'PLAYER LOST'
    elif player_choice == 'paper' and ai_play == 'rock':
        resault = 'PLAYER WON'
    elif player_choice == 'paper' and ai_play == 'scissors':
        resault = 'PLAYER LOST'
    elif player_choice == 'scissors' and ai_play == 'rock':
        resault = 'PLAYER LOST'
    elif player_choice == 'scissors' and ai_play == 'paper':
        resault = 'PLAYER WON'
    else:
        resault = 'Tie'

    return resault


def get_probablity(history_path):
    base_rock_prob = 35
    base_scissors_prob = 35
    base_paper_prob = 30

    rock_count = 0
    paper_count = 0
    scissors_count = 0

    rock_prob = 0
    scissors_prob = 0
    paper_prob = 0
    with open(history_path, 'r') as f:
        for index, line in enumerate(f.readlines()):
            if re.search('^rock$', line, re.I):
                rock_count += 1
            elif re.search('^paper$', line, re.I):
                paper_count += 1
            elif re.search('^scissors$', line, re.I):
                scissors_count += 1
            else:
                pass
    total_lines = sum(1 for _ in open(history_path)) + 100
    rock_prob = (rock_count + base_rock_prob) / total_lines
    paper_prob = (paper_count + base_paper_prob) / total_lines
    scissors_prob = (scissors_count + base_scissors_prob) / total_lines
    return [rock_prob, paper_prob, scissors_prob]


def get_player_choice(history_path):
    while True:
        print('What will you play?')
        print('Rock     [r]')
        print('Paper    [p]')
        print('Scissors [s]')
        print('Quit     [q]')
        player_choice = input().lower()
        if player_choice == 'q':
            return 'q'
        elif player_choice == 'r':
            player_choice = 'rock'
            break
        elif player_choice == 'p':
            player_choice = 'paper'
            break
        elif player_choice == 's':
            player_choice = 'scissors'
            break
        else:
            print("Please type 'r', 'p', 's' to play or 'q' to leave the game.")
            print()
            continue
    with open(history_path, 'a') as f:
        f.write(f'{player_choice}\n')
    return player_choice


def get_ai_play(probability):
    rock_prob = probability[0]
    paper_prob = probability[1]
    scissors_prob = probability[2]
    # print(f'rock prob: {rock_prob}')
    # print(f'paper_prob: {paper_prob}')
    # print(f'scissors_prob: {scissors_prob}')
    ai_play = ''
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
        ai_play = 'paper'
    elif greatest_prob == scissors_prob:
        ai_play = 'rock'
    elif greatest_prob == paper_prob:
        ai_play = 'scissors'
    else:
        print("AI did not pick")

    return ai_play


if __name__ == '__main__':
    main()
