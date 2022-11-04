
def main():
    print("Input type")
    print("Metric:   1")
    print("Imperial: 2")
    inputType = input("")

    if inputType == "1":
        startKm = float(input("Enter the first odometer reading (km): "))
        endKm = float(input("Enter the second odometer reading (km): "))
        liters = float(input("Enter the amount of fuel used (L): "))

    if inputType == "2":
        startMiles = float(input("Enter the first odometer reading (miles): "))
        endMiles = float(input("Enter the second odometer reading (miles): "))
        gallons = float(input("Enter the amount of fuel used (gallons): "))

    # checks to see if metric input needs to be converted to imperial
    if inputType == "2":
        get_imperial(startMiles, endMiles, gallons)

    # checks to see if metric input needs to be converted to imperial
    if inputType == "1":
        get_metric(startKm, endKm, liters)

    # print mpg output
        miles_per_gallon(startMiles, endMiles, gallons)
    # print Km per L output
        kilometers_per_liter(startKm, endKm, liters)


def get_imperial(startKm, endKm, liters):
    startMiles = startKm / 1.609344
    endMiles = endKm / 1.609344
    gallons = liters * 3.78541178
    return startMiles, endMiles, gallons


def get_metric(startMiles, endMiles, gallons):
    startKm = startMiles * 1.609344
    endKm = endMiles * 1.609344
    liters = gallons / 3.78541178
    return startKm, endKm, liters


def miles_per_gallon(startMiles, endMiles, gallons):
    mpg = (startMiles - endMiles) / gallons
    print(f'{mpg} miles per gallon')


def kilometers_per_liter(startKm, endKm, liters):
    kmpl = (startKm - endKm) / liters
    print(f'{kmpl} miles per gallon')


if __name__ == "__main__":
    main()
