# Flutter Quizzler 
##### A new Flutter project.
---
# Basics of OOP Concepts Dart
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

