import csv
import os
import sqlite3

# Trabaja siempre en la carpeta donde está este archivo
carpeta = os.path.dirname(os.path.abspath(__file__))
ruta_db = os.path.join(carpeta, "ejercicios.db")

if not os.path.exists(ruta_db):
    print("No se encontró ejercicios.db. Corre primero la app y resuelve algunos ejercicios.")
    raise SystemExit

con = sqlite3.connect(ruta_db)

# 1. Exportar a SQL (estructura + datos)
with open(os.path.join(carpeta, "database.sql"), "w", encoding="utf-8") as f:
    for linea in con.iterdump():
        f.write(linea + "\n")

# 2. Exportar a CSV (se ve como tabla en GitHub)
cursor = con.execute("SELECT * FROM historial")
with open(os.path.join(carpeta, "historial.csv"), "w", newline="", encoding="utf-8") as f:
    escritor = csv.writer(f)
    escritor.writerow([col[0] for col in cursor.description])
    escritor.writerows(cursor.fetchall())

con.close()
print("Listo: se crearon database.sql e historial.csv")