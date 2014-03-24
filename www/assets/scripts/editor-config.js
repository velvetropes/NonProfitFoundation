// This code could (may be should) go in your config.js file
CKEDITOR.stylesSet.add('starkey_styles', [
	/** Block Styles
	 * -------------------------------------------------------------------------
	 * Block Styles
	 * -------------------------------------------------------------------------
	 * These styles are already available in the "Format" combo, so they are
	 * not needed here by default. You may enable them to avoid placing the
	 * "Format" combo in the toolbar, maintaining the same features.
	**/
	{ name : 'Heading 1'		, element : 'h1' },
	{ name : 'Heading 2'		, element : 'h2' },
	{ name : 'Heading 3'		, element : 'h3' },
	{ name : 'Heading 4'		, element : 'h4' },
	{ name : 'Heading 5'		, element : 'h5' },
	{ name : 'Heading 6'		, element : 'h6' },
	{ name : 'Paragraph'		, element : 'p'  },
	{ name : 'Article'			, element : 'article'},
	{ name : 'Section'			, element : 'section'},
	
	/*
	 * -------------------------------------------------------------------------
	 * Object Styles
	 * -------------------------------------------------------------------------
	 * These are special styles that apply additional classes are markup to the 
	 * standard html tags.
	*/
	{ name : 'Intro Text'		, element : 'p', attributes : { 'class' : 'lead' } },
	{ name : 'Address'			, element : 'address'},
	{ name : 'legal'			, element : 'small', attributes : {'class' : 'legal'} },

	{ name : 'Right Align'		, element : 'img', attributes : {'class' : 'alignright'} },
	{ name : 'Left Align'		, element : 'img', attributes : {'class' : 'alignleft'} },
	{ name : 'Center'			, element : 'img', attributes : {'class' : 'aligncenter'} },

	{ name : 'button'			, element : 'a', attributes : {'class' : 'link-with-border'} },

	{ name : 'clearfix'         , element : 'div', attributes : {'class' : 'clearfix'} },
	{ name : 'Align Left'       , element : 'div', attributes : {'class' : 'alignright'} },
	{ name : 'Align Right'      , element : 'div', attributes : {'class' : 'alignleft'} },
	{ name : 'Align Center'     , element : 'div', attributes : {'class' : 'aligncenter wrapper'} }

	/*
	{ name : 'Info Box'			, element : 'p', attributes : { 'class' : 'alert alert-warning' }},
	{ name : 'Error Box'		, element : 'p', attributes : { 'class' : 'alert alert-error'   }},
	{ name : 'Success Box'		, element : 'p', attributes : { 'class' : 'alert alert-success' }},
	*/

	/*
	 * -------------------------------------------------------------------------
	 * Inline Styles
	 * -------------------------------------------------------------------------
	 * These are core styles available as toolbar buttons. You may opt enabling
	 * some of them in the Styles combo, removing them from the toolbar.
	
	{ name : 'Fine Print'		, element : 'small'},
	{ name : 'Warning Text'		, element : 'b', attributes : { 'class' : 'text-warning' }},
	{ name : 'Error Text'		, element : 'b', attributes : { 'class' : 'text-error'   }},
	{ name : 'Info Text'		, element : 'b', attributes : { 'class' : 'text-intro'   }},
	{ name : 'Success Text'		, element : 'b', attributes : { 'class' : 'text-success' }}
	*/
]);



/*
 * --------------------------------------------------------------------
 *  EDITOR CONFIGURATION
 * --------------------------------------------------------------------
 *
 * Create default configuration settings, to be used by all Wygwam fields.
 * See http://docs.cksource.com/ckeditor_api/symbols/CKEDITOR.config.html
 *
 */
CKEDITOR.editorConfig = function( config ) {
	// Startup options
	config.startupOutlineBlocks = 'true';
	config.scayt_autoStartup = true;

	// Content Processing
	config.forcePasteAsPlainText = true;
	config.pasteFromWordNumberedHeadingToList = true;
	config.fillEmptyBlock = false;
	config.tabSpaces = 4;

	// Editor classes and CSS
	config.docType = '<!DOCTYPE html>';
	config.stylesSet = 'starkey_styles';
	config.contentsCss = '/assets/styles/wysiwyg.css';
	config.bodyClass = 'text-container';
	config.disableReadonlyStyling = true;

	// Editor dimensions
	config.resize_minWidth = 200;

};



/*
 * --------------------------------------------------------------------
 *  OUTPUT FORMATTING
 * --------------------------------------------------------------------
 *
 * You can customize how CKEditor formats your HTML markup by setting
 * custom writer rules. Just uncomment the CKEDITOR.on() block below,
 * and modify the values for intent, breakBeforeOpen, etc.
 * See http://docs.cksource.com/CKEditor_3.x/Developers_Guide/Output_Formatting
 *
 */
CKEDITOR.on( 'instanceReady', function(ev) {
	var blockTagRules = {
		indent: true,             // indent the contents between the opening and closing tags?
		breakBeforeOpen: true,    // put a line break before the opening tag?
		breakAfterOpen: false,     // put a line break after the opening tag?
		breakBeforeClose: false,  // put a line break before the closing tag?
		breakAfterClose: true     // put a line break after the closing tag?
	};

	var blockTags = ['div','h1','h2','h3','h4','h5','h6','p','pre', 'img', 'li'];
	for (var i = 0; i < blockTags.length; i++)
	{
		ev.editor.dataProcessor.writer.setRules( blockTags[i], blockTagRules);
	}

	var inlineTagRules = {
		indent: false,             // indent the contents between the opening and closing tags?
		breakBeforeOpen: false,    // put a line break before the opening tag?
		breakAfterOpen: false,     // put a line break after the opening tag?
		breakBeforeClose: false,  // put a line break before the closing tag?
		breakAfterClose: false     // put a line break after the closing tag?
	};
	var inlineTags = ['a', 'span', 'i', 'b', 'em', 'strong'];
	for (var i = 0; i < inlineTags.length; i++)
	{
		ev.editor.dataProcessor.writer.setRules( inlineTags[i], inlineTagRules);
	}

	ev.editor.dataProcessor.writer.selfClosingEnd = '>';

	/*
	ev.editor.dataProcessor.htmlFilter.addRules({
        elements:
        {
            $: function (element) {
                // Output dimensions of images as width and height
                if (element.name == 'img') {
                    var style = element.attributes.style;

                    if (style) {
                        // Get the width from the style.
                        var match = /(?:^|\s)width\s*:\s*(\d+)px/i.exec(style),
                            width = match && match[1];

                    	if (width) {
                            element.attributes.style = element.attributes.style.replace(/(?:^|\s)width\s*:\s*(\d+)px;?/i, '');
                        }

                        // Get the height from the style.
                        match = /(?:^|\s)height\s*:\s*(\d+)px/i.exec(style);
                        var height = match && match[1];

                        if (height) {
                            element.attributes.style = element.attributes.style.replace(/(?:^|\s)height\s*:\s*(\d+)px;?/i, '');
                        }

                        // Get the height from the style.
                        match = /(?:^|\s)float\s*:\s*(right|left)/i.exec(style);
                        var aligned = match && match[1];
                        if (aligned)
                        {
                        	element.attributes.style = element.attributes.style.replace(/(?:^|\s)float\s*:\s*(right|left)/i, '');
                        }
                    }
                }

                if (!element.attributes.style)
                    delete element.attributes.style;

                return element;
            }
        }
    });
    */

});

// Load external Scripts
// CKEDITOR.scriptLoader.load('//use.typekit.net/mae3rbg.js');
