Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.6 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1C7DEC433F5
	for <linux-hwmon@archiver.kernel.org>; Tue,  7 Sep 2021 15:37:11 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id EE3AD61052
	for <linux-hwmon@archiver.kernel.org>; Tue,  7 Sep 2021 15:37:10 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1345573AbhIGPiP (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Tue, 7 Sep 2021 11:38:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58730 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1345539AbhIGPiM (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Tue, 7 Sep 2021 11:38:12 -0400
Received: from mail-ot1-x335.google.com (mail-ot1-x335.google.com [IPv6:2607:f8b0:4864:20::335])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7B050C061757;
        Tue,  7 Sep 2021 08:37:06 -0700 (PDT)
Received: by mail-ot1-x335.google.com with SMTP id v33-20020a0568300921b0290517cd06302dso13240083ott.13;
        Tue, 07 Sep 2021 08:37:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=sender:subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=qzCAbQreV5TwH9yFWvlUXyDFt9CTh5w89/ws6dlPyBw=;
        b=hSLPWR4VnM2jFIIdOs4giUmW0OkYDRAnrYH2ryAokITl0Y+3nmLYRHFCQPTcqwYzqZ
         JMfaaN+LF0CxJdaoFtfjWOMzxQreQKFuIMt9binkJdXIN7yLyxwq7u0h20Fl2eL0Jrwg
         4StXm0is02oODkUMZ2dcn7l/8oay4qQXtznHjHwXaUgcWSpiWgVwBhNEo81xrV0Uhwle
         QjbiQk1YtgywxqHMhrFWyJXppdZNvH+mytDqOPxpOMEjNYCJc0WzqzpB9AhuE5gwtXwJ
         a4F99INXeBZy6Ooh+Bb5f81+kh5D1ya6wvpUGnB+Sxa4HNskhig73dqzQ0mKREVP63ru
         fHYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=qzCAbQreV5TwH9yFWvlUXyDFt9CTh5w89/ws6dlPyBw=;
        b=iBmCmoWkyKezX20/b+T8OCm8EjQGqo+vvPJwO/qJb51hR2R2mUbx78C/eu0xPVoqca
         J+HZJvEClubBblceAr/FHeQ4XB8dRGm1DZzAWExPD7HTqRqIY1+4ofCxgwNK2ZLf4dYP
         rKTl2gLJilIZoyjQuoq2Wq59oQX/1LEay09ZPD/VWcIcAHNPA8H3wSRIcPmM6GbK6oTy
         l492GPxfws2au/BjJAjWk98lJnVbNuM5tK+b9goHQk9oQa4fDwlWSQqt1Kq+Y7u80ioW
         UgEjtcej6OV3Gb9e1nlKd4JKMnRkBBJlKlwVOhHH8olf9B9mcK6g3ZKGYM8qVTZJrRBD
         ih/Q==
X-Gm-Message-State: AOAM530JtiAnZyEw41pRCslPwoJ2ayKY5boMaHhTDACkf3DffWkfFcqy
        RlNSd6+j18zI7UWZJhBEo5fJ7yMKMEE=
X-Google-Smtp-Source: ABdhPJzjWz8eFX2KR6nRurdk4R95LdYZknvbSP8QCRNg6MCxKUNdt2QmjnvcWAFKRwjB3iiTmOOyuQ==
X-Received: by 2002:a05:6830:1d8c:: with SMTP id y12mr16201621oti.362.1631029025625;
        Tue, 07 Sep 2021 08:37:05 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id 186sm2266590ood.39.2021.09.07.08.37.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 07 Sep 2021 08:37:05 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Subject: Re: [PATCH 7/8] hwmon: (tmp421) really disable channels
To:     Krzysztof Adamski <krzysztof.adamski@nokia.com>,
        Jean Delvare <jdelvare@suse.com>
Cc:     Rob Herring <robh+dt@kernel.org>, linux-hwmon@vger.kernel.org,
        devicetree@vger.kernel.org
References: <cover.1631021349.git.krzysztof.adamski@nokia.com>
 <d0a1be24701dcf19a2f7501a9bc7fddf2b739792.1631021349.git.krzysztof.adamski@nokia.com>
From:   Guenter Roeck <linux@roeck-us.net>
Message-ID: <4392497d-22fe-b9df-cde1-73ff7b6a8d4e@roeck-us.net>
Date:   Tue, 7 Sep 2021 08:37:03 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <d0a1be24701dcf19a2f7501a9bc7fddf2b739792.1631021349.git.krzysztof.adamski@nokia.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On 9/7/21 6:46 AM, Krzysztof Adamski wrote:
> Recent patch added possibility to disable selected channels. That would
> only make sure that the ENODATA is returned for those channels but would
> not configure the actual hardware.
> 
> With this patch, the config register is written to make sure the
> channels are disabled also at hardware level.
> 
> Signed-off-by: Krzysztof Adamski <krzysztof.adamski@nokia.com>
> ---
>   drivers/hwmon/tmp421.c | 35 ++++++++++++++++++++++++++++++++---
>   1 file changed, 32 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/hwmon/tmp421.c b/drivers/hwmon/tmp421.c
> index 90c6b094785e..cec25fb1c771 100644
> --- a/drivers/hwmon/tmp421.c
> +++ b/drivers/hwmon/tmp421.c
> @@ -33,6 +33,8 @@ enum chips { tmp421, tmp422, tmp423, tmp441, tmp442 };
>   /* The TMP421 registers */
>   #define TMP421_STATUS_REG			0x08
>   #define TMP421_CONFIG_REG_1			0x09
> +#define TMP421_CONFIG_REG_2			0x0A
> +#define TMP421_CONFIG_REG_REN(x)		(BIT(3 + (x)))
>   #define TMP421_CONVERSION_RATE_REG		0x0B
>   #define TMP421_N_FACTOR_REG_1			0x21
>   #define TMP421_MANUFACTURER_ID_REG		0xFE
> @@ -351,6 +353,25 @@ void tmp421_probe_from_dt(struct i2c_client *client, struct tmp421_data *data)
>   	}
>   }
>   
> +void tmp421_disable_channels(struct i2c_client *client, uint8_t mask)
> +{
> +	int err;
> +	int cfg = i2c_smbus_read_byte_data(client, TMP421_CONFIG_REG_2);
> +
> +	if (cfg < 0) {
> +		dev_err(&client->dev,
> +			"error reading register, can't disable channels\n");
> +		return;
> +	}
> +
> +	cfg &= ~mask;
> +
> +	err = i2c_smbus_write_byte_data(client, TMP421_CONFIG_REG_2, cfg);
> +	if (err < 0)
> +		dev_err(&client->dev,
> +			"error writing register, can't disable channels\n");
> +}
> +
>   static const struct hwmon_ops tmp421_ops = {
>   	.is_visible = tmp421_is_visible,
>   	.read = tmp421_read,
> @@ -363,6 +384,7 @@ static int tmp421_probe(struct i2c_client *client)
>   	struct device *hwmon_dev;
>   	struct tmp421_data *data;
>   	int i, err;
> +	u8 disable = 0;
>   
>   	data = devm_kzalloc(dev, sizeof(struct tmp421_data), GFP_KERNEL);
>   	if (!data)
> @@ -380,11 +402,18 @@ static int tmp421_probe(struct i2c_client *client)
>   	if (err)
>   		return err;
>   
> -	for (i = 0; i < data->channels; i++)
> -		data->temp_config[i] = HWMON_T_INPUT | HWMON_T_FAULT;
> -
>   	tmp421_probe_from_dt(client, data);
>   
> +	for (i = 0; i < data->channels; i++) {
> +		data->temp_config[i] |= HWMON_T_INPUT | HWMON_T_FAULT;
> +		if (data->channel[i].disabled)
> +			disable |= TMP421_CONFIG_REG_REN(i);
> +
> +	}
> +
> +	if (disable)
> +		tmp421_disable_channels(client, disable);
> +

This doesn't take into account that channels may already be disabled
by the BIOS/ROMMON. The code will have to set the channel status explicitly
for all channels if configured through dt, or read it from the chip
otherwise. Also, as mentioned, the sysfs attribute should be supported
as well (meaning it should also be possible to enable a channel).

Guenter

>   	data->chip.ops = &tmp421_ops;
>   	data->chip.info = data->info;
>   
> 

