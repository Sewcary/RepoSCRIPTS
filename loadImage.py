                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                       #!/usr/bin/python

from PIL import Image, ImageTk
from tkinter import Tk
from tkinter.ttk import Frame, Label
import sys

class Example(Frame):
  
    def __init__(self):
        super().__init__()   
         
        # self.loadImage() 
        self.initUI()
        
        
    def loadImage(self):
        try:
            self.img = Image.open("1.gif")

        except IOError:
            print("Unable to load image")
            sys.exit(1)
        
    
    def initUI(self):
      
        # self.master.title("Label")
        
        # tatras = ImageTk.PhotoImage(self.img)
        # label = Label(self, image=tatras)
        
        # # reference must be stored
        # label.image = tatras
        
        # label.pack()
        self.pack()
        
        
    def setGeometry(self):
      
        # w, h = self.img.size
        # self.master.geometry(("%dx%d+300+300") % (w, h))
        self.master.geometry("452x125")

def main():
  
    root = Tk()
    ex = Example()
    # ex.setGeometry()
    root.mainloop()  


if __name__ == '__main__':
    main()  