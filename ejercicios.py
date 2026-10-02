import random
import sqlite3
from datetime import datetime

from flask import Flask, g, redirect, render_template, request, session, url_for

app = Flask(__name__)
app.secret_key = "cambia-esta-clave"  # necesaria para usar session
DB = "ejercicios.db"
NOMBRES = ["Par o impar", "Tabla de multiplicar", "Adivina el número"]


def get_db():
    if "db" not in g:
        g.db = sqlite3.connect(DB)
        g.db.row_factory = sqlite3.Row
    return g.db


@app.teardown_appcontext
def cerrar_db(error=None):
    db = g.pop("db", None)
    if db is not None:
        db.close()


def init_db():
    with sqlite3.connect(DB) as db:
        db.execute(
            """CREATE TABLE IF NOT EXISTS historial (
                id INTEGER PRIMARY KEY AUTOINCREMENT,
                ejercicio TEXT NOT NULL,
                entrada TEXT NOT NULL,
                resultado TEXT NOT NULL,
                fecha TEXT NOT NULL
            )"""
        )


def guardar(ejercicio, entrada, resultado):
    db = get_db()
    db.execute(
        "INSERT INTO historial (ejercicio, entrada, resultado, fecha) VALUES (?, ?, ?, ?)",
        (ejercicio, str(entrada), resultado, datetime.now().strftime("%Y-%m-%d %H:%M:%S")),
    )
    db.commit()


# Ejercicio 1: par o impar
def par_o_impar(n):
    return f"{n} es par." if n % 2 == 0 else f"{n} es impar."


# Ejercicio 2: tabla de multiplicar
def tabla(n):
    return [f"{n} x {i} = {n * i}" for i in range(1, 11)]


# Ejercicio 3: adivina el número (con función, como el reto extra)
def adivinar(intento):
    if "secreto" not in session:
        session["secreto"] = random.randint(1, 100)
        session["intentos"] = 0
    session["intentos"] += 1
    secreto = session["secreto"]

    if intento < secreto:
        return "El número secreto es mayor."
    if intento > secreto:
        return "El número secreto es menor."

    intentos = session["intentos"]
    session.pop("secreto")
    session.pop("intentos")
    return f"¡Adivinaste! Lo lograste en {intentos} intentos. Se eligió un nuevo número."


@app.route("/", methods=["GET", "POST"])
def index():
    if request.method == "POST":
        ej = request.form.get("ejercicio")
        try:
            n = int(request.form.get("numero", ""))
        except ValueError:
            session["resultado"] = {"ej": ej, "texto": "Escribe un número entero válido.", "lineas": []}
            return redirect(url_for("index") + "#ej" + str(ej))

        if ej == "1":
            texto = par_o_impar(n)
            guardar("Par o impar", n, texto)
            session["resultado"] = {"ej": "1", "texto": texto, "lineas": []}
        elif ej == "2":
            lineas = tabla(n)
            guardar("Tabla de multiplicar", n, "; ".join(lineas))
            session["resultado"] = {"ej": "2", "texto": "", "lineas": lineas}
        elif ej == "3":
            texto = adivinar(n)
            guardar("Adivina el número", n, texto)
            session["resultado"] = {"ej": "3", "texto": texto, "lineas": []}
        return redirect(url_for("index") + "#ej" + str(ej))

    resultado = session.pop("resultado", None)
    historial = get_db().execute(
        "SELECT * FROM historial ORDER BY id DESC LIMIT 10"
    ).fetchall()
    return render_template("index.html", resultado=resultado, historial=historial)


init_db()

if __name__ == "__main__":
    app.run(debug=True)