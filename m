Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CCBD8C433F5
	for <linux-hwmon@archiver.kernel.org>; Fri, 24 Sep 2021 12:17:12 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id ADC1B610C7
	for <linux-hwmon@archiver.kernel.org>; Fri, 24 Sep 2021 12:17:12 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S245386AbhIXMSn (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Fri, 24 Sep 2021 08:18:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35732 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239965AbhIXMSm (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Fri, 24 Sep 2021 08:18:42 -0400
Received: from mail-oi1-x232.google.com (mail-oi1-x232.google.com [IPv6:2607:f8b0:4864:20::232])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 50B51C061574;
        Fri, 24 Sep 2021 05:17:09 -0700 (PDT)
Received: by mail-oi1-x232.google.com with SMTP id r26so14230568oij.2;
        Fri, 24 Sep 2021 05:17:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=TGMxp80on7fmbONtvpmmPncsnRHVOLDa8yqmsm26Ps8=;
        b=BnQpKzM4nsQHNV/iIaujkn2NeRvkMKec/W3kFW1fecKP1qI//5JUSUK11nmuOGLgBe
         6ZTl8jMBZZCHEp3+4bmpd0SvzlHJD+7e2zGJYNbrMulcQoNGGyVMhqJ+zvZvflKVzDUU
         4xecHYzJ/FTwG1PARkg2qws5iPmMGcqnOOMizMUcR+n0i3OCafyETFJnYQ7lKEt4HjQi
         A++YHyKBa9PNzpmZj9ZhshPpfzsH37Jh8+MiYLR9yJqLn+GBKVZjvgfvQJiRw+VoTraP
         +U3i2C1u6Q2aQl4zboFKmnWd7kFmZQrgIFk24c6nCMPx8Nv0ntFvW62gavGlxOpFk0YB
         uSnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition:in-reply-to;
        bh=TGMxp80on7fmbONtvpmmPncsnRHVOLDa8yqmsm26Ps8=;
        b=nnl7wAl+/ORdzEVaNkg6gnn+KSADg7lufXTdvXMt8vYPSBjbI+Nfr7GgxD3+ltNZcv
         wwsw22UQaGseTD07Tk9L5NMojz9XJgIgxFWGGVP/bNCI5nrdU8SNJ+ZIKDQM3usjoDUM
         6HM1tgODEyDrMnb4scHEF5hzjOPr8G9w6g5YFTYVWG0tzgmHh35sKI8HKeKyvs4kb3cU
         FK+FER3vivIP5MSQKvELeOcFxZ87NuEiou2nkLlt0oK+DtegyiBD6gWKXrvbk6nGQ3B9
         RPUmqn+5B84YaUDYrQyGII5lIlryUCR7j/P9JFIq+0buKueBKscfqaC8IAOyjuWUAoQz
         CKNQ==
X-Gm-Message-State: AOAM532hVX9yfdMHxjT72NkF1fAscJt6a/H7XJz+qcvLEAbsEnmHFzaL
        HK1TeCfPuDazwyqqrivZZb8=
X-Google-Smtp-Source: ABdhPJwxk7Uh0F449KS/vQK3mn0D3tWm5OYDHiQydpLIxuMYZ5fN/YOHsO0trlkCSfyN0E+Sroh4RA==
X-Received: by 2002:a05:6808:613:: with SMTP id y19mr1169911oih.176.1632485827799;
        Fri, 24 Sep 2021 05:17:07 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id p20sm1988016otl.56.2021.09.24.05.17.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Sep 2021 05:17:07 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date:   Fri, 24 Sep 2021 05:17:06 -0700
From:   Guenter Roeck <linux@roeck-us.net>
To:     Krzysztof Adamski <krzysztof.adamski@nokia.com>
Cc:     Jean Delvare <jdelvare@suse.com>, Rob Herring <robh+dt@kernel.org>,
        linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org,
        Przemyslaw Cencner <przemyslaw.cencner@nokia.com>
Subject: Re: [PATCH v2 04/10] hwmon: (tmp421) add support for defining labels
 from DT
Message-ID: <20210924121706.GA2696746@roeck-us.net>
References: <cover.1632473318.git.krzysztof.adamski@nokia.com>
 <fab57edf8a0b8b2bcb2a7acefa1e1b65a9534f31.1632473318.git.krzysztof.adamski@nokia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <fab57edf8a0b8b2bcb2a7acefa1e1b65a9534f31.1632473318.git.krzysztof.adamski@nokia.com>
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On Fri, Sep 24, 2021 at 11:39:49AM +0200, Krzysztof Adamski wrote:
> tmp42x is a multichannel temperature sensor with several external
> channels. Since those channels can be used to connect diodes placed
> anywhere in the system, their meaning will vary depending on the
> project. For this case, the hwmon framework has an idea of labels which
> allows us to assign the meaning to each channel.
> 
> The similar concept is already implemented in ina3221 - the label for
> each channel can be defined via device tree. See commit a9e9dd9c6de5
> ("hwmon: (ina3221) Read channel input source info from DT")
> 
> This patch adds support for similar feature to tmp421.
> 
> Signed-off-by: Krzysztof Adamski <krzysztof.adamski@nokia.com>
> ---
>  drivers/hwmon/tmp421.c | 61 ++++++++++++++++++++++++++++++++++++++++++
>  1 file changed, 61 insertions(+)
> 
> diff --git a/drivers/hwmon/tmp421.c b/drivers/hwmon/tmp421.c
> index 1068fe59df0b..f9f910d60b12 100644
> --- a/drivers/hwmon/tmp421.c
> +++ b/drivers/hwmon/tmp421.c
> @@ -88,6 +88,7 @@ static const struct of_device_id __maybe_unused tmp421_of_match[] = {
>  MODULE_DEVICE_TABLE(of, tmp421_of_match);
>  
>  struct tmp421_channel {
> +	const char *label;
>  	s16 temp;
>  };
>  
> @@ -177,6 +178,16 @@ static int tmp421_read(struct device *dev, enum hwmon_sensor_types type,
>  
>  }
>  
> +static int tmp421_read_string(struct device *dev, enum hwmon_sensor_types type,
> +			     u32 attr, int channel, const char **str)
> +{
> +	struct tmp421_data *data = dev_get_drvdata(dev);
> +
> +	*str = data->channel[channel].label;
> +
> +	return 0;
> +}
> +
>  static umode_t tmp421_is_visible(const void *data, enum hwmon_sensor_types type,
>  				 u32 attr, int channel)
>  {
> @@ -187,6 +198,8 @@ static umode_t tmp421_is_visible(const void *data, enum hwmon_sensor_types type,
>  		return 0444;
>  	case hwmon_temp_input:
>  		return 0444;
> +	case hwmon_temp_label:
> +		return 0444;
>  	default:
>  		return 0;
>  	}
> @@ -279,9 +292,53 @@ static int tmp421_detect(struct i2c_client *client,
>  	return 0;
>  }
>  
> +static int tmp421_probe_child_from_dt(struct i2c_client *client,
> +				      struct device_node *child,
> +				      struct tmp421_data *data)
> +
> +{
> +	struct device *dev = &client->dev;
> +	u32 i;
> +	int err;
> +
> +	err = of_property_read_u32(child, "reg", &i);
> +	if (err) {
> +		dev_err(dev, "missing reg property of %pOFn\n", child);
> +		return err;
> +	}
> +
> +	if (i > MAX_CHANNELS) {
> +		dev_err(dev, "invalid reg %d of %pOFn\n", i, child);
> +		return -EINVAL;
> +	}
> +
> +	of_property_read_string(child, "label", &data->channel[i].label);
> +	if (data->channel[i].label)
> +		data->temp_config[i] |= HWMON_T_LABEL;
> +
> +	return 0;
> +}
> +
> +static int tmp421_probe_from_dt(struct i2c_client *client, struct tmp421_data *data)
> +{
> +	struct device *dev = &client->dev;
> +	const struct device_node *np = dev->of_node;
> +	struct device_node *child;
> +	int err;
> +
> +	for_each_child_of_node(np, child) {
> +		err = tmp421_probe_child_from_dt(client, child, data);
> +		if (err)
> +			return err;
> +	}

That makes me wonder: Can there ever be other (not temperature channel
related) child nodes ? Power, for example ?

Thanks,
Guenter

> +
> +	return 0;
> +}
> +
>  static const struct hwmon_ops tmp421_ops = {
>  	.is_visible = tmp421_is_visible,
>  	.read = tmp421_read,
> +	.read_string = tmp421_read_string,
>  };
>  
>  static int tmp421_probe(struct i2c_client *client)
> @@ -310,6 +367,10 @@ static int tmp421_probe(struct i2c_client *client)
>  	for (i = 0; i < data->channels; i++)
>  		data->temp_config[i] = HWMON_T_INPUT | HWMON_T_FAULT;
>  
> +	err = tmp421_probe_from_dt(client, data);
> +	if (err)
> +		return err;
> +
>  	data->chip.ops = &tmp421_ops;
>  	data->chip.info = data->info;
>  
