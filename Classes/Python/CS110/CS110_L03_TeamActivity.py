import math


def AreaOfSquare(side):
    area = side * side
    return area


def AreaOfRect(length, width):
    area = length * width
    return area


def AreaofCircle(radius):
    area = math.pi * math.pow(radius, 2)
    return area


def main():
    sideOfSquare = float(input("What is the length of a side of the square: "))
    print(f'The area of the square is: {AreaOfSquare(sideOfSquare):.2f}')
    lengthOfRect = float(input("What is the length of rectangle? "))
    widthOfRect = float(input("What is the width of the rectangle? "))
    print(
        f'The area of the rectangle is: {AreaOfRect(lengthOfRect, widthOfRect):.2f}')
    circleRadius = float(input("What is the radius of the circle? "))
    print(f'The area of the circle is: {AreaofCircle(circleRadius):.2f}')


if __name__ == "__main__":
    main()
