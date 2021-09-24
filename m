Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9E3C8C433FE
	for <linux-hwmon@archiver.kernel.org>; Fri, 24 Sep 2021 12:12:40 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 847B6610FD
	for <linux-hwmon@archiver.kernel.org>; Fri, 24 Sep 2021 12:12:40 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S245038AbhIXMOM (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Fri, 24 Sep 2021 08:14:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34740 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239965AbhIXMOM (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Fri, 24 Sep 2021 08:14:12 -0400
Received: from mail-oi1-x22c.google.com (mail-oi1-x22c.google.com [IPv6:2607:f8b0:4864:20::22c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3AB6AC061574;
        Fri, 24 Sep 2021 05:12:39 -0700 (PDT)
Received: by mail-oi1-x22c.google.com with SMTP id a3so14176649oid.6;
        Fri, 24 Sep 2021 05:12:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=MfuNxsVZjMbrYtzb+zu+X2t59R08maojWh/sO2fR7HQ=;
        b=RemtayfwLWfgph6yWPECqfo11JpLvrPifE4PwmCubhrr+eSJmW6PRqchyNFxIBKWWx
         Ely93OOR5Qn4tqB8943V4pTtFjQPrdHnF2nLXJV/SGtJWe7YVYRxXZ0VhcMANpfj7MVB
         dJTKkCuEE+Pii01nfLwn4wYe++Ub+Jf7BMl9htjkwoqGJAGPK3ugJ/+vSsFLalROHY+Y
         RhUxfXqmgldlwSYgjWuBuvmhbrNDhZt35ASf+V4844DBdFOsCEcqjB5birAkBsdBmxBo
         hq0METDVcCshL1BOQzth/74B7MQ+Q81k5YIVvuusWXY1D7o0L4Ul5gTRgVD+g+fUb8T8
         tSfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition:in-reply-to;
        bh=MfuNxsVZjMbrYtzb+zu+X2t59R08maojWh/sO2fR7HQ=;
        b=jTQKR+HK5B63NSMcplOfHH86scu+oFiakZYXf67Un6JWJf9/Vjw2F/RNqmKNs2m9LU
         Hial+afMBMKBM9SDHKeItuGTBPdCGaG3l+lyaLBF0JhfMJcupnqFWzPY9RawlFsuFqiV
         0fcExdEtUDUKntmTdE9cWH827GiNRNz0f7kfIbg8llfCia7sqvfEQhmi3jW7aZL8HSo6
         rkIrDU6q3ylGwmXMngAJp+zB8yBd6WJraxhoIqrmxKsRi21uhVo5A2AtvlZJ6VE3j6/O
         9e7omJu4nZxMgIfpxxnKmllmJgTtgl8Ir2vGGCWNvQID06O6H26ByfyTDYJy4Awecj4o
         +GeQ==
X-Gm-Message-State: AOAM532Yh9GoF1FSWEL8SdScdP7EkmLEUQrtt2kn4AFr4fk7Xk+dDh9n
        bwl5tff0lF5hKXWI2mYSWIA=
X-Google-Smtp-Source: ABdhPJzVxGIp6FvOhHgYaTHTqBooCG5zOc2kNsd3iZ64gbhngfCl+ZmodhjUlKlRpytpOvsB64zSAA==
X-Received: by 2002:a54:4e84:: with SMTP id c4mr1227334oiy.106.1632485558434;
        Fri, 24 Sep 2021 05:12:38 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id b19sm2006331otk.75.2021.09.24.05.12.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Sep 2021 05:12:37 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date:   Fri, 24 Sep 2021 05:12:35 -0700
From:   Guenter Roeck <linux@roeck-us.net>
To:     Krzysztof Adamski <krzysztof.adamski@nokia.com>
Cc:     Jean Delvare <jdelvare@suse.com>, Rob Herring <robh+dt@kernel.org>,
        linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org,
        Przemyslaw Cencner <przemyslaw.cencner@nokia.com>
Subject: Re: [PATCH v2 07/10] hwmon: (tmp421) really disable channels
Message-ID: <20210924121235.GA2696513@roeck-us.net>
References: <cover.1632473318.git.krzysztof.adamski@nokia.com>
 <1553ef3db09cfa166b26b77c958f5c13576dfbaf.1632473318.git.krzysztof.adamski@nokia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1553ef3db09cfa166b26b77c958f5c13576dfbaf.1632473318.git.krzysztof.adamski@nokia.com>
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On Fri, Sep 24, 2021 at 11:42:40AM +0200, Krzysztof Adamski wrote:
> Recent patch added possibility to disable selected channels. That would
> only make sure that the ENODATA is returned for those channels but would
> not configure the actual hardware.
> 
> With this patch, the config register is written to make sure the
> channels are disabled also at hardware level.
> 
> Signed-off-by: Krzysztof Adamski <krzysztof.adamski@nokia.com>
> ---
>  drivers/hwmon/tmp421.c | 34 ++++++++++++++++++++++++++++++++++
>  1 file changed, 34 insertions(+)
> 
> diff --git a/drivers/hwmon/tmp421.c b/drivers/hwmon/tmp421.c
> index 0fa4c02f5808..4934ce13afb4 100644
> --- a/drivers/hwmon/tmp421.c
> +++ b/drivers/hwmon/tmp421.c
> @@ -33,6 +33,9 @@ enum chips { tmp421, tmp422, tmp423, tmp441, tmp442 };
>  /* The TMP421 registers */
>  #define TMP421_STATUS_REG			0x08
>  #define TMP421_CONFIG_REG_1			0x09
> +#define TMP421_CONFIG_REG_2			0x0A
> +#define TMP421_CONFIG_REG_REN(x)		(BIT(3 + (x)))
> +#define TMP421_CONFIG_REG_REN_MASK		(BIT(3)|BIT(4)|BIT(5)|BIT(6))

GENMASK() would probably be better here.

>  #define TMP421_CONVERSION_RATE_REG		0x0B
>  #define TMP421_N_FACTOR_REG_1			0x21
>  #define TMP421_MANUFACTURER_ID_REG		0xFE
> @@ -155,6 +158,33 @@ static struct tmp421_data *tmp421_update_device(struct device *dev)
>  	return data;
>  }
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
> +		dev_err(dev,
> +			"error reading register, can't disable channels\n");

Unnecessary line break

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
> +	if (err < 0)
> +		dev_err(dev,
> +			"error writing register, can't disable channels\n");

Unnecessary line break

> +
> +	return err;
> +}
> +
>  static int tmp421_read(struct device *dev, enum hwmon_sensor_types type,
>  		       u32 attr, int channel, long *val)
>  {
> @@ -395,6 +425,10 @@ static int tmp421_probe(struct i2c_client *client)
>  	if (err)
>  		return err;
>  
> +	err = tmp421_enable_channels(data);
> +	if (err)
> +		return err;

This should really be called from tmp421_init_client(). After all, that is what
the function is for.

> +
>  	data->chip.ops = &tmp421_ops;
>  	data->chip.info = data->info;
>  
