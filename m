Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3281DC433EF
	for <linux-hwmon@archiver.kernel.org>; Tue, 12 Oct 2021 14:38:02 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 18ACF60EB4
	for <linux-hwmon@archiver.kernel.org>; Tue, 12 Oct 2021 14:38:02 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237266AbhJLOkD (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Tue, 12 Oct 2021 10:40:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33618 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235294AbhJLOkC (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Tue, 12 Oct 2021 10:40:02 -0400
Received: from mail-oo1-xc33.google.com (mail-oo1-xc33.google.com [IPv6:2607:f8b0:4864:20::c33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0A4F5C061570;
        Tue, 12 Oct 2021 07:38:01 -0700 (PDT)
Received: by mail-oo1-xc33.google.com with SMTP id i1-20020a4ab241000000b002b7069d0e88so1658833ooo.5;
        Tue, 12 Oct 2021 07:38:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=sender:subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=zEtpO9hq8rB/L5sNcG9D1sqxQOc2Z+aKTsmVJB788Z8=;
        b=iwCHDg8O/m+iDZ73DL/r+rl/QH5HopwaeL+mdraCbBk9785FD/E0wosD5+ugf77W2K
         g66gyEsfsDPTAYB9hVuVHn3u4jfkBqm2XVkq+VUfIDEMhgmzIWK5OZg2REEZ9opnBvxl
         jsDZt9KZVr1q0cghbvooOrZ56jU1D9NfG0uESuYXAdRYHN+LW/YCvchEgauHvkqx+f50
         Nu+J8XAi1dlYacU+ktGgvKwvwnZ1OZF/3ZzxzFrwSwkuH6zpfc/MFEf33tPtsjdge+Iv
         TsTl3DcyXB/hAha6PIr0wuQYyaR7EKDBVtDSIU9ADQXLN4TffM2KiP76xrGA/84lmvge
         dEfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=zEtpO9hq8rB/L5sNcG9D1sqxQOc2Z+aKTsmVJB788Z8=;
        b=o1UNQvpb1G/+6zN7RMAfME4uGXBu0lS13oNSMME28R8PWevbV3WpUR3cWBsTjzcOJe
         w3zQUeVgzaNrkHBXT2JVjjEqMcgZGDX7JJ5tsOLJk79938aB6VzeEloCcqYaWdd21WD5
         ZBXmk+uCRjwo23/kJUzDFfBNkCW1wf8CuvfI3eTUFyX0CyHmLpcC+zr2x3NZeX/Nq591
         yWrKiXsQfYbTt5PFFihPcrwWIBz+XO/bI6GjFA+m6iOdbQpnRNoAWfOtCpGyCW7ksCFK
         76QuCL2EfaIeRhh96h5xCJVJvUb9hMYnkZv01/iy8CDpck5F620wFOMj7OuoSrplCLTh
         ERsw==
X-Gm-Message-State: AOAM531Oz+MBO6k78d9FCHKTdAIAyrma2H/bcxzFrS407yFQCPlEU+TY
        KF9p3uZxAwULvzsLXaCX+C2gCrCoiD4=
X-Google-Smtp-Source: ABdhPJw1QOOtNYnr7ENvnd6mfTZkJPOvQcYkdg+3Bi9mwrGljX82Dk50dszTgtTkmsGmUM8hMYwwTQ==
X-Received: by 2002:a4a:b282:: with SMTP id k2mr23396028ooo.11.1634049480102;
        Tue, 12 Oct 2021 07:38:00 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id bb39sm2395160oib.28.2021.10.12.07.37.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 12 Oct 2021 07:37:59 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Subject: Re: [PATCH v4 06/10] hwmon: (tmp421) really disable channels
To:     Krzysztof Adamski <krzysztof.adamski@nokia.com>,
        Jean Delvare <jdelvare@suse.com>
Cc:     Rob Herring <robh+dt@kernel.org>, linux-hwmon@vger.kernel.org,
        devicetree@vger.kernel.org
References: <cover.1634029538.git.krzysztof.adamski@nokia.com>
 <eaee0947c813b04b77ee8364724d1a406dccc33b.1634029538.git.krzysztof.adamski@nokia.com>
From:   Guenter Roeck <linux@roeck-us.net>
Message-ID: <f3d5de1f-37c6-f897-b504-137699c9de4e@roeck-us.net>
Date:   Tue, 12 Oct 2021 07:37:58 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <eaee0947c813b04b77ee8364724d1a406dccc33b.1634029538.git.krzysztof.adamski@nokia.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On 10/12/21 2:29 AM, Krzysztof Adamski wrote:
> Recent patch added possibility to disable selected channels. That would
> only make sure that the ENODATA is returned for those channels but would
> not configure the actual hardware.
> 
> With this patch, the config register is written to make sure the
> channels are disabled also at hardware level.
> 
> Signed-off-by: Krzysztof Adamski <krzysztof.adamski@nokia.com>
> ---
>   drivers/hwmon/tmp421.c | 41 +++++++++++++++++++++++++++++++++++------
>   1 file changed, 35 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/hwmon/tmp421.c b/drivers/hwmon/tmp421.c
> index fcd2932a6ddb..45cb197cd277 100644
> --- a/drivers/hwmon/tmp421.c
> +++ b/drivers/hwmon/tmp421.c
> @@ -33,6 +33,9 @@ enum chips { tmp421, tmp422, tmp423, tmp441, tmp442 };
>   /* The TMP421 registers */
>   #define TMP421_STATUS_REG			0x08
>   #define TMP421_CONFIG_REG_1			0x09
> +#define TMP421_CONFIG_REG_2			0x0A
> +#define TMP421_CONFIG_REG_REN(x)		(BIT(3 + (x)))
> +#define TMP421_CONFIG_REG_REN_MASK		GENMASK(6, 3)
>   #define TMP421_CONVERSION_RATE_REG		0x0B
>   #define TMP421_N_FACTOR_REG_1			0x21
>   #define TMP421_MANUFACTURER_ID_REG		0xFE
> @@ -162,6 +165,31 @@ static int tmp421_update_device(struct tmp421_data *data)
>   	return 0;
>   }
>   
> +static int tmp421_enable_channels(struct tmp421_data *data)
> +{
> +	int err;
> +	struct i2c_client *client = data->client;
> +	struct device *dev = &client->dev;
> +	int cfg = i2c_smbus_read_byte_data(client, TMP421_CONFIG_REG_2);
> +	int i;
> +
> +	if (cfg < 0) {
> +		dev_err(dev, "error reading register, can't disable channels\n");
> +		return err;

		return cfg;

> +	}
> +
> +	cfg &= ~TMP421_CONFIG_REG_REN_MASK;
> +	for (i = 0; i < data->channels; i++)
> +		if (data->channel[i].enabled)
> +			cfg |= TMP421_CONFIG_REG_REN(i);
> +
> +	err = i2c_smbus_write_byte_data(client, TMP421_CONFIG_REG_2, cfg);

Please make the write optional: It is only necessary if the old register
value differs from the new register value.

> +	if (err < 0)
> +		dev_err(dev, "error writing register, can't disable channels\n");
> +
> +	return err;
> +}
> +
>   static int tmp421_read(struct device *dev, enum hwmon_sensor_types type,
>   		       u32 attr, int channel, long *val)
>   {
> @@ -217,9 +245,10 @@ static umode_t tmp421_is_visible(const void *data, enum hwmon_sensor_types type,
>   	}
>   }
>   
> -static int tmp421_init_client(struct i2c_client *client)
> +static int tmp421_init_client(struct tmp421_data *data)
>   {
>   	int config, config_orig;
> +	struct i2c_client *client = data->client;
>   
>   	/* Set the conversion rate to 2 Hz */
>   	i2c_smbus_write_byte_data(client, TMP421_CONVERSION_RATE_REG, 0x05);
> @@ -240,7 +269,7 @@ static int tmp421_init_client(struct i2c_client *client)
>   		i2c_smbus_write_byte_data(client, TMP421_CONFIG_REG_1, config);
>   	}
>   
> -	return 0;
> +	return tmp421_enable_channels(data);
>   }
>   
>   static int tmp421_detect(struct i2c_client *client,
> @@ -389,10 +418,6 @@ static int tmp421_probe(struct i2c_client *client)
>   		data->channels = i2c_match_id(tmp421_id, client)->driver_data;
>   	data->client = client;
>   
> -	err = tmp421_init_client(client);
> -	if (err)
> -		return err;
> -
>   	for (i = 0; i < data->channels; i++) {
>   		data->temp_config[i] = HWMON_T_INPUT | HWMON_T_FAULT;
>   		data->channel[i].enabled = true;
> @@ -402,6 +427,10 @@ static int tmp421_probe(struct i2c_client *client)
>   	if (err)
>   		return err;
>   
> +	err = tmp421_init_client(data);
> +	if (err)
> +		return err;
> +
>   	data->chip.ops = &tmp421_ops;
>   	data->chip.info = data->info;
>   
> 

