def main():

    print("For each of these questions, please provide a 1-10 rating:")

    loan_size = int(input("How large is the loan? "))
    credit = int(input("How good is your credit history? "))
    income = int(input("How high is your income? "))
    down_payment = int(input("How large is your down payment? "))

    decision_false = False
    # loan size is at least 5
    if loan_size >= 5:
        # credit histroy and income are both aleast 7
        if credit >= 7 and income >= 7:
            decision_false = True
        # credit histroy or income are both aleast 7 and down is at least 5
        elif credit >= 7 or income >= 7:
            if down_payment >= 5:
                decision_false = True
            else:
                decision_false = False
        else:
            decision_false = False

    # if loan is less than 5
    else:
        if credit < 4:
            decision_false = False
        else:
            if down_payment >= 7 or down_payment >= 7:
                decision_false = True
            elif income >= 4 and down_payment >= 4:
                decision_false = True
            else:
                decision_false = False

    if decision_false:
        print("you will not get a loan.")
    else:
        print("We will loan to you")


if __name__ == "__main__":
    main()
