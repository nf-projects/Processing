# starting points
x = 250
y = 300

diameter = 50

# starting velocity: increments by which to increase x/y values per draw()
xinc = 15
yinc = 25

# gravity constant: each frame: add to y 
ygrav = 5

# ball material resistance: energy loss if ball collides
matres = 0.95 #5% loss = very bouncy                           
                  
def setup():
    #size of popup window
    size(500,500)
    
    #framerate; speed of the circle - framerate * increments
    frameRate(30)
    
    #set the color of the circle fill
    fill(255,255,100)

def draw():
    #called once every frame, forever
    
    #declare variables as global not local
    
    global x
    global y

    global diameter
   
    global xinc
    global yinc
    global ygrav
    global matres
    
    #==================================================================================
    #change x & y increments (direction of the circle) depending on where it hits
    #subtract radius (diameter/2) so the edge of the circle collides, not the center
    #==================================================================================
    
    #hits right
    if x > width - diameter/2:
        xinc *= -1
        xinc *= matres
        yinc *= matres
        x = width - diameter/2
        
    #hits left
    if x < 0 + diameter/2:
        xinc *= -1
        xinc *= matres
        yinc *= matres
        x = 0 + diameter/2
        
        
    #hits bottom
    if y > height - diameter/2:
        yinc *= -1
        yinc *= matres
        xinc *= matres
        y = height - diameter/2
        
    #hits top        
    if y < 0 + diameter/2:
        yinc *= -1
        yinc *= matres
        xinc *= matres
        y = 0 + diameter/2
    
    ytemp = x/2
    if y > 300 and x > 300:
        xinc *= -1
        yinc *= -1
        xinc *= matres
        yinc *= matres
        #x = width - diameter/2
    
    
    #clear background to make a moving ball illusion    
    background(255,255,255)
    
    #draw the circle
    circle(x,y,diameter)
    
    #draw the rectangle
    quad(300,500,500,250,750,350,350,750)    
    
    #gravity impact
    yinc += ygrav    

        
    #increase x & y increments so that the ball actually moves
    x += xinc
    y += yinc
    
    #print(y,yinc,x,xinc)
