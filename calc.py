# calc.py

def add(a, b):
    try:
        result = int(a) + int(b)  # Chuyển a và b sang số và tính tổng
        return result
    except ValueError:
        return "Error: Invalid input"
