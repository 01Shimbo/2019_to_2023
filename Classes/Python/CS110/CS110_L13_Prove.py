def main():
    temp = float(input("What is the Temperature? "))
    temp_type = input("Fahrenheit or Celsius (F/C)? ")
    if temp_type.upper() == "F":
        pass
    elif temp_type.upper() == "C":
        temp = cel_to_fah(temp)
        pass
    else:
        print("Enter 'c' or 'C' for Celsius")
        print("-or-")
        print("Enter 'f' or 'F' for Fahrenheit")
    for mph in range(5, 61, 5):
        wind_chill = cal_wind_chill(temp, mph)
        print(
            f"At temperature {temp:.1f}F, and wind speed {mph} mph, the windchill is: {wind_chill:.2f}F")


def cal_wind_chill(f, mph):
    wc = 35.74 + (0.6215 * f) - (35.75 * (mph**0.16)) + \
        ((0.4275 * f) * (mph**0.16))
    return wc

def cel_to_fah(c):
    f =  ((9/5) * c) + 32
    return f
    
main()
