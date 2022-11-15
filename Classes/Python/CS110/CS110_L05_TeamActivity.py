def get_remainder(x):
    last_digit = x % 10
    return last_digit

def main():
    per = float(input("What precent do you have? "))
    if per >= 90:
        letter = "A"
    elif per >= 80:
        letter = "B"
    elif per >= 70:
        letter = "C"
    elif per >= 60:
        letter = "D"
    else:
        letter = "F"

    last_num = get_remainder(per)
    
    if last_num >= 7:
        sufix = "+"
    elif last_num <= 3:
        sufix = "-"
    else:
        sufix = ""
    
    print(f"your letter grade is: {sufix}{letter}")
        
    if per >= 70:
        print(f"You passed the class")
    else:
        print("You did not pass.")


if __name__ == "__main__":
    main()
