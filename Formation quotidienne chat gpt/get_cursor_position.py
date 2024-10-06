import ctypes

def get_cursor_position():
    """Renvoie les coordonnées x et y de la position du curseur"""
    point = ctypes.wintypes.POINT()
    ctypes.windll.user32.GetCursorPos(ctypes.byref(point))
    return point.x, point.y

while True:
    x, y = get_cursor_position()
    print(f"Position actuelle du curseur : x={x}, y={y}")