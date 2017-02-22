FCKConfig.ImageBrowserURL+='&ServerPath=/przepisy/upload/';
FCKConfig.FlashBrowserURL+='&ServerPath=/przepisy/upload/';
FCKConfig.LinkBrowserURL+='&ServerPath=/przepisy/upload/';
FCKConfig.ImageUploadURL+='&ServerPath=/przepisy/upload/';
FCKConfig.FlashUploadURL+='&ServerPath=/przepisy/upload/';
FCKConfig.LinkUploadURL+='&ServerPath=/przepisy/upload/';

FCKConfig.AutoDetectLanguage=false;
FCKConfig.DefaultLanguage='pl';
FCKConfig.EditorAreaCSS='';

FCKConfig.ToolbarSets['Basic'] = [
	['Bold','Italic','-','OrderedList','UnorderedList','-','TextColor','BGColor']
];
FCKConfig.ToolbarSets['Full'] = [
	['Source','DocProps','-','Save','NewPage','Preview','-','Templates'],
	['Cut','Copy','Paste','PasteText','PasteWord','-','Print','SpellCheck'],
	['Undo','Redo','-','Find','Replace','-','SelectAll','RemoveFormat'],
	['Form','Checkbox','Radio','TextField','Textarea','Select','Button','ImageButton','HiddenField'],
	'/',
	['Bold','Italic','Underline','StrikeThrough','-','Subscript','Superscript'],
	['OrderedList','UnorderedList','-','Outdent','Indent'],
	['JustifyLeft','JustifyCenter','JustifyRight','JustifyFull'],
	['Link','Unlink','Anchor'],
	['Image','Flash','Table','Rule','Smiley','SpecialChar','PageBreak'],
	'/',
	['Style','FontFormat','FontName','FontSize'],
	['TextColor','BGColor'],
	['FitWindow']
];
FCKConfig.ToolbarSets['TB1'] = [
	['Bold','Italic','-','OrderedList','UnorderedList','-','TextColor',
	'BGColor','-','Outdent','Indent','RemoveFormat','-','Image','Rule','Smiley','SpecialChar',
	'Source']
];
