# flutter_quizzler

A new Flutter project.

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.

----

# Basic OOP Concepts Dart
## Class example
```
class Car
{
void drive(){
  print("Turn Car");
  }
}
void main()
{
Car myCar = Car(); //object created myCar
myCar.drive();
}
```
## Encapsulation
- Making the class properties as private using " _ " (Underscore).
Example
```
class Car
{
void _fuel() //encalsulated
  {
  print("Low Fuel");
  }
  void fuelLevel()  //getter/setter to use private property
  {
   return _fuel();
    
  }
}
void main()
{
Car myCar = Car();
myCar.fuelLevel();
}
```
## Inheritance
- We have to use ```extends``` kyeword for inheritating class.
- Syntax ```class Selfdrivingcar extends Car```
- Example
```
class Car //Old class
{
  void drive(){
    print("Turn Car");
  }
}

class SelfDrivingCar extends Car // New class interitated with Old
{
  void fuel(){
   print("Low Fuel"); 
     
  }
}

void main(){
  SelfDrivingCar selfCar = SelfDrivingCar();
  selfCar.drive();  
  selfCar.fuel(); //can use old Car class also after inheritance
}
```


## Polymorphism
- It is used to override more property to same type of class function
- It uses ```@override``` keyword and to used parent class method its syntax is ```super.YourFunctionName()```.
- Example

```
class Car //Old class
{
  void drive(){
    print("Turn Car");
  }
}

class SelfDrivingCar extends Car // New class interitated with Old
{
  @override   //annotation for overridden from to generic methon derived from parent class
  void drive(){
   print("Automic Drive");  //new drive set for SelfDriveCar
    super.drive();  //Old - Class Car, void drive() used 
  }
}

void main(){
  SelfDrivingCar selfCar = SelfDrivingCar();
  selfCar.drive();  
}
```

## 

