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
    this.color = 'floralwhite';
  }
  paint(cell) {
    $(cell).css('background-color', this.color);
    console.log("HI");
  }
};

createPatternGrid = (pattern) => {
  console.log(pattern.length);
  // "<div class="cell">
  // </div>"
}

class Pattern {
  constructor(object){
    this.names = Object.keys(object);
  }

}

$(document).ready(function() {
  brush  = new Paintbrush();
  $('.paint').on('click', (e) => {
    let id = $(e.currentTarget).attr('id');
    let selectedColor = colors[id];
    brush.color = selectedColor;
  });

  $(".cell").on('mouseover', (e) => {
    brush.paint(e.currentTarget);
  });

  $('.template-button').one('click', (e) => {
    $.ajax({
      method: "GET",
      url: '/templates'
    }).done((response) => {
    const patterns = new Pattern(response);
    patterns.names.forEach((name) => {
      let newButton = $(`<button class="single-template-button" value="${name}">${name}</button>`);
      newButton.appendTo($('.template-loader'));
    })
  })
  })

  $('.template-loader').on('click', '.single-template-button', (e) => {
    const val = $(e.currentTarget).val()
    $.ajax({
      method: "GET",
      url: `/templates/${val}`
    }).done((response) => {
      createPatternGrid(response);
    })
  })
});
