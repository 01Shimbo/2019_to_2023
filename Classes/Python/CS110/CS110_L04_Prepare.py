def fahrenheit_to_celsius(f):
    """converts fahrenheit to celsius"""
    c = (f - 32) * (5 / 9)
    return c


def main():
    """takes temp in fahrenheit from user
    than converts it to celsius """
    degrees_f = float(input("What is the temperature in Fahrenheit? "))
    degrees_c = fahrenheit_to_celsius(degrees_f)
    print(f"The temperature in Celsius is {degrees_c:.1f} degrees.")


if __name__ == "__main__":
    main()
