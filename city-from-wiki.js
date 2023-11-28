const list = [];
document
  .querySelectorAll(".wikitable")
  .forEach((table) =>
    table
      .querySelectorAll("td:first-child a")
      .forEach((row) => list.push(row.text))
  );
console.log(list);
