const colors = {
  p1: "indigo",
  p2: "olivedrab",
  p3: "powderblue",
  p4: "salmon",
  p5: "peru",
  p6: "mediumvioletred"
}


class Paintbrush {
  constructor() {
    this.color = 'lightgrey';
  }
  paint(cell) {
    $(cell).css('background-color', this.color);
    console.log("HI");
  }
};

$(document).ready(function() {
  brush  = new Paintbrush();
  $('.paint').on('click', (e) => {
    let id = $(e.currentTarget).attr('id');
    let selectedColor = colors[id];
    brush.color = selectedColor;
  })
  $(".cell").on('mouseover', (e) => {
    brush.paint(e.currentTarget);
  })
});
