export function qS(query, node = document) {
  return node.querySelector(query);
}

export function qSA(query, node = document) {
  return node.querySelectorAll(query);
}

export function byId(id) {
  return document.getElementById(id);
}