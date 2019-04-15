Return-Path: <SRS0=uXUr=SR=vger.kernel.org=linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.3 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,USER_AGENT_MUTT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3D1C3C10F0E
	for <linux-hwmon@archiver.kernel.org>; Mon, 15 Apr 2019 20:13:56 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id EE6A2206BA
	for <linux-hwmon@archiver.kernel.org>; Mon, 15 Apr 2019 20:13:55 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DhA9S6Zg"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728215AbfDOUNz (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Mon, 15 Apr 2019 16:13:55 -0400
Received: from mail-pl1-f193.google.com ([209.85.214.193]:36412 "EHLO
        mail-pl1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728148AbfDOUNz (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Mon, 15 Apr 2019 16:13:55 -0400
Received: by mail-pl1-f193.google.com with SMTP id ck15so9129116plb.3
        for <linux-hwmon@vger.kernel.org>; Mon, 15 Apr 2019 13:13:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=ub/D1F3HYSG7/t+PZkHwKM5FK0wKGK2NYN2EuCL5Sk8=;
        b=DhA9S6ZgpzlbMaGqBq9xtHhPfoTJgXmJNdPzq376sZ6jcfAFFqGcMmlbGYDEbVoZa6
         +HuM8ZcFQDz95tyBPMFTGvzubAEOSiM6BvAyLs+fVXMawxSu85BAojb64XFpTY46Cxrt
         lp4TDKW/nOzKdgJjem1WJ1ltwzfqPk2YTskc/TIpOxrI8pI/IxNlEUbcQGKoXf8M7/fE
         JIs3uv/epere3p2s25b9x2AgMDA9CYDdnLIwsctIgpg6sV3vWZgHCtRgCA0HXrYIxv/o
         OYd2tgxKm6Es9EZ3bxD4BJnprWqtgHwq557qAPhAG1Wt7doGJ9fH0VkO4J+QooZ9Qr5K
         aaUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition:in-reply-to:user-agent;
        bh=ub/D1F3HYSG7/t+PZkHwKM5FK0wKGK2NYN2EuCL5Sk8=;
        b=VAZpy6vvbCJtROrfhf8hiJ8R7EzGuKsTsdSu+KgkG9gyRJbyyJGGlimkB/HXgcCO0V
         T4C23L9ZP2Gdv3+f9l8w0TVk/odTET65Vq5ve5QCcJvFvaceZZqB8ozWiq7vLesgnLKl
         49wHZmqOmvJSqAu2JKRAai5TM0neJ5adssdr5uTasBRqK5kfR6y6k6rITguVloA7Dssb
         +LCR8yKJ39XDmFut4PdzYAbQD8TFsg0iNyyks9UtrShtERPlNs/w9QfpGCK6ntpFsPGz
         Ts8Hh1J+X8BHpa55C7/8oUIp8w/9KN7ku6kygRU9f1B0YWDmzNPme2pXP3Fal5+RTDM8
         vsyA==
X-Gm-Message-State: APjAAAXgtbKmsT/59VV9uVEeiD2/79kmInbb5m0JN09h5rvyNyrxIFbF
        4wxTJBYwv/+Oy09165pl8AE=
X-Google-Smtp-Source: APXvYqxl4qcKX6zYg//UiiDcPZ6dOhZx8zyab1cF/06Xg3ki4Dj7JKw+LAT+ISd15XT01kZ+R8EVow==
X-Received: by 2002:a17:902:3e5:: with SMTP id d92mr74057285pld.11.1555359234744;
        Mon, 15 Apr 2019 13:13:54 -0700 (PDT)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id b7sm138254457pfj.67.2019.04.15.13.13.52
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 15 Apr 2019 13:13:53 -0700 (PDT)
Date:   Mon, 15 Apr 2019 13:13:52 -0700
From:   Guenter Roeck <linux@roeck-us.net>
To:     "Adamski, Krzysztof (Nokia - PL/Wroclaw)" 
        <krzysztof.adamski@nokia.com>
Cc:     Jean Delvare <jdelvare@suse.com>,
        "linux-hwmon@vger.kernel.org" <linux-hwmon@vger.kernel.org>,
        "Sverdlin, Alexander (Nokia - DE/Ulm)" <alexander.sverdlin@nokia.com>
Subject: Re: [PATCH v3 1/4] pmbus: introduce PMBUS_VIRT_*_SAMPLES registers
Message-ID: <20190415201352.GA25482@roeck-us.net>
References: <cover.1555273192.git.krzysztof.adamski@nokia.com>
 <d7c49e8d72af52caa5a31b476ada5161a6d437ef.1555273192.git.krzysztof.adamski@nokia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <d7c49e8d72af52caa5a31b476ada5161a6d437ef.1555273192.git.krzysztof.adamski@nokia.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
Sender: linux-hwmon-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On Sun, Apr 14, 2019 at 09:58:18PM +0000, Adamski, Krzysztof (Nokia - PL/Wroclaw) wrote:
> Those virtual registers can be used to export manufacturer specific
> functionality for controlling the number of samples for average values
> reported by the device.
> 
> Signed-off-by: Krzysztof Adamski <krzysztof.adamski@nokia.com>

Applied to hwmon-next.

Thanks,
Guenter

> ---
>  drivers/hwmon/pmbus/pmbus.h      |  15 +++++
>  drivers/hwmon/pmbus/pmbus_core.c | 110 +++++++++++++++++++++++++++++++
>  2 files changed, 125 insertions(+)
> 
> diff --git a/drivers/hwmon/pmbus/pmbus.h b/drivers/hwmon/pmbus/pmbus.h
> index 1d24397d36ec..e73289cc867d 100644
> --- a/drivers/hwmon/pmbus/pmbus.h
> +++ b/drivers/hwmon/pmbus/pmbus.h
> @@ -217,6 +217,20 @@ enum pmbus_regs {
>  	PMBUS_VIRT_PWM_ENABLE_2,
>  	PMBUS_VIRT_PWM_ENABLE_3,
>  	PMBUS_VIRT_PWM_ENABLE_4,
> +
> +	/* Samples for average
> +	 *
> +	 * Drivers wanting to expose functionality for changing the number of
> +	 * samples used for average values should implement support in
> +	 * {read,write}_word_data callback for either PMBUS_VIRT_SAMPLES if it
> +	 * applies to all types of measurements, or any number of specific
> +	 * PMBUS_VIRT_*_SAMPLES registers to allow for individual control.
> +	 */
> +	PMBUS_VIRT_SAMPLES,
> +	PMBUS_VIRT_IN_SAMPLES,
> +	PMBUS_VIRT_CURR_SAMPLES,
> +	PMBUS_VIRT_POWER_SAMPLES,
> +	PMBUS_VIRT_TEMP_SAMPLES,
>  };
>  
>  /*
> @@ -371,6 +385,7 @@ enum pmbus_sensor_classes {
>  #define PMBUS_HAVE_STATUS_VMON	BIT(19)
>  #define PMBUS_HAVE_PWM12	BIT(20)
>  #define PMBUS_HAVE_PWM34	BIT(21)
> +#define PMBUS_HAVE_SAMPLES	BIT(22)
>  
>  #define PMBUS_PAGE_VIRTUAL	BIT(31)
>  
> diff --git a/drivers/hwmon/pmbus/pmbus_core.c b/drivers/hwmon/pmbus/pmbus_core.c
> index 2e2b5851139c..9b7d493c98b9 100644
> --- a/drivers/hwmon/pmbus/pmbus_core.c
> +++ b/drivers/hwmon/pmbus/pmbus_core.c
> @@ -1901,6 +1901,112 @@ static int pmbus_add_fan_attributes(struct i2c_client *client,
>  	return 0;
>  }
>  
> +struct pmbus_samples_attr {
> +	int reg;
> +	char *name;
> +};
> +
> +struct pmbus_samples_reg {
> +	int page;
> +	struct pmbus_samples_attr *attr;
> +	struct device_attribute dev_attr;
> +};
> +
> +static struct pmbus_samples_attr pmbus_samples_registers[] = {
> +	{
> +		.reg = PMBUS_VIRT_SAMPLES,
> +		.name = "samples",
> +	}, {
> +		.reg = PMBUS_VIRT_IN_SAMPLES,
> +		.name = "in_samples",
> +	}, {
> +		.reg = PMBUS_VIRT_CURR_SAMPLES,
> +		.name = "curr_samples",
> +	}, {
> +		.reg = PMBUS_VIRT_POWER_SAMPLES,
> +		.name = "power_samples",
> +	}, {
> +		.reg = PMBUS_VIRT_TEMP_SAMPLES,
> +		.name = "temp_samples",
> +	}
> +};
> +
> +#define to_samples_reg(x) container_of(x, struct pmbus_samples_reg, dev_attr)
> +
> +static ssize_t pmbus_show_samples(struct device *dev,
> +				  struct device_attribute *devattr, char *buf)
> +{
> +	int val;
> +	struct i2c_client *client = to_i2c_client(dev->parent);
> +	struct pmbus_samples_reg *reg = to_samples_reg(devattr);
> +
> +	val = _pmbus_read_word_data(client, reg->page, reg->attr->reg);
> +	if (val < 0)
> +		return val;
> +
> +	return snprintf(buf, PAGE_SIZE, "%d\n", val);
> +}
> +
> +static ssize_t pmbus_set_samples(struct device *dev,
> +				 struct device_attribute *devattr,
> +				 const char *buf, size_t count)
> +{
> +	int ret;
> +	long val;
> +	struct i2c_client *client = to_i2c_client(dev->parent);
> +	struct pmbus_samples_reg *reg = to_samples_reg(devattr);
> +
> +	if (kstrtol(buf, 0, &val) < 0)
> +		return -EINVAL;
> +
> +	ret = _pmbus_write_word_data(client, reg->page, reg->attr->reg, val);
> +
> +	return ret ? : count;
> +}
> +
> +static int pmbus_add_samples_attr(struct pmbus_data *data, int page,
> +				  struct pmbus_samples_attr *attr)
> +{
> +	struct pmbus_samples_reg *reg;
> +
> +	reg = devm_kzalloc(data->dev, sizeof(*reg), GFP_KERNEL);
> +	if (!reg)
> +		return -ENOMEM;
> +
> +	reg->attr = attr;
> +	reg->page = page;
> +
> +	pmbus_dev_attr_init(&reg->dev_attr, attr->name, 0644,
> +			    pmbus_show_samples, pmbus_set_samples);
> +
> +	return pmbus_add_attribute(data, &reg->dev_attr.attr);
> +}
> +
> +static int pmbus_add_samples_attributes(struct i2c_client *client,
> +					struct pmbus_data *data)
> +{
> +	const struct pmbus_driver_info *info = data->info;
> +	int s;
> +
> +	if (!(info->func[0] & PMBUS_HAVE_SAMPLES))
> +		return 0;
> +
> +	for (s = 0; s < ARRAY_SIZE(pmbus_samples_registers); s++) {
> +		struct pmbus_samples_attr *attr;
> +		int ret;
> +
> +		attr = &pmbus_samples_registers[s];
> +		if (!pmbus_check_word_register(client, 0, attr->reg))
> +			continue;
> +
> +		ret = pmbus_add_samples_attr(data, 0, attr);
> +		if (ret)
> +			return ret;
> +	}
> +
> +	return 0;
> +}
> +
>  static int pmbus_find_attributes(struct i2c_client *client,
>  				 struct pmbus_data *data)
>  {
> @@ -1932,6 +2038,10 @@ static int pmbus_find_attributes(struct i2c_client *client,
>  
>  	/* Fans */
>  	ret = pmbus_add_fan_attributes(client, data);
> +	if (ret)
> +		return ret;
> +
> +	ret = pmbus_add_samples_attributes(client, data);
>  	return ret;
>  }
>  
