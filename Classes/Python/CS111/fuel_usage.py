
def main():

    startMiles = float(input("Enter the first odometer reading (miles): "))
    endMiles = float(input("Enter the second odometer reading (miles): "))
    gallons = float(input("Enter the amount of fuel used (gallons): "))

# checks to see if metric input needs to be converted to imperial
    mpg = miles_per_gallon(startMiles, endMiles, gallons)
    lp100k = lp100k_from_mpg(mpg)

    print(f'{mpg:.1f} miles per gallon')
    print(f'{lp100k:.2f} liters per 100 kilometers')
# checks to see if metric input needs to be converted to imperial
# print mpg output
# print Km per L output


def lp100k_from_mpg(mpg):
    """Convert miles per gallon to liters per 100
    kilometers and return the converted value.

    Parameter mpg: A value in miles per gallon
    Return: The converted value in liters per 100km.
    """
    lp100k = 235.215 / mpg
    return lp100k


def miles_per_gallon(startMiles, endMiles, gallons):
    """Compute and return the average number of miles
    that a vehicle traveled per gallon of fuel.

    Parameters
        start_miles: An odometer value in miles.
        end_miles: Another odometer value in miles.
        amount_gallons: A fuel amount in U.S. gallons.
    Return: Fuel efficiency in miles per gallon.
    """
    mpg = abs(startMiles - endMiles) / gallons
    return mpg


if __name__ == "__main__":
    main()
