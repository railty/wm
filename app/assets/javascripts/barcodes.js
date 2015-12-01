function resetInputFile(inputFile) {
  $(inputFile).wrap('<form>').closest('form').get(0).reset();
  $(inputFile).unwrap();
}

function uploadExcel(e, tn, tv){
  var file = e.target.files[0];

  var xhr = new XMLHttpRequest();
  xhr.open("POST", '/barcodes/upload', true);
  xhr.onreadystatechange = function() {
      if (xhr.readyState == 4 && xhr.status == 200) {
          resetInputFile(e.target);
          var result = JSON.parse(xhr.responseText);
          
      }
  };
  var fd = new FormData();
  fd.append(tn, tv);
  fd.append("excel_file", file);
  xhr.send(fd);
}
