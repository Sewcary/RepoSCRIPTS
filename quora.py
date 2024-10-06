import pyautogui
import time
import sys
import pyperclip
from pynput import keyboard

stop_script = False

def on_press(key):
    global stop_script
    if key == keyboard.Key.ctrl_l:
        stop_script = True

def on_release(key):
    global stop_script
    if key == keyboard.Key.ctrl_l:
        stop_script = False
text = """Pourquoi certains endroits en Antarctique sont-ils interdits d'exploration ?
Y a-t-il des preuves ou des rumeurs concernant une relation entre Sandrine Rousseau et Alice Coffin ?
Quelles sont les dernières découvertes scientifiques qui vous ont surpris ?
Quels sont les signes révélateurs d'une arnaque Bitcoin sur Telegram ?
Comment peut-on différencier les crypto-monnaies légitimes des fraudes ?
Quelles sont les précautions à prendre avant d'investir dans les crypto-monnaies ?
Pourquoi les êtres humains sont-ils attirés par les mystères et les phénomènes paranormaux ?
Comment peut-on construire un monde plus équitable et durable pour les générations futures ?
Quels sont les avantages et les inconvénients du développement de la fusion nucléaire ?
Comment l'art peut-il être utilisé pour stimuler la créativité et l'imagination ?
Comment les technologies émergentes pourraient-elles aider à résoudre les problèmes de la faim dans le monde ?
Quels sont les avantages et les inconvénients de l'utilisation de la réalité virtuelle pour l'enseignement et la formation professionnelle ?
Comment prendre des photos professionnelles pour des produits à vendre en ligne ?""
listener = keyboard.Listener(on_press=on_press, on_release=on_release)
listener.start()

questions = text.split('\n')


stop_script = False

for q in questions:
    if stop_script:
        break
    try:
        screen_width, screen_height = pyautogui.size()  
        pyautogui.press('f5')
        time.sleep(3)
        pyautogui.moveTo(3280,  218 , duration=2)   #AJoute    
        pyautogui.click()
        
        pyautogui.moveTo(2533,  595 , duration=2)#Zoone de texte
        # pyautogui.click()
        pyperclip.copy(q)
        pyautogui.hotkey('ctrl', 'v') 
        
        pyautogui.moveTo(3138,  828 , duration=2) #ajoute bleu
        pyautogui.click()
        
        pyautogui.moveTo(3123, 965 , duration=5) # Sujet terminer
        pyautogui.click()

        pyautogui.moveTo(2962,  670 , duration=0.5) # continuer sans modif les sujets 
        pyautogui.click()

        pyautogui.moveTo(3162,  935 , duration=2)  # Terminer
        pyautogui.click()
        with open('logquora.txt','a') as f :    
            f.write(q + '\n')
    except KeyboardInterrupt:
        print("Le script a été interrompu.")
        sys.exit()

listener.stop()