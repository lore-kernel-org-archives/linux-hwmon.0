Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.6 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8946AC433EF
	for <linux-hwmon@archiver.kernel.org>; Tue,  7 Sep 2021 15:42:13 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 67D1A60F5E
	for <linux-hwmon@archiver.kernel.org>; Tue,  7 Sep 2021 15:42:13 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235162AbhIGPnT (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Tue, 7 Sep 2021 11:43:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60054 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1345333AbhIGPnS (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Tue, 7 Sep 2021 11:43:18 -0400
Received: from mail-ot1-x32a.google.com (mail-ot1-x32a.google.com [IPv6:2607:f8b0:4864:20::32a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7BB38C061575;
        Tue,  7 Sep 2021 08:42:12 -0700 (PDT)
Received: by mail-ot1-x32a.google.com with SMTP id i3-20020a056830210300b0051af5666070so13292471otc.4;
        Tue, 07 Sep 2021 08:42:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=sender:subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=lA7u5y3v3BIyhp6tmFbsbfv2xNBCFBIUIMasuqRXFqk=;
        b=aUDliC9dmek4osY9gtWeScBIyY7AQ3sZiHGUpwa6RDDyUG6zlz/y0UEvNh65tEOxGA
         l/4xlnP16AyyEHSLLnnTxAvyraP4BDfd6EBfy/UmT2LKxOdai3h9ZzIBKS9SIx8lhFXL
         QZ2+3Kh/f1aX6pmTt/s7Rnr5IAuwBKBlnUjg7Qhpryob/hxwhi5MbRyJ4Myw2o0XsuDE
         TMK+85KBNXNi2mlyuu4vVoreKARCSGY24m9mYuT/1K2dFVb3jvYA9wYar9Uc3yO1y8O1
         NeWSSmLfurvFJ68yz3NJrZzLrkHalYvGQGt+oMYwcQN2DjNthQs2oV1/GiovLg31T9NU
         PweQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=lA7u5y3v3BIyhp6tmFbsbfv2xNBCFBIUIMasuqRXFqk=;
        b=iTTH7ckk5KjZdyION12qwHkEd8TRd6fYRCFzS0Ct8pYM2WDGBo+9MghyxoAZBazrzu
         A69ZSKRFOkU8gg+L0QUxDvivBjr9+ZXsxTJjOJ06tDt+dBOjAsZAZRhOLbR+eVO9hyqj
         ECkQczWyhhUJIPHLQ3QviP1FRDjnps8hKISucy/6QT51z4vTVFhzkes0/3nphpnyAmwb
         dLApJuPJRms8q+s11vYfPQ52IjKH+FdbEL95oZpa2WvfN8P2BeCOs+ZWysdOU8JV6g2W
         f/lmdG813KRd0OQBmFFdhYjvM6anB/rfYj/G1e/6T8gbT9WNaIBbp5nLc/RkGDg85SGf
         kQdw==
X-Gm-Message-State: AOAM532q7OHzIJlBSu6vRdUneBif4484xmThftcv0hmU7tRfwc2FroNm
        EI9Oc3gguIavyyLNFfqf7ifN9+yg9H0=
X-Google-Smtp-Source: ABdhPJwn/kMi6pMrAJB++B7kbJ7/Y/YYIn+sQmMZDDhvUPffmqcNeAyswav7l0eEz23pd7fCWfhdpQ==
X-Received: by 2002:a9d:6c48:: with SMTP id g8mr15159331otq.199.1631029331640;
        Tue, 07 Sep 2021 08:42:11 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id c14sm2456374otd.62.2021.09.07.08.42.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 07 Sep 2021 08:42:11 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Subject: Re: [PATCH 6/8] hwmon: (tmp421) support specifying n-factor via DT
To:     Krzysztof Adamski <krzysztof.adamski@nokia.com>,
        Jean Delvare <jdelvare@suse.com>
Cc:     Rob Herring <robh+dt@kernel.org>, linux-hwmon@vger.kernel.org,
        devicetree@vger.kernel.org
References: <cover.1631021349.git.krzysztof.adamski@nokia.com>
 <546898c479414a00e9caf8902d8d8db082a02668.1631021349.git.krzysztof.adamski@nokia.com>
From:   Guenter Roeck <linux@roeck-us.net>
Message-ID: <ad309fd1-1cf0-034a-d110-ad8433448dc8@roeck-us.net>
Date:   Tue, 7 Sep 2021 08:42:09 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <546898c479414a00e9caf8902d8d8db082a02668.1631021349.git.krzysztof.adamski@nokia.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On 9/7/21 6:45 AM, Krzysztof Adamski wrote:
> Previous patches added a way to specify some channel specific parameters
> in DT and n-factor is definitely one of them. This calibration mechanism
> is board specific as its value depends on the diodes/transistors being
> connected to the sensor and thus the DT seems like a right fit for that
> information. It is very similar to the value of shunt resistor that some
> drivers allows specifying in DT.
> 
> This patch adds a possibility to set n-factor for each channel via
> "n-factor" DT property in each channel subnode.
> 
> Signed-off-by: Krzysztof Adamski <krzysztof.adamski@nokia.com>
> ---
>   drivers/hwmon/tmp421.c | 17 +++++++++++++++++
>   1 file changed, 17 insertions(+)
> 
> diff --git a/drivers/hwmon/tmp421.c b/drivers/hwmon/tmp421.c
> index a41d7935acb9..90c6b094785e 100644
> --- a/drivers/hwmon/tmp421.c
> +++ b/drivers/hwmon/tmp421.c
> @@ -34,6 +34,7 @@ enum chips { tmp421, tmp422, tmp423, tmp441, tmp442 };
>   #define TMP421_STATUS_REG			0x08
>   #define TMP421_CONFIG_REG_1			0x09
>   #define TMP421_CONVERSION_RATE_REG		0x0B
> +#define TMP421_N_FACTOR_REG_1			0x21
>   #define TMP421_MANUFACTURER_ID_REG		0xFE
>   #define TMP421_DEVICE_ID_REG			0xFF
>   
> @@ -302,6 +303,7 @@ void tmp421_probe_child_from_dt(struct i2c_client *client,
>   {
>   	struct device *dev = &client->dev;
>   	u32 i;
> +	s32 val;
>   	int err;
>   
>   	err = of_property_read_u32(child, "reg", &i);
> @@ -321,6 +323,21 @@ void tmp421_probe_child_from_dt(struct i2c_client *client,
>   		data->channel[i].disabled = true;
>   		return;
>   	}
> +
> +	if (i == 0)
> +		return; /* input 0 is internal channel */
> +
> +	err = of_property_read_s32(child, "n-factor", &val);
> +	if (!err) {
> +		if (val > 127 || val < -128)
> +			dev_err(dev, "n-factor for channel %d invalid (%d)\n",
> +				i, val);

This should report an error to the caller.

Guenter

> +		else
> +			i2c_smbus_write_byte_data(client,
> +						  TMP421_N_FACTOR_REG_1 + i - 1,
> +						  val);
> +	}
> +
>   }
>   
>   void tmp421_probe_from_dt(struct i2c_client *client, struct tmp421_data *data)
> 

