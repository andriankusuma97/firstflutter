

class Car {
    // Define properties (optional with types)
    model: string;
    year: number;
  
    // Constructor (optional with parameters)
    constructor(model: string, year: number) {
      this.model = model;
      this.year = year;
    }
  
    // Methods (functions within the class)
    getDetails(): string {
      return `This car is a ${this.model} from ${this.year}.`;
    }
  }
  
  // Create an instance of the Car class
  const myCars = new Car("Honda Civic", 2023);
  
  // Access and print properties
  console.log("Car model:", myCar.model);  // Output: Car model: Honda Civic
  
  // Call a method within the class
  console.log(myCar.getDetails());  // Output: This car is a Honda Civic from 2023.
  