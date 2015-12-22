<?php
class ControllerPaymentFreeCheckout extends Controller {
	public function index() {
		$data['button_confirm'] = $this->language->get('button_confirm');

		$data['continue'] = $this->url->link('checkout/success');

		if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/payment/free_checkout.tpl')) {
			return $this->load->view($this->config->get('config_template') . '/template/payment/free_checkout.tpl', $data);
		} else {
			return $this->load->view('default/template/payment/free_checkout.tpl', $data);
		}
	}

	public function confirm() {
		if ($this->session->data['payment_method']['code'] == 'free_checkout') {
			$this->load->model('checkout/order');

            $comment = strip_tags($this->request->post['comment']);

			$this->model_checkout_order->addOrderHistory($this->session->data['order_id'], $this->config->get('free_checkout_order_status_id'),$comment);

            // 如果付款方式为挂账,则进行客户资金交易记录.
            $order_info = $this->model_checkout_order->getOrder($this->session->data['order_id']);
            if ($order_info) {
                $this->load->model('account/transaction');
                $this->model_account_transaction->addTransaction($order_info['customer_id'], '订单 #' . $order_info['order_id'] ,-$order_info['total'], $order_info['order_id']);
            }
		}
	}
}