Return-Path: <SRS0=3WuK=S4=vger.kernel.org=linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3050EC43219
	for <linux-hwmon@archiver.kernel.org>; Fri, 26 Apr 2019 12:44:16 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 00D5B206C1
	for <linux-hwmon@archiver.kernel.org>; Fri, 26 Apr 2019 12:44:15 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="juisgAUq"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726060AbfDZMoP (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Fri, 26 Apr 2019 08:44:15 -0400
Received: from mail-pl1-f196.google.com ([209.85.214.196]:35278 "EHLO
        mail-pl1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726025AbfDZMoP (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Fri, 26 Apr 2019 08:44:15 -0400
Received: by mail-pl1-f196.google.com with SMTP id w24so1542826plp.2
        for <linux-hwmon@vger.kernel.org>; Fri, 26 Apr 2019 05:44:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:subject:to:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=CVM2xc3Y4sLbrXjdESNIWNZ7fBVgfG5voeHNAlfSsyM=;
        b=juisgAUq/tOi6sNCGjV8a6i8/QubjN1dLM6OF2fLJy3XGFR/CoXcSdG6eNtGyXikXI
         IJu5+6Zn56JkbVZZ51aMETGty8ZoSxi07k1qnmeimNB+5l8Xz+qt+l8Y1x8efXdpwD5k
         hNmA33N5CojYqKCV+AvSe7et8PQfNDGEiKlzntkzmdI17KEQb6LbsO9lSXG2gFXNybc/
         zeAh5SJQLKzkqMD6iSupZKk1tjtrjd+nwTdD3vdnlmnh97ebCRrc3e0CY98AOUZK1+OJ
         EFwBLZWBZ7gfBhcTLVL0x8SQHOXq+nOdEolbrDf1YfMrXVY2bGdaFm7CPHB1qbyi28Xa
         RhiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:subject:to:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=CVM2xc3Y4sLbrXjdESNIWNZ7fBVgfG5voeHNAlfSsyM=;
        b=Mpx4WOwBCAYIbB8bYZV/hJQYtZX9jzAnpGBGVLdmvZPzA5q2I2xHKgqCrfev/xydkx
         bTkufiiJ5vrlLGLgro/4vCrRtHOBGd6mI/oK4Lxhj27u5Lx9MClfjQ1PdvdvPYCCpP3n
         k/uNYjTZjgOZygUQLQH9qJRk9ciNfNkUBoGmKiDFvX2PpO4EkuZNLjhczIdVayqH0Z6N
         bknmRSV3CmAtn/Y/T+YFBsDJNz5x6s2uO7XRSFrvzGvDEk84sFiQZ+dpq8kkdQhpsQR+
         eKviaq6kMWdHIBpb7ri6DJZ4WYNVDRTE60GNLtviazwsaR1h7bTW8ohld352q9fWid6D
         hP8w==
X-Gm-Message-State: APjAAAUT6h+W5DCwzIm0IdLdIsJIpbNXJMR8gy2TqpxX92QUT4z8r+nN
        7Z4YGbiI/Ag0+idBtLaGr+ZIj5C7
X-Google-Smtp-Source: APXvYqzbbcJTbEgnoGbRJejP0sXHsrvyj+vrBs4Oj7rlLxc7Ea6uf07UeOQ4VWzobVl/fsPI++3xKA==
X-Received: by 2002:a17:902:8d89:: with SMTP id v9mr46759299plo.230.1556282653777;
        Fri, 26 Apr 2019 05:44:13 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id w10sm37495999pfi.126.2019.04.26.05.44.11
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 26 Apr 2019 05:44:12 -0700 (PDT)
Subject: Re: [PATCH] hwmon: (lm75) Add support for TMP75B
To:     Iker Perez del Palomar <iker.perez@codethink.co.uk>,
        linux-hwmon@vger.kernel.org
References: <7082731b-ccd8-d16c-8f10-6f4e550ecd18@codethink.co.uk>
 <ded895e5-974e-b1e1-937c-f228bc157dbe@codethink.co.uk>
From:   Guenter Roeck <linux@roeck-us.net>
Message-ID: <30409949-fc40-aae9-14cd-16b13a6379de@roeck-us.net>
Date:   Fri, 26 Apr 2019 05:44:11 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <ded895e5-974e-b1e1-937c-f228bc157dbe@codethink.co.uk>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-hwmon-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On 4/26/19 12:42 AM, Iker Perez del Palomar wrote:
> The TMP75B has a different control register, supports 12-bit
> resolution and the default conversion rate is 37 Hz.
> 
> dt-bindings: hwmon: Add tmp75b to lm75.txt
> 
> Signed-off-by: Iker Perez del Palomar Sustatxa <iker.perez@codethink.co.uk>

This patch is corrupted (line wraps as far as I can see). Also, please
version your patches, and add a version log, as described in
Documentation/process/submitting-patches.rst.

Also, please run checkpatch and fix the problems it reports.
That includes the line wraps, but there is also a bad assignment.

Thanks,
Guenter

> ---
>   Documentation/devicetree/bindings/hwmon/lm75.txt |  1 +
>   Documentation/hwmon/lm75                         |  5 +++--
>   drivers/hwmon/lm75.c                             | 11 +++++++++++
>   3 files changed, 15 insertions(+), 2 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/hwmon/lm75.txt
> b/Documentation/devicetree/bindings/hwmon/lm75.txt
> index 12d8cf7cf592..586b5ed70be7 100644
> --- a/Documentation/devicetree/bindings/hwmon/lm75.txt
> +++ b/Documentation/devicetree/bindings/hwmon/lm75.txt
> @@ -25,6 +25,7 @@ Required properties:
>   		"ti,tmp175",
>   		"ti,tmp275",
>   		"ti,tmp75",
> +		"ti,tmp75b",
>   		"ti,tmp75c",
> 
>   - reg: I2C bus address of the device
> diff --git a/Documentation/hwmon/lm75 b/Documentation/hwmon/lm75
> index 010583608f12..baf052935761 100644
> --- a/Documentation/hwmon/lm75
> +++ b/Documentation/hwmon/lm75
> @@ -47,8 +47,8 @@ Supported chips:
>       Addresses scanned: none
>       Datasheet: Publicly available at the ST website
>   	       https://www.st.com/resource/en/datasheet/stlm75.pdf
> -  * Texas Instruments TMP100, TMP101, TMP105, TMP112, TMP75, TMP75C,
> TMP175, TMP275
> -    Prefixes: 'tmp100', 'tmp101', 'tmp105', 'tmp112', 'tmp175',
> 'tmp75', 'tmp75c', 'tmp275'
> +  * Texas Instruments TMP100, TMP101, TMP105, TMP112, TMP75, TMP75B,
> TMP75C, TMP175, TMP275
> +    Prefixes: 'tmp100', 'tmp101', 'tmp105', 'tmp112', 'tmp175',
> 'tmp75', 'tmp75b', 'tmp75c', 'tmp275'
>       Addresses scanned: none
>       Datasheet: Publicly available at the Texas Instruments website
>                  http://www.ti.com/product/tmp100
> @@ -56,6 +56,7 @@ Supported chips:
>                  http://www.ti.com/product/tmp105
>                  http://www.ti.com/product/tmp112
>                  http://www.ti.com/product/tmp75
> +               http://www.ti.com/product/tmp75b
>                  http://www.ti.com/product/tmp75c
>                  http://www.ti.com/product/tmp175
>                  http://www.ti.com/product/tmp275
> diff --git a/drivers/hwmon/lm75.c b/drivers/hwmon/lm75.c
> index 447af07450f1..5e730788bf5f 100644
> --- a/drivers/hwmon/lm75.c
> +++ b/drivers/hwmon/lm75.c
> @@ -59,6 +59,7 @@ enum lm75_type {		/* keep sorted in alphabetical order */
>   	tmp175,
>   	tmp275,
>   	tmp75,
> +	tmp75b,
>   	tmp75c,
>   };
> 
> @@ -378,6 +379,11 @@ lm75_probe(struct i2c_client *client, const struct
> i2c_device_id *id)
>   		data->resolution = 12;
>   		data->sample_time = MSEC_PER_SEC / 2;
>   		break;
> +	case tmp75b:
> +		clr_mask |= 1 << 15;    /* not one-shot mode */
> +		data->resolution = 12;
> +		data->sample_time = MSEC_PER_SEC / 4;
> +		break;
>   	case tmp75c:
>   		clr_mask |= 1 << 5;		/* not one-shot mode */
>   		data->resolution = 12;
> @@ -438,6 +444,7 @@ static const struct i2c_device_id lm75_ids[] = {
>   	{ "tmp175", tmp175, },
>   	{ "tmp275", tmp275, },
>   	{ "tmp75", tmp75, },
> +	{ "tmp75b", tmp75b, },
>   	{ "tmp75c", tmp75c, },
>   	{ /* LIST END */ }
>   };
> @@ -537,6 +544,10 @@ static const struct of_device_id lm75_of_match[] = {
>   		.data = (void *)tmp75
>   	},
>   	{
> +		.compatible = "ti,tmp75b",
> +		.data=(void *)tmp75b
> +	},
> +	{
>   		.compatible = "ti,tmp75c",
>   		.data = (void *)tmp75c
>   	},
> 

