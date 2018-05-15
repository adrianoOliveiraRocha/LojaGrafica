function delivery(order_id, opt){
	var url = '/checkout/delivery/' + order_id + '/' + opt;
	window.self.location.href = url;
}

function approved(orderItemArt_id, approved){
	url = "/checkout/approved/" + orderItemArt_id + '/' + approved;
	window.self.location.href = url;
}
