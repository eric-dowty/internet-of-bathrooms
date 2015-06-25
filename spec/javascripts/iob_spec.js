describe("IoB Javascript", function() {

  it("works", function() {
    expect(true).toBe(true);
    expect(jQuery).toBeDefined();
  });

  it("returns a new row", function() {
    var user = {name: "eric", points: 100}
    var row = newRow(user)
    expect(row).toEqual("<tr><td class='names-column'>eric</td><td align='right' class='points-column'>100</td></tr>") 
  });

  it("returns a bot message", function() {
    var message = bathroomMessage()
    console.log(message.class)
  });

  it("returns bathroom statuses", function() {
    var statuses = {bathroom1: 1, bathroom2: 0, bathroom3: 1}
    var updates = updateStatus(statuses)
    console.log(updates)
  });

});

