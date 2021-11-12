function finalizingForm() {

  let quantityOfBags = document.getElementById("quantityOfBags");
  if (quantityOfBags.value === '1') {
    document.getElementById("finalQuantity").innerText = quantityOfBags.value + ' worek darów';
  }else if (quantityOfBags.value === '2'
      || quantityOfBags.value === '3'
      || quantityOfBags.value === '4'
  ){
    document.getElementById("finalQuantity").innerText = quantityOfBags.value + ' worki darów';
  } else {
    document.getElementById("finalQuantity").innerText = quantityOfBags.value + ' worków darów';
  }

  let institutions = document.querySelectorAll('input[name="institution"]');
  let selected;
  for (const item of institutions){
    if (item.checked){
      selected = item.value;
      break;
    }
  }
  let selectedInstitution = document.getElementById("selected" + selected);
  document.getElementById("institutionName").innerText = selectedInstitution.innerText;

  let street = document.getElementById("formStreet");
  document.getElementById("liStreet").innerText = street.value;

  let city = document.getElementById("formCity");
  document.getElementById("liCity").innerText = city.value;

  let postCode = document.getElementById("formPostCode");
  document.getElementById("liPostCode").innerText = postCode.value;

  let phone = document.getElementById("formPhone");
  document.getElementById("liPhone").innerText = phone.value;

  let data = document.getElementById("formDate");
  document.getElementById("liData").innerText = data.value;

  let time = document.getElementById("formTime");
  document.getElementById("liTime").innerText = time.value;

  let comment = document.getElementById("formPickUpComment");
  if (comment.value === ''){
    document.getElementById('liComment').innerText = 'Brak uwag'
  } else {
    document.getElementById("liComment").innerText = comment.value;
  }

}