Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EAEA6C433F5
	for <linux-hwmon@archiver.kernel.org>; Thu,  3 Feb 2022 19:04:47 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237541AbiBCTEr (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Thu, 3 Feb 2022 14:04:47 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37848 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231250AbiBCTEq (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Thu, 3 Feb 2022 14:04:46 -0500
Received: from mail-oi1-x231.google.com (mail-oi1-x231.google.com [IPv6:2607:f8b0:4864:20::231])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 99AFFC061714
        for <linux-hwmon@vger.kernel.org>; Thu,  3 Feb 2022 11:04:46 -0800 (PST)
Received: by mail-oi1-x231.google.com with SMTP id u13so5576420oie.5
        for <linux-hwmon@vger.kernel.org>; Thu, 03 Feb 2022 11:04:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=CkON932z1nA/DDysBSU4gYL+dQvLI7eIVbnsUEFz05Y=;
        b=h5yoL0lERBHqHt/Ieu5+79oQfc98zIsy7p8WRoRfaospr4v9E6IhHbmRl29E1sWwiY
         o5/nuHn5esQogedrsywxk8sC0taIRRPMNbdBHCbCptA9o0lOt6yTHTi4mR0h/f/RGdgg
         yZGbe7oPpI5qc5wka03gDqbzqNdR/Z//m3xO6ULvqgTgPf4BrJUvru5i9YT61vh6sDWj
         p+Q++dFvxmuPR7pv4mF36YJPXk/hXYSsEMHKHX8vPXg17fLnSXC3jbiCTg6iq7CQogNK
         kGlJP5V6UthcS0PktkabKHEOGeJzlBQpUN/jPjcgay+J6ZKdY9iVR8twfvi8nBBMOy7t
         xb0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition:in-reply-to;
        bh=CkON932z1nA/DDysBSU4gYL+dQvLI7eIVbnsUEFz05Y=;
        b=lbbKLwSWw4hSocbilDg/bcHgX9xz085N9Tt+1oaRtVCl9B8OzHFnye774r1qjqKp2K
         IffWUP7MwDP4pmU2JxQwyBbuCdESxMIQxOBwY6ZvgJri8Lwet04+1DuSLzUsrVvpz9Qj
         JS2LkJbqz6XHXdC5YoeSCZ5GZYd27+MFoqHaM1VMFLCadC/gumhTmIh/POKTpGaiy/2Y
         Ux6h89MwELy59EvOcxAz8rGMe3Ua8Vg4OX8l5bNM1Cxc/ieDAc+/b3o5uQ7pii6eIVnm
         nk3cpCrvI+SkT8g7vvcEMqsWWp70SukN8fdLBC8MygL0ztnhfm7q0nYrbNhw+mt1Wcac
         A/Ig==
X-Gm-Message-State: AOAM530gxoEA8pXn78rhedVYLYFcyOnLZpeYrkiPf8rXmiWH1U1Vcp8C
        q+YmWOR3yvEwbIYJH7CtECs=
X-Google-Smtp-Source: ABdhPJzapRWBwD3n2fkoQGUZ4/gZcgnqwv7MWZQR11nsy1j7V3wRV9PyWtme4/WRI0hmW9pk/MppYw==
X-Received: by 2002:a05:6808:180f:: with SMTP id bh15mr8854195oib.233.1643915086050;
        Thu, 03 Feb 2022 11:04:46 -0800 (PST)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id t21sm12513796oor.4.2022.02.03.11.04.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Feb 2022 11:04:45 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Date:   Thu, 3 Feb 2022 11:04:44 -0800
From:   Guenter Roeck <linux@roeck-us.net>
To:     Marcello Sylvester Bauer <sylv@sylv.io>
Cc:     linux-hwmon@vger.kernel.org,
        Patrick Rudolph <patrick.rudolph@9elements.com>,
        Jean Delvare <jdelvare@suse.com>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH v4 2/4] hwmon: (max6639) Add regulator support
Message-ID: <20220203190444.GA236698@roeck-us.net>
References: <cover.1643299570.git.sylv@sylv.io>
 <2cb9ed600fb43cdc604799746fbde2e2942cdca6.1643299570.git.sylv@sylv.io>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2cb9ed600fb43cdc604799746fbde2e2942cdca6.1643299570.git.sylv@sylv.io>
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On Thu, Jan 27, 2022 at 05:17:28PM +0100, Marcello Sylvester Bauer wrote:
> Add regulator support for boards where the fan-supply have to be
> powered up before it can be used.
> 
> Signed-off-by: Patrick Rudolph <patrick.rudolph@9elements.com>
> Signed-off-by: Marcello Sylvester Bauer <sylv@sylv.io>

Applied.

Thanks,
Guenter

> ---
>  drivers/hwmon/max6639.c | 62 +++++++++++++++++++++++++++++++++++------
>  1 file changed, 54 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/hwmon/max6639.c b/drivers/hwmon/max6639.c
> index ccc0f047bd44..14bb7726f8d7 100644
> --- a/drivers/hwmon/max6639.c
> +++ b/drivers/hwmon/max6639.c
> @@ -87,6 +87,9 @@ struct max6639_data {
>  	/* Register values initialized only once */
>  	u8 ppr;			/* Pulses per rotation 0..3 for 1..4 ppr */
>  	u8 rpm_range;		/* Index in above rpm_ranges table */
> +
> +	/* Optional regulator for FAN supply */
> +	struct regulator *reg;
>  };
>  
>  static struct max6639_data *max6639_update_device(struct device *dev)
> @@ -516,6 +519,11 @@ static int max6639_detect(struct i2c_client *client,
>  	return 0;
>  }
>  
> +static void max6639_regulator_disable(void *data)
> +{
> +	regulator_disable(data);
> +}
> +
>  static int max6639_probe(struct i2c_client *client)
>  {
>  	struct device *dev = &client->dev;
> @@ -528,6 +536,28 @@ static int max6639_probe(struct i2c_client *client)
>  		return -ENOMEM;
>  
>  	data->client = client;
> +
> +	data->reg = devm_regulator_get_optional(dev, "fan");
> +	if (IS_ERR(data->reg)) {
> +		if (PTR_ERR(data->reg) != -ENODEV)
> +			return PTR_ERR(data->reg);
> +
> +		data->reg = NULL;
> +	} else {
> +		/* Spin up fans */
> +		err = regulator_enable(data->reg);
> +		if (err) {
> +			dev_err(dev, "Failed to enable fan supply: %d\n", err);
> +			return err;
> +		}
> +		err = devm_add_action_or_reset(dev, max6639_regulator_disable,
> +					       data->reg);
> +		if (err) {
> +			dev_err(dev, "Failed to register action: %d\n", err);
> +			return err;
> +		}
> +	}
> +
>  	mutex_init(&data->update_lock);
>  
>  	/* Initialize the max6639 chip */
> @@ -545,23 +575,39 @@ static int max6639_probe(struct i2c_client *client)
>  static int max6639_suspend(struct device *dev)
>  {
>  	struct i2c_client *client = to_i2c_client(dev);
> -	int data = i2c_smbus_read_byte_data(client, MAX6639_REG_GCONFIG);
> -	if (data < 0)
> -		return data;
> +	struct max6639_data *data = dev_get_drvdata(dev);
> +	int ret = i2c_smbus_read_byte_data(client, MAX6639_REG_GCONFIG);
> +
> +	if (ret < 0)
> +		return ret;
> +
> +	if (data->reg)
> +		regulator_disable(data->reg);
>  
>  	return i2c_smbus_write_byte_data(client,
> -			MAX6639_REG_GCONFIG, data | MAX6639_GCONFIG_STANDBY);
> +			MAX6639_REG_GCONFIG, ret | MAX6639_GCONFIG_STANDBY);
>  }
>  
>  static int max6639_resume(struct device *dev)
>  {
>  	struct i2c_client *client = to_i2c_client(dev);
> -	int data = i2c_smbus_read_byte_data(client, MAX6639_REG_GCONFIG);
> -	if (data < 0)
> -		return data;
> +	struct max6639_data *data = dev_get_drvdata(dev);
> +	int ret;
> +
> +	if (data->reg) {
> +		ret = regulator_enable(data->reg);
> +		if (ret) {
> +			dev_err(dev, "Failed to enable fan supply: %d\n", ret);
> +			return ret;
> +		}
> +	}
> +
> +	ret = i2c_smbus_read_byte_data(client, MAX6639_REG_GCONFIG);
> +	if (ret < 0)
> +		return ret;
>  
>  	return i2c_smbus_write_byte_data(client,
> -			MAX6639_REG_GCONFIG, data & ~MAX6639_GCONFIG_STANDBY);
> +			MAX6639_REG_GCONFIG, ret & ~MAX6639_GCONFIG_STANDBY);
>  }
>  #endif /* CONFIG_PM_SLEEP */
>  
