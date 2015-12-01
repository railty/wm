class ParseExcel extends React.Component {
  constructor(props) {
    super(props);
    this.state = {
      msg: null,
      importing: false,
      result: null
    };
  }

  import(){
    debugger;
    this.setState({importing: true});

    var xhr = new XMLHttpRequest();
    xhr.open("POST", '/barcodes/import_data', true);
    xhr.onreadystatechange = function() {
        if (xhr.readyState == 4 && xhr.status == 200) {
          debugger;
          var result = JSON.parse(xhr.responseText);
          this.setState({result: result});
        }
    }.bind(this);

    var fd = new FormData();
    fd.append(this.props.tokenName, this.props.token);
    fd.append("itemfile", JSON.stringify(this.state.result));
    xhr.send(fd);
  }

  onChange(e){
    var file = e.target.files[0];
    var fileName = file.name;
    var xhr = new XMLHttpRequest();
    xhr.open("POST", '/barcodes/upload', true);
    xhr.onreadystatechange = function() {
        if (xhr.readyState == 4 && xhr.status == 200) {
            this.resetInputFile(e.target);
            var result = JSON.parse(xhr.responseText);
            this.setState({result: result});
        }
    }.bind(this);

    var fd = new FormData();
    fd.append(this.props.tokenName, this.props.token);
    fd.append("excel_file", file);
    xhr.send(fd);
  }

  resetInputFile(inputFile) {
    $(inputFile).wrap('<form>').closest('form').get(0).reset();
    $(inputFile).unwrap();
  }

  render () {
    var tables = null;
    var button = null;
    if (this.state.result){
      tables = this.state.result.records.map((record, i)=>{
        var ths = record.map((cell, h)=>{
          var key = 'h' + i.toString() + '.' + h.toString();
          return (
            <th key={key}>{cell.name}</th>
          );
        });
        var thead = (<thead><tr>{ths}</tr></thead>);

        var tds = record.map((cell, k)=>{
          var key = 'b' + i.toString() + '.' + k.toString();
          if (cell.message){
            var cls = null;
            if (cell.message.level == 'warning') cls = 'warning';
            if (cell.message.level == 'error') cls = 'danger';
            return (<td key={key} className={cls}  dataToggle="tooltip" dataPlacement="top" title={cell.message.text}>{cell.value}</td>);
          }
          else return (<td key={key}>{cell.value}</td>);
        });
        var tr = (<tr>{tds}</tr>);
        return (
          <table key={i} className="table table-striped table-condensed">
            {thead}
            <tbody>{tr}</tbody>
          </table>
        );
      });

      button = (<button className="btn btn-primary" onClick={this.import.bind(this)}>Import</button>);

    }

    return (
      <div>
        <input type="file" className='form-control' label="please select the excel file" accept="application/vnd.ms-excel" onChange={this.onChange.bind(this)}/>
        {tables}
        {button}
      </div>
    );
  }
}

ParseExcel.propTypes = {
  token_name: React.PropTypes.string,
  token: React.PropTypes.string
};
