;; ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
;;  FILENAME:   telegram_library.lsp
;; ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


(context 'TG) ; TG ->Telegram

(define *TOKEN* "YOUR_TELEGRAM_TOKEN")
(define *CHAT_ID* "THE_CHAT_ID")
(define *PARSE_MODE* "markdown")
(define *SEND_MODE* "curl") ;  "curl|wget"


(define (send-message text)
    (if (= *SEND_MODE* "curl")
        (send-message-curl text)
        (send-message-wget text)))


(define (send-message-curl text)
(setf COMMAND (string {curl -G "https://api.telegram.org/bot}
						   *TOKEN*
						   {/sendMessage?chat_id=}
						   *CHAT_ID*
						   {&disable_web_page_preview=1&text=}
						   text
						   {&parse_mode=}
						   *PARSE_MODE*
						   {"})
						   )					
	(! COMMAND)
)


(define (send-message-wget text)
	(setf COMMAND (string {wget -O /dev/nul -i "https://api.telegram.org/bot}
						   *TOKEN*
						   {/sendMessage?chat_id=}
						   *CHAT_ID*
						   {&disable_web_page_preview=1&text=}
						   text
						   {&parse_mode=}
						   *PARSE_MODE*
						   {"})
						   )					   
	(! COMMAND)
)

(context MAIN)