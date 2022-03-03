#num of squares per row
num=25
#grid size
gs = 760/num
#gs * num has to be 760

#player start position
x = 5
y = 6

#score counter
score = 0

#fps counter
fps = 10

#if player has already moved since the game has begun
#useful for score counter for example
alreadymoved = False

#length of the tail at start
#value is one higher than the actual tail length
taillength = 5

#used so that you don't have to press the move button for each square,
#instead you "toggle" move modes

#possible values:
#UP DOWN LEFT RIGHT

#set in the keyPressed() method which is outside of draw (unaffected by FPS)
#used in the draw() method to move the player
movetype = ""

#create field array and fill with 0

#0 = empty
#1 = player (head)
#2 = apple

#does not draw them, will be drawn separately in drawfield()
field=[[0 for i in range(num)] for j in range(num)]
#set initial player location to 1 to set it as a player
field[x][y] = 1
#create 10 random apple positions
for i in range(10):
    field[int(random(2,num-1))][int(random(2,num-1))] = 2    

#tail array
#similar logic to field arrau
tail=[[x,y]]

def drawfield():
    for i in range(num):
        #draw the lines for the field
        line(num+i*gs,num,num+i*gs,height-num)
        line(num,num+i*gs,width-num,num+i*gs)        
        
    #draw text at the top
    textSize(32)
    fill(255,255,255)
    text("Score: " + str(score) + "    FPS: " + str(fps) + "    Tail Length: " + str(taillength-1), 15,30)
   
#happens when the game is over, called in various places in draw()             
def gameover():
    #set color to red
    fill(255,0,0)
    #stop the draw() loop from executing
    noLoop()
    print("Game over!")
    textSize(100)
    text("Game Over!", 150,420)
    
    # color the last square black
    fill(0,0,0)
    rect(num+gs*(x-1),num+gs*(y-1),gs,gs)

def setup():
    size(840,840)
    frameRate(fps)
    
def draw():
    global x
    global y
    global field,tail
    
    global alreadymoved
    
    global score
    global fps
    
    global taillength
        
    #erase screen each frame
    background(128,128,128)
    
    #draw field lines
    drawfield()
    
    for i in range(num):
        for j in range(num):
            if(field[i][j]==1):
                # draw player
                fill(255,255,255)
                rect(num+gs*(i-1),num+gs*(j-1),gs,gs)
            if(field[i][j]==2):    
                #draw apple
                fill(255,0,0)
                rect(num+gs*(i-1),num+gs*(j-1),gs,gs) 
    
    #set current position to 0
    #field[x][y] = 0
    #move player
    if movetype == "UP":
        y -= 1  
        alreadymoved = True  
    if movetype == "DOWN":
        y += 1
        alreadymoved = True
    if movetype == "LEFT":
        x -= 1   
        alreadymoved = True 
    if movetype == "RIGHT":
        x += 1 
        alreadymoved = True 
    
    #hits top or left side -- end
    if x <= 1 or y <= 1:
        gameover()
    
    #hits bottom or right side -- end
    if x >= num-1 or y >= num-1:
        gameover()
        
    #hits own tail
    if field[x][y] == 1 and alreadymoved == True and keyPressed == False:
        gameover()
    
    #add to tail
    if x != tail[0][0] or y != tail[0][1]:
        tail.append([x,y])
    #limit tail length
    if len(tail) >= taillength:
        field[tail[0][0]][tail[0][1]] = 0
        tail.pop(0)
            

    x = constrain(x,0,num-1)
    y = constrain(y,0,num-1)
    
    #hits apple -- create new apple
    if field[x][y]==2:
        #set current position to 1 as player is on that position
        field[x][y]=1
        #create new apple
        field[int(random(2,num-1))][int(random(2,num-1))] = 2
        
        #score += 100
        taillength += 1
    
    #set new position to 1 = player
    field[x][y]=1
    if alreadymoved == True:
        score += 1
        
    fps = 10 + int(score/30)
    frameRate(fps)
    
                                                       
def keyPressed():
    global x
    global y
    global movetype
    if key == CODED:
        if keyCode == UP:
            if movetype != "DOWN":
                movetype = "UP" 
        if keyCode == DOWN:
            if movetype != "UP":
                movetype = "DOWN"
        if keyCode == RIGHT:
            if movetype != "LEFT":
                movetype = "RIGHT"
        if keyCode == LEFT:
            if movetype != "RIGHT":
                movetype = "LEFT"    
      
    #check for opposite movement so you don't hit yourself    
    if key == "w":
        if movetype != "DOWN":
            movetype = "UP"    
    if key == "s":
        if movetype != "UP":
            movetype = "DOWN"
    if key == "d":
        if movetype != "LEFT":
            movetype = "RIGHT"
    if key == "a":
        if movetype != "RIGHT":
            movetype = "LEFT"                                            
