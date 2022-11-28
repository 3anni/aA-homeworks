
// /********************  SCOPING 101 ********************/

// function mysteryScoping1() {
//   var x = 'out of block';
//   if (true) {
//     var x = 'in block';
//     console.log(x);
//   }
//   console.log(x);
// }
// // mysteryScoping1();

// function mysteryScoping2() {
//   const x = 'out of block';
//   if (true) {
//     const x = 'in block';
//     console.log(x);
//   }
//   console.log(x);
// }
// // mysteryScoping2();

// function mysteryScoping3() {
//   const x = 'out of block';
//   if (true) {
//     var x = 'in block';
//     console.log(x);
//   }
//   console.log(x);
// }
// // mysteryScoping3();

// function mysteryScoping4() {
//   let x = 'out of block';
//   if (true) {
//     let x = 'in block';
//     console.log(x);
//   }
//   console.log(x);
// }
// // mysteryScoping4();

// function mysteryScoping5() {
//   let x = 'out of block';
//   if (true) {
//     let x = 'in block';
//     console.log(x);
//   }
//   let x = 'out of block again';
//   console.log(x);
// }
// // mysteryScoping5();


function madLib(verb, adj, noun) {
  return `We shall ${verb.toUpperCase()} the ${adj.toUpperCase()} ${noun.toUpperCase()}.`
}
// console.log(madLib('make', 'best', 'guac')); // "We shall MAKE the BEST GUAC."


function isSubstring(searchString, subString) {
  return searchString.includes(subString);
}
// console.log(isSubstring("time to program", "time"));
// //true
// console.log(isSubstring("Jump for joy", "joys"));
// // false


function fizzBuzz(array) {
  array.reduce((fizz, ele) => {
    // let [div_by_3, div_by_5] = [+ (ele % 3 === 0),+ (ele % 3 === 0)];
    let div_by_3 = (ele % 3 === 0) ? 1 : 0;
    let div_by_5 = (ele % 5 === 0) ? 1 : 0;
    if (div_by_3 + div_by_5 === 0) fizz.push(ele);
    return fizz;
  },[])
}
// let sum = arr.reduce((pv, cv) => pv + cv, 0);
// arr = [1,2,3,4,5,6,7,8,9,10,11,12];
// console.log(fizzBuzz(arr));


function isPrime(num) {
  if (num < 2) return false;
  for(let i = 2; i < num; i++) {
    if (num % i === 0) return false;
  }
  return true;
}
// console.log(isPrime(2));
// //true
// console.log(isPrime(10));
// //false

// console.log(isPrime(15485863));
// //true
// console.log(isPrime(3548563));
//false


function sumOfNPrimes(n) {
  if (n < 1) return 0;
  primes = [];
  let i = 2;

  while (primes.length < n) {
    if (isPrime(i)) primes.push(i);
    i++;
  }

  return primes.reduce((acc, el) => el + acc);
}
console.log(sumOfNPrimes(0));
 //0
console.log(sumOfNPrimes(1));
//2
console.log(sumOfNPrimes(4));
//17

