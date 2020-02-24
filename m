Return-Path: <SRS0=BLaD=4M=vger.kernel.org=linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.1 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9FDDEC11D2F
	for <linux-hwmon@archiver.kernel.org>; Mon, 24 Feb 2020 14:27:26 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 73D9F2082F
	for <linux-hwmon@archiver.kernel.org>; Mon, 24 Feb 2020 14:27:26 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BasMxWNy"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727513AbgBXO10 (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Mon, 24 Feb 2020 09:27:26 -0500
Received: from mail-pj1-f66.google.com ([209.85.216.66]:55225 "EHLO
        mail-pj1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727299AbgBXO10 (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Mon, 24 Feb 2020 09:27:26 -0500
Received: by mail-pj1-f66.google.com with SMTP id dw13so4283300pjb.4
        for <linux-hwmon@vger.kernel.org>; Mon, 24 Feb 2020 06:27:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=pJU9ZlSH7tp+ZTuR5M2B2DPe26e9Jh4k+LHDhsa3qDk=;
        b=BasMxWNyvJjeGlu6v3qZmTKHSmGeD8vpeRyK4WdeV/HAGRyuZj+b2ULUZNYCqOH1wp
         dE+SUZVSOFenvTRxinJMYvXKGVUcL9IogoLFaLwbJZyObTdgPv9Icx9nXJMGKlNh43R0
         s+OsT4ULdWphOm7XgLjVtPL/+sSzpFzZTsVpNXOWj8Wp6EVlTJ7VvS0OViT76gyh8IHj
         gunSkmz4hJneaEUPS7cOW59hbA7XYsfGMIaPidSBB9zLs3TM6TqcrZ86JcDpK58R56lR
         KXoNL3JIM1Z/0ywdcceDLWdzjcOKAP1ZysYIlOVovGmgpM0xEBC757BtIrXi4wns35nI
         wMKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=pJU9ZlSH7tp+ZTuR5M2B2DPe26e9Jh4k+LHDhsa3qDk=;
        b=eb4/8xxdSnT/ci/vuVeknq0846w1H4gxRNvCmWNs+FxkEFOYlFxYmoTOZ87KfTFwe5
         0qXq8Pqky+LiS0lkx7zxi1GuIWTgXlzJOKV62zX4KBFh+Q6fd3NslEPRq+qqywDatNL2
         b6ZLge8R9KYUlvA22jLZB2VDMxUt8S6Psr4ou4vBY5ob4/gyIzTx4NO83CyugV1JsvlQ
         aKxMK4t5s1YPcpjFLt7dJ671qBqeR0unxb+45aqG13cUe7ud671XKKlx5vQ7fi2l06j9
         YVxVrdxlqNoldENRyMwLn5BIMgEDhJfJfTiiN3a880Z0MLx88xb0HPWQWkpT9qPZoyuA
         N1NQ==
X-Gm-Message-State: APjAAAU9zKHqEqUUw8+DX7bMnkL4A1WuJ83KfuNC38xuYfJCmZVRqYCO
        Y9EM3lXNZnFGELSoJI7W0gf/h81M
X-Google-Smtp-Source: APXvYqxuX2ui7oBs43vZ4+39YZx2q8ke8nyeh7kWnlg3ocYm6I6nqVcCIbJiF1B/u3ofpRDk9b2WTg==
X-Received: by 2002:a17:902:503:: with SMTP id 3mr51399525plf.78.1582554445142;
        Mon, 24 Feb 2020 06:27:25 -0800 (PST)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id w2sm12801394pfw.43.2020.02.24.06.27.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 24 Feb 2020 06:27:24 -0800 (PST)
Subject: Re: [hwmon-next v1 2/2] hwmon: (pmbus/xdpe12284) Add custom format
 for vout limits conversion
To:     Vadim Pasternak <vadimp@mellanox.com>
Cc:     linux-hwmon@vger.kernel.org
References: <20200224131257.28176-1-vadimp@mellanox.com>
 <20200224131257.28176-3-vadimp@mellanox.com>
From:   Guenter Roeck <linux@roeck-us.net>
Message-ID: <25433626-800a-b9f7-4b39-f49cadddacab@roeck-us.net>
Date:   Mon, 24 Feb 2020 06:27:23 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <20200224131257.28176-3-vadimp@mellanox.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-hwmon-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On 2/24/20 5:12 AM, Vadim Pasternak wrote:
> Provide callback for overvoltage and undervoltage output readouts
> conversion. These registers are presented in 'slinear11' format, while
> default conversion for 'vout' class for the devices is 'vid'. It is
> resulted in wrong conversion in pmbus_reg2data() for in{3-4}_lcrit and
> in{3-4}_crit attributes.
> 
> Signed-off-by: Vadim Pasternak <vadimp@mellanox.com>
> ---
>   drivers/hwmon/pmbus/xdpe12284.c | 23 +++++++++++++++++++++++
>   1 file changed, 23 insertions(+)
> 
> diff --git a/drivers/hwmon/pmbus/xdpe12284.c b/drivers/hwmon/pmbus/xdpe12284.c
> index ecd9b65627ec..751c8e18c881 100644
> --- a/drivers/hwmon/pmbus/xdpe12284.c
> +++ b/drivers/hwmon/pmbus/xdpe12284.c
> @@ -18,6 +18,28 @@
>   #define XDPE122_AMD_625MV		0x10 /* AMD mode 6.25mV */
>   #define XDPE122_PAGE_NUM		2
>   
> +static int xdpe122_reg2data(u16 reg, int data, long *val)
> +{
> +	s16 exponent;
> +	s32 mantissa;
> +
> +	switch (reg) {
> +	case PMBUS_VOUT_OV_FAULT_LIMIT:
> +	case PMBUS_VOUT_UV_FAULT_LIMIT:

Another situation where having a datasheet would be quite valuable.

I would suggest to implement reading those two registers locally
and convert them to the expected data format. That seems to be
more straightforward than re-implementing slinear conversion.

Thanks,
Guenter

> +		/* Convert to LINEAR11. */
> +		exponent = ((s16)data) >> 11;
> +		mantissa = ((s16)((data & GENMASK(10, 0)) << 5)) >> 5;
> +		*val = mantissa * 1000L;
> +		if (exponent >= 0)
> +			*val <<= exponent;
> +		else
> +			*val >>= -exponent;
> +		return 0;
> +	default:
> +		return -ENODATA;
> +	}
> +}
> +
>   static int xdpe122_identify(struct i2c_client *client,
>   			    struct pmbus_driver_info *info)
>   {
> @@ -70,6 +92,7 @@ static struct pmbus_driver_info xdpe122_info = {
>   		PMBUS_HAVE_TEMP | PMBUS_HAVE_STATUS_TEMP |
>   		PMBUS_HAVE_POUT | PMBUS_HAVE_PIN | PMBUS_HAVE_STATUS_INPUT,
>   	.identify = xdpe122_identify,
> +	.reg2data = xdpe122_reg2data,
>   };
>   
>   static int xdpe122_probe(struct i2c_client *client,
> 

