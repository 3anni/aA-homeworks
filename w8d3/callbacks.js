
// const cb = function() {
//   alert('HAMMERTIME');
// }
// const myTimeout = setTimeout(cb, 5000);

// function hammerTime(time) {
//   setTimeout(() => {
//     alert(`${time} is hammertime!`);
//   }, time)
// }

// hammerTime(3000);


const readline = require('readline');

const reader = readline.createInterface({
  input: process.stdin,
  output: process.stdout
});

// 1. Ask the user if they'd like tea.
// 2. console.log their response.
// 3. Ask the user if they'd like biscuits.
// 4. console.log their complete response: So you ${ firstAns } want tea and you ${ secondAns } want coffee.
// 5. Close the reader.
// reader.question('')

function teaAndBiscuits () {
  // let first, second;

  reader.question('Would you like some tea?', function (res) {
    console.log(`You replied ${res}.`);
    reader.question('Would you like some biscuits?', function (res2) {
      console.log(`You replied ${res2}.`);

      const first = (res === 'yes') ? 'do' : 'don\'t';
      const second = (res2 === 'yes') ? 'do' : 'don\'t';

      console.log(`So you ${first} want tea and you ${second} want biscuits.`);
      reader.close();
    });
  });
}




