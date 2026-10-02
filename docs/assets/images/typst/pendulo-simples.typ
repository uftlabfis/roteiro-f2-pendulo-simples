// Bibliotecas importadas
#import "@preview/cetz:0.4.2" // Desenho vetorial
#import "@preview/cetz-plot:0.1.3": plot, chart
#import "@preview/inknertia:0.1.0": newtonian
#import newtonian: *


#set page(width: auto, height: auto, margin: 5pt) 
#set text(lang: "pt", region: "BR", size: 12pt, font: "Arial")
// Use margin para dar um respiro, se desejar

// 🎨 Definição de Cores
#let uft-green = rgb("#008577")
#let uft-blue = rgb("#004A80")
#let uft-yellow = rgb("#FDB913")
#let uft-gray = rgb("#666666")
#let primary-color = uft-blue
#let secondary-color = uft-green

#let g = 10;
#let m = 0.03;
#let r = 1;
#let v = 0.5;
#let th = 30deg;

#let P = m*g;
#let P_r = P * calc.sin(th);
#let P_t = P * calc.cos(th);
#let T = P_t  + m * calc.pow(v, 2) / 2;

#let x_0 = r*calc.cos(270deg + th);
#let y_0 = r*calc.sin(270deg + th);


#cetz.canvas(length: 6cm, {
  import cetz.draw: *

  // Suporte
  wall(((-r/3, 0), (r/3, 0), (r/3, r/10), (-r/3, r/10)), stroke-style: 1pt + black, sides: (0,))

  rect((-0.8*r, r/10), (0.8*r, -1.3*r), stroke: none)

  arc((0, -r/4), radius: r/4, start: 270deg, delta: th, mode: "PIE", stroke: none, fill: uft-gray.lighten(80%))
  content((0, -r/5), [$theta$], anchor: "north-west", padding: 0.055)

  arc((x_0, y_0 - r/8), radius: r/8, start: 270deg, delta: th, mode: "PIE", stroke: none, fill: uft-gray.lighten(70%))
  content((x_0, y_0 - r/6), [$theta$], anchor: "west", padding: 0.02)

  arc((-x_0, y_0), radius: r, start: 270deg - th, delta: 2*th, stroke: (dash: "dashed", paint: uft-gray, thickness: 1pt))


  line((0,0), (-x_0, y_0), stroke: (dash: "dashed", paint: uft-gray, thickness: 1pt))
  circle((-x_0, y_0), radius: r/20, stroke: (dash: "dashed", paint: uft-gray), fill: uft-gray.lighten(75%))

  line((0, 0), (0, -r), stroke: (dash: "dashed", paint: uft-gray))
  circle((0, -r), radius: r/20, stroke: (dash: "dashed", paint: uft-gray), fill: uft-gray.lighten(75%))

  line((0,0), (x_0, y_0), stroke: 1.5pt+uft-blue, name: "fio")
  content("fio", [$l$], anchor: "west", padding: 0.03)
  circle("fio.end", radius: r/20, stroke: 1.5pt+uft-blue, fill: uft-blue.lighten(50%))


  line((x_0, y_0), (x_0, y_0 - P), stroke: 1.5pt, mark: (end: "stealth", fill: black), name: "peso")
  content("peso.end", [$arrow(P)$], anchor: "north", padding: 0.04)

  line((x_0, y_0), (x_0 - P_r * calc.cos(th), y_0 - P_r * calc.sin(th)), stroke: 1.5pt, mark: (end: "stealth", fill: black), name: "peso_r")
  content("peso_r.end", [$arrow(P)_perp$], anchor: "south", padding: 0.04)

  line((x_0, y_0), (x_0 + P_t * calc.sin(th), y_0 - P_t * calc.cos(th)), stroke: 1.5pt, mark: (end: "stealth", fill: black), name: "peso_t")
  content("peso_t.end", [$arrow(P)_parallel$], anchor: "south-west", padding: 0.01)

  line((x_0, y_0), (x_0 - T * calc.sin(th), y_0 + T * calc.cos(th)), stroke: 1.5pt, mark: (end: "stealth", fill: black), name: "tensao")
  content("tensao.end", [$arrow(T)$], anchor: "south-west", padding: 0.01)

  line(("peso_r.end"), ("peso.end"), ("peso_t.end"), stroke: (dash: "dashed", paint: uft-gray, thickness: 1pt))










  



  



})
