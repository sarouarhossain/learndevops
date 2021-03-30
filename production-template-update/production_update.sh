#!/bin/sh
{
    aws ses update-template --cli-input-json file://membership-fee-receipt-email_en.json --profile prd
    aws ses update-template --cli-input-json file://membership-fee-receipt-email_ja.json --profile prd
    aws ses update-template --cli-input-json file://membership-fee-receipt-email_ko.json --profile prd
    aws ses update-template --cli-input-json file://membership-fee-receipt-email_th.json --profile prd
    aws ses update-template --cli-input-json file://membership-fee-receipt-email_zh-cn.json --profile prd
    aws ses update-template --cli-input-json file://membership-fee-receipt-email_zh-tw.json --profile prd

    aws ses update-template --cli-input-json file://point-earned_en.json --profile prd
    aws ses update-template --cli-input-json file://point-earned_ja.json --profile prd
    aws ses update-template --cli-input-json file://point-earned_ko.json --profile prd
    aws ses update-template --cli-input-json file://point-earned_th.json --profile prd
    aws ses update-template --cli-input-json file://point-earned_zh-cn.json --profile prd
    aws ses update-template --cli-input-json file://point-earned_zh-tw.json --profile prd

    aws ses update-template --cli-input-json file://failed-add-point_ja.json --profile prd
} &> output.txt