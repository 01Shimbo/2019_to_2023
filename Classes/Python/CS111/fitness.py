# Import datetime so that it can be
# used to compute a person's age.
from datetime import datetime


def main():
    # Get the user's gender, birthdate, height, and weight.
    while True:
        print("What is your gender (m or f)? ")
        gender = input('')
        if gender == 'm':
            gender = 'male'
            break
        elif gender == 'f':
            gender = 'female'
            break
        else:
            continue

    birthdate = input("What is your birthday (YYYY-MM-DD)? ")
    age = compute_age(birthdate)

    inches = float(input("What is your height (inch)? "))
    cm = cm_from_in(inches)

    pounds = float(input("what is your weight (lb)? "))
    kg = kg_from_lb(pounds)

    bmi = body_mass_index(kg, cm)

    bmr = basal_metabolic_rate(gender, kg, cm, age)
    # Call the compute_age, kg_from_lb, cm_from_in,
    # body_mass_index, and basal_metabolic_rate functions as needed.
    # Print the results for the user to see.
    print(f"Age (years): {age}")
    print(f"Weight (kg): {kg:.2f}")
    print(f"Height (cm): {cm:.2f}")
    print(f"Body mass index: {bmi:.2f}")
    print(f"Basal metabolic rate (kcal/day): {bmr:.2f}")

    pass


def compute_age(birth_str):
    """Compute and return a person's age in years.
    Parameter birth_str: a person's birthdate stored
        as a string in this format: YYYY-MM-DD
    Return: a person's age in years.
    """
    # Convert a person's birthdate from a string
    # to a date object.
    birthdate = datetime.strptime(birth_str, "%Y-%m-%d")
    today = datetime.now()

    # Compute the difference between today and the
    # person's birthdate in years.
    years = today.year - birthdate.year

    # If necessary, subtract one from the difference.
    if birthdate.month > today.month or \
        (birthdate.month == today.month and
            birthdate.day > today.day):
        years -= 1

    return years


def kg_from_lb(pounds):
    """Convert a mass in pounds to kilograms.
    Parameter pounds: a mass in U.S. pounds.
    Return: the mass in kilograms.
    """
    kg = pounds * 0.453592
    return kg


def cm_from_in(inches):
    """Convert a length in inches to centimeters.
    Parameter inches: a length in inches.
    Return: the length in centimeters.
    """
    cm = inches * 2.54
    return cm


def body_mass_index(weight, height):
    """Compute and return a person's body mass index.
    Parameters
        weight: a person's weight in kilograms.
        height: a person's height in centimeters.
    Return: a person's body mass index.
    """
    bmi = (10_000 * weight) / (height ** 2)
    return bmi


def basal_metabolic_rate(gender, weight, height, age):
    """Compute and return a person's basal metabolic rate.
    Parameters
        weight: a person's weight in kilograms.
        height: a person's height in centimeters.
        age: a person's age in years.
    Return: a person's basal metabolic rate in kcals per day.
    """
    if gender.lower() == "male":
        bmr = 88.362 + (13.397 * weight) + (4.799 * height) - (5.677 * age)
    elif gender.lower() == "female":
        bmr = 447.593 + (9.247 * weight) + (3.098 * height) - (4.330 * age)
    return bmr


# Call the main function so that
# this program will start executing.
if __name__ == "__main__":
    main()
