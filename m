Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 77417C352A1
	for <linux-hwmon@archiver.kernel.org>; Tue,  6 Dec 2022 07:03:52 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233961AbiLFHDt (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Tue, 6 Dec 2022 02:03:49 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46488 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233912AbiLFHDs (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Tue, 6 Dec 2022 02:03:48 -0500
Received: from mail-oi1-x229.google.com (mail-oi1-x229.google.com [IPv6:2607:f8b0:4864:20::229])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5C3A119C22
        for <linux-hwmon@vger.kernel.org>; Mon,  5 Dec 2022 23:03:47 -0800 (PST)
Received: by mail-oi1-x229.google.com with SMTP id m204so15933577oib.6
        for <linux-hwmon@vger.kernel.org>; Mon, 05 Dec 2022 23:03:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :sender:from:to:cc:subject:date:message-id:reply-to;
        bh=efUCPFwfKP2AglJG+S1ZVk06le9S0acNz3fx23bcGD0=;
        b=nGMcWotYvrbBr717SjNVA4u87+0RlnP+DentxUDf6z+XdYiL7ExTOrQ0hpCI0htmnQ
         khlGTNZ8dYpdAiFHFcQIWdrqxqJHMyp8yInvWwyk1LwWJT3uMEHto6GTlxNK9UFJBmqG
         7uE5PlaYdjHCtqPlfOrFpMnvz3pI9sYN8J03SssHIFvcmrGwA0OOh0dji0CzATNJHVHL
         RLxaccjmlOwEEgXjHI/HN0WHM6QCqzSg1KTZj+q5RRVVdRngnU/ae49ap3gKJ7NCuMHt
         JPN7HfKfdHw1iolPytf9CrBVhjHBCbWPgJfbFFHVxYrryumNH9F7YfnhrA+8xvUTG7LF
         dSNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :sender:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=efUCPFwfKP2AglJG+S1ZVk06le9S0acNz3fx23bcGD0=;
        b=6m2X968aetHkIWmcOYXWj70Tgk4TSTpUa3Nllr8t65/2k8kXZo0aHmkis5VeKKIm2c
         fJPQ6yTE01QjgWnA/X+HcLxx7H52C8BL38RcCj8y1JbVJCAH2DCCrZQojCh06X+s1L5v
         FIGLmcgXar4g78cm293haV2229robDtZsezkI4/zl57QsLhzKC6ZvHWlBo6mH+NAvOj9
         SF1GXmWDKMsrGpAo/62EiWBchbIFPKUSENGPvQ/xP9sbYspViU1uvRs4I2tMj8EPStGu
         K1k5VdZpuIXwxIrIC4JA+F1+vEC76pd4hMcnv3Hducjwstb5gtVoFnQ3NRtuVKMGsei2
         W7cw==
X-Gm-Message-State: ANoB5pmef1457+06Ra3hAaiAa3khQKmUSVziTzX0xUqoXg0I45S0C/Pg
        q6oAj/E5iq11r563tMnJt+iunOMl+tQ=
X-Google-Smtp-Source: AA0mqf6K2ctMEflsGoPH7M7phqOX4KtYGjOQS0i9VYj8DII78TxifBbILGe/jt0ZU5w7WUkCNuODqw==
X-Received: by 2002:a05:6808:199c:b0:35a:260b:794d with SMTP id bj28-20020a056808199c00b0035a260b794dmr31566115oib.123.1670310226728;
        Mon, 05 Dec 2022 23:03:46 -0800 (PST)
Received: from ?IPV6:2600:1700:e321:62f0:329c:23ff:fee3:9d7c? ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id by13-20020a056830608d00b0066e873e4c2csm5756323otb.45.2022.12.05.23.03.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 05 Dec 2022 23:03:46 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <eeb76b93-53d5-bc5b-b132-475c11f8ce1b@roeck-us.net>
Date:   Mon, 5 Dec 2022 23:03:43 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH v3 1/2] hwmon: (emc2305) fix unable to probe emc2301/2/3
Content-Language: en-US
To:     Xingjiang Qiao <nanpuyue@gmail.com>
Cc:     Jean Delvare <jdelvare@suse.com>,
        Michael Shych <michaelsh@nvidia.com>,
        linux-hwmon@vger.kernel.org
References: <20221205173611.145571-1-nanpuyue@gmail.com>
 <20221206055331.170459-1-nanpuyue@gmail.com>
From:   Guenter Roeck <linux@roeck-us.net>
In-Reply-To: <20221206055331.170459-1-nanpuyue@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On 12/5/22 21:53, Xingjiang Qiao wrote:
> The definitions of 'EMC2305_REG_PRODUCT_ID' and 'EMC2305_REG_DEVICE' are
> both '0xfd', they actually return the same value, but the values returned
> by emc2301/2/3/5 are different, so probe emc2301/2/3 will fail, This patch
> fixes that.
> 
> Signed-off-by: Xingjiang Qiao <nanpuyue@gmail.com>

Please stop sending new versions of your patches as reply to previous versions,
and please provide change logs. I have no idea what is different between
versions 2 and 3 of this patch, and v2 as well as v3 almost got lost.

Guenter

> ---
>   drivers/hwmon/emc2305.c | 7 +------
>   1 file changed, 1 insertion(+), 6 deletions(-)
> 
> diff --git a/drivers/hwmon/emc2305.c b/drivers/hwmon/emc2305.c
> index aa1f25add0b6..9a78ca22541e 100644
> --- a/drivers/hwmon/emc2305.c
> +++ b/drivers/hwmon/emc2305.c
> @@ -16,7 +16,6 @@ static const unsigned short
>   emc2305_normal_i2c[] = { 0x27, 0x2c, 0x2d, 0x2e, 0x2f, 0x4c, 0x4d, I2C_CLIENT_END };
>   
>   #define EMC2305_REG_DRIVE_FAIL_STATUS	0x27
> -#define EMC2305_REG_DEVICE		0xfd
>   #define EMC2305_REG_VENDOR		0xfe
>   #define EMC2305_FAN_MAX			0xff
>   #define EMC2305_FAN_MIN			0x00
> @@ -524,7 +523,7 @@ static int emc2305_probe(struct i2c_client *client, const struct i2c_device_id *
>   	struct device *dev = &client->dev;
>   	struct emc2305_data *data;
>   	struct emc2305_platform_data *pdata;
> -	int vendor, device;
> +	int vendor;
>   	int ret;
>   	int i;
>   
> @@ -535,10 +534,6 @@ static int emc2305_probe(struct i2c_client *client, const struct i2c_device_id *
>   	if (vendor != EMC2305_VENDOR)
>   		return -ENODEV;
>   
> -	device = i2c_smbus_read_byte_data(client, EMC2305_REG_DEVICE);
> -	if (device != EMC2305_DEVICE)
> -		return -ENODEV;
> -
>   	data = devm_kzalloc(dev, sizeof(*data), GFP_KERNEL);
>   	if (!data)
>   		return -ENOMEM;

