;; Determines the change in time. Returns the value in seconds.
;; rEndDate --- Required. If the end date value is smaller than the start date, then a negative value will be returned.
;; rStartDate - Optional. If left empty, the value will be assumed as zero and the End Date will be returned in seconds.
(defun TimeDiff (rEndDate rStartDate / 
    DateToSeconds MonthDay
    ); local variable declarations
    
    (defun DateToSeconds (rDate / iYear iMonth iDay iHour iMinute rSecond DayValue)
        
        ;; Date to Days
        (setq iYear (fix (/ rDate 10000)))
        (setq iMonth (- (fix (/ rDate 100)) (* (fix (/ rDate 10000)) 100)))
        (setq iDay (- (fix rDate)(* (fix (/ rDate 100)) 100)))
        (setq DayValue (+ (fix (* iYear 365.25)) (MonthDay iYear iMonth) iDay))
        
        ;; Date to seconds
        (setq iHour (- (fix (* rDate 100)) (* 100.0 (fix rDate))))
        (setq iMinute (- (fix (* rDate 10000)) (* 100.0 (fix (* rDate 100)))))
        (setq rSecond (- (* rDate 1000000) (* 100 (fix (* rDate 10000)))))
        (+ (* (+ (* (+ (* DayValue 24) iHour) 60) iMinute) 60) rSecond)
    );DateToSeconds
    
    ;; Converts a month to days
    (defun MonthDay (iYear iMonth / Days)
        (setq Days (cond ; Completed months
            ((= iMonth 01) 0)
            ((= iMonth 02) 31)
            ((= iMonth 03) (if (= (/ iYear 4)(fix (/ iYear 4))) 29 28))
            ((= iMonth 04) 31)
            ((= iMonth 05) 30)
            ((= iMonth 06) 31)
            ((= iMonth 07) 30)
            ((= iMonth 08) 31)
            ((= iMonth 09) 31)
            ((= iMonth 10) 30)
            ((= iMonth 11) 31)
            ((= iMonth 12) 30)
        ));setq<-cond
        (+ Days (if (> iMonth 1)(MonthDay iYear (1- iMonth)) 0))
    );MonthDay
    
    ;; Date to seconds
    (- 
        (DateToSeconds rEndDate) 
        (if (and (numberp rStartDate) (> (abs rStartDate) 100))
            (DateToSeconds rStartDate) 
            0
        );if
    );minus
);defun
