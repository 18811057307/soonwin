<?php
class ModelPaymentFreeCheckout extends Model {
	public function getMethod($address, $total) {
		$this->load->language('payment/free_checkout');

        //将免费付款修改为挂账 by qingt 2015-05-13
		//if ($total <= 0.00) {
		//	$status = true;
		//} else {
		//	$status = false;
		//}

		$method_data = array();

		//if ($status) {
			$method_data = array(
				'code'       => 'free_checkout',
				'title'      => $this->language->get('text_title'),
				'terms'      => '',
				'sort_order' => $this->config->get('free_checkout_sort_order')
			);
		//}

		return $method_data;
	}
}