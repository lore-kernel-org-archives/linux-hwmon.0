Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 923D0C433F5
	for <linux-hwmon@archiver.kernel.org>; Fri, 15 Oct 2021 22:53:12 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 779446105A
	for <linux-hwmon@archiver.kernel.org>; Fri, 15 Oct 2021 22:53:12 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243397AbhJOWzS (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Fri, 15 Oct 2021 18:55:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58770 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S243388AbhJOWzS (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Fri, 15 Oct 2021 18:55:18 -0400
Received: from mail-oo1-xc33.google.com (mail-oo1-xc33.google.com [IPv6:2607:f8b0:4864:20::c33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7E43AC061570;
        Fri, 15 Oct 2021 15:53:11 -0700 (PDT)
Received: by mail-oo1-xc33.google.com with SMTP id u5-20020a4ab5c5000000b002b6a2a05065so3476486ooo.0;
        Fri, 15 Oct 2021 15:53:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=/g1O94RkwembzAc8QIZU1CKwrXJ/7NdqAutjeKhjpl8=;
        b=jiwTqqvSE4T6R2IbIWoz7/O10ElB9eAaUiO2kkXbV91030yre75MalZOFhtXsh/xtn
         4HmN71rLGVq9i/kEim3jAk+V6v0O9g/8aeIwqKKoiWjZtWu4LvMK9Od1IB1+fOJLpEIh
         az7MGDAVARHBoXKBRRdkqShMnywgdOZwpGj9+sQgLgred0H0fA03eXAQNOrA90ak9Clh
         81xwNFwjvFIFq2h/zWKBcaLLVvMNzzbHFbvzEfJL/YuGI4lOvbLP+ZgJKFkp1uQWGjTT
         mj9YVwm9aaXD9f7X9XQ1QEflPbu7u8gCMkth/2Ra69bbBXUH+LtKRBxwt82NfajSED+q
         okpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition:in-reply-to;
        bh=/g1O94RkwembzAc8QIZU1CKwrXJ/7NdqAutjeKhjpl8=;
        b=kO+iPZ20UZCVs2f0LyrQj1DeOEnmgVvMldfJeg/qkKWrcwKUO/gVsICQhoVdV1N+ol
         aWG30Xaq6LranTfZq8ai6FwOIbCWj+aEvwsRDjrK6osr96XI6EVYvnF7dCiYAq0WGawR
         Xj548Z2tT3sjWL35MmJgEdUR9o5Fn/6Xlhk2nmXU7EViLQR7zuLvCd47ph3UsA/3lel8
         YadiJzXDccxh+haIkgnBoK5esWvjlae2bq9Y1y8AEZPikK14ojQ06u1u47Y2a7M7wP3N
         2FwyFwq6POhG9SGgygK0qxG9iM4IlKT+deYjlFWvXOWHSRsjh0tYbloWPBwkmrLoiWJp
         z/Pw==
X-Gm-Message-State: AOAM533SRG4lxxDCiiV14Gx4/hibpqgQ4uExgZvrJr3JrrqYO8C6MsKb
        lGeoR6D6Rj/UNJU1Ml1/EOdkb6hWnTU=
X-Google-Smtp-Source: ABdhPJzYoYeL7rvQkYyivtBD25bz8ribLMtGLAxT9bwn+S7v/UfsdG/bqBnrVlvfMSjnfrO5jTRCVg==
X-Received: by 2002:a4a:3859:: with SMTP id o25mr10837494oof.10.1634338390809;
        Fri, 15 Oct 2021 15:53:10 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id bg16sm1681756oib.30.2021.10.15.15.53.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 Oct 2021 15:53:10 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date:   Fri, 15 Oct 2021 15:53:09 -0700
From:   Guenter Roeck <linux@roeck-us.net>
To:     Krzysztof Adamski <krzysztof.adamski@nokia.com>
Cc:     Jean Delvare <jdelvare@suse.com>, Rob Herring <robh+dt@kernel.org>,
        linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v5 5/9] hwmon: (tmp421) really disable channels
Message-ID: <20211015225309.GA1485429@roeck-us.net>
References: <cover.1634206677.git.krzysztof.adamski@nokia.com>
 <d451cacdf21bf8eff38a47c055aad8c0c6e8755a.1634206677.git.krzysztof.adamski@nokia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <d451cacdf21bf8eff38a47c055aad8c0c6e8755a.1634206677.git.krzysztof.adamski@nokia.com>
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On Thu, Oct 14, 2021 at 03:09:08PM +0200, Krzysztof Adamski wrote:
> Recent patch added possibility to disable selected channels. That would
> only make sure that the ENODATA is returned for those channels but would
> not configure the actual hardware.
> 
> With this patch, the config register is written to make sure the
> channels are disabled also at hardware level.
> 
> Signed-off-by: Krzysztof Adamski <krzysztof.adamski@nokia.com>

Applied, again after "s/^  / /"

Guenter

> ---
>  drivers/hwmon/tmp421.c | 44 ++++++++++++++++++++++++++++++++++++------
>  1 file changed, 38 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/hwmon/tmp421.c b/drivers/hwmon/tmp421.c
> index 606914f20910..b402e81ae5d5 100644
> --- a/drivers/hwmon/tmp421.c
> +++ b/drivers/hwmon/tmp421.c
> @@ -33,6 +33,9 @@ enum chips { tmp421, tmp422, tmp423, tmp441, tmp442 };
>  /* The TMP421 registers */
>  #define TMP421_STATUS_REG			0x08
>  #define TMP421_CONFIG_REG_1			0x09
> +#define TMP421_CONFIG_REG_2			0x0A
> +#define TMP421_CONFIG_REG_REN(x)		(BIT(3 + (x)))
> +#define TMP421_CONFIG_REG_REN_MASK		GENMASK(6, 3)
>  #define TMP421_CONVERSION_RATE_REG		0x0B
>  #define TMP421_N_FACTOR_REG_1			0x21
>  #define TMP421_MANUFACTURER_ID_REG		0xFE
> @@ -162,6 +165,34 @@ static int tmp421_update_device(struct tmp421_data *data)
>  	return 0;
>  }
>  
> +static int tmp421_enable_channels(struct tmp421_data *data)
> +{
> +	int err;
> +	struct i2c_client *client = data->client;
> +	struct device *dev = &client->dev;
> +	int old = i2c_smbus_read_byte_data(client, TMP421_CONFIG_REG_2);
> +	int new, i;
> +
> +	if (old < 0) {
> +		dev_err(dev, "error reading register, can't disable channels\n");
> +		return old;
> +	}
> +
> +	new = old & ~TMP421_CONFIG_REG_REN_MASK;
> +	for (i = 0; i < data->channels; i++)
> +		if (data->channel[i].enabled)
> +			new |= TMP421_CONFIG_REG_REN(i);
> +
> +	if (new == old)
> +		return 0;
> +
> +	err = i2c_smbus_write_byte_data(client, TMP421_CONFIG_REG_2, new);
> +	if (err < 0)
> +		dev_err(dev, "error writing register, can't disable channels\n");
> +
> +	return err;
> +}
> +
>  static int tmp421_read(struct device *dev, enum hwmon_sensor_types type,
>  		       u32 attr, int channel, long *val)
>  {
> @@ -217,9 +248,10 @@ static umode_t tmp421_is_visible(const void *data, enum hwmon_sensor_types type,
>  	}
>  }
>  
> -static int tmp421_init_client(struct i2c_client *client)
> +static int tmp421_init_client(struct tmp421_data *data)
>  {
>  	int config, config_orig;
> +	struct i2c_client *client = data->client;
>  
>  	/* Set the conversion rate to 2 Hz */
>  	i2c_smbus_write_byte_data(client, TMP421_CONVERSION_RATE_REG, 0x05);
> @@ -240,7 +272,7 @@ static int tmp421_init_client(struct i2c_client *client)
>  		i2c_smbus_write_byte_data(client, TMP421_CONFIG_REG_1, config);
>  	}
>  
> -	return 0;
> +	return tmp421_enable_channels(data);
>  }
>  
>  static int tmp421_detect(struct i2c_client *client,
> @@ -391,10 +423,6 @@ static int tmp421_probe(struct i2c_client *client)
>  		data->channels = i2c_match_id(tmp421_id, client)->driver_data;
>  	data->client = client;
>  
> -	err = tmp421_init_client(client);
> -	if (err)
> -		return err;
> -
>  	for (i = 0; i < data->channels; i++) {
>  		data->temp_config[i] = HWMON_T_INPUT | HWMON_T_FAULT;
>  		data->channel[i].enabled = true;
> @@ -404,6 +432,10 @@ static int tmp421_probe(struct i2c_client *client)
>  	if (err)
>  		return err;
>  
> +	err = tmp421_init_client(data);
> +	if (err)
> +		return err;
> +
>  	data->chip.ops = &tmp421_ops;
>  	data->chip.info = data->info;
>  
