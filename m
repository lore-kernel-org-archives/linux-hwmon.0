Return-Path: <SRS0=cQ/s=VU=vger.kernel.org=linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.1 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D6D0AC7618B
	for <linux-hwmon@archiver.kernel.org>; Tue, 23 Jul 2019 13:01:01 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id A570421670
	for <linux-hwmon@archiver.kernel.org>; Tue, 23 Jul 2019 13:01:01 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lkWzR0pT"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390028AbfGWNBB (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Tue, 23 Jul 2019 09:01:01 -0400
Received: from mail-pf1-f193.google.com ([209.85.210.193]:36113 "EHLO
        mail-pf1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2390003AbfGWNBB (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Tue, 23 Jul 2019 09:01:01 -0400
Received: by mail-pf1-f193.google.com with SMTP id r7so19120603pfl.3
        for <linux-hwmon@vger.kernel.org>; Tue, 23 Jul 2019 06:01:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=VX7Snu+SXhAHTVGT4F4aME0WIufo8DzZNQ6VvRoYSec=;
        b=lkWzR0pTG/3AxrZEJTviuMOpRiDL1/DtQiJ9fA6RJrKTz+CfYdjnKAxsOkVZcztcaj
         wrGwILvF60CcEnFJlbg8fEXmFn3dwy2qJsNreFWCxK54dsH+VqmTsomCsH3xsrQXvAuH
         2jmJ9OhcmtUFCLbDLsdvDoMuYPvsYnUgwSGlcrwS9bG49saiACWgMomDvqIGm2F8g80Y
         TJHowVDxPn+dDXiWXz92TjIRSRYEmqLkmX6owi27lnLaiCOoqlEs5podeAxYH3rrWT0V
         n56x/a/F7+eqaTMjT7OxUuGWAAMghaPhzr22uMPxfhUYlntSIQlBSz3tk3rUBRSFOluh
         Oe3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=VX7Snu+SXhAHTVGT4F4aME0WIufo8DzZNQ6VvRoYSec=;
        b=tOV6xnbrIc3Sm87R3+5tOsSnpDhzb7OinR/aBuRXyfJv/tQTpfBVIyES9e7qvygV6N
         lkY6x5IHIM/q9U3ZCasJXbSo56dQ3C5UYFUCnH4a0OZ4vGXHny43ea4xEOIjr4KbF+tS
         VAR/gu/UkW82N2Ys77/ZTyTcOC8PJTyywRa99WIkIbmQLKvp7lIN6QbDiWFHkCCSaD+c
         X0ddg7xk79cgZrFzqFD2136COkoZ59rrEZw5rb/Jvp99yurbHU6zLxlSCcBaKF32pDMh
         GO4g5MbDFzh7HP7J6wRvmIJnu6ol398y39F2h2hsvjn8ca5IdnJRA2of59WAl+DQzL4q
         pspA==
X-Gm-Message-State: APjAAAXlYK1iETwTncpTBZIpRBmlLCiqd8XIe3oaSz+OvZjX7QPGadQU
        uxstzU5c7feK+SZW4hNS+5t1rt6m
X-Google-Smtp-Source: APXvYqwdYf1pTQoNU9as2lTPJj/L4vYyg3nksWbhv914kINzzRhFFpCgten4ak7ftfaMyrtzgvU0bQ==
X-Received: by 2002:a63:10a:: with SMTP id 10mr77308106pgb.281.1563886859850;
        Tue, 23 Jul 2019 06:00:59 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id b29sm74418665pfr.159.2019.07.23.06.00.58
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 23 Jul 2019 06:00:59 -0700 (PDT)
Subject: Re: [PATCH 1/1] drivers/hwmon/acpi_power_meter.c: Change log level
To:     Wang Shenran <shenran268@gmail.com>
Cc:     jdelvare@suse.com, linux-hwmon@vger.kernel.org
References: <20190723105658.6564-1-shenran268@gmail.com>
From:   Guenter Roeck <linux@roeck-us.net>
Message-ID: <f95103d2-2b19-4c26-0229-12debc642ed0@roeck-us.net>
Date:   Tue, 23 Jul 2019 06:00:58 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190723105658.6564-1-shenran268@gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-hwmon-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On 7/23/19 3:56 AM, Wang Shenran wrote:
> At boot time, the acpi_power_meter driver logs the following error level
> message: "Ignoring unsafe software power cap". Having read about it from
> a few sources, it seems that the error message can be quite misleading.
> 
> While the message can imply that Linux is ignoring the fact that the
> system is operating in potentially dangerous conditions, the truth is
> the driver found an ACPI_PMC object that supports software power
> capping. The driver simply decides not to use it, perhaps because it
> doesn't support the object.
> 
> The best solution is probably changing the log level from error to warning.
> All sources I have found, regarding the error, have downplayed its
> significance. There is not much of a reason for it to be on error level,
> while causing potential confusions or misinterpretations.
> 
> Signed-off-by: Wang Shenran <shenran268@gmail.com>
> ---
>   drivers/hwmon/acpi_power_meter.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/hwmon/acpi_power_meter.c b/drivers/hwmon/acpi_power_meter.c
> index 6ba1a08253f0..ee0363e5be43 100644
> --- a/drivers/hwmon/acpi_power_meter.c
> +++ b/drivers/hwmon/acpi_power_meter.c
> @@ -681,7 +681,7 @@ static int setup_attrs(struct acpi_power_meter_resource *resource)
>   
>   	if (resource->caps.flags & POWER_METER_CAN_CAP) {
>   		if (!can_cap_in_hardware()) {
> -			dev_err(&resource->acpi_dev->dev,
> +			dev_warn(&resource->acpi_dev->dev,
>   				"Ignoring unsafe software power cap!\n");

Also please fix continuation line alignment.

Thanks,
Guenter

>   			goto skip_unsafe_cap;
>   		}
> 

