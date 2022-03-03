# starting points
x = 250
y = 250

diameter = 50

# increments by which to increase x/y values per draw()
xinc = 7
yinc = 11

#left paddle
#x and y are the top left corner
padlx = 30
padly = 400
padlwidth = 10
padllength = 100

#right paddle
#x and y are the top left corner
padrx = 470
padry = 400
padrwidth = 10
padrlength = 100

#goal counters
leftgoal = 0
rightgoal = 0


def randomColor():
    color1 = random(255)
    color2 = random(255)
    color3 = random(255)
    
    fill(color1,color2,color3)    
                  
def collision(type):
    global xinc
    global yinc
    
    if type == "x":
        #invert x direction
        xinc *= -1
    if type == "y":
        #invert y direction
        yinc *= -1  
                        
    #change color whenever it collides
    #uncomment to enable
    #randomColor() 
    
                                                                                                
                  
def setup():
    
    #size of popup window
    #default 500,500
    #might break if changed (paddle x & y are independent for now)
    size(500,500)
    
    #framerate
    #speed of the circle - framerate * increments
    frameRate(30)
    
    #set the color of the circle fill
    fill(128,128,128)

def draw():
    #called once every frame, forever
    
    
    #declare variables as global not local
    
    global x
    global y

    global diameter
   
    global xinc
    global yinc
    
    
    global padlx
    global padly
    
    global padlwidth
    global padllength  
    
    global padrx
    global padry
    
    global padrwidth
    global padrlength
    
    global leftgoal
    global rightgoal                     
    
    
    #==================================================================================
    #change x & y increments (direction of the circle) depending on where it hits
    #subtract radius (diameter/2) so the edge of the circle collides, not the center
    #==================================================================================
    
    #hits left or right
    if x > width - diameter/2:
        #increase goal counter
        leftgoal += 1
        
        #reset ball to center
        x = 250
        y = 250
    if x < 0 + diameter/2:
        #increase goal counter
        rightgoal += 1   
        
        #reset ball to center
        x = 250
        y = 250        
        
        
    #hits bottom or top
    if y > height - diameter/2 or y < 0 + diameter/2:
        collision("y")

    #hits left paddle    
    if x <= (padlx + padlwidth) + diameter/2 and (y >= padly and y <= padly + padllength):
        collision("x")

    #hits right paddle    
    if x >= padrx - diameter/2 and (y >= padry and y <= padry + padrlength):
        collision("x")                
        
    
    if keyPressed:
        if key == 'a' or key == 'A':
            padly = max(0,padly-20)    
        if key == 'z' or key == 'Z':
            padly = min(height-padllength,padly+20)
            
        if key == 'j' or key == 'J':
            padry = max(0,padry-20)    
        if key == 'm' or key == 'M':
            padry = min(height-padrlength,padry+20)                                           
                                                                     
                                                                                                                                                                                                                
    #clear background to make a moving ball illusion    
    background(255,255,255)
    
    #draw the circle
    circle(x,y,diameter)
    
    #draw left paddle
    rect(padlx,padly,padlwidth,padllength)
    
    #draw right paddle
    rect(padrx,padry,padrwidth,padrlength)    
    
    #draw goal counter text
    #cast int to string so python doesn't yell at you
    textSize(32)
    text(str(leftgoal) + " | " + str(rightgoal), 220, 30)
    
    #increase x & y increments so that the ball actually moves
    x += xinc
    y += yinc
