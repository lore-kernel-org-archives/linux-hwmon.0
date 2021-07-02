Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D518EC11F68
	for <linux-hwmon@archiver.kernel.org>; Fri,  2 Jul 2021 14:59:43 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id A8527613E9
	for <linux-hwmon@archiver.kernel.org>; Fri,  2 Jul 2021 14:59:43 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231891AbhGBPCP (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Fri, 2 Jul 2021 11:02:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48558 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230271AbhGBPCO (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Fri, 2 Jul 2021 11:02:14 -0400
Received: from mail-ot1-x32b.google.com (mail-ot1-x32b.google.com [IPv6:2607:f8b0:4864:20::32b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A59BAC061762;
        Fri,  2 Jul 2021 07:59:42 -0700 (PDT)
Received: by mail-ot1-x32b.google.com with SMTP id 7-20020a9d0d070000b0290439abcef697so10332989oti.2;
        Fri, 02 Jul 2021 07:59:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:to:cc:references:from:subject:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=F7+a2h4l4H+prUm1/jHV9zkZxzIhVH1IqDcSm5ZQpJ0=;
        b=IS+DsQnsL8DwDyYGW5xMEgMulFIw84AfOOuS3wiLKrWyYm9oXu6j2gkAH82+Yz1ifj
         Imaut/E8vssawZVZEOGQEvNc38uP9ZtRV9Eb2vcsBEuvYQVIXLW6PXJjpq5/+ZfQt2TV
         Hhd6UEfxruUbh+TzEHVUGsPZ0zpIkRzbYB/I+rmeKzhbX6qNJFcGgDKkBZeLHZhjky4w
         AQM/hkZ0o7k5Z9nYfOjQxON11E8imFKCRzEKDqoRpqeDNb4Eqi7lA2+/A9os95wO6fnO
         xJnZd1P993FMo8zE5pWspSw6wCRZCwpczpVKkMWIg8GYQuUsQau7p/CAA/GUIlM8fA/Q
         sUrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:to:cc:references:from:subject:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=F7+a2h4l4H+prUm1/jHV9zkZxzIhVH1IqDcSm5ZQpJ0=;
        b=GfhTBT3lQhsPJ4AJPAJp37c4dADhov664XJTEEmR/xOjt5MR+eDQsr2sWZea9AukME
         jGIsOlP6Ri620jU0cAQ+3wbn3X/IAo9QwiCnQXKUZOCpxNhvRtddy4vN/Uyu6AHhNlTh
         1xOL5kqO5UnlvZNHEETOjnkRVJiBAIcLMHVmwB2gJh6vPVW2Ro/OmqsQtDI126i2jtx+
         sDc2zxgqfHY/Hv4EFUSrd6nBxRkU7c0m/bk28LoGFk0D9wCqrg4/r2rtK1c+w3YVqpeZ
         d+Z6HEAJPHZlDPOZ5emw27JKnL/2vo23mmNbjSeUedSkto6DJ+hOZFCguE5+vud0AckU
         yLVw==
X-Gm-Message-State: AOAM532qDNPJfwxgmEnRwaS77wo/wfkajAFcMR87tOmcoBaNT4dS0J1H
        dxcJgBp3l6QYmbWgPKJPPCY=
X-Google-Smtp-Source: ABdhPJyw60eyOw+1qoQysVzbQVMsxxYP4Six4B3rORJYl4/f54w4PUo7rfviaeSvl6jCV8OlphhpjA==
X-Received: by 2002:a9d:7382:: with SMTP id j2mr1039224otk.245.1625237981985;
        Fri, 02 Jul 2021 07:59:41 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id g1sm661139otq.22.2021.07.02.07.59.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 02 Jul 2021 07:59:41 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
To:     ainux.wang@gmail.com, jdelvare@suse.com, corbet@lwn.net
Cc:     linux-hwmon@vger.kernel.org, linux-doc@vger.kernel.org,
        sterlingteng@gmail.com, chenhuacai@kernel.org,
        chenhuacai@loongson.cn
References: <20210702073142.15166-1-ainux.wang@gmail.com>
 <20210702073142.15166-3-ainux.wang@gmail.com>
From:   Guenter Roeck <linux@roeck-us.net>
Subject: Re: [PATCH v6 2/2] hwmon: (pmbus) Try use read_status() to read
 status register
Message-ID: <63862f18-ecdb-68e6-f859-20e10583e71e@roeck-us.net>
Date:   Fri, 2 Jul 2021 07:59:39 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210702073142.15166-3-ainux.wang@gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On 7/2/21 12:31 AM, ainux.wang@gmail.com wrote:
> From: "Ainux.Wang" <ainux.wang@gmail.com>
> 
> There is a case(like MP2949A) that the chip do not support STATUS_WORD
> and STATUS_BYTE command, but return some random data when reading.
> 
> So we should call read_status() instead of i2c_smbus_read_word_data()
> and i2c_smbus_read_byte_data(), and the chip driver should implement a
> read_word_data() function and a read_byte_data() function to return
> -ENXIO.

No, the chip driver needs to simulate at least one of the commands. That makes most
of the changes below unnecessary. We should limit complexity to where it is needed,
meaning the chip driver.

> 
> Signed-off-by: Ainux.Wang <ainux.wang@gmail.com>
> ---
>   drivers/hwmon/pmbus/pmbus_core.c | 20 +++++++++++++++-----
>   1 file changed, 15 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/hwmon/pmbus/pmbus_core.c b/drivers/hwmon/pmbus/pmbus_core.c
> index 776ee2237be2..d3273a20e76e 100644
> --- a/drivers/hwmon/pmbus/pmbus_core.c
> +++ b/drivers/hwmon/pmbus/pmbus_core.c
> @@ -503,6 +503,9 @@ static int pmbus_check_status_cml(struct i2c_client *client)
>   	struct pmbus_data *data = i2c_get_clientdata(client);
>   	int status, status2;
>   
> +	if (!data->read_status)
> +		return -EINVAL;
> +

Unnecessary.

>   	status = data->read_status(client, -1);
>   	if (status < 0 || (status & PB_STATUS_CML)) {
>   		status2 = _pmbus_read_byte_data(client, -1, PMBUS_STATUS_CML);
> @@ -534,6 +537,9 @@ static bool pmbus_check_status_register(struct i2c_client *client, int page)
>   	int status;
>   	struct pmbus_data *data = i2c_get_clientdata(client);
>   
> +	if (!data->read_status)
> +		return false;
> +

Unnecessary.

>   	status = data->read_status(client, page);
>   	if (status >= 0 && !(data->flags & PMBUS_SKIP_STATUS_CHECK) &&
>   	    (status & PB_STATUS_CML)) {
> @@ -573,6 +579,8 @@ static int pmbus_get_status(struct i2c_client *client, int page, int reg)
>   
>   	switch (reg) {
>   	case PMBUS_STATUS_WORD:
> +		if (!data->read_status)
> +			return -EINVAL;

Unnecessary.

>   		status = data->read_status(client, page);
>   		break;
>   	default:
> @@ -2306,16 +2314,15 @@ static int pmbus_init_common(struct i2c_client *client, struct pmbus_data *data,
>   	/*
>   	 * Some PMBus chips don't support PMBUS_STATUS_WORD, so try
>   	 * to use PMBUS_STATUS_BYTE instead if that is the case.
> -	 * Bail out if both registers are not supported.
>   	 */
>   	data->read_status = pmbus_read_status_word;
> -	ret = i2c_smbus_read_word_data(client, PMBUS_STATUS_WORD);
> +	ret = data->read_status(client, -1);

This ...

>   	if (ret < 0 || ret == 0xffff) {
>   		data->read_status = pmbus_read_status_byte;
> -		ret = i2c_smbus_read_byte_data(client, PMBUS_STATUS_BYTE);
> +		ret = data->read_status(client, -1);

and this are the only two changes needed.

>   		if (ret < 0 || ret == 0xff) {
> -			dev_err(dev, "PMBus status register not found\n");
> -			return -ENODEV;
> +			/* Both registers are not supported. */
> +			data->read_status = NULL;

Unnecessary.

>   		}
>   	} else {
>   		data->has_status_word = true;
> @@ -2484,6 +2491,9 @@ static int pmbus_debugfs_get_status(void *data, u64 *val)
>   	struct pmbus_debugfs_entry *entry = data;
>   	struct pmbus_data *pdata = i2c_get_clientdata(entry->client);
>   
> +	if (!pdata->read_status)
> +		return -EINVAL;
> +
Unnecessary.

>   	rc = pdata->read_status(entry->client, entry->page);
>   	if (rc < 0)
>   		return rc;
> 

