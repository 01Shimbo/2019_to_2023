import random
import pytest


def main():
    # while True:
    #     print("Welcome to the three to four word phrase generator")
    #     print("'plural' or 'singular'")
    #     quantity = input()
    #     if quantity == "plural" or quantity == "singular":
    #         break
    #     else:
    #         continue
    # while True:
    #     print("What tense?")
    #     print("'past' 'present' 'future'")
    #     tense = input()
    #     if tense == "past" or tense == "present" or tense == "future":
    #         break
    #     else:
    #         continue
    # if quantity == "singular":
    #     quantity = 1
    # else:
    #     quantity = 2
    # determiner = get_determiner(quantity)
    # noun = get_noun(quantity)
    # verb = get_verb(quantity, tense)

    print(f'{ get_determiner(1).capitalize()} { get_noun(1)} {get_verb(1, "past")}.')
    print(f'{ get_determiner(1).capitalize()} { get_noun(1)} {get_verb(1, "present")}.')
    print(f'{ get_determiner(1).capitalize()} { get_noun(1)} {get_verb(1, "future")}.')
    print(f'{ get_determiner(2).capitalize()} { get_noun(2)} {get_verb(2, "past")}.')
    print(f'{ get_determiner(2).capitalize()} { get_noun(2)} {get_verb(2, "present")}.')
    print(f'{ get_determiner(2).capitalize()} { get_noun(2)} {get_verb(2, "future")}.')


def get_determiner(quantity):
    """Return a randomly chosen determiner. A determiner is
    a word like "the", "a", "one", "some", "many".
    If quantity == 1, this function will return either "a",
    "one", or "the". Otherwise this function will return
    either "some", "many", or "the".

    Parameter
        quantity: an integer.
            If quantity == 1, this function will return a
            determiner for a single noun. Otherwise this
            function will return a determiner for a plural
            noun.
    Return: a randomly chosen determiner.
    """
    if quantity == 1:
        words = ["a", "one", "the"]
    else:
        words = ["some", "many", "the"]

    # Randomly choose and return a determiner.
    word = random.choice(words)
    return word


def get_noun(quantity):
    """Return a randomly chosen noun.
    If quantity == 1, this function will
    return one of these ten single nouns:
        "bird", "boy", "car", "cat", "child",
        "dog", "girl", "man", "rabbit", "woman"
    Otherwise, this function will return one of
    these ten plural nouns:
        "birds", "boys", "cars", "cats", "children",
        "dogs", "girls", "men", "rabbits", "women"

    Parameter
        quantity: an integer that determines if
            the returned noun is single or plural.
    Return: a randomly chosen noun.
    """
    # single_noun_array = ["bird", "boy", "car", "cat",
    #                      "child", "dog", "girl", "man", "rabbit", "woman"]
    # plural_noun_array = ["birds", "boys", "cars", "cats",
    #                      "children", "dogs", "girls", "men", "rabbits", "women"]

    # get single noun array
    if quantity == 1:
        noun_array = ["bird", "boy", "car", "cat",
                      "child", "dog", "girl", "man", "rabbit", "woman"]
    # plural noun array
    else:
        noun_array = ["birds", "boys", "cars", "cats",
                      "children", "dogs", "girls", "men", "rabbits", "women"]
    noun = random.choice(noun_array)
    return noun


def get_verb(quantity, tense):
    """Return a randomly chosen verb. If tense is "past",
    this function will return one of these ten verbs:
        "drank", "ate", "grew", "laughed", "thought",
        "ran", "slept", "talked", "walked", "wrote"
    If tense is "present" and quantity is 1, this
    function will return one of these ten verbs:
        "drinks", "eats", "grows", "laughs", "thinks",
        "runs", "sleeps", "talks", "walks", "writes"
    If tense is "present" and quantity is NOT 1,
    this function will return one of these ten verbs:
        "drink", "eat", "grow", "laugh", "think",
        "run", "sleep", "talk", "walk", "write"
    If tense is "future", this function will return one of
    these ten verbs:
        "will drink", "will eat", "will grow", "will laugh",
        "will think", "will run", "will sleep", "will talk",
        "will walk", "will write"

    Parameters
        quantity: an integer that determines if the
            returned verb is single or plural.
        tense: a string that determines the verb conjugation,
            either "past", "present" or "future".
    Return: a randomly chosen verb.
    """
    # past_verb_array = ["drank", "ate", "grew", "laughed", "thought",
    #                    "ran", "slept", "talked", "walked", "wrote"]
    # present_verb_array = ["drinks", "eats", "grows", "laughs", "thinks",
    #                       "runs", "sleeps", "talks", "walks", "writes"]
    # present_plural_verb_array = ["drink", "eat", "grow", "laugh", "think",
    #                              "run", "sleep", "talk", "walk", "write"]
    # future_verb_array = ["will drink", "will eat", "will grow", "will laugh",
    #                      "will think", "will run", "will sleep", "will talk", "will walk", "will write"]

    # single past verb array
    if tense == "past":
        verb_array = ["drank", "ate", "grew", "laughed", "thought",
                      "ran", "slept", "talked", "walked", "wrote"]
    # single present verb array
    elif quantity == 1 and tense == "present":
        verb_array = ["drinks", "eats", "grows", "laughs", "thinks",
                      "runs", "sleeps", "talks", "walks", "writes"]
    # plural present verb array
    elif quantity != 1 and tense == "present":
        verb_array = ["drink", "eat", "grow", "laugh", "think",
                      "run", "sleep", "talk", "walk", "write"]
    # future verb array
    elif tense == "future":
        verb_array = ["will drink", "will eat", "will grow", "will laugh",
                      "will think", "will run", "will sleep", "will talk", "will walk", "will write"]
    else:
        ("error getting verb array")

    verb = random.choice(verb_array)
    return verb


# Call the main function that is part of pytest so that the
# computer will execute the test functions in this file.
# pytest.main(["-v", "--tb=line", "-rN", __file__])

if __name__ == "__main__":
    main()
