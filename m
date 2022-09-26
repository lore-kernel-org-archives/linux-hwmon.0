Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A2F8DC07E9D
	for <linux-hwmon@archiver.kernel.org>; Mon, 26 Sep 2022 22:22:24 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230382AbiIZWWX (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Mon, 26 Sep 2022 18:22:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53994 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229734AbiIZWWW (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Mon, 26 Sep 2022 18:22:22 -0400
Received: from mail-pj1-x102a.google.com (mail-pj1-x102a.google.com [IPv6:2607:f8b0:4864:20::102a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AFC657D1DC
        for <linux-hwmon@vger.kernel.org>; Mon, 26 Sep 2022 15:22:18 -0700 (PDT)
Received: by mail-pj1-x102a.google.com with SMTP id rt12so7594759pjb.1
        for <linux-hwmon@vger.kernel.org>; Mon, 26 Sep 2022 15:22:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:sender
         :from:to:cc:subject:date;
        bh=Uayjlcsl6IjdRoeMF0JRlwIAUaTUUfiHIvl1M5KsDbQ=;
        b=CmWhsX1h7ZsLLRSvQ0S2/enGfu1lhjm0WGyM7xZL9ktVnPezKlB1m82hMdN2iVbN9a
         tAFrEHxWyhaK8gGC9U0OnsCGZQkkG+q1BGqGe4NIbWLxTeJMwJ0FXAU8xkZeUjcOIy9S
         0dn945yn+1SgugPPZ+uyOB9/kCSJAe/IOlEiHl6YWjctBZ3tkEh8rYrhnPovh7OTJwUH
         V+ei3Z+0a5pKZpcVGqnywvrFbgJxSZ3at/XxrgPNIjPGDLu0fU12BXWU4kkbTitdzabU
         Fq1hRSLV+fAgOe5mZcNqCvIx9Ic5uun2PYhgthL+/Jajc+F6ADpPsAHA2Gx4ABJNBFJv
         0Jng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:sender
         :x-gm-message-state:from:to:cc:subject:date;
        bh=Uayjlcsl6IjdRoeMF0JRlwIAUaTUUfiHIvl1M5KsDbQ=;
        b=3YI1Nzn+A0UeToCIOOOEKpQsf0KnD1MxZswFM84Yb8PBH0d3oWfdjFBYVRljEuMqH9
         /5AwSsSc3GjOi52UXWlOwm0j3Pb8+CUl6hqqf7w8AOELxkquRnNimUMX0GGvQj6YmDlf
         Kt2IizsTUldzLwlKN+LOO+IqJjPNmuhM+RuM18bN3D714kzd2H/Ab0UWRtAQ4i04A7iu
         eNhyApZ6V+7FAjZGAVHag0pv6SZ4HW4aCtO6pC56xA3AADNenowNI5Cifmo9B42FrXS0
         De5HfvkQmJUEcFS7vIuvvWC5ZnS5zN5hOnAIMC+UNbwhDwF+aE9G4BUW0nTwxy5Xr1IQ
         NPbQ==
X-Gm-Message-State: ACrzQf3dEe6h+NEypHzhOlmjbnwYPC3ZIeDnHjmsCnbIIGdd4yXt2+5P
        OYFsAAc3a6c9gHFFa+LlIp2DngZfJnJd+Q==
X-Google-Smtp-Source: AMsMyM5axDKSh3L9UpmLwM45urz7d8jok3c6rAHPCLXcCR8xuiWLwkbHYCSLtpUjbdjDLPflQY8oPw==
X-Received: by 2002:a17:90a:243:b0:200:80ea:a6f3 with SMTP id t3-20020a17090a024300b0020080eaa6f3mr995198pje.9.1664230937422;
        Mon, 26 Sep 2022 15:22:17 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id a28-20020aa7971c000000b00540b979c493sm18374pfg.55.2022.09.26.15.22.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Sep 2022 15:22:16 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date:   Mon, 26 Sep 2022 15:22:14 -0700
From:   Guenter Roeck <linux@roeck-us.net>
To:     Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= 
        <u.kleine-koenig@pengutronix.de>
Cc:     Jean Delvare <jdelvare@suse.com>, linux-hwmon@vger.kernel.org,
        kernel@pengutronix.de
Subject: Re: [PATCH] hwmon: w83627hf: Reorder symbols to get rid of a few
 forward declarations
Message-ID: <20220926222214.GA689346@roeck-us.net>
References: <20220926153946.1478260-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220926153946.1478260-1-u.kleine-koenig@pengutronix.de>
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On Mon, Sep 26, 2022 at 05:39:46PM +0200, Uwe Kleine-König wrote:
> Declarations for static symbols are useless code repetition (unless
> there are cyclic dependencies).
> 
> Reorder some functions and variables which allows to get rid of 7
> forward declarations.
> 
> Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>

Applied to hwmon-next.

Thanks,
Guenter

> ---
>  drivers/hwmon/w83627hf.c | 1784 +++++++++++++++++++-------------------
>  1 file changed, 894 insertions(+), 890 deletions(-)
> 
> 
> base-commit: 568035b01cfb107af8d2e4bd2fb9aea22cf5b868
> 
> diff --git a/drivers/hwmon/w83627hf.c b/drivers/hwmon/w83627hf.c
> index 9be277156ed2..d46cc27c0789 100644
> --- a/drivers/hwmon/w83627hf.c
> +++ b/drivers/hwmon/w83627hf.c
> @@ -389,14 +389,184 @@ struct w83627hf_data {
>  #endif
>  };
>  
> -static int w83627hf_probe(struct platform_device *pdev);
> -static int w83627hf_remove(struct platform_device *pdev);
> +/* Registers 0x50-0x5f are banked */
> +static inline void w83627hf_set_bank(struct w83627hf_data *data, u16 reg)
> +{
> +	if ((reg & 0x00f0) == 0x50) {
> +		outb_p(W83781D_REG_BANK, data->addr + W83781D_ADDR_REG_OFFSET);
> +		outb_p(reg >> 8, data->addr + W83781D_DATA_REG_OFFSET);
> +	}
> +}
> +
> +/* Not strictly necessary, but play it safe for now */
> +static inline void w83627hf_reset_bank(struct w83627hf_data *data, u16 reg)
> +{
> +	if (reg & 0xff00) {
> +		outb_p(W83781D_REG_BANK, data->addr + W83781D_ADDR_REG_OFFSET);
> +		outb_p(0, data->addr + W83781D_DATA_REG_OFFSET);
> +	}
> +}
> +
> +static int w83627hf_read_value(struct w83627hf_data *data, u16 reg)
> +{
> +	int res, word_sized;
> +
> +	mutex_lock(&data->lock);
> +	word_sized = (((reg & 0xff00) == 0x100)
> +		   || ((reg & 0xff00) == 0x200))
> +		  && (((reg & 0x00ff) == 0x50)
> +		   || ((reg & 0x00ff) == 0x53)
> +		   || ((reg & 0x00ff) == 0x55));
> +	w83627hf_set_bank(data, reg);
> +	outb_p(reg & 0xff, data->addr + W83781D_ADDR_REG_OFFSET);
> +	res = inb_p(data->addr + W83781D_DATA_REG_OFFSET);
> +	if (word_sized) {
> +		outb_p((reg & 0xff) + 1,
> +		       data->addr + W83781D_ADDR_REG_OFFSET);
> +		res =
> +		    (res << 8) + inb_p(data->addr +
> +				       W83781D_DATA_REG_OFFSET);
> +	}
> +	w83627hf_reset_bank(data, reg);
> +	mutex_unlock(&data->lock);
> +	return res;
> +}
> +
> +static int w83627hf_write_value(struct w83627hf_data *data, u16 reg, u16 value)
> +{
> +	int word_sized;
> +
> +	mutex_lock(&data->lock);
> +	word_sized = (((reg & 0xff00) == 0x100)
> +		   || ((reg & 0xff00) == 0x200))
> +		  && (((reg & 0x00ff) == 0x53)
> +		   || ((reg & 0x00ff) == 0x55));
> +	w83627hf_set_bank(data, reg);
> +	outb_p(reg & 0xff, data->addr + W83781D_ADDR_REG_OFFSET);
> +	if (word_sized) {
> +		outb_p(value >> 8,
> +		       data->addr + W83781D_DATA_REG_OFFSET);
> +		outb_p((reg & 0xff) + 1,
> +		       data->addr + W83781D_ADDR_REG_OFFSET);
> +	}
> +	outb_p(value & 0xff,
> +	       data->addr + W83781D_DATA_REG_OFFSET);
> +	w83627hf_reset_bank(data, reg);
> +	mutex_unlock(&data->lock);
> +	return 0;
> +}
> +
> +static void w83627hf_update_fan_div(struct w83627hf_data *data)
> +{
> +	int reg;
> +
> +	reg = w83627hf_read_value(data, W83781D_REG_VID_FANDIV);
> +	data->fan_div[0] = (reg >> 4) & 0x03;
> +	data->fan_div[1] = (reg >> 6) & 0x03;
> +	if (data->type != w83697hf) {
> +		data->fan_div[2] = (w83627hf_read_value(data,
> +				       W83781D_REG_PIN) >> 6) & 0x03;
> +	}
> +	reg = w83627hf_read_value(data, W83781D_REG_VBAT);
> +	data->fan_div[0] |= (reg >> 3) & 0x04;
> +	data->fan_div[1] |= (reg >> 4) & 0x04;
> +	if (data->type != w83697hf)
> +		data->fan_div[2] |= (reg >> 5) & 0x04;
> +}
> +
> +static struct w83627hf_data *w83627hf_update_device(struct device *dev)
> +{
> +	struct w83627hf_data *data = dev_get_drvdata(dev);
> +	int i, num_temps = (data->type == w83697hf) ? 2 : 3;
> +	int num_pwms = (data->type == w83697hf) ? 2 : 3;
> +
> +	mutex_lock(&data->update_lock);
> +
> +	if (time_after(jiffies, data->last_updated + HZ + HZ / 2)
> +	    || !data->valid) {
> +		for (i = 0; i <= 8; i++) {
> +			/* skip missing sensors */
> +			if (((data->type == w83697hf) && (i == 1)) ||
> +			    ((data->type != w83627hf && data->type != w83697hf)
> +			    && (i == 5 || i == 6)))
> +				continue;
> +			data->in[i] =
> +			    w83627hf_read_value(data, W83781D_REG_IN(i));
> +			data->in_min[i] =
> +			    w83627hf_read_value(data,
> +					       W83781D_REG_IN_MIN(i));
> +			data->in_max[i] =
> +			    w83627hf_read_value(data,
> +					       W83781D_REG_IN_MAX(i));
> +		}
> +		for (i = 0; i <= 2; i++) {
> +			data->fan[i] =
> +			    w83627hf_read_value(data, W83627HF_REG_FAN(i));
> +			data->fan_min[i] =
> +			    w83627hf_read_value(data,
> +					       W83627HF_REG_FAN_MIN(i));
> +		}
> +		for (i = 0; i <= 2; i++) {
> +			u8 tmp = w83627hf_read_value(data,
> +				W836X7HF_REG_PWM(data->type, i));
> +			/* bits 0-3 are reserved  in 627THF */
> +			if (data->type == w83627thf)
> +				tmp &= 0xf0;
> +			data->pwm[i] = tmp;
> +			if (i == 1 &&
> +			    (data->type == w83627hf || data->type == w83697hf))
> +				break;
> +		}
> +		if (data->type == w83627hf) {
> +				u8 tmp = w83627hf_read_value(data,
> +						W83627HF_REG_PWM_FREQ);
> +				data->pwm_freq[0] = tmp & 0x07;
> +				data->pwm_freq[1] = (tmp >> 4) & 0x07;
> +		} else if (data->type != w83627thf) {
> +			for (i = 1; i <= 3; i++) {
> +				data->pwm_freq[i - 1] =
> +					w83627hf_read_value(data,
> +						W83637HF_REG_PWM_FREQ[i - 1]);
> +				if (i == 2 && (data->type == w83697hf))
> +					break;
> +			}
> +		}
> +		if (data->type != w83627hf) {
> +			for (i = 0; i < num_pwms; i++) {
> +				u8 tmp = w83627hf_read_value(data,
> +					W83627THF_REG_PWM_ENABLE[i]);
> +				data->pwm_enable[i] =
> +					((tmp >> W83627THF_PWM_ENABLE_SHIFT[i])
> +					& 0x03) + 1;
> +			}
> +		}
> +		for (i = 0; i < num_temps; i++) {
> +			data->temp[i] = w83627hf_read_value(
> +						data, w83627hf_reg_temp[i]);
> +			data->temp_max[i] = w83627hf_read_value(
> +						data, w83627hf_reg_temp_over[i]);
> +			data->temp_max_hyst[i] = w83627hf_read_value(
> +						data, w83627hf_reg_temp_hyst[i]);
> +		}
> +
> +		w83627hf_update_fan_div(data);
> +
> +		data->alarms =
> +		    w83627hf_read_value(data, W83781D_REG_ALARM1) |
> +		    (w83627hf_read_value(data, W83781D_REG_ALARM2) << 8) |
> +		    (w83627hf_read_value(data, W83781D_REG_ALARM3) << 16);
> +		i = w83627hf_read_value(data, W83781D_REG_BEEP_INTS2);
> +		data->beep_mask = (i << 8) |
> +		    w83627hf_read_value(data, W83781D_REG_BEEP_INTS1) |
> +		    w83627hf_read_value(data, W83781D_REG_BEEP_INTS3) << 16;
> +		data->last_updated = jiffies;
> +		data->valid = true;
> +	}
> +
> +	mutex_unlock(&data->update_lock);
>  
> -static int w83627hf_read_value(struct w83627hf_data *data, u16 reg);
> -static int w83627hf_write_value(struct w83627hf_data *data, u16 reg, u16 value);
> -static void w83627hf_update_fan_div(struct w83627hf_data *data);
> -static struct w83627hf_data *w83627hf_update_device(struct device *dev);
> -static void w83627hf_init_device(struct platform_device *pdev);
> +	return data;
> +}
>  
>  #ifdef CONFIG_PM
>  static int w83627hf_suspend(struct device *dev)
> @@ -464,99 +634,171 @@ static const struct dev_pm_ops w83627hf_dev_pm_ops = {
>  #define W83627HF_DEV_PM_OPS	NULL
>  #endif /* CONFIG_PM */
>  
> -static struct platform_driver w83627hf_driver = {
> -	.driver = {
> -		.name	= DRVNAME,
> -		.pm	= W83627HF_DEV_PM_OPS,
> -	},
> -	.probe		= w83627hf_probe,
> -	.remove		= w83627hf_remove,
> -};
> -
> -static ssize_t
> -in_input_show(struct device *dev, struct device_attribute *devattr, char *buf)
> -{
> -	int nr = to_sensor_dev_attr(devattr)->index;
> -	struct w83627hf_data *data = w83627hf_update_device(dev);
> -	return sprintf(buf, "%ld\n", (long)IN_FROM_REG(data->in[nr]));
> -}
> -static ssize_t
> -in_min_show(struct device *dev, struct device_attribute *devattr, char *buf)
> -{
> -	int nr = to_sensor_dev_attr(devattr)->index;
> -	struct w83627hf_data *data = w83627hf_update_device(dev);
> -	return sprintf(buf, "%ld\n", (long)IN_FROM_REG(data->in_min[nr]));
> -}
> -static ssize_t
> -in_max_show(struct device *dev, struct device_attribute *devattr, char *buf)
> -{
> -	int nr = to_sensor_dev_attr(devattr)->index;
> -	struct w83627hf_data *data = w83627hf_update_device(dev);
> -	return sprintf(buf, "%ld\n", (long)IN_FROM_REG(data->in_max[nr]));
> -}
> -static ssize_t
> -in_min_store(struct device *dev, struct device_attribute *devattr,
> -	     const char *buf, size_t count)
> +static int w83627thf_read_gpio5(struct platform_device *pdev)
>  {
> -	int nr = to_sensor_dev_attr(devattr)->index;
> -	struct w83627hf_data *data = dev_get_drvdata(dev);
> -	long val;
> -	int err;
> -
> -	err = kstrtol(buf, 10, &val);
> -	if (err)
> -		return err;
> +	struct w83627hf_sio_data *sio_data = dev_get_platdata(&pdev->dev);
> +	int res = 0xff, sel;
>  
> -	mutex_lock(&data->update_lock);
> -	data->in_min[nr] = IN_TO_REG(val);
> -	w83627hf_write_value(data, W83781D_REG_IN_MIN(nr), data->in_min[nr]);
> -	mutex_unlock(&data->update_lock);
> -	return count;
> -}
> -static ssize_t
> -in_max_store(struct device *dev, struct device_attribute *devattr,
> -	     const char *buf, size_t count)
> -{
> -	int nr = to_sensor_dev_attr(devattr)->index;
> -	struct w83627hf_data *data = dev_get_drvdata(dev);
> -	long val;
> -	int err;
> +	if (superio_enter(sio_data)) {
> +		/*
> +		 * Some other driver reserved the address space for itself.
> +		 * We don't want to fail driver instantiation because of that,
> +		 * so display a warning and keep going.
> +		 */
> +		dev_warn(&pdev->dev,
> +			 "Can not read VID data: Failed to enable SuperIO access\n");
> +		return res;
> +	}
>  
> -	err = kstrtol(buf, 10, &val);
> -	if (err)
> -		return err;
> +	superio_select(sio_data, W83627HF_LD_GPIO5);
>  
> -	mutex_lock(&data->update_lock);
> -	data->in_max[nr] = IN_TO_REG(val);
> -	w83627hf_write_value(data, W83781D_REG_IN_MAX(nr), data->in_max[nr]);
> -	mutex_unlock(&data->update_lock);
> -	return count;
> -}
> +	res = 0xff;
>  
> -static SENSOR_DEVICE_ATTR_RO(in1_input, in_input, 1);
> -static SENSOR_DEVICE_ATTR_RW(in1_min, in_min, 1);
> -static SENSOR_DEVICE_ATTR_RW(in1_max, in_max, 1);
> -static SENSOR_DEVICE_ATTR_RO(in2_input, in_input, 2);
> -static SENSOR_DEVICE_ATTR_RW(in2_min, in_min, 2);
> -static SENSOR_DEVICE_ATTR_RW(in2_max, in_max, 2);
> -static SENSOR_DEVICE_ATTR_RO(in3_input, in_input, 3);
> -static SENSOR_DEVICE_ATTR_RW(in3_min, in_min, 3);
> -static SENSOR_DEVICE_ATTR_RW(in3_max, in_max, 3);
> -static SENSOR_DEVICE_ATTR_RO(in4_input, in_input, 4);
> -static SENSOR_DEVICE_ATTR_RW(in4_min, in_min, 4);
> -static SENSOR_DEVICE_ATTR_RW(in4_max, in_max, 4);
> -static SENSOR_DEVICE_ATTR_RO(in5_input, in_input, 5);
> -static SENSOR_DEVICE_ATTR_RW(in5_min, in_min, 5);
> -static SENSOR_DEVICE_ATTR_RW(in5_max, in_max, 5);
> -static SENSOR_DEVICE_ATTR_RO(in6_input, in_input, 6);
> -static SENSOR_DEVICE_ATTR_RW(in6_min, in_min, 6);
> -static SENSOR_DEVICE_ATTR_RW(in6_max, in_max, 6);
> -static SENSOR_DEVICE_ATTR_RO(in7_input, in_input, 7);
> -static SENSOR_DEVICE_ATTR_RW(in7_min, in_min, 7);
> -static SENSOR_DEVICE_ATTR_RW(in7_max, in_max, 7);
> -static SENSOR_DEVICE_ATTR_RO(in8_input, in_input, 8);
> -static SENSOR_DEVICE_ATTR_RW(in8_min, in_min, 8);
> -static SENSOR_DEVICE_ATTR_RW(in8_max, in_max, 8);
> +	/* Make sure these GPIO pins are enabled */
> +	if (!(superio_inb(sio_data, W83627THF_GPIO5_EN) & (1<<3))) {
> +		dev_dbg(&pdev->dev, "GPIO5 disabled, no VID function\n");
> +		goto exit;
> +	}
> +
> +	/*
> +	 * Make sure the pins are configured for input
> +	 * There must be at least five (VRM 9), and possibly 6 (VRM 10)
> +	 */
> +	sel = superio_inb(sio_data, W83627THF_GPIO5_IOSR) & 0x3f;
> +	if ((sel & 0x1f) != 0x1f) {
> +		dev_dbg(&pdev->dev, "GPIO5 not configured for VID "
> +			"function\n");
> +		goto exit;
> +	}
> +
> +	dev_info(&pdev->dev, "Reading VID from GPIO5\n");
> +	res = superio_inb(sio_data, W83627THF_GPIO5_DR) & sel;
> +
> +exit:
> +	superio_exit(sio_data);
> +	return res;
> +}
> +
> +static int w83687thf_read_vid(struct platform_device *pdev)
> +{
> +	struct w83627hf_sio_data *sio_data = dev_get_platdata(&pdev->dev);
> +	int res = 0xff;
> +
> +	if (superio_enter(sio_data)) {
> +		/*
> +		 * Some other driver reserved the address space for itself.
> +		 * We don't want to fail driver instantiation because of that,
> +		 * so display a warning and keep going.
> +		 */
> +		dev_warn(&pdev->dev,
> +			 "Can not read VID data: Failed to enable SuperIO access\n");
> +		return res;
> +	}
> +
> +	superio_select(sio_data, W83627HF_LD_HWM);
> +
> +	/* Make sure these GPIO pins are enabled */
> +	if (!(superio_inb(sio_data, W83687THF_VID_EN) & (1 << 2))) {
> +		dev_dbg(&pdev->dev, "VID disabled, no VID function\n");
> +		goto exit;
> +	}
> +
> +	/* Make sure the pins are configured for input */
> +	if (!(superio_inb(sio_data, W83687THF_VID_CFG) & (1 << 4))) {
> +		dev_dbg(&pdev->dev, "VID configured as output, "
> +			"no VID function\n");
> +		goto exit;
> +	}
> +
> +	res = superio_inb(sio_data, W83687THF_VID_DATA) & 0x3f;
> +
> +exit:
> +	superio_exit(sio_data);
> +	return res;
> +}
> +
> +static void w83627hf_init_device(struct platform_device *pdev)
> +{
> +	struct w83627hf_data *data = platform_get_drvdata(pdev);
> +	int i;
> +	enum chips type = data->type;
> +	u8 tmp;
> +
> +	/* Minimize conflicts with other winbond i2c-only clients...  */
> +	/* disable i2c subclients... how to disable main i2c client?? */
> +	/* force i2c address to relatively uncommon address */
> +	if (type == w83627hf) {
> +		w83627hf_write_value(data, W83781D_REG_I2C_SUBADDR, 0x89);
> +		w83627hf_write_value(data, W83781D_REG_I2C_ADDR, force_i2c);
> +	}
> +
> +	/* Read VID only once */
> +	if (type == w83627hf || type == w83637hf) {
> +		int lo = w83627hf_read_value(data, W83781D_REG_VID_FANDIV);
> +		int hi = w83627hf_read_value(data, W83781D_REG_CHIPID);
> +		data->vid = (lo & 0x0f) | ((hi & 0x01) << 4);
> +	} else if (type == w83627thf) {
> +		data->vid = w83627thf_read_gpio5(pdev);
> +	} else if (type == w83687thf) {
> +		data->vid = w83687thf_read_vid(pdev);
> +	}
> +
> +	/* Read VRM & OVT Config only once */
> +	if (type == w83627thf || type == w83637hf || type == w83687thf) {
> +		data->vrm_ovt =
> +			w83627hf_read_value(data, W83627THF_REG_VRM_OVT_CFG);
> +	}
> +
> +	tmp = w83627hf_read_value(data, W83781D_REG_SCFG1);
> +	for (i = 1; i <= 3; i++) {
> +		if (!(tmp & BIT_SCFG1[i - 1])) {
> +			data->sens[i - 1] = 4;
> +		} else {
> +			if (w83627hf_read_value
> +			    (data,
> +			     W83781D_REG_SCFG2) & BIT_SCFG2[i - 1])
> +				data->sens[i - 1] = 1;
> +			else
> +				data->sens[i - 1] = 2;
> +		}
> +		if ((type == w83697hf) && (i == 2))
> +			break;
> +	}
> +
> +	if(init) {
> +		/* Enable temp2 */
> +		tmp = w83627hf_read_value(data, W83627HF_REG_TEMP2_CONFIG);
> +		if (tmp & 0x01) {
> +			dev_warn(&pdev->dev, "Enabling temp2, readings "
> +				 "might not make sense\n");
> +			w83627hf_write_value(data, W83627HF_REG_TEMP2_CONFIG,
> +				tmp & 0xfe);
> +		}
> +
> +		/* Enable temp3 */
> +		if (type != w83697hf) {
> +			tmp = w83627hf_read_value(data,
> +				W83627HF_REG_TEMP3_CONFIG);
> +			if (tmp & 0x01) {
> +				dev_warn(&pdev->dev, "Enabling temp3, "
> +					 "readings might not make sense\n");
> +				w83627hf_write_value(data,
> +					W83627HF_REG_TEMP3_CONFIG, tmp & 0xfe);
> +			}
> +		}
> +	}
> +
> +	/* Start monitoring */
> +	w83627hf_write_value(data, W83781D_REG_CONFIG,
> +			    (w83627hf_read_value(data,
> +						W83781D_REG_CONFIG) & 0xf7)
> +			    | 0x01);
> +
> +	/* Enable VBAT monitoring if needed */
> +	tmp = w83627hf_read_value(data, W83781D_REG_VBAT);
> +	if (!(tmp & 0x01))
> +		w83627hf_write_value(data, W83781D_REG_VBAT, tmp | 0x01);
> +}
>  
>  /* use a different set of functions for in0 */
>  static ssize_t show_in_0(struct w83627hf_data *data, char *buf, u8 reg)
> @@ -582,6 +824,7 @@ static ssize_t in0_input_show(struct device *dev,
>  	struct w83627hf_data *data = w83627hf_update_device(dev);
>  	return show_in_0(data, buf, data->in[0]);
>  }
> +static DEVICE_ATTR_RO(in0_input);
>  
>  static ssize_t in0_min_show(struct device *dev, struct device_attribute *attr,
>  			    char *buf)
> @@ -590,13 +833,6 @@ static ssize_t in0_min_show(struct device *dev, struct device_attribute *attr,
>  	return show_in_0(data, buf, data->in_min[0]);
>  }
>  
> -static ssize_t in0_max_show(struct device *dev, struct device_attribute *attr,
> -			    char *buf)
> -{
> -	struct w83627hf_data *data = w83627hf_update_device(dev);
> -	return show_in_0(data, buf, data->in_max[0]);
> -}
> -
>  static ssize_t in0_min_store(struct device *dev,
>  			     struct device_attribute *attr, const char *buf,
>  			     size_t count)
> @@ -627,6 +863,15 @@ static ssize_t in0_min_store(struct device *dev,
>  	return count;
>  }
>  
> +static DEVICE_ATTR_RW(in0_min);
> +
> +static ssize_t in0_max_show(struct device *dev, struct device_attribute *attr,
> +			    char *buf)
> +{
> +	struct w83627hf_data *data = w83627hf_update_device(dev);
> +	return show_in_0(data, buf, data->in_max[0]);
> +}
> +
>  static ssize_t in0_max_store(struct device *dev,
>  			     struct device_attribute *attr, const char *buf,
>  			     size_t count)
> @@ -657,97 +902,129 @@ static ssize_t in0_max_store(struct device *dev,
>  	return count;
>  }
>  
> -static DEVICE_ATTR_RO(in0_input);
> -static DEVICE_ATTR_RW(in0_min);
>  static DEVICE_ATTR_RW(in0_max);
>  
>  static ssize_t
> -fan_input_show(struct device *dev, struct device_attribute *devattr,
> -	       char *buf)
> +alarm_show(struct device *dev, struct device_attribute *attr, char *buf)
>  {
> -	int nr = to_sensor_dev_attr(devattr)->index;
>  	struct w83627hf_data *data = w83627hf_update_device(dev);
> -	return sprintf(buf, "%ld\n", FAN_FROM_REG(data->fan[nr],
> -				(long)DIV_FROM_REG(data->fan_div[nr])));
> +	int bitnr = to_sensor_dev_attr(attr)->index;
> +	return sprintf(buf, "%u\n", (data->alarms >> bitnr) & 1);
>  }
> +
> +static SENSOR_DEVICE_ATTR_RO(in0_alarm, alarm, 0);
> +static SENSOR_DEVICE_ATTR_RO(in1_alarm, alarm, 1);
> +static SENSOR_DEVICE_ATTR_RO(in2_alarm, alarm, 2);
> +static SENSOR_DEVICE_ATTR_RO(in3_alarm, alarm, 3);
> +static SENSOR_DEVICE_ATTR_RO(in4_alarm, alarm, 8);
> +static SENSOR_DEVICE_ATTR_RO(in5_alarm, alarm, 9);
> +static SENSOR_DEVICE_ATTR_RO(in6_alarm, alarm, 10);
> +static SENSOR_DEVICE_ATTR_RO(in7_alarm, alarm, 16);
> +static SENSOR_DEVICE_ATTR_RO(in8_alarm, alarm, 17);
> +static SENSOR_DEVICE_ATTR_RO(fan1_alarm, alarm, 6);
> +static SENSOR_DEVICE_ATTR_RO(fan2_alarm, alarm, 7);
> +static SENSOR_DEVICE_ATTR_RO(fan3_alarm, alarm, 11);
> +static SENSOR_DEVICE_ATTR_RO(temp1_alarm, alarm, 4);
> +static SENSOR_DEVICE_ATTR_RO(temp2_alarm, alarm, 5);
> +static SENSOR_DEVICE_ATTR_RO(temp3_alarm, alarm, 13);
> +
>  static ssize_t
> -fan_min_show(struct device *dev, struct device_attribute *devattr, char *buf)
> +beep_show(struct device *dev, struct device_attribute *attr, char *buf)
>  {
> -	int nr = to_sensor_dev_attr(devattr)->index;
>  	struct w83627hf_data *data = w83627hf_update_device(dev);
> -	return sprintf(buf, "%ld\n", FAN_FROM_REG(data->fan_min[nr],
> -				(long)DIV_FROM_REG(data->fan_div[nr])));
> +	int bitnr = to_sensor_dev_attr(attr)->index;
> +	return sprintf(buf, "%u\n", (data->beep_mask >> bitnr) & 1);
>  }
> +
>  static ssize_t
> -fan_min_store(struct device *dev, struct device_attribute *devattr,
> -	      const char *buf, size_t count)
> +beep_store(struct device *dev, struct device_attribute *attr, const char *buf,
> +	   size_t count)
>  {
> -	int nr = to_sensor_dev_attr(devattr)->index;
>  	struct w83627hf_data *data = dev_get_drvdata(dev);
> -	unsigned long val;
> +	int bitnr = to_sensor_dev_attr(attr)->index;
> +	u8 reg;
> +	unsigned long bit;
>  	int err;
>  
> -	err = kstrtoul(buf, 10, &val);
> +	err = kstrtoul(buf, 10, &bit);
>  	if (err)
>  		return err;
>  
> -	mutex_lock(&data->update_lock);
> -	data->fan_min[nr] = FAN_TO_REG(val, DIV_FROM_REG(data->fan_div[nr]));
> -	w83627hf_write_value(data, W83627HF_REG_FAN_MIN(nr),
> -			     data->fan_min[nr]);
> -
> -	mutex_unlock(&data->update_lock);
> -	return count;
> -}
> +	if (bit & ~1)
> +		return -EINVAL;
>  
> -static SENSOR_DEVICE_ATTR_RO(fan1_input, fan_input, 0);
> -static SENSOR_DEVICE_ATTR_RW(fan1_min, fan_min, 0);
> -static SENSOR_DEVICE_ATTR_RO(fan2_input, fan_input, 1);
> -static SENSOR_DEVICE_ATTR_RW(fan2_min, fan_min, 1);
> -static SENSOR_DEVICE_ATTR_RO(fan3_input, fan_input, 2);
> -static SENSOR_DEVICE_ATTR_RW(fan3_min, fan_min, 2);
> +	mutex_lock(&data->update_lock);
> +	if (bit)
> +		data->beep_mask |= (1 << bitnr);
> +	else
> +		data->beep_mask &= ~(1 << bitnr);
>  
> -static ssize_t
> -temp_show(struct device *dev, struct device_attribute *devattr, char *buf)
> -{
> -	int nr = to_sensor_dev_attr(devattr)->index;
> -	struct w83627hf_data *data = w83627hf_update_device(dev);
> +	if (bitnr < 8) {
> +		reg = w83627hf_read_value(data, W83781D_REG_BEEP_INTS1);
> +		if (bit)
> +			reg |= (1 << bitnr);
> +		else
> +			reg &= ~(1 << bitnr);
> +		w83627hf_write_value(data, W83781D_REG_BEEP_INTS1, reg);
> +	} else if (bitnr < 16) {
> +		reg = w83627hf_read_value(data, W83781D_REG_BEEP_INTS2);
> +		if (bit)
> +			reg |= (1 << (bitnr - 8));
> +		else
> +			reg &= ~(1 << (bitnr - 8));
> +		w83627hf_write_value(data, W83781D_REG_BEEP_INTS2, reg);
> +	} else {
> +		reg = w83627hf_read_value(data, W83781D_REG_BEEP_INTS3);
> +		if (bit)
> +			reg |= (1 << (bitnr - 16));
> +		else
> +			reg &= ~(1 << (bitnr - 16));
> +		w83627hf_write_value(data, W83781D_REG_BEEP_INTS3, reg);
> +	}
> +	mutex_unlock(&data->update_lock);
>  
> -	u16 tmp = data->temp[nr];
> -	return sprintf(buf, "%ld\n", (nr) ? (long) LM75_TEMP_FROM_REG(tmp)
> -					  : (long) TEMP_FROM_REG(tmp));
> +	return count;
>  }
>  
> +static SENSOR_DEVICE_ATTR_RW(in0_beep, beep, 0);
> +static SENSOR_DEVICE_ATTR_RW(in1_beep, beep, 1);
> +static SENSOR_DEVICE_ATTR_RW(in2_beep, beep, 2);
> +static SENSOR_DEVICE_ATTR_RW(in3_beep, beep, 3);
> +static SENSOR_DEVICE_ATTR_RW(in4_beep, beep, 8);
> +static SENSOR_DEVICE_ATTR_RW(in5_beep, beep, 9);
> +static SENSOR_DEVICE_ATTR_RW(in6_beep, beep, 10);
> +static SENSOR_DEVICE_ATTR_RW(in7_beep, beep, 16);
> +static SENSOR_DEVICE_ATTR_RW(in8_beep, beep, 17);
> +static SENSOR_DEVICE_ATTR_RW(fan1_beep, beep, 6);
> +static SENSOR_DEVICE_ATTR_RW(fan2_beep, beep, 7);
> +static SENSOR_DEVICE_ATTR_RW(fan3_beep, beep, 11);
> +static SENSOR_DEVICE_ATTR_RW(temp1_beep, beep, 4);
> +static SENSOR_DEVICE_ATTR_RW(temp2_beep, beep, 5);
> +static SENSOR_DEVICE_ATTR_RW(temp3_beep, beep, 13);
> +static SENSOR_DEVICE_ATTR_RW(beep_enable, beep, 15);
> +
>  static ssize_t
> -temp_max_show(struct device *dev, struct device_attribute *devattr, char *buf)
> +in_input_show(struct device *dev, struct device_attribute *devattr, char *buf)
>  {
>  	int nr = to_sensor_dev_attr(devattr)->index;
>  	struct w83627hf_data *data = w83627hf_update_device(dev);
> -
> -	u16 tmp = data->temp_max[nr];
> -	return sprintf(buf, "%ld\n", (nr) ? (long) LM75_TEMP_FROM_REG(tmp)
> -					  : (long) TEMP_FROM_REG(tmp));
> +	return sprintf(buf, "%ld\n", (long)IN_FROM_REG(data->in[nr]));
>  }
>  
>  static ssize_t
> -temp_max_hyst_show(struct device *dev, struct device_attribute *devattr,
> -		   char *buf)
> +in_min_show(struct device *dev, struct device_attribute *devattr, char *buf)
>  {
>  	int nr = to_sensor_dev_attr(devattr)->index;
>  	struct w83627hf_data *data = w83627hf_update_device(dev);
> -
> -	u16 tmp = data->temp_max_hyst[nr];
> -	return sprintf(buf, "%ld\n", (nr) ? (long) LM75_TEMP_FROM_REG(tmp)
> -					  : (long) TEMP_FROM_REG(tmp));
> +	return sprintf(buf, "%ld\n", (long)IN_FROM_REG(data->in_min[nr]));
>  }
>  
>  static ssize_t
> -temp_max_store(struct device *dev, struct device_attribute *devattr,
> -	       const char *buf, size_t count)
> +in_min_store(struct device *dev, struct device_attribute *devattr,
> +	     const char *buf, size_t count)
>  {
>  	int nr = to_sensor_dev_attr(devattr)->index;
>  	struct w83627hf_data *data = dev_get_drvdata(dev);
> -	u16 tmp;
>  	long val;
>  	int err;
>  
> @@ -755,21 +1032,27 @@ temp_max_store(struct device *dev, struct device_attribute *devattr,
>  	if (err)
>  		return err;
>  
> -	tmp = (nr) ? LM75_TEMP_TO_REG(val) : TEMP_TO_REG(val);
>  	mutex_lock(&data->update_lock);
> -	data->temp_max[nr] = tmp;
> -	w83627hf_write_value(data, w83627hf_reg_temp_over[nr], tmp);
> +	data->in_min[nr] = IN_TO_REG(val);
> +	w83627hf_write_value(data, W83781D_REG_IN_MIN(nr), data->in_min[nr]);
>  	mutex_unlock(&data->update_lock);
>  	return count;
>  }
>  
>  static ssize_t
> -temp_max_hyst_store(struct device *dev, struct device_attribute *devattr,
> -		    const char *buf, size_t count)
> +in_max_show(struct device *dev, struct device_attribute *devattr, char *buf)
> +{
> +	int nr = to_sensor_dev_attr(devattr)->index;
> +	struct w83627hf_data *data = w83627hf_update_device(dev);
> +	return sprintf(buf, "%ld\n", (long)IN_FROM_REG(data->in_max[nr]));
> +}
> +
> +static ssize_t
> +in_max_store(struct device *dev, struct device_attribute *devattr,
> +	     const char *buf, size_t count)
>  {
>  	int nr = to_sensor_dev_attr(devattr)->index;
>  	struct w83627hf_data *data = dev_get_drvdata(dev);
> -	u16 tmp;
>  	long val;
>  	int err;
>  
> @@ -777,42 +1060,62 @@ temp_max_hyst_store(struct device *dev, struct device_attribute *devattr,
>  	if (err)
>  		return err;
>  
> -	tmp = (nr) ? LM75_TEMP_TO_REG(val) : TEMP_TO_REG(val);
>  	mutex_lock(&data->update_lock);
> -	data->temp_max_hyst[nr] = tmp;
> -	w83627hf_write_value(data, w83627hf_reg_temp_hyst[nr], tmp);
> +	data->in_max[nr] = IN_TO_REG(val);
> +	w83627hf_write_value(data, W83781D_REG_IN_MAX(nr), data->in_max[nr]);
>  	mutex_unlock(&data->update_lock);
>  	return count;
>  }
>  
> -static SENSOR_DEVICE_ATTR_RO(temp1_input, temp, 0);
> -static SENSOR_DEVICE_ATTR_RW(temp1_max, temp_max, 0);
> -static SENSOR_DEVICE_ATTR_RW(temp1_max_hyst, temp_max_hyst, 0);
> -static SENSOR_DEVICE_ATTR_RO(temp2_input, temp, 1);
> -static SENSOR_DEVICE_ATTR_RW(temp2_max, temp_max, 1);
> -static SENSOR_DEVICE_ATTR_RW(temp2_max_hyst, temp_max_hyst, 1);
> -static SENSOR_DEVICE_ATTR_RO(temp3_input, temp, 2);
> -static SENSOR_DEVICE_ATTR_RW(temp3_max, temp_max, 2);
> -static SENSOR_DEVICE_ATTR_RW(temp3_max_hyst, temp_max_hyst, 2);
> +static SENSOR_DEVICE_ATTR_RO(in1_input, in_input, 1);
> +static SENSOR_DEVICE_ATTR_RW(in1_min, in_min, 1);
> +static SENSOR_DEVICE_ATTR_RW(in1_max, in_max, 1);
> +static SENSOR_DEVICE_ATTR_RO(in2_input, in_input, 2);
> +static SENSOR_DEVICE_ATTR_RW(in2_min, in_min, 2);
> +static SENSOR_DEVICE_ATTR_RW(in2_max, in_max, 2);
> +static SENSOR_DEVICE_ATTR_RO(in3_input, in_input, 3);
> +static SENSOR_DEVICE_ATTR_RW(in3_min, in_min, 3);
> +static SENSOR_DEVICE_ATTR_RW(in3_max, in_max, 3);
> +static SENSOR_DEVICE_ATTR_RO(in4_input, in_input, 4);
> +static SENSOR_DEVICE_ATTR_RW(in4_min, in_min, 4);
> +static SENSOR_DEVICE_ATTR_RW(in4_max, in_max, 4);
> +static SENSOR_DEVICE_ATTR_RO(in5_input, in_input, 5);
> +static SENSOR_DEVICE_ATTR_RW(in5_min, in_min, 5);
> +static SENSOR_DEVICE_ATTR_RW(in5_max, in_max, 5);
> +static SENSOR_DEVICE_ATTR_RO(in6_input, in_input, 6);
> +static SENSOR_DEVICE_ATTR_RW(in6_min, in_min, 6);
> +static SENSOR_DEVICE_ATTR_RW(in6_max, in_max, 6);
> +static SENSOR_DEVICE_ATTR_RO(in7_input, in_input, 7);
> +static SENSOR_DEVICE_ATTR_RW(in7_min, in_min, 7);
> +static SENSOR_DEVICE_ATTR_RW(in7_max, in_max, 7);
> +static SENSOR_DEVICE_ATTR_RO(in8_input, in_input, 8);
> +static SENSOR_DEVICE_ATTR_RW(in8_min, in_min, 8);
> +static SENSOR_DEVICE_ATTR_RW(in8_max, in_max, 8);
>  
>  static ssize_t
> -cpu0_vid_show(struct device *dev, struct device_attribute *attr, char *buf)
> +fan_input_show(struct device *dev, struct device_attribute *devattr,
> +	       char *buf)
>  {
> +	int nr = to_sensor_dev_attr(devattr)->index;
>  	struct w83627hf_data *data = w83627hf_update_device(dev);
> -	return sprintf(buf, "%ld\n", (long) vid_from_reg(data->vid, data->vrm));
> +	return sprintf(buf, "%ld\n", FAN_FROM_REG(data->fan[nr],
> +				(long)DIV_FROM_REG(data->fan_div[nr])));
>  }
> -static DEVICE_ATTR_RO(cpu0_vid);
>  
>  static ssize_t
> -vrm_show(struct device *dev, struct device_attribute *attr, char *buf)
> +fan_min_show(struct device *dev, struct device_attribute *devattr, char *buf)
>  {
> -	struct w83627hf_data *data = dev_get_drvdata(dev);
> -	return sprintf(buf, "%ld\n", (long) data->vrm);
> +	int nr = to_sensor_dev_attr(devattr)->index;
> +	struct w83627hf_data *data = w83627hf_update_device(dev);
> +	return sprintf(buf, "%ld\n", FAN_FROM_REG(data->fan_min[nr],
> +				(long)DIV_FROM_REG(data->fan_div[nr])));
>  }
> +
>  static ssize_t
> -vrm_store(struct device *dev, struct device_attribute *attr, const char *buf,
> -	  size_t count)
> +fan_min_store(struct device *dev, struct device_attribute *devattr,
> +	      const char *buf, size_t count)
>  {
> +	int nr = to_sensor_dev_attr(devattr)->index;
>  	struct w83627hf_data *data = dev_get_drvdata(dev);
>  	unsigned long val;
>  	int err;
> @@ -821,58 +1124,45 @@ vrm_store(struct device *dev, struct device_attribute *attr, const char *buf,
>  	if (err)
>  		return err;
>  
> -	if (val > 255)
> -		return -EINVAL;
> -	data->vrm = val;
> +	mutex_lock(&data->update_lock);
> +	data->fan_min[nr] = FAN_TO_REG(val, DIV_FROM_REG(data->fan_div[nr]));
> +	w83627hf_write_value(data, W83627HF_REG_FAN_MIN(nr),
> +			     data->fan_min[nr]);
>  
> +	mutex_unlock(&data->update_lock);
>  	return count;
>  }
> -static DEVICE_ATTR_RW(vrm);
> -
> -static ssize_t
> -alarms_show(struct device *dev, struct device_attribute *attr, char *buf)
> -{
> -	struct w83627hf_data *data = w83627hf_update_device(dev);
> -	return sprintf(buf, "%ld\n", (long) data->alarms);
> -}
> -static DEVICE_ATTR_RO(alarms);
>  
> -static ssize_t
> -alarm_show(struct device *dev, struct device_attribute *attr, char *buf)
> -{
> -	struct w83627hf_data *data = w83627hf_update_device(dev);
> -	int bitnr = to_sensor_dev_attr(attr)->index;
> -	return sprintf(buf, "%u\n", (data->alarms >> bitnr) & 1);
> -}
> -static SENSOR_DEVICE_ATTR_RO(in0_alarm, alarm, 0);
> -static SENSOR_DEVICE_ATTR_RO(in1_alarm, alarm, 1);
> -static SENSOR_DEVICE_ATTR_RO(in2_alarm, alarm, 2);
> -static SENSOR_DEVICE_ATTR_RO(in3_alarm, alarm, 3);
> -static SENSOR_DEVICE_ATTR_RO(in4_alarm, alarm, 8);
> -static SENSOR_DEVICE_ATTR_RO(in5_alarm, alarm, 9);
> -static SENSOR_DEVICE_ATTR_RO(in6_alarm, alarm, 10);
> -static SENSOR_DEVICE_ATTR_RO(in7_alarm, alarm, 16);
> -static SENSOR_DEVICE_ATTR_RO(in8_alarm, alarm, 17);
> -static SENSOR_DEVICE_ATTR_RO(fan1_alarm, alarm, 6);
> -static SENSOR_DEVICE_ATTR_RO(fan2_alarm, alarm, 7);
> -static SENSOR_DEVICE_ATTR_RO(fan3_alarm, alarm, 11);
> -static SENSOR_DEVICE_ATTR_RO(temp1_alarm, alarm, 4);
> -static SENSOR_DEVICE_ATTR_RO(temp2_alarm, alarm, 5);
> -static SENSOR_DEVICE_ATTR_RO(temp3_alarm, alarm, 13);
> +static SENSOR_DEVICE_ATTR_RO(fan1_input, fan_input, 0);
> +static SENSOR_DEVICE_ATTR_RW(fan1_min, fan_min, 0);
> +static SENSOR_DEVICE_ATTR_RO(fan2_input, fan_input, 1);
> +static SENSOR_DEVICE_ATTR_RW(fan2_min, fan_min, 1);
> +static SENSOR_DEVICE_ATTR_RO(fan3_input, fan_input, 2);
> +static SENSOR_DEVICE_ATTR_RW(fan3_min, fan_min, 2);
>  
>  static ssize_t
> -beep_mask_show(struct device *dev, struct device_attribute *attr, char *buf)
> +fan_div_show(struct device *dev, struct device_attribute *devattr, char *buf)
>  {
> +	int nr = to_sensor_dev_attr(devattr)->index;
>  	struct w83627hf_data *data = w83627hf_update_device(dev);
>  	return sprintf(buf, "%ld\n",
> -		      (long)BEEP_MASK_FROM_REG(data->beep_mask));
> +		       (long) DIV_FROM_REG(data->fan_div[nr]));
>  }
>  
> +/*
> + * Note: we save and restore the fan minimum here, because its value is
> + * determined in part by the fan divisor.  This follows the principle of
> + * least surprise; the user doesn't expect the fan minimum to change just
> + * because the divisor changed.
> + */
>  static ssize_t
> -beep_mask_store(struct device *dev, struct device_attribute *attr,
> -		const char *buf, size_t count)
> +fan_div_store(struct device *dev, struct device_attribute *devattr,
> +	      const char *buf, size_t count)
>  {
> +	int nr = to_sensor_dev_attr(devattr)->index;
>  	struct w83627hf_data *data = dev_get_drvdata(dev);
> +	unsigned long min;
> +	u8 reg;
>  	unsigned long val;
>  	int err;
>  
> @@ -882,289 +1172,121 @@ beep_mask_store(struct device *dev, struct device_attribute *attr,
>  
>  	mutex_lock(&data->update_lock);
>  
> -	/* preserve beep enable */
> -	data->beep_mask = (data->beep_mask & 0x8000)
> -			| BEEP_MASK_TO_REG(val);
> -	w83627hf_write_value(data, W83781D_REG_BEEP_INTS1,
> -			    data->beep_mask & 0xff);
> -	w83627hf_write_value(data, W83781D_REG_BEEP_INTS3,
> -			    ((data->beep_mask) >> 16) & 0xff);
> -	w83627hf_write_value(data, W83781D_REG_BEEP_INTS2,
> -			    (data->beep_mask >> 8) & 0xff);
> +	/* Save fan_min */
> +	min = FAN_FROM_REG(data->fan_min[nr],
> +			   DIV_FROM_REG(data->fan_div[nr]));
> +
> +	data->fan_div[nr] = DIV_TO_REG(val);
> +
> +	reg = (w83627hf_read_value(data, nr==2 ? W83781D_REG_PIN : W83781D_REG_VID_FANDIV)
> +	       & (nr==0 ? 0xcf : 0x3f))
> +	    | ((data->fan_div[nr] & 0x03) << (nr==0 ? 4 : 6));
> +	w83627hf_write_value(data, nr==2 ? W83781D_REG_PIN : W83781D_REG_VID_FANDIV, reg);
> +
> +	reg = (w83627hf_read_value(data, W83781D_REG_VBAT)
> +	       & ~(1 << (5 + nr)))
> +	    | ((data->fan_div[nr] & 0x04) << (3 + nr));
> +	w83627hf_write_value(data, W83781D_REG_VBAT, reg);
> +
> +	/* Restore fan_min */
> +	data->fan_min[nr] = FAN_TO_REG(min, DIV_FROM_REG(data->fan_div[nr]));
> +	w83627hf_write_value(data, W83627HF_REG_FAN_MIN(nr), data->fan_min[nr]);
>  
>  	mutex_unlock(&data->update_lock);
>  	return count;
>  }
>  
> -static DEVICE_ATTR_RW(beep_mask);
> +static SENSOR_DEVICE_ATTR_RW(fan1_div, fan_div, 0);
> +static SENSOR_DEVICE_ATTR_RW(fan2_div, fan_div, 1);
> +static SENSOR_DEVICE_ATTR_RW(fan3_div, fan_div, 2);
>  
>  static ssize_t
> -beep_show(struct device *dev, struct device_attribute *attr, char *buf)
> +temp_show(struct device *dev, struct device_attribute *devattr, char *buf)
>  {
> +	int nr = to_sensor_dev_attr(devattr)->index;
>  	struct w83627hf_data *data = w83627hf_update_device(dev);
> -	int bitnr = to_sensor_dev_attr(attr)->index;
> -	return sprintf(buf, "%u\n", (data->beep_mask >> bitnr) & 1);
> +
> +	u16 tmp = data->temp[nr];
> +	return sprintf(buf, "%ld\n", (nr) ? (long) LM75_TEMP_FROM_REG(tmp)
> +					  : (long) TEMP_FROM_REG(tmp));
>  }
>  
>  static ssize_t
> -beep_store(struct device *dev, struct device_attribute *attr, const char *buf,
> -	   size_t count)
> -{
> -	struct w83627hf_data *data = dev_get_drvdata(dev);
> -	int bitnr = to_sensor_dev_attr(attr)->index;
> -	u8 reg;
> -	unsigned long bit;
> -	int err;
> -
> -	err = kstrtoul(buf, 10, &bit);
> -	if (err)
> -		return err;
> -
> -	if (bit & ~1)
> -		return -EINVAL;
> -
> -	mutex_lock(&data->update_lock);
> -	if (bit)
> -		data->beep_mask |= (1 << bitnr);
> -	else
> -		data->beep_mask &= ~(1 << bitnr);
> -
> -	if (bitnr < 8) {
> -		reg = w83627hf_read_value(data, W83781D_REG_BEEP_INTS1);
> -		if (bit)
> -			reg |= (1 << bitnr);
> -		else
> -			reg &= ~(1 << bitnr);
> -		w83627hf_write_value(data, W83781D_REG_BEEP_INTS1, reg);
> -	} else if (bitnr < 16) {
> -		reg = w83627hf_read_value(data, W83781D_REG_BEEP_INTS2);
> -		if (bit)
> -			reg |= (1 << (bitnr - 8));
> -		else
> -			reg &= ~(1 << (bitnr - 8));
> -		w83627hf_write_value(data, W83781D_REG_BEEP_INTS2, reg);
> -	} else {
> -		reg = w83627hf_read_value(data, W83781D_REG_BEEP_INTS3);
> -		if (bit)
> -			reg |= (1 << (bitnr - 16));
> -		else
> -			reg &= ~(1 << (bitnr - 16));
> -		w83627hf_write_value(data, W83781D_REG_BEEP_INTS3, reg);
> -	}
> -	mutex_unlock(&data->update_lock);
> -
> -	return count;
> -}
> -
> -static SENSOR_DEVICE_ATTR_RW(in0_beep, beep, 0);
> -static SENSOR_DEVICE_ATTR_RW(in1_beep, beep, 1);
> -static SENSOR_DEVICE_ATTR_RW(in2_beep, beep, 2);
> -static SENSOR_DEVICE_ATTR_RW(in3_beep, beep, 3);
> -static SENSOR_DEVICE_ATTR_RW(in4_beep, beep, 8);
> -static SENSOR_DEVICE_ATTR_RW(in5_beep, beep, 9);
> -static SENSOR_DEVICE_ATTR_RW(in6_beep, beep, 10);
> -static SENSOR_DEVICE_ATTR_RW(in7_beep, beep, 16);
> -static SENSOR_DEVICE_ATTR_RW(in8_beep, beep, 17);
> -static SENSOR_DEVICE_ATTR_RW(fan1_beep, beep, 6);
> -static SENSOR_DEVICE_ATTR_RW(fan2_beep, beep, 7);
> -static SENSOR_DEVICE_ATTR_RW(fan3_beep, beep, 11);
> -static SENSOR_DEVICE_ATTR_RW(temp1_beep, beep, 4);
> -static SENSOR_DEVICE_ATTR_RW(temp2_beep, beep, 5);
> -static SENSOR_DEVICE_ATTR_RW(temp3_beep, beep, 13);
> -static SENSOR_DEVICE_ATTR_RW(beep_enable, beep, 15);
> -
> -static ssize_t
> -fan_div_show(struct device *dev, struct device_attribute *devattr, char *buf)
> +temp_max_show(struct device *dev, struct device_attribute *devattr, char *buf)
>  {
>  	int nr = to_sensor_dev_attr(devattr)->index;
>  	struct w83627hf_data *data = w83627hf_update_device(dev);
> -	return sprintf(buf, "%ld\n",
> -		       (long) DIV_FROM_REG(data->fan_div[nr]));
> -}
> -/*
> - * Note: we save and restore the fan minimum here, because its value is
> - * determined in part by the fan divisor.  This follows the principle of
> - * least surprise; the user doesn't expect the fan minimum to change just
> - * because the divisor changed.
> - */
> -static ssize_t
> -fan_div_store(struct device *dev, struct device_attribute *devattr,
> -	      const char *buf, size_t count)
> -{
> -	int nr = to_sensor_dev_attr(devattr)->index;
> -	struct w83627hf_data *data = dev_get_drvdata(dev);
> -	unsigned long min;
> -	u8 reg;
> -	unsigned long val;
> -	int err;
> -
> -	err = kstrtoul(buf, 10, &val);
> -	if (err)
> -		return err;
> -
> -	mutex_lock(&data->update_lock);
> -
> -	/* Save fan_min */
> -	min = FAN_FROM_REG(data->fan_min[nr],
> -			   DIV_FROM_REG(data->fan_div[nr]));
> -
> -	data->fan_div[nr] = DIV_TO_REG(val);
> -
> -	reg = (w83627hf_read_value(data, nr==2 ? W83781D_REG_PIN : W83781D_REG_VID_FANDIV)
> -	       & (nr==0 ? 0xcf : 0x3f))
> -	    | ((data->fan_div[nr] & 0x03) << (nr==0 ? 4 : 6));
> -	w83627hf_write_value(data, nr==2 ? W83781D_REG_PIN : W83781D_REG_VID_FANDIV, reg);
> -
> -	reg = (w83627hf_read_value(data, W83781D_REG_VBAT)
> -	       & ~(1 << (5 + nr)))
> -	    | ((data->fan_div[nr] & 0x04) << (3 + nr));
> -	w83627hf_write_value(data, W83781D_REG_VBAT, reg);
> -
> -	/* Restore fan_min */
> -	data->fan_min[nr] = FAN_TO_REG(min, DIV_FROM_REG(data->fan_div[nr]));
> -	w83627hf_write_value(data, W83627HF_REG_FAN_MIN(nr), data->fan_min[nr]);
> -
> -	mutex_unlock(&data->update_lock);
> -	return count;
> -}
> -
> -static SENSOR_DEVICE_ATTR_RW(fan1_div, fan_div, 0);
> -static SENSOR_DEVICE_ATTR_RW(fan2_div, fan_div, 1);
> -static SENSOR_DEVICE_ATTR_RW(fan3_div, fan_div, 2);
>  
> -static ssize_t
> -pwm_show(struct device *dev, struct device_attribute *devattr, char *buf)
> -{
> -	int nr = to_sensor_dev_attr(devattr)->index;
> -	struct w83627hf_data *data = w83627hf_update_device(dev);
> -	return sprintf(buf, "%ld\n", (long) data->pwm[nr]);
> +	u16 tmp = data->temp_max[nr];
> +	return sprintf(buf, "%ld\n", (nr) ? (long) LM75_TEMP_FROM_REG(tmp)
> +					  : (long) TEMP_FROM_REG(tmp));
>  }
>  
>  static ssize_t
> -pwm_store(struct device *dev, struct device_attribute *devattr,
> -	  const char *buf, size_t count)
> +temp_max_store(struct device *dev, struct device_attribute *devattr,
> +	       const char *buf, size_t count)
>  {
>  	int nr = to_sensor_dev_attr(devattr)->index;
>  	struct w83627hf_data *data = dev_get_drvdata(dev);
> -	unsigned long val;
> +	u16 tmp;
> +	long val;
>  	int err;
>  
> -	err = kstrtoul(buf, 10, &val);
> +	err = kstrtol(buf, 10, &val);
>  	if (err)
>  		return err;
>  
> +	tmp = (nr) ? LM75_TEMP_TO_REG(val) : TEMP_TO_REG(val);
>  	mutex_lock(&data->update_lock);
> -
> -	if (data->type == w83627thf) {
> -		/* bits 0-3 are reserved  in 627THF */
> -		data->pwm[nr] = PWM_TO_REG(val) & 0xf0;
> -		w83627hf_write_value(data,
> -				     W836X7HF_REG_PWM(data->type, nr),
> -				     data->pwm[nr] |
> -				     (w83627hf_read_value(data,
> -				     W836X7HF_REG_PWM(data->type, nr)) & 0x0f));
> -	} else {
> -		data->pwm[nr] = PWM_TO_REG(val);
> -		w83627hf_write_value(data,
> -				     W836X7HF_REG_PWM(data->type, nr),
> -				     data->pwm[nr]);
> -	}
> -
> +	data->temp_max[nr] = tmp;
> +	w83627hf_write_value(data, w83627hf_reg_temp_over[nr], tmp);
>  	mutex_unlock(&data->update_lock);
>  	return count;
>  }
>  
> -static SENSOR_DEVICE_ATTR_RW(pwm1, pwm, 0);
> -static SENSOR_DEVICE_ATTR_RW(pwm2, pwm, 1);
> -static SENSOR_DEVICE_ATTR_RW(pwm3, pwm, 2);
> -
>  static ssize_t
> -pwm_enable_show(struct device *dev, struct device_attribute *devattr,
> -		char *buf)
> +temp_max_hyst_show(struct device *dev, struct device_attribute *devattr,
> +		   char *buf)
>  {
>  	int nr = to_sensor_dev_attr(devattr)->index;
>  	struct w83627hf_data *data = w83627hf_update_device(dev);
> -	return sprintf(buf, "%d\n", data->pwm_enable[nr]);
> -}
> -
> -static ssize_t
> -pwm_enable_store(struct device *dev, struct device_attribute *devattr,
> -		 const char *buf, size_t count)
> -{
> -	int nr = to_sensor_dev_attr(devattr)->index;
> -	struct w83627hf_data *data = dev_get_drvdata(dev);
> -	u8 reg;
> -	unsigned long val;
> -	int err;
> -
> -	err = kstrtoul(buf, 10, &val);
> -	if (err)
> -		return err;
> -
> -	if (!val || val > 3)	/* modes 1, 2 and 3 are supported */
> -		return -EINVAL;
> -	mutex_lock(&data->update_lock);
> -	data->pwm_enable[nr] = val;
> -	reg = w83627hf_read_value(data, W83627THF_REG_PWM_ENABLE[nr]);
> -	reg &= ~(0x03 << W83627THF_PWM_ENABLE_SHIFT[nr]);
> -	reg |= (val - 1) << W83627THF_PWM_ENABLE_SHIFT[nr];
> -	w83627hf_write_value(data, W83627THF_REG_PWM_ENABLE[nr], reg);
> -	mutex_unlock(&data->update_lock);
> -	return count;
> -}
> -
> -static SENSOR_DEVICE_ATTR_RW(pwm1_enable, pwm_enable, 0);
> -static SENSOR_DEVICE_ATTR_RW(pwm2_enable, pwm_enable, 1);
> -static SENSOR_DEVICE_ATTR_RW(pwm3_enable, pwm_enable, 2);
>  
> -static ssize_t
> -pwm_freq_show(struct device *dev, struct device_attribute *devattr, char *buf)
> -{
> -	int nr = to_sensor_dev_attr(devattr)->index;
> -	struct w83627hf_data *data = w83627hf_update_device(dev);
> -	if (data->type == w83627hf)
> -		return sprintf(buf, "%ld\n",
> -			pwm_freq_from_reg_627hf(data->pwm_freq[nr]));
> -	else
> -		return sprintf(buf, "%ld\n",
> -			pwm_freq_from_reg(data->pwm_freq[nr]));
> +	u16 tmp = data->temp_max_hyst[nr];
> +	return sprintf(buf, "%ld\n", (nr) ? (long) LM75_TEMP_FROM_REG(tmp)
> +					  : (long) TEMP_FROM_REG(tmp));
>  }
>  
>  static ssize_t
> -pwm_freq_store(struct device *dev, struct device_attribute *devattr,
> -	       const char *buf, size_t count)
> +temp_max_hyst_store(struct device *dev, struct device_attribute *devattr,
> +		    const char *buf, size_t count)
>  {
>  	int nr = to_sensor_dev_attr(devattr)->index;
>  	struct w83627hf_data *data = dev_get_drvdata(dev);
> -	static const u8 mask[]={0xF8, 0x8F};
> -	unsigned long val;
> +	u16 tmp;
> +	long val;
>  	int err;
>  
> -	err = kstrtoul(buf, 10, &val);
> +	err = kstrtol(buf, 10, &val);
>  	if (err)
>  		return err;
>  
> +	tmp = (nr) ? LM75_TEMP_TO_REG(val) : TEMP_TO_REG(val);
>  	mutex_lock(&data->update_lock);
> -
> -	if (data->type == w83627hf) {
> -		data->pwm_freq[nr] = pwm_freq_to_reg_627hf(val);
> -		w83627hf_write_value(data, W83627HF_REG_PWM_FREQ,
> -				(data->pwm_freq[nr] << (nr*4)) |
> -				(w83627hf_read_value(data,
> -				W83627HF_REG_PWM_FREQ) & mask[nr]));
> -	} else {
> -		data->pwm_freq[nr] = pwm_freq_to_reg(val);
> -		w83627hf_write_value(data, W83637HF_REG_PWM_FREQ[nr],
> -				data->pwm_freq[nr]);
> -	}
> -
> +	data->temp_max_hyst[nr] = tmp;
> +	w83627hf_write_value(data, w83627hf_reg_temp_hyst[nr], tmp);
>  	mutex_unlock(&data->update_lock);
>  	return count;
>  }
>  
> -static SENSOR_DEVICE_ATTR_RW(pwm1_freq, pwm_freq, 0);
> -static SENSOR_DEVICE_ATTR_RW(pwm2_freq, pwm_freq, 1);
> -static SENSOR_DEVICE_ATTR_RW(pwm3_freq, pwm_freq, 2);
> +static SENSOR_DEVICE_ATTR_RO(temp1_input, temp, 0);
> +static SENSOR_DEVICE_ATTR_RW(temp1_max, temp_max, 0);
> +static SENSOR_DEVICE_ATTR_RW(temp1_max_hyst, temp_max_hyst, 0);
> +static SENSOR_DEVICE_ATTR_RO(temp2_input, temp, 1);
> +static SENSOR_DEVICE_ATTR_RW(temp2_max, temp_max, 1);
> +static SENSOR_DEVICE_ATTR_RW(temp2_max_hyst, temp_max_hyst, 1);
> +static SENSOR_DEVICE_ATTR_RO(temp3_input, temp, 2);
> +static SENSOR_DEVICE_ATTR_RW(temp3_max, temp_max, 2);
> +static SENSOR_DEVICE_ATTR_RW(temp3_max_hyst, temp_max_hyst, 2);
>  
>  static ssize_t
>  temp_type_show(struct device *dev, struct device_attribute *devattr,
> @@ -1236,81 +1358,12 @@ static SENSOR_DEVICE_ATTR_RW(temp2_type, temp_type, 1);
>  static SENSOR_DEVICE_ATTR_RW(temp3_type, temp_type, 2);
>  
>  static ssize_t
> -name_show(struct device *dev, struct device_attribute *devattr, char *buf)
> +alarms_show(struct device *dev, struct device_attribute *attr, char *buf)
>  {
> -	struct w83627hf_data *data = dev_get_drvdata(dev);
> -
> -	return sprintf(buf, "%s\n", data->name);
> -}
> -static DEVICE_ATTR_RO(name);
> -
> -static int __init w83627hf_find(int sioaddr, unsigned short *addr,
> -				struct w83627hf_sio_data *sio_data)
> -{
> -	int err;
> -	u16 val;
> -
> -	static __initconst char *const names[] = {
> -		"W83627HF",
> -		"W83627THF",
> -		"W83697HF",
> -		"W83637HF",
> -		"W83687THF",
> -	};
> -
> -	sio_data->sioaddr = sioaddr;
> -	err = superio_enter(sio_data);
> -	if (err)
> -		return err;
> -
> -	err = -ENODEV;
> -	val = force_id ? force_id : superio_inb(sio_data, DEVID);
> -	switch (val) {
> -	case W627_DEVID:
> -		sio_data->type = w83627hf;
> -		break;
> -	case W627THF_DEVID:
> -		sio_data->type = w83627thf;
> -		break;
> -	case W697_DEVID:
> -		sio_data->type = w83697hf;
> -		break;
> -	case W637_DEVID:
> -		sio_data->type = w83637hf;
> -		break;
> -	case W687THF_DEVID:
> -		sio_data->type = w83687thf;
> -		break;
> -	case 0xff:	/* No device at all */
> -		goto exit;
> -	default:
> -		pr_debug(DRVNAME ": Unsupported chip (DEVID=0x%02x)\n", val);
> -		goto exit;
> -	}
> -
> -	superio_select(sio_data, W83627HF_LD_HWM);
> -	val = (superio_inb(sio_data, WINB_BASE_REG) << 8) |
> -	       superio_inb(sio_data, WINB_BASE_REG + 1);
> -	*addr = val & WINB_ALIGNMENT;
> -	if (*addr == 0) {
> -		pr_warn("Base address not set, skipping\n");
> -		goto exit;
> -	}
> -
> -	val = superio_inb(sio_data, WINB_ACT_REG);
> -	if (!(val & 0x01)) {
> -		pr_warn("Enabling HWM logical device\n");
> -		superio_outb(sio_data, WINB_ACT_REG, val | 0x01);
> -	}
> -
> -	err = 0;
> -	pr_info(DRVNAME ": Found %s chip at %#x\n",
> -		names[sio_data->type], *addr);
> -
> - exit:
> -	superio_exit(sio_data);
> -	return err;
> +	struct w83627hf_data *data = w83627hf_update_device(dev);
> +	return sprintf(buf, "%ld\n", (long) data->alarms);
>  }
> +static DEVICE_ATTR_RO(alarms);
>  
>  #define VIN_UNIT_ATTRS(_X_)	\
>  	&sensor_dev_attr_in##_X_##_input.dev_attr.attr,		\
> @@ -1334,6 +1387,100 @@ static int __init w83627hf_find(int sioaddr, unsigned short *addr,
>  	&sensor_dev_attr_temp##_X_##_alarm.dev_attr.attr,	\
>  	&sensor_dev_attr_temp##_X_##_beep.dev_attr.attr
>  
> +static ssize_t
> +beep_mask_show(struct device *dev, struct device_attribute *attr, char *buf)
> +{
> +	struct w83627hf_data *data = w83627hf_update_device(dev);
> +	return sprintf(buf, "%ld\n",
> +		      (long)BEEP_MASK_FROM_REG(data->beep_mask));
> +}
> +
> +static ssize_t
> +beep_mask_store(struct device *dev, struct device_attribute *attr,
> +		const char *buf, size_t count)
> +{
> +	struct w83627hf_data *data = dev_get_drvdata(dev);
> +	unsigned long val;
> +	int err;
> +
> +	err = kstrtoul(buf, 10, &val);
> +	if (err)
> +		return err;
> +
> +	mutex_lock(&data->update_lock);
> +
> +	/* preserve beep enable */
> +	data->beep_mask = (data->beep_mask & 0x8000)
> +			| BEEP_MASK_TO_REG(val);
> +	w83627hf_write_value(data, W83781D_REG_BEEP_INTS1,
> +			    data->beep_mask & 0xff);
> +	w83627hf_write_value(data, W83781D_REG_BEEP_INTS3,
> +			    ((data->beep_mask) >> 16) & 0xff);
> +	w83627hf_write_value(data, W83781D_REG_BEEP_INTS2,
> +			    (data->beep_mask >> 8) & 0xff);
> +
> +	mutex_unlock(&data->update_lock);
> +	return count;
> +}
> +
> +static DEVICE_ATTR_RW(beep_mask);
> +
> +static ssize_t
> +pwm_show(struct device *dev, struct device_attribute *devattr, char *buf)
> +{
> +	int nr = to_sensor_dev_attr(devattr)->index;
> +	struct w83627hf_data *data = w83627hf_update_device(dev);
> +	return sprintf(buf, "%ld\n", (long) data->pwm[nr]);
> +}
> +
> +static ssize_t
> +pwm_store(struct device *dev, struct device_attribute *devattr,
> +	  const char *buf, size_t count)
> +{
> +	int nr = to_sensor_dev_attr(devattr)->index;
> +	struct w83627hf_data *data = dev_get_drvdata(dev);
> +	unsigned long val;
> +	int err;
> +
> +	err = kstrtoul(buf, 10, &val);
> +	if (err)
> +		return err;
> +
> +	mutex_lock(&data->update_lock);
> +
> +	if (data->type == w83627thf) {
> +		/* bits 0-3 are reserved  in 627THF */
> +		data->pwm[nr] = PWM_TO_REG(val) & 0xf0;
> +		w83627hf_write_value(data,
> +				     W836X7HF_REG_PWM(data->type, nr),
> +				     data->pwm[nr] |
> +				     (w83627hf_read_value(data,
> +				     W836X7HF_REG_PWM(data->type, nr)) & 0x0f));
> +	} else {
> +		data->pwm[nr] = PWM_TO_REG(val);
> +		w83627hf_write_value(data,
> +				     W836X7HF_REG_PWM(data->type, nr),
> +				     data->pwm[nr]);
> +	}
> +
> +	mutex_unlock(&data->update_lock);
> +	return count;
> +}
> +
> +static SENSOR_DEVICE_ATTR_RW(pwm1, pwm, 0);
> +static SENSOR_DEVICE_ATTR_RW(pwm2, pwm, 1);
> +static SENSOR_DEVICE_ATTR_RW(pwm3, pwm, 2);
> +
> +static ssize_t
> +name_show(struct device *dev, struct device_attribute *devattr, char *buf)
> +{
> +	struct w83627hf_data *data = dev_get_drvdata(dev);
> +
> +	return sprintf(buf, "%s\n", data->name);
> +}
> +
> +static DEVICE_ATTR_RO(name);
> +
>  static struct attribute *w83627hf_attributes[] = {
>  	&dev_attr_in0_input.attr,
>  	&dev_attr_in0_min.attr,
> @@ -1366,59 +1513,184 @@ static const struct attribute_group w83627hf_group = {
>  	.attrs = w83627hf_attributes,
>  };
>  
> -static struct attribute *w83627hf_attributes_opt[] = {
> -	VIN_UNIT_ATTRS(1),
> -	VIN_UNIT_ATTRS(5),
> -	VIN_UNIT_ATTRS(6),
> +static ssize_t
> +pwm_freq_show(struct device *dev, struct device_attribute *devattr, char *buf)
> +{
> +	int nr = to_sensor_dev_attr(devattr)->index;
> +	struct w83627hf_data *data = w83627hf_update_device(dev);
> +	if (data->type == w83627hf)
> +		return sprintf(buf, "%ld\n",
> +			pwm_freq_from_reg_627hf(data->pwm_freq[nr]));
> +	else
> +		return sprintf(buf, "%ld\n",
> +			pwm_freq_from_reg(data->pwm_freq[nr]));
> +}
>  
> -	FAN_UNIT_ATTRS(3),
> -	TEMP_UNIT_ATTRS(3),
> -	&sensor_dev_attr_pwm3.dev_attr.attr,
> +static ssize_t
> +pwm_freq_store(struct device *dev, struct device_attribute *devattr,
> +	       const char *buf, size_t count)
> +{
> +	int nr = to_sensor_dev_attr(devattr)->index;
> +	struct w83627hf_data *data = dev_get_drvdata(dev);
> +	static const u8 mask[]={0xF8, 0x8F};
> +	unsigned long val;
> +	int err;
>  
> -	&sensor_dev_attr_pwm1_freq.dev_attr.attr,
> -	&sensor_dev_attr_pwm2_freq.dev_attr.attr,
> -	&sensor_dev_attr_pwm3_freq.dev_attr.attr,
> +	err = kstrtoul(buf, 10, &val);
> +	if (err)
> +		return err;
>  
> -	&sensor_dev_attr_pwm1_enable.dev_attr.attr,
> -	&sensor_dev_attr_pwm2_enable.dev_attr.attr,
> -	&sensor_dev_attr_pwm3_enable.dev_attr.attr,
> +	mutex_lock(&data->update_lock);
>  
> -	NULL
> -};
> +	if (data->type == w83627hf) {
> +		data->pwm_freq[nr] = pwm_freq_to_reg_627hf(val);
> +		w83627hf_write_value(data, W83627HF_REG_PWM_FREQ,
> +				(data->pwm_freq[nr] << (nr*4)) |
> +				(w83627hf_read_value(data,
> +				W83627HF_REG_PWM_FREQ) & mask[nr]));
> +	} else {
> +		data->pwm_freq[nr] = pwm_freq_to_reg(val);
> +		w83627hf_write_value(data, W83637HF_REG_PWM_FREQ[nr],
> +				data->pwm_freq[nr]);
> +	}
>  
> -static const struct attribute_group w83627hf_group_opt = {
> -	.attrs = w83627hf_attributes_opt,
> -};
> +	mutex_unlock(&data->update_lock);
> +	return count;
> +}
>  
> -static int w83627hf_probe(struct platform_device *pdev)
> -{
> -	struct device *dev = &pdev->dev;
> -	struct w83627hf_sio_data *sio_data = dev_get_platdata(dev);
> -	struct w83627hf_data *data;
> -	struct resource *res;
> -	int err, i;
> +static SENSOR_DEVICE_ATTR_RW(pwm1_freq, pwm_freq, 0);
> +static SENSOR_DEVICE_ATTR_RW(pwm2_freq, pwm_freq, 1);
> +static SENSOR_DEVICE_ATTR_RW(pwm3_freq, pwm_freq, 2);
>  
> -	static const char *names[] = {
> -		"w83627hf",
> -		"w83627thf",
> -		"w83697hf",
> -		"w83637hf",
> -		"w83687thf",
> -	};
> +static ssize_t
> +cpu0_vid_show(struct device *dev, struct device_attribute *attr, char *buf)
> +{
> +	struct w83627hf_data *data = w83627hf_update_device(dev);
> +	return sprintf(buf, "%ld\n", (long) vid_from_reg(data->vid, data->vrm));
> +}
>  
> -	res = platform_get_resource(pdev, IORESOURCE_IO, 0);
> -	if (!devm_request_region(dev, res->start, WINB_REGION_SIZE, DRVNAME)) {
> -		dev_err(dev, "Failed to request region 0x%lx-0x%lx\n",
> -			(unsigned long)res->start,
> -			(unsigned long)(res->start + WINB_REGION_SIZE - 1));
> -		return -EBUSY;
> -	}
> +static DEVICE_ATTR_RO(cpu0_vid);
>  
> -	data = devm_kzalloc(dev, sizeof(struct w83627hf_data), GFP_KERNEL);
> -	if (!data)
> -		return -ENOMEM;
> +static ssize_t
> +vrm_show(struct device *dev, struct device_attribute *attr, char *buf)
> +{
> +	struct w83627hf_data *data = dev_get_drvdata(dev);
> +	return sprintf(buf, "%ld\n", (long) data->vrm);
> +}
>  
> -	data->addr = res->start;
> +static ssize_t
> +vrm_store(struct device *dev, struct device_attribute *attr, const char *buf,
> +	  size_t count)
> +{
> +	struct w83627hf_data *data = dev_get_drvdata(dev);
> +	unsigned long val;
> +	int err;
> +
> +	err = kstrtoul(buf, 10, &val);
> +	if (err)
> +		return err;
> +
> +	if (val > 255)
> +		return -EINVAL;
> +	data->vrm = val;
> +
> +	return count;
> +}
> +
> +static DEVICE_ATTR_RW(vrm);
> +
> +static ssize_t
> +pwm_enable_show(struct device *dev, struct device_attribute *devattr,
> +		char *buf)
> +{
> +	int nr = to_sensor_dev_attr(devattr)->index;
> +	struct w83627hf_data *data = w83627hf_update_device(dev);
> +	return sprintf(buf, "%d\n", data->pwm_enable[nr]);
> +}
> +
> +static ssize_t
> +pwm_enable_store(struct device *dev, struct device_attribute *devattr,
> +		 const char *buf, size_t count)
> +{
> +	int nr = to_sensor_dev_attr(devattr)->index;
> +	struct w83627hf_data *data = dev_get_drvdata(dev);
> +	u8 reg;
> +	unsigned long val;
> +	int err;
> +
> +	err = kstrtoul(buf, 10, &val);
> +	if (err)
> +		return err;
> +
> +	if (!val || val > 3)	/* modes 1, 2 and 3 are supported */
> +		return -EINVAL;
> +	mutex_lock(&data->update_lock);
> +	data->pwm_enable[nr] = val;
> +	reg = w83627hf_read_value(data, W83627THF_REG_PWM_ENABLE[nr]);
> +	reg &= ~(0x03 << W83627THF_PWM_ENABLE_SHIFT[nr]);
> +	reg |= (val - 1) << W83627THF_PWM_ENABLE_SHIFT[nr];
> +	w83627hf_write_value(data, W83627THF_REG_PWM_ENABLE[nr], reg);
> +	mutex_unlock(&data->update_lock);
> +	return count;
> +}
> +
> +static SENSOR_DEVICE_ATTR_RW(pwm1_enable, pwm_enable, 0);
> +static SENSOR_DEVICE_ATTR_RW(pwm2_enable, pwm_enable, 1);
> +static SENSOR_DEVICE_ATTR_RW(pwm3_enable, pwm_enable, 2);
> +
> +static struct attribute *w83627hf_attributes_opt[] = {
> +	VIN_UNIT_ATTRS(1),
> +	VIN_UNIT_ATTRS(5),
> +	VIN_UNIT_ATTRS(6),
> +
> +	FAN_UNIT_ATTRS(3),
> +	TEMP_UNIT_ATTRS(3),
> +	&sensor_dev_attr_pwm3.dev_attr.attr,
> +
> +	&sensor_dev_attr_pwm1_freq.dev_attr.attr,
> +	&sensor_dev_attr_pwm2_freq.dev_attr.attr,
> +	&sensor_dev_attr_pwm3_freq.dev_attr.attr,
> +
> +	&sensor_dev_attr_pwm1_enable.dev_attr.attr,
> +	&sensor_dev_attr_pwm2_enable.dev_attr.attr,
> +	&sensor_dev_attr_pwm3_enable.dev_attr.attr,
> +
> +	NULL
> +};
> +
> +static const struct attribute_group w83627hf_group_opt = {
> +	.attrs = w83627hf_attributes_opt,
> +};
> +
> +static int w83627hf_probe(struct platform_device *pdev)
> +{
> +	struct device *dev = &pdev->dev;
> +	struct w83627hf_sio_data *sio_data = dev_get_platdata(dev);
> +	struct w83627hf_data *data;
> +	struct resource *res;
> +	int err, i;
> +
> +	static const char *names[] = {
> +		"w83627hf",
> +		"w83627thf",
> +		"w83697hf",
> +		"w83637hf",
> +		"w83687thf",
> +	};
> +
> +	res = platform_get_resource(pdev, IORESOURCE_IO, 0);
> +	if (!devm_request_region(dev, res->start, WINB_REGION_SIZE, DRVNAME)) {
> +		dev_err(dev, "Failed to request region 0x%lx-0x%lx\n",
> +			(unsigned long)res->start,
> +			(unsigned long)(res->start + WINB_REGION_SIZE - 1));
> +		return -EBUSY;
> +	}
> +
> +	data = devm_kzalloc(dev, sizeof(struct w83627hf_data), GFP_KERNEL);
> +	if (!data)
> +		return -ENOMEM;
> +
> +	data->addr = res->start;
>  	data->type = sio_data->type;
>  	data->name = names[sio_data->type];
>  	mutex_init(&data->lock);
> @@ -1568,349 +1840,81 @@ static int w83627hf_remove(struct platform_device *pdev)
>  	return 0;
>  }
>  
> -/* Registers 0x50-0x5f are banked */
> -static inline void w83627hf_set_bank(struct w83627hf_data *data, u16 reg)
> -{
> -	if ((reg & 0x00f0) == 0x50) {
> -		outb_p(W83781D_REG_BANK, data->addr + W83781D_ADDR_REG_OFFSET);
> -		outb_p(reg >> 8, data->addr + W83781D_DATA_REG_OFFSET);
> -	}
> -}
> -
> -/* Not strictly necessary, but play it safe for now */
> -static inline void w83627hf_reset_bank(struct w83627hf_data *data, u16 reg)
> -{
> -	if (reg & 0xff00) {
> -		outb_p(W83781D_REG_BANK, data->addr + W83781D_ADDR_REG_OFFSET);
> -		outb_p(0, data->addr + W83781D_DATA_REG_OFFSET);
> -	}
> -}
> -
> -static int w83627hf_read_value(struct w83627hf_data *data, u16 reg)
> -{
> -	int res, word_sized;
> -
> -	mutex_lock(&data->lock);
> -	word_sized = (((reg & 0xff00) == 0x100)
> -		   || ((reg & 0xff00) == 0x200))
> -		  && (((reg & 0x00ff) == 0x50)
> -		   || ((reg & 0x00ff) == 0x53)
> -		   || ((reg & 0x00ff) == 0x55));
> -	w83627hf_set_bank(data, reg);
> -	outb_p(reg & 0xff, data->addr + W83781D_ADDR_REG_OFFSET);
> -	res = inb_p(data->addr + W83781D_DATA_REG_OFFSET);
> -	if (word_sized) {
> -		outb_p((reg & 0xff) + 1,
> -		       data->addr + W83781D_ADDR_REG_OFFSET);
> -		res =
> -		    (res << 8) + inb_p(data->addr +
> -				       W83781D_DATA_REG_OFFSET);
> -	}
> -	w83627hf_reset_bank(data, reg);
> -	mutex_unlock(&data->lock);
> -	return res;
> -}
> +static struct platform_driver w83627hf_driver = {
> +	.driver = {
> +		.name	= DRVNAME,
> +		.pm	= W83627HF_DEV_PM_OPS,
> +	},
> +	.probe		= w83627hf_probe,
> +	.remove		= w83627hf_remove,
> +};
>  
> -static int w83627thf_read_gpio5(struct platform_device *pdev)
> +static int __init w83627hf_find(int sioaddr, unsigned short *addr,
> +				struct w83627hf_sio_data *sio_data)
>  {
> -	struct w83627hf_sio_data *sio_data = dev_get_platdata(&pdev->dev);
> -	int res = 0xff, sel;
> -
> -	if (superio_enter(sio_data)) {
> -		/*
> -		 * Some other driver reserved the address space for itself.
> -		 * We don't want to fail driver instantiation because of that,
> -		 * so display a warning and keep going.
> -		 */
> -		dev_warn(&pdev->dev,
> -			 "Can not read VID data: Failed to enable SuperIO access\n");
> -		return res;
> -	}
> +	int err;
> +	u16 val;
>  
> -	superio_select(sio_data, W83627HF_LD_GPIO5);
> +	static __initconst char *const names[] = {
> +		"W83627HF",
> +		"W83627THF",
> +		"W83697HF",
> +		"W83637HF",
> +		"W83687THF",
> +	};
>  
> -	res = 0xff;
> +	sio_data->sioaddr = sioaddr;
> +	err = superio_enter(sio_data);
> +	if (err)
> +		return err;
>  
> -	/* Make sure these GPIO pins are enabled */
> -	if (!(superio_inb(sio_data, W83627THF_GPIO5_EN) & (1<<3))) {
> -		dev_dbg(&pdev->dev, "GPIO5 disabled, no VID function\n");
> +	err = -ENODEV;
> +	val = force_id ? force_id : superio_inb(sio_data, DEVID);
> +	switch (val) {
> +	case W627_DEVID:
> +		sio_data->type = w83627hf;
> +		break;
> +	case W627THF_DEVID:
> +		sio_data->type = w83627thf;
> +		break;
> +	case W697_DEVID:
> +		sio_data->type = w83697hf;
> +		break;
> +	case W637_DEVID:
> +		sio_data->type = w83637hf;
> +		break;
> +	case W687THF_DEVID:
> +		sio_data->type = w83687thf;
> +		break;
> +	case 0xff:	/* No device at all */
>  		goto exit;
> -	}
> -
> -	/*
> -	 * Make sure the pins are configured for input
> -	 * There must be at least five (VRM 9), and possibly 6 (VRM 10)
> -	 */
> -	sel = superio_inb(sio_data, W83627THF_GPIO5_IOSR) & 0x3f;
> -	if ((sel & 0x1f) != 0x1f) {
> -		dev_dbg(&pdev->dev, "GPIO5 not configured for VID "
> -			"function\n");
> +	default:
> +		pr_debug(DRVNAME ": Unsupported chip (DEVID=0x%02x)\n", val);
>  		goto exit;
>  	}
>  
> -	dev_info(&pdev->dev, "Reading VID from GPIO5\n");
> -	res = superio_inb(sio_data, W83627THF_GPIO5_DR) & sel;
> -
> -exit:
> -	superio_exit(sio_data);
> -	return res;
> -}
> -
> -static int w83687thf_read_vid(struct platform_device *pdev)
> -{
> -	struct w83627hf_sio_data *sio_data = dev_get_platdata(&pdev->dev);
> -	int res = 0xff;
> -
> -	if (superio_enter(sio_data)) {
> -		/*
> -		 * Some other driver reserved the address space for itself.
> -		 * We don't want to fail driver instantiation because of that,
> -		 * so display a warning and keep going.
> -		 */
> -		dev_warn(&pdev->dev,
> -			 "Can not read VID data: Failed to enable SuperIO access\n");
> -		return res;
> -	}
> -
>  	superio_select(sio_data, W83627HF_LD_HWM);
> -
> -	/* Make sure these GPIO pins are enabled */
> -	if (!(superio_inb(sio_data, W83687THF_VID_EN) & (1 << 2))) {
> -		dev_dbg(&pdev->dev, "VID disabled, no VID function\n");
> +	val = (superio_inb(sio_data, WINB_BASE_REG) << 8) |
> +	       superio_inb(sio_data, WINB_BASE_REG + 1);
> +	*addr = val & WINB_ALIGNMENT;
> +	if (*addr == 0) {
> +		pr_warn("Base address not set, skipping\n");
>  		goto exit;
>  	}
>  
> -	/* Make sure the pins are configured for input */
> -	if (!(superio_inb(sio_data, W83687THF_VID_CFG) & (1 << 4))) {
> -		dev_dbg(&pdev->dev, "VID configured as output, "
> -			"no VID function\n");
> -		goto exit;
> +	val = superio_inb(sio_data, WINB_ACT_REG);
> +	if (!(val & 0x01)) {
> +		pr_warn("Enabling HWM logical device\n");
> +		superio_outb(sio_data, WINB_ACT_REG, val | 0x01);
>  	}
>  
> -	res = superio_inb(sio_data, W83687THF_VID_DATA) & 0x3f;
> +	err = 0;
> +	pr_info(DRVNAME ": Found %s chip at %#x\n",
> +		names[sio_data->type], *addr);
>  
> -exit:
> + exit:
>  	superio_exit(sio_data);
> -	return res;
> -}
> -
> -static int w83627hf_write_value(struct w83627hf_data *data, u16 reg, u16 value)
> -{
> -	int word_sized;
> -
> -	mutex_lock(&data->lock);
> -	word_sized = (((reg & 0xff00) == 0x100)
> -		   || ((reg & 0xff00) == 0x200))
> -		  && (((reg & 0x00ff) == 0x53)
> -		   || ((reg & 0x00ff) == 0x55));
> -	w83627hf_set_bank(data, reg);
> -	outb_p(reg & 0xff, data->addr + W83781D_ADDR_REG_OFFSET);
> -	if (word_sized) {
> -		outb_p(value >> 8,
> -		       data->addr + W83781D_DATA_REG_OFFSET);
> -		outb_p((reg & 0xff) + 1,
> -		       data->addr + W83781D_ADDR_REG_OFFSET);
> -	}
> -	outb_p(value & 0xff,
> -	       data->addr + W83781D_DATA_REG_OFFSET);
> -	w83627hf_reset_bank(data, reg);
> -	mutex_unlock(&data->lock);
> -	return 0;
> -}
> -
> -static void w83627hf_init_device(struct platform_device *pdev)
> -{
> -	struct w83627hf_data *data = platform_get_drvdata(pdev);
> -	int i;
> -	enum chips type = data->type;
> -	u8 tmp;
> -
> -	/* Minimize conflicts with other winbond i2c-only clients...  */
> -	/* disable i2c subclients... how to disable main i2c client?? */
> -	/* force i2c address to relatively uncommon address */
> -	if (type == w83627hf) {
> -		w83627hf_write_value(data, W83781D_REG_I2C_SUBADDR, 0x89);
> -		w83627hf_write_value(data, W83781D_REG_I2C_ADDR, force_i2c);
> -	}
> -
> -	/* Read VID only once */
> -	if (type == w83627hf || type == w83637hf) {
> -		int lo = w83627hf_read_value(data, W83781D_REG_VID_FANDIV);
> -		int hi = w83627hf_read_value(data, W83781D_REG_CHIPID);
> -		data->vid = (lo & 0x0f) | ((hi & 0x01) << 4);
> -	} else if (type == w83627thf) {
> -		data->vid = w83627thf_read_gpio5(pdev);
> -	} else if (type == w83687thf) {
> -		data->vid = w83687thf_read_vid(pdev);
> -	}
> -
> -	/* Read VRM & OVT Config only once */
> -	if (type == w83627thf || type == w83637hf || type == w83687thf) {
> -		data->vrm_ovt = 
> -			w83627hf_read_value(data, W83627THF_REG_VRM_OVT_CFG);
> -	}
> -
> -	tmp = w83627hf_read_value(data, W83781D_REG_SCFG1);
> -	for (i = 1; i <= 3; i++) {
> -		if (!(tmp & BIT_SCFG1[i - 1])) {
> -			data->sens[i - 1] = 4;
> -		} else {
> -			if (w83627hf_read_value
> -			    (data,
> -			     W83781D_REG_SCFG2) & BIT_SCFG2[i - 1])
> -				data->sens[i - 1] = 1;
> -			else
> -				data->sens[i - 1] = 2;
> -		}
> -		if ((type == w83697hf) && (i == 2))
> -			break;
> -	}
> -
> -	if(init) {
> -		/* Enable temp2 */
> -		tmp = w83627hf_read_value(data, W83627HF_REG_TEMP2_CONFIG);
> -		if (tmp & 0x01) {
> -			dev_warn(&pdev->dev, "Enabling temp2, readings "
> -				 "might not make sense\n");
> -			w83627hf_write_value(data, W83627HF_REG_TEMP2_CONFIG,
> -				tmp & 0xfe);
> -		}
> -
> -		/* Enable temp3 */
> -		if (type != w83697hf) {
> -			tmp = w83627hf_read_value(data,
> -				W83627HF_REG_TEMP3_CONFIG);
> -			if (tmp & 0x01) {
> -				dev_warn(&pdev->dev, "Enabling temp3, "
> -					 "readings might not make sense\n");
> -				w83627hf_write_value(data,
> -					W83627HF_REG_TEMP3_CONFIG, tmp & 0xfe);
> -			}
> -		}
> -	}
> -
> -	/* Start monitoring */
> -	w83627hf_write_value(data, W83781D_REG_CONFIG,
> -			    (w83627hf_read_value(data,
> -						W83781D_REG_CONFIG) & 0xf7)
> -			    | 0x01);
> -
> -	/* Enable VBAT monitoring if needed */
> -	tmp = w83627hf_read_value(data, W83781D_REG_VBAT);
> -	if (!(tmp & 0x01))
> -		w83627hf_write_value(data, W83781D_REG_VBAT, tmp | 0x01);
> -}
> -
> -static void w83627hf_update_fan_div(struct w83627hf_data *data)
> -{
> -	int reg;
> -
> -	reg = w83627hf_read_value(data, W83781D_REG_VID_FANDIV);
> -	data->fan_div[0] = (reg >> 4) & 0x03;
> -	data->fan_div[1] = (reg >> 6) & 0x03;
> -	if (data->type != w83697hf) {
> -		data->fan_div[2] = (w83627hf_read_value(data,
> -				       W83781D_REG_PIN) >> 6) & 0x03;
> -	}
> -	reg = w83627hf_read_value(data, W83781D_REG_VBAT);
> -	data->fan_div[0] |= (reg >> 3) & 0x04;
> -	data->fan_div[1] |= (reg >> 4) & 0x04;
> -	if (data->type != w83697hf)
> -		data->fan_div[2] |= (reg >> 5) & 0x04;
> -}
> -
> -static struct w83627hf_data *w83627hf_update_device(struct device *dev)
> -{
> -	struct w83627hf_data *data = dev_get_drvdata(dev);
> -	int i, num_temps = (data->type == w83697hf) ? 2 : 3;
> -	int num_pwms = (data->type == w83697hf) ? 2 : 3;
> -
> -	mutex_lock(&data->update_lock);
> -
> -	if (time_after(jiffies, data->last_updated + HZ + HZ / 2)
> -	    || !data->valid) {
> -		for (i = 0; i <= 8; i++) {
> -			/* skip missing sensors */
> -			if (((data->type == w83697hf) && (i == 1)) ||
> -			    ((data->type != w83627hf && data->type != w83697hf)
> -			    && (i == 5 || i == 6)))
> -				continue;
> -			data->in[i] =
> -			    w83627hf_read_value(data, W83781D_REG_IN(i));
> -			data->in_min[i] =
> -			    w83627hf_read_value(data,
> -					       W83781D_REG_IN_MIN(i));
> -			data->in_max[i] =
> -			    w83627hf_read_value(data,
> -					       W83781D_REG_IN_MAX(i));
> -		}
> -		for (i = 0; i <= 2; i++) {
> -			data->fan[i] =
> -			    w83627hf_read_value(data, W83627HF_REG_FAN(i));
> -			data->fan_min[i] =
> -			    w83627hf_read_value(data,
> -					       W83627HF_REG_FAN_MIN(i));
> -		}
> -		for (i = 0; i <= 2; i++) {
> -			u8 tmp = w83627hf_read_value(data,
> -				W836X7HF_REG_PWM(data->type, i));
> - 			/* bits 0-3 are reserved  in 627THF */
> - 			if (data->type == w83627thf)
> -				tmp &= 0xf0;
> -			data->pwm[i] = tmp;
> -			if (i == 1 &&
> -			    (data->type == w83627hf || data->type == w83697hf))
> -				break;
> -		}
> -		if (data->type == w83627hf) {
> -				u8 tmp = w83627hf_read_value(data,
> -						W83627HF_REG_PWM_FREQ);
> -				data->pwm_freq[0] = tmp & 0x07;
> -				data->pwm_freq[1] = (tmp >> 4) & 0x07;
> -		} else if (data->type != w83627thf) {
> -			for (i = 1; i <= 3; i++) {
> -				data->pwm_freq[i - 1] =
> -					w83627hf_read_value(data,
> -						W83637HF_REG_PWM_FREQ[i - 1]);
> -				if (i == 2 && (data->type == w83697hf))
> -					break;
> -			}
> -		}
> -		if (data->type != w83627hf) {
> -			for (i = 0; i < num_pwms; i++) {
> -				u8 tmp = w83627hf_read_value(data,
> -					W83627THF_REG_PWM_ENABLE[i]);
> -				data->pwm_enable[i] =
> -					((tmp >> W83627THF_PWM_ENABLE_SHIFT[i])
> -					& 0x03) + 1;
> -			}
> -		}
> -		for (i = 0; i < num_temps; i++) {
> -			data->temp[i] = w83627hf_read_value(
> -						data, w83627hf_reg_temp[i]);
> -			data->temp_max[i] = w83627hf_read_value(
> -						data, w83627hf_reg_temp_over[i]);
> -			data->temp_max_hyst[i] = w83627hf_read_value(
> -						data, w83627hf_reg_temp_hyst[i]);
> -		}
> -
> -		w83627hf_update_fan_div(data);
> -
> -		data->alarms =
> -		    w83627hf_read_value(data, W83781D_REG_ALARM1) |
> -		    (w83627hf_read_value(data, W83781D_REG_ALARM2) << 8) |
> -		    (w83627hf_read_value(data, W83781D_REG_ALARM3) << 16);
> -		i = w83627hf_read_value(data, W83781D_REG_BEEP_INTS2);
> -		data->beep_mask = (i << 8) |
> -		    w83627hf_read_value(data, W83781D_REG_BEEP_INTS1) |
> -		    w83627hf_read_value(data, W83781D_REG_BEEP_INTS3) << 16;
> -		data->last_updated = jiffies;
> -		data->valid = true;
> -	}
> -
> -	mutex_unlock(&data->update_lock);
> -
> -	return data;
> +	return err;
>  }
>  
>  static int __init w83627hf_device_add(unsigned short address,
