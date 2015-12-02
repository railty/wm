class Upload extends React.Component {
  constructor(props) {
    super(props);
    this.state = {
      msg: null,
      uploading: false,
      records: null
    };
  }
  upload(){
    this.setState({uploading: true});

    var xhr = new XMLHttpRequest();
    xhr.open("POST", '/barcodes/import.json', true);
    xhr.onreadystatechange = function() {
        if (xhr.readyState == 4 && xhr.status == 200) {
          var data = JSON.parse(xhr.responseText);
          var msg = 'itemfile created: ' + data.created + ', updated: ' + data.updated;
          this.setState({msg: msg, uploading: false});
        }
    }.bind(this);

    var fd = new FormData();
    fd.append(this.props.tokenName, this.props.token);
    fd.append("records", JSON.stringify(this.state.records));
    xhr.send(fd);
  }

  uploadByAjax(){
    this.setState({uploading: true});
    $.ajax({
      url: '/barcodes/import.json',
      type: "POST",
      accepts: "application/json",
      data: {records: this.state.records},
      success: function(data) {
        var msg = 'itemfile created: ' + data.created + ', updated: ' + data.updated;
        this.setState({msg: msg, uploading: false});
      }.bind(this),
      error: function(xhr, status, err) {
        var data = JSON.parse(xhr.responseJSON.msg);
        this.state.items[data.n].error = data.error;
        this.setState({items: this.state.items, msg:data.error, uploading: false});
      }.bind(this)
    });
  }

  onChange(e){
    var f = e.target.files[0];
    var reader = new FileReader();
    var fileName = f.name;
    reader.onload = function(e) {
      var data = e.target.result;
      var workbook = XLSX.read(data, {type: 'binary', cellDates: true});

      var sheetName = workbook.SheetNames[0];
      var firstDataRow, headerRow;

      if (sheetName == 'Input Sheet'){
        firstDataRow = 3;
        headerRow = 1;
      }else {
        firstDataRow = 1;
        headerRow = 0;
      }

      var inputSheet = workbook.Sheets[sheetName];
      var range = inputSheet['!ref'].split(':');
      var firstCell = XLSX.utils.decode_cell(range[0]);
      var lastCell = XLSX.utils.decode_cell(range[1]);
      var records = [];
      for(var r = firstDataRow; r <= lastCell.r; r++) {
        var items = [];
        for(var c = firstCell.c; c <= lastCell.c; c++) {
          var nameCell = XLSX.utils.encode_cell({c:c, r:headerRow});
          var name = inputSheet[nameCell];

          if (name){
            var valueCell = XLSX.utils.encode_cell({c:c, r:r});
            var value = inputSheet[valueCell];

            var text = '';  //for value is null
            if (value){
              text = value.w;
              //seems to be a bug in xlsx js,
              //the excel spec says that imft = 0eh means should display as m/d/yy, which is exactly js-xlsx does
              //however, both excel and libreoffice display it as mm/dd/yyyy
              if (value.t == 'n' && (value.XF) && (value.XF.ifmt)){
                if ((value.XF.ifmt == 14)||(value.XF.ifmt == 186)){
                  //string manupulation or
                  text = value.w.replace(/(\d+)\/(\d+)\/(\d+)/, '20$3-$1-$2')
                  //parse date and re-format
                  //value = new Date(Date.parse(value.w)).toISOString().slice(0,10).replace(/-/g,"/");
                }
              }
            }

            if ((name.v=='Item Effective Date' || name.v=='Item Expiration Date')&&(text.length==8)){
              text = text.replace(/(\d+)\/(\d+)\/(\d+)/, '20$3-$1-$2');
            }
            items.push({n:name.v, v:text});
          }
        }
        records.push(items);
      }
      this.setState({records: records});
    }.bind(this);
    reader.readAsBinaryString(f);
  }

  render () {
    var table = null;
    var button = null;
    if (this.state.records){
      var ths = this.state.records[0].map((item, c)=>{
        return(
          <th key={'h'+c}>{item.n}</th>
        );
      });
      var trs = this.state.records.map((items, r)=>{
        var tds = items.map((item, c)=>{
          var k = r + '.' + c;
          return(
            <td key={k}>{item.v}</td>
          );
        });

        return (
          <tr key={r}>
            {tds}
          </tr>
        );
      });

      table = (
        <table className="table table-striped table-condensed"><tbody>
          <tr>{ths}</tr>
          {trs}
        </tbody></table>
      );

      if (this.state.uploading)
        button = (<button className="btn btn-primary" disabled="disabled">Uploading</button>);
      else
        button = (<button className="btn btn-primary" onClick={this.upload.bind(this)}>Upload</button>);

      var alert = this.state.msg ? <div className="alert alert-danger" role="alert">{this.state.msg}</div> : null;
    }

    return (
      <div>
        <input type="file" className='form-control' label="please select the excel file" accept="application/vnd.ms-excel" onChange={this.onChange.bind(this)}/>
        {button}
        {alert}
        {table}
      </div>
    );
  }
}

Upload.propTypes = {
  label: React.PropTypes.string
};
