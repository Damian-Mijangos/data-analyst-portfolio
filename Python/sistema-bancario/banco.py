import os
class Persona:
  
  def __init__(self, nombre, apellido):
    self.nombre = nombre
    self.apellido = apellido

class Cliente(Persona):
  
  def __init__(self,nombre, apellido, numero_cuenta, balance = 0):
    super().__init__(nombre, apellido)
    self.numero_cuenta = numero_cuenta
    self.balance = balance

  def __str__(self):
    # imprime su balance
    return f"\nCliente: {self.nombre} {self.apellido}\nBalance de cuenta {self.numero_cuenta}: ${self.balance}"
  
  def depositar(self, monto_deposito):
    self.balance += monto_deposito
    print(f"Deposito realizado")
  
  def retirar(self, monto_retiro):
    if self.balance >= monto_retiro:
      self.balance -= monto_retiro
      print(f"Retiro realizado")
    else:
      print(f"No tienes suficiente saldo para realizar el retiro")


def crear_cliente():
  nombre_cliente = input("Nombre: ")
  apellido_cliente = input("Apellido: ")
  numero_cuenta = int(input("Numero de cuenta: "))
  cliente = Cliente(nombre_cliente, apellido_cliente, numero_cuenta)
  return cliente

def inicio():
  os.system("cls")
  mi_cliente = crear_cliente()
  os.system("cls")
  print(mi_cliente)
  opcion = 0
  
  while opcion!= 3:
    print("""
    [1] Depositar
    [2] Retirar
    [3] Salir
    """)
    opcion = int(input())

    if opcion == 1:
      monto_deposito = int(input("\nMonto a depositar: "))
      os.system("cls")
      mi_cliente.depositar(monto_deposito)
    elif opcion == 2:
      monto_retiro = int(input("\nMonto a retirar: "))
      os.system("cls")
      mi_cliente.retirar(monto_retiro)
    print(mi_cliente)
  
  os.system("cls")
  print("Gracias por operar en Banco Python")

inicio()