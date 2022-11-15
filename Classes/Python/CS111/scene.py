# Import the functions from the Draw 2-D library
# so that they can be used in this program.
import os
lib = os
from draw2d import \
    start_drawing, draw_line, draw_oval, draw_arc, \
    draw_rectangle, draw_polygon, draw_text, finish_drawing


def main():
    # Width and height of the scene in pixels
    scene_width = 800
    scene_height = 500

    # Call the start_drawing function in the draw2d.py
    # library which will open a window and create a canvas.
    canvas = start_drawing("Scene", scene_width, scene_height)

    # Call your drawing functions such
    # as draw_sky and draw_ground here.
    draw_sky(canvas, scene_width, scene_height)
    draw_ground(canvas, scene_width, scene_height)

    # Call the finish_drawing function
    # in the draw2d.py library.
    finish_drawing(canvas)


def draw_sky(canvas, scene_width, scene_height):
    """Draw the sky and all the objects in the sky."""
    draw_rectangle(canvas, 0, scene_height / 3,
                   scene_width, scene_height, width=0, fill="sky blue")
    # objects in the sky
    draw_sun(canvas)
    draw_cloud(canvas)
    draw_bird(canvas, 200, 550)


def draw_ground(canvas, scene_width, scene_height):
    """Draw the ground and all the objects on the ground."""
    draw_rectangle(canvas, 0, 0,
                   scene_width, scene_height / 3, width=0, fill="forestGreen")
    # objects on the ground
    draw_tree(canvas)

    # draws the flowers
    draw_flower(canvas, 400, 100)
    draw_flower(canvas, 750, 80)
    draw_flower(canvas, 145, 50)
    draw_flower(canvas, 50, 30)

    # draw the grass

    draw_grass(canvas, 260, 30)
    draw_grass(canvas, 190, 60)
    draw_grass(canvas, 600, 45)
    draw_grass(canvas, 65, 60)


def draw_sun(canvas):
    draw_oval(canvas, 250, 250, 100, 100, width=0, fill="yellow")


def draw_cloud(canvas):
    draw_oval(canvas, 200, 420, 600, 400, outline="white", fill="white")
    draw_oval(canvas, 180, 400, 400, 440, outline="white", fill="white")
    draw_oval(canvas, 220, 430, 450, 470, outline="white", fill="white")


def draw_bird(canvas, x, y):

    point_x = x
    point_y = y

    left_wing_x = x + 100
    left_wing_y = y + 40
    right_wing_x = x - 100
    right_wing_y = y + 40

    # # left wing 
    # draw_arc(canvas, left_wing_x, point_y, point_x, left_wing_y, start=360,
    #          extent=90, fill="black", width=2)
    # # right wing
    # draw_arc(canvas, point_x, point_y, right_wing_x, right_wing_y, start=90,
    #          extent=90, fill="black", width=2)
    
    
    # # left wing 
    # draw_arc(canvas, right_wing_x, point_y, point_x, right_wing_y, start=360,
    #          extent=90, fill="black", width=2)
    # # right wing
    # draw_arc(canvas, point_x, point_y, left_wing_x, left_wing_y, start=90,
    #          extent=90, fill="black", width=2)


    draw_arc(canvas, 350, 300, 450, 340, start=360,
             extent=90, fill="black", width=2)
    draw_arc(canvas, 450, 300, 550, 340, start=90,
             extent=90, fill="black", width=2)


def draw_flower(canvas, x, y):
    # stem var
    stem_lower_x = x
    stem_lower_y = y
    stem_upper_x = x + 5
    stem_upper_y = y + 50
    # flower var
    flower_bottom_lower_x = x - 5
    flower_bottom_lower_y = y + 45
    flower_bottom_upper_x = x + 10
    flower_bottom_upper_y = y + 55

    flower_peddels_lower_x = x - 5
    flower_peddels_lower_y = y + 60
    flower_peddels_upper_x = x + 10
    flower_peddels_upper_y = y + 50

    draw_rectangle(canvas, stem_lower_x, stem_lower_y,
                   stem_upper_x, stem_upper_y, fill="green3", outline="green3")
    draw_oval(canvas, flower_bottom_lower_x, flower_bottom_lower_y,
              flower_bottom_upper_x, flower_bottom_upper_y, fill="red", outline="red")
    draw_rectangle(canvas, flower_peddels_lower_x, flower_peddels_lower_y,
                   flower_peddels_upper_x, flower_peddels_upper_y, fill="red", outline="red")


def draw_tree(canvas):
    draw_rectangle(canvas, 600, 100, 630, 250,
                   fill="saddleBrown", outline="saddleBrown")
    draw_polygon(canvas, 550, 150, 615, 480, 680, 150,
                 fill="darkGreen", outline="darkGreen")


def draw_grass(canvas, x, y):
    color = "green3"

    base_x = x
    base_y = y

    left_upper_x = x + 40
    left_upper_y = y + 40

    left_lower_x = x + 40
    left_lower_y = y + 30

    right_base_x = x + 60
    right_base_y = y + 30

    right_x = x + 40
    right_y = y + 5

    draw_arc(canvas, base_x, base_y, left_lower_x, left_lower_y, start=1,
             extent=90, fill=color, width=2, outline=color)
    draw_arc(canvas, base_x, base_y, left_upper_x, left_upper_y, start=1,
             extent=90, fill=color, width=2, outline=color)
    draw_arc(canvas, right_base_x, right_base_y, right_x, right_y, start=90,
             extent=90, fill=color, width=2, outline=color)


if __name__ == "__main__":
    main()
