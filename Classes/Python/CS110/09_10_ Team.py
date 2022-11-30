input_list = [3, 5, 7, 3, 2, -1, -4, -8, 0]
num_list = []
while True:
    # num = int(input("put in number: "))
    for num in input_list:
        num_list.append(num)
    small = 10000000000000000000
    if num == 0:
        sum = 0
        count = 0
        for i in num_list:
            count += 1
            sum += i

            if i < small and i > 0:
                small = i
        print (small)


        avg = sum / count

        print(f"sum: {sum}")
        print(f"avg: {avg:.2f}")
        print(f"max number is: {max(num_list)}")
        print(f"min number is: {small}")

        break

    else:
        print("something is wronge")


account_list = ["checking", "savings"]
balance_list = [102.57, 82.32]
total = 0
while True:
    account = input("name of account: ")
    if account.lower() != "quit":
        balance = float(input("balance of account: "))
        print()
        account_list.append(account)
        balance_list.append(balance)
    elif account.lower() == "quit":
        for i in range(len(account_list)):
            print(f"{account_list[i]} - {balance_list[i]}")
            total += balance_list[i]
        print()
        avg = total / (i + 1)
        print(f"total {total}")
        print(f"avg {avg:.2f}")

        break
