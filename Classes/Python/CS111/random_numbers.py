# Team Assignment - Week 04 - Leeson 7
from random import choice, uniform as uni


def main():
    numbers = [16.2, 75.1, 52.3]
    words = ['join', 'love', 'smile']
    print(numbers)
    append_random_numbers(numbers)
    print(numbers)
    
    append_random_numbers(numbers, 2)
    print(numbers)

    append_random_words(words)
    print(words)

    append_random_words(words, 2)
    print(words)


def append_random_numbers(numbers_list, quantity=1):
    for _ in range(quantity):
        number = round(uni(0.1, 99.9), 1)
        numbers_list.append(number)


def append_random_words(words_list, quantity=1):
    for _ in range(quantity):
        word = ['join', 'love', 'smile']
        random_word = choice(word)
        words_list.append(random_word)


if __name__ == "__main__":
    main()
