// Use this to customize the wymeditor boot process
// Just mirror the options specified in boot_wym.js with the new options here.
// This will completely override anything specified in boot_wym.js for that key.
// e.g. skin: 'something_else'
var custom_wymeditor_boot_options = {
	classesItems: [
    {name: 'text-align', rules:[
			{name: 'left', title: '{Left}'}
			, {name: 'center', title: '{Center}'}, {name: 'right', title: '{Right}'}
			, {name: 'justify', title: '{Justify}'}
		], join: '-', title: '{Text_Align}'}
    , {name: 'image-align', rules:[
				{name: 'left', title: '{Left}'}
				, {name: 'right', title: '{Right}'}
		], join: '-', title: '{Image_Align}'}
    , {name: 'font-size', rules:[
				{name: 'small', title: '{Small}'}
				, {name: 'normal', title: '{Normal}'}
				, {name: 'large', title: '{Large}'}
		], join: '-', title: '{Font_Size}'}
		, {name: 'font-color', rules:[
				{name: 'red', title: '{red}'}
				, {name: 'black', title: '{black}'}
				, {name: 'blue', title: '{blue}'}
				, {name: 'yellow', title: '{yellow}'}
				, {name: 'green', title: '{green}'}
		], join: '-', title: '{Font_Color}'}
  ]
};