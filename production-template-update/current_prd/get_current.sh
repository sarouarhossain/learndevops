#!/bin/sh

aws ses get-template --template-name membership-fee-receipt-email_en >> ./membership-fee-receipt-email_en.json --profile prd
aws ses get-template --template-name membership-fee-receipt-email_ja >> ./membership-fee-receipt-email_ja.json --profile prd
aws ses get-template --template-name membership-fee-receipt-email_ko >> ./membership-fee-receipt-email_ko.json --profile prd
aws ses get-template --template-name membership-fee-receipt-email_th >> ./membership-fee-receipt-email_th.json --profile prd
aws ses get-template --template-name membership-fee-receipt-email_zh-cn >> ./membership-fee-receipt-email_zh-cn.json --profile prd
aws ses get-template --template-name membership-fee-receipt-email_zh-tw >> ./membership-fee-receipt-email_zh-tw.json --profile prd

aws ses get-template --template-name point-earned_en >> ./point-earned_en.json --profile prd
aws ses get-template --template-name point-earned_ja >> ./point-earned_ja.json --profile prd
aws ses get-template --template-name point-earned_ko >> ./point-earned_ko.json --profile prd
aws ses get-template --template-name point-earned_th >> ./point-earned_th.json --profile prd
aws ses get-template --template-name point-earned_zh-cn >> ./point-earned_zh-cn.json --profile prd
aws ses get-template --template-name point-earned_zh-tw >> ./point-earned_zh-tw.json --profile prd

aws ses get-template --template-name failed-add-point_ja >> ./failed-add-point_ja.json --profile prd
