size(1000,1000)
point(500,500)
    
radius = 400

offx = 500
offy = 500

#bottom right
for x in range(0,radius):
    y = sqrt(radius*radius-x*x)
    xdraw = x + offx
    ydraw = y + offy
    print(xdraw,ydraw)
    point(xdraw,ydraw)
    
#top right    
for x in range(0,radius):
    y = -sqrt(radius*radius-x*x)
    xdraw = x + offx
    ydraw = y + offy
    print(xdraw,ydraw)
    point(xdraw,ydraw)

#top left    
for x in range(0,-radius,-1):
    y = -sqrt(radius*radius-x*x)
    xdraw = x + offx
    ydraw = y + offy
    print(xdraw,ydraw)
    point(xdraw,ydraw)
    
#bottom left    
for x in range(0,-radius,-1):
    y = sqrt(radius*radius-x*x)
    xdraw = x + offx
    ydraw = y + offy
    print(xdraw,ydraw)
    point(xdraw,ydraw)                                        
