# from L08_Prove_test import comcompare_strings
def main():
    hint = compare_strings("temple", "Teampl")


def compare_strings(guess, andswer):
    for enum, letter in enumerate(guess):
        print(f"en:{enum} lett: {letter}")

    for enum, letter in enumerate(andswer):
        print(f"en:{enum} lett: {letter}")


main()