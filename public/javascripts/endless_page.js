var currentPage = 1

function checkScroll() {
	if (nearBottomOfPage()) {
		currentPage++;
		new Ajax.Request('/front_pages?page=' + currentPage, {asynchronous:true, evalscripts:true, method:'get'} )
	} else {
		setTimeout("checkScroll()", 250);
	}
}

function nearBottomOfPage() {
	return scrollDistanceFromBottom() < 150;
}

function scrollDistanceFromBottom(argument) {
	return pageHeight() - (window.pageYOffset + self.innerHeight);	
}

function pageHeight() {
	return Math.max(document.body.scrollHeight, document.body.offsetHeight);
}

document.observe('dom:loaded', checkScroll);

