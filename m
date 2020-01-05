Return-Path: <SRS0=lfVP=22=vger.kernel.org=linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.1 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 36A7EC33C8C
	for <linux-hwmon@archiver.kernel.org>; Sun,  5 Jan 2020 16:03:38 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id F33572085B
	for <linux-hwmon@archiver.kernel.org>; Sun,  5 Jan 2020 16:03:37 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EafbpNEv"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726260AbgAEQDh (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Sun, 5 Jan 2020 11:03:37 -0500
Received: from mail-pf1-f193.google.com ([209.85.210.193]:44518 "EHLO
        mail-pf1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726212AbgAEQDh (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Sun, 5 Jan 2020 11:03:37 -0500
Received: by mail-pf1-f193.google.com with SMTP id 195so24943288pfw.11;
        Sun, 05 Jan 2020 08:03:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=CPJ0Y8yXATlIXd/jcLnbOF2ROr1PvEXWZgMBa/iQ9gY=;
        b=EafbpNEvNLQYoa0aXwGyY0O6Fe61ubpdkjAbsDqy9Z0axdhta/3jH6daqBhdOTarPo
         /9xWtLnJp8g5ETbg17VeDptISt3h3a+RRJnTZHcIbAFq3vfPHTPzshd4US+XH7Mv7Lhr
         6CqMFRSgrqDZI2L5BxZ95aWyd7BrDUx+hW755WDSJbSF0DwsZgCReimvPXC0siHFxkHr
         MaQuV5ib1ZOE1IknkH5/Mvy/Bdt1JIw1mwftkeHRftkhFxyfRMf0CgI8J9P4UZ5OLna3
         k57ZhBL7+zPR9GcdHqR/9g6IFds8BL+Igqqv0qwO0YUFC0ySRbW+44TlA7RuAHoDaZXK
         EA0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=CPJ0Y8yXATlIXd/jcLnbOF2ROr1PvEXWZgMBa/iQ9gY=;
        b=mKDaNMT8bB6TRF9/5mXxL+hxdwf6tKIv5wUp/r1uAyRuYeR0JS8KJCRGh/YCdSum7Y
         sK+yyVvNLrHHNQf7iWDmupIMh9I50iSEVYeDT0mbP2lVZxALmxackJAiZsumqfxGifc0
         Z79y9h7CoYSj/iADjhFSaELaxz6GALP16atkid+q/6loDUEdi+PjRL8+C514ntqIqPiK
         38i/1zhDvr2q1a8wOQ6djYLY2ULczs8p+dwJmO+8cFYvOMTlGRgrJRTR6PKF0OjeTFDK
         2O7kBCekRSYRZ49iedpLYXdxPoqvqKHdz/kO745BHEOZFZQRodmQBlUTImUVoZsEvMAy
         rcug==
X-Gm-Message-State: APjAAAV8kQkf538/JCVwP/rNrnrn5I40OnT893rXgM8MUHSc2HO1Yifw
        DwLDYkyZH8V8x51+3saEC3ognTxX
X-Google-Smtp-Source: APXvYqzcSpCck+UT7Ghj0TTpKooK3mxXF2TL6BlY/Ym3WQqS3quDsYxlB+fmZ6ccumqgXJB13vgDbg==
X-Received: by 2002:a63:1d1a:: with SMTP id d26mr101185769pgd.98.1578240216049;
        Sun, 05 Jan 2020 08:03:36 -0800 (PST)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id k1sm70554993pgk.90.2020.01.05.08.03.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 05 Jan 2020 08:03:35 -0800 (PST)
Subject: Re: [RFC PATCH hwmon-next v1 5/5] hwmon: (pmbus/tps53679) Extend
 device list supported by driver
To:     Vadim Pasternak <vadimp@mellanox.com>, robh+dt@kernel.org,
        vijaykhemka@fb.com
Cc:     linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org
References: <20200105105833.30196-1-vadimp@mellanox.com>
 <20200105105833.30196-6-vadimp@mellanox.com>
From:   Guenter Roeck <linux@roeck-us.net>
Message-ID: <567ebd26-529e-6b2a-2f07-cfaf0f2217a9@roeck-us.net>
Date:   Sun, 5 Jan 2020 08:03:33 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <20200105105833.30196-6-vadimp@mellanox.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-hwmon-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On 1/5/20 2:58 AM, Vadim Pasternak wrote:
> Extends driver with support of the additional devices:
> Texas Instruments Dual channel DCAP+ multiphase controllers: TPS53688,
> SN1906016.
> Infineon Multi-phase Digital VR Controller Sierra devices
> XDPE12286C, XDPE12284C, XDPE12283C, XDPE12254C and XDPE12250C.
> 
> Extend Kconfig with added devices.
> 
> Signed-off-by: Vadim Pasternak <vadimp@mellanox.com>
> ---
>   drivers/hwmon/pmbus/Kconfig    |  5 +++--
>   drivers/hwmon/pmbus/tps53679.c | 14 ++++++++++++++
>   2 files changed, 17 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/hwmon/pmbus/Kconfig b/drivers/hwmon/pmbus/Kconfig
> index 59859979571d..9e3d197d5322 100644
> --- a/drivers/hwmon/pmbus/Kconfig
> +++ b/drivers/hwmon/pmbus/Kconfig
> @@ -200,10 +200,11 @@ config SENSORS_TPS40422
>   	  be called tps40422.
>   
>   config SENSORS_TPS53679
> -	tristate "TI TPS53679"
> +	tristate "TI TPS53679, TPS53688, SN1906016, Infineon XDPE122xxx family"
>   	help
>   	  If you say yes here you get hardware monitoring support for TI
> -	  TPS53679.
> +	  TPS53679, PS53688, SN1906016 and Infineon XDPE12286C, XDPE12284C,

TPS53688. For the others, for some I can't even determine if they exist
in the first place (eg SN1906016, XPDE12250C) or how they would differ
from other variants (eg XPDE12284C vs. XPDE12284A).
And why would they all use the same bit map in the VOUT_MODE register,
the same number of PMBus pages (phases), and the same attributes in each
page ?

Thanks,
Guenter

> +	  XDPE12283C, XDPE12254C, XDPE12250C devices.
>   
>   	  This driver can also be built as a module. If so, the module will
>   	  be called tps53679.
> diff --git a/drivers/hwmon/pmbus/tps53679.c b/drivers/hwmon/pmbus/tps53679.c
> index 7ce2fca4acde..f38eb116735b 100644
> --- a/drivers/hwmon/pmbus/tps53679.c
> +++ b/drivers/hwmon/pmbus/tps53679.c
> @@ -89,6 +89,13 @@ static int tps53679_probe(struct i2c_client *client,
>   
>   static const struct i2c_device_id tps53679_id[] = {
>   	{"tps53679", 0},
> +	{"tps53688", 0},
> +	{"sn1906016", 0},
> +	{"xdpe12283c", 0},
> +	{"xdpe12250c", 0},
> +	{"xdpe12254c", 0},
> +	{"xdpe12284c", 0},
> +	{"xdpe12286c", 0},

Alphabetic order, please.

>   	{}
>   };
>   
> @@ -96,6 +103,13 @@ MODULE_DEVICE_TABLE(i2c, tps53679_id);
>   
>   static const struct of_device_id __maybe_unused tps53679_of_match[] = {
>   	{.compatible = "ti,tps53679"},
> +	{.compatible = "ti,tps53688"},
> +	{.compatible = "ti,sn1906016"},
> +	{.compatible = "infineon,xdpe12283c"},
> +	{.compatible = "infineon,xdpe12250c"},
> +	{.compatible = "infineon,xdpe12254c"},
> +	{.compatible = "infineon,xdpe12284c"},
> +	{.compatible = "infineon,xdpe12286c"},
>   	{}
>   };
>   MODULE_DEVICE_TABLE(of, tps53679_of_match);
> 

