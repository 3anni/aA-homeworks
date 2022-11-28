

document.addEventListener("DOMContentLoaded", function(){
  const canvas = document.getElementById("mycanvas");
  canvas.width = 500;
  canvas.height = 500;

  const c = canvas.getContext("2d");

  c.fillStyle = "red";
  c.fillRect(100, 100, 300, 300);

  c.beginPath();
  c.arc(250,250,80,0,2 * Math.PI,true);
  c.strokeStyle = "white";
  c.lineWidth = 20;
  c.stroke();
  c.fillStyle = "blue";
  c.fill();


});


