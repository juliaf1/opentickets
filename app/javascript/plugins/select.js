import $ from 'jquery';
import 'select2';

const multipleSelect = () => {
  $(document).ready(function(){
    $('.multiple-select').select2();
  })
}

export { multipleSelect };
