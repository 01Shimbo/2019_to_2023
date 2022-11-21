from sentences import get_determiner, get_noun, get_verb, get_preposition, get_prepositional_phrase
import pytest


def main():
    # print (f'{ get_determiner(1).capitalize()} { get_noun(1)} {get_verb(1, "past")} {get_prepositional_phrase(1)}')
    # print (f'{ get_determiner(1).capitalize()} { get_noun(1)} {get_verb(1, "present")} {get_prepositional_phrase(1)}.')
    # print (f'{ get_determiner(1).capitalize()} { get_noun(1)} {get_verb(1, "future")} {get_prepositional_phrase(1)}.')
    # print (f'{ get_determiner(2).capitalize()} { get_noun(2)} {get_verb(2, "past")} {get_prepositional_phrase(2)}.')
    # print (f'{ get_determiner(2).capitalize()} { get_noun(2)} {get_verb(2, "present")} {get_prepositional_phrase(2)}.')
    # print (f'{ get_determiner(2).capitalize()} { get_noun(2)} {get_verb(2, "future")} {get_prepositional_phrase(2)}.')

    pytest.main(["-v", "--tb=line", "-rN", __file__])


def test_get_determiner():
    # checks for singular artical
    singular = ["a", "one", "the"]
    assert get_determiner(1) in singular

    # checks for plural artical
    plural = ["some", "many", "the"]
    assert get_determiner(2) in plural


def test_get_noun():
    # checks singular noun
    singular = ["bird", "boy", "car", "cat",
                "child", "dog", "girl", "man", "rabbit", "woman"]
    assert get_noun(1) in singular
    # checks plural noun
    plural = ["birds", "boys", "cars", "cats",
              "children", "dogs", "girls", "men", "rabbits", "women"]
    assert get_noun(2) in plural


def test_get_verb():

    get_verb(1, "past")
    get_verb(2, "past")

    get_verb(1, "present")
    get_verb(2, "present")

    get_verb(1, "future")
    get_verb(2, "future")

    # single past verb array
    past = ["drank", "ate", "grew", "laughed", "thought",
            "ran", "slept", "talked", "walked", "wrote"]
    assert get_verb(1, "past") in past
    assert get_verb(2, "past") in past
    # single present verb array
    singular_present = ["drinks", "eats", "grows", "laughs", "thinks",
                        "runs", "sleeps", "talks", "walks", "writes"]
    assert get_verb(1, "present") in singular_present

    # plural present verb array
    plural_present = ["drink", "eat", "grow", "laugh", "think",
                      "run", "sleep", "talk", "walk", "write"]
    assert get_verb(2, "present") in plural_present

    # future verb array
    future = ["will drink", "will eat", "will grow", "will laugh",
              "will think", "will run", "will sleep", "will talk", "will walk", "will write"]
    assert get_verb(1, "future") in future
    assert get_verb(2, "future") in future


def test_get_preposition():
    prep = ["about", "above", "across", "after", "along",
            "around", "at", "before", "behind", "below",
            "beyond", "by", "despite", "except", "for",
            "from", "in", "into", "near", "of",
                          "off", "on", "onto", "out", "over",
                          "past", "to", "under", "with", "without"]
    assert get_preposition() in prep


def test_get_prepositional_phrase():
    prep = ["about", "above", "across", "after", "along",
            "around", "at", "before", "behind", "below",
            "beyond", "by", "despite", "except", "for",
            "from", "in", "into", "near", "of",
                          "off", "on", "onto", "out", "over",
                          "past", "to", "under", "with", "without"]

    singular_determiner = ["a", "one", "the"]
    singular_noun = ["bird", "boy", "car", "cat",
                     "child", "dog", "girl", "man", "rabbit", "woman"]

    assert get_preposition() in prep and get_determiner(
        1) in singular_determiner and get_noun(1) in singular_noun

    plural_determiner = ["some", "many", "the"]
    plural_noun = ["birds", "boys", "cars", "cats",
                   "children", "dogs", "girls", "men", "rabbits", "women"]
    assert get_preposition() in prep and get_determiner(
        2) in plural_determiner and get_noun(2) in plural_noun


if __name__ == "__main__":
    main()
