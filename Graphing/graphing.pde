size(1000,1000)
    
offx = 500
offy = 500

xmax = 10
ymax = 10

textSize(30)
fill(0,0,0)


#draw axis
line(50,500,950,500)
line(500,50,500,950)  

for i in range(-xmax,xmax+1,1):
    line(offx+i*(900/(2*xmax)),480,offx+i*(900/(2*xmax)),520)   
    print(i)
    text(i, offx+i*(900/(2*xmax))-10, 540)
for i in range(-ymax,ymax+1,1):
    line(480,offy+i*(900/(2*ymax)),520,offy+i*(900/(2*ymax)))   
    print(i)     
    text(i, 520, offy-i*(900/(2*ymax))+10)
    
    
stroke(255,0,0)  
x = -xmax
while x <= xmax:
    y= x*x
    point(offx+x*(900/(2*xmax)),offy-y*(900/(2*ymax)))
    x += 0.01

    
    
    
                                                                      
