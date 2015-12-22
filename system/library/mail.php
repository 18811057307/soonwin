<?php
require 'phpmailer/PHPMailerAutoload.php';

class Mail {
    protected $to;
    protected $from;
    protected $sender;
    protected $replyto;
    protected $subject;
    protected $text;
    protected $html;
    protected $attachments = array();
    public $protocol = 'mail';
    public $smtp_hostname;
    public $smtp_username;
    public $smtp_password;
    public $smtp_port = 25;
    public $smtp_timeout = 5;
    public $newline = "\n";
    public $verp = false;
    public $parameter = '';

    public function __construct($config = array()) {
        foreach ($config as $key => $value) {
            $this->$key = $value;
        }
    }

    public function setTo($to) {
        $this->to = $to;
    }

    public function setFrom($from) {
        $this->from = $from;
    }

    public function setSender($sender) {
        $this->sender = $sender;
    }

    public function setReplyTo($reply_to) {
        $this->replyto = $reply_to;
    }

    public function setSubject($subject) {
        $this->subject = $subject;
    }

    public function setText($text) {
        $this->text = $text;
    }

    public function setHtml($html) {
        $this->html = $html;
    }

    public function addAttachment($filename) {
        $this->attachments[] = $filename;
    }

    public function send() {
        //Create a new PHPMailer instance
        $mail = new PHPMailer;
        //Tell PHPMailer to use SMTP
        $mail->isSMTP();
        //Enable SMTP debugging
        // 0 = off (for production use)
        // 1 = client messages
        // 2 = client and server messages
        $mail->CharSet = 'UTF-8';
        $mail->Encoding = 'base64';
        $mail->SMTPDebug = 0;
        //Set the hostname of the mail server
        $mail->Host = $this->smtp_hostname;
        //Set the SMTP port number - likely to be 25, 465 or 587
        $mail->Port = $this->smtp_port;
        //Whether to use SMTP authentication
        $mail->SMTPAuth = true;
        //Username to use for SMTP authentication
        $mail->Username = $this->smtp_username;
        //Password to use for SMTP authentication
        $mail->Password = $this->smtp_password;
        //Set who the message is to be sent from
        $mail->setFrom($this->from, $this->sender);
        //Set who the message is to be sent to
        $mail->addAddress($this->to);

        //Set the subject line
        $mail->Subject = $this->subject;
        $mail->Body = $this->text;
        //Attach an image file
        //send the message, check for errors
        if (!$mail->send()) {
            return "Mailer Error: " . $mail->ErrorInfo;
        } else {
            return "Message sent!";
        }
    }
}