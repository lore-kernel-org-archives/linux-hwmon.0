Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F13B0C433F5
	for <linux-hwmon@archiver.kernel.org>; Fri, 14 Jan 2022 18:49:15 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239563AbiANStP (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Fri, 14 Jan 2022 13:49:15 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54418 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236181AbiANStP (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Fri, 14 Jan 2022 13:49:15 -0500
Received: from mail-oi1-x22c.google.com (mail-oi1-x22c.google.com [IPv6:2607:f8b0:4864:20::22c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B13EBC061574
        for <linux-hwmon@vger.kernel.org>; Fri, 14 Jan 2022 10:49:14 -0800 (PST)
Received: by mail-oi1-x22c.google.com with SMTP id s127so13436951oig.2
        for <linux-hwmon@vger.kernel.org>; Fri, 14 Jan 2022 10:49:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=3pl9qK0eTiTBKn75THXQU0tfikTYm7SZURYcV1D93hU=;
        b=jJokCdpc7nQLXBBSF32SteNBGzFnMwFt4+5aUwe5HV4b4YnVL/ycspkUYlPnAmL83L
         j3WHkgTerMn5VbUEXB+0tc3aoXK5FYFFZhYaRhu8YmyBQuEJV39N68lSPydI20pJudx7
         iRGlLMQCS4WsCrD7Rmx2BrnGukqI0ahl43jL4Urw4crhyisa1mt4ghcMMH0RbeQcHDUN
         uyCkeU9aJBg4rWigUXTUcywVmh6H+zdWHAc3gWRVJMnaJQ0bjRnec6G5LZI7YM+LYZ/a
         +mJfhalgQaamBT2fgHXK2V1NekNQV70U7je2teLgnNC6+vPJqZQSt64pQcGVGt98ci8M
         EE5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition:in-reply-to;
        bh=3pl9qK0eTiTBKn75THXQU0tfikTYm7SZURYcV1D93hU=;
        b=n8eyakFk5L7ngq7yO0NGB+OYfbAKiYkZMu54c48BUmcbaVHos7BrDLkwtvUMOHPL8K
         qqMA0vxkdGCBaYhP7knSEsvwUaFGd3Jae9U/pRkAeKC5StPWTMmfu/9SMUx6w6XD8K3Y
         ovjeucH9xqS4Hza1WdYXIUgCRnKMvn8qTF9qb6MmJa8OKfjh23N6kxcAbM1QzI2Du7iO
         aex68k64eosR4u8vrbdm/QGIblHHXWHzhgakLJRTPfzC70sLelRlcW9VTjgcZTU3ivYY
         Q4SgPPAeC13Jv5XP1Y3dxV20HPiKhOvXdeXB10+aM+CWoFCmEM6NTfkGSDUF0SUxpXRN
         rZmg==
X-Gm-Message-State: AOAM530Gz6XhPrS7ZzSQcv8ENYPZkgiYzPIjFiGR5eKYfM5VXlfrYHy9
        +WKMilKioXb9pdabXhhsDHpqLWGywTY=
X-Google-Smtp-Source: ABdhPJydgDgcnY1pOyn9u8LFF4F48JlmjfZxR10Vul6BCjU2xJtBGZLnkh4MyFtTBN5YgEq/tEmdaw==
X-Received: by 2002:a05:6808:10c4:: with SMTP id s4mr13900195ois.57.1642186153979;
        Fri, 14 Jan 2022 10:49:13 -0800 (PST)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id y2sm2221855otq.27.2022.01.14.10.49.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Jan 2022 10:49:13 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Date:   Fri, 14 Jan 2022 10:49:12 -0800
From:   Guenter Roeck <linux@roeck-us.net>
To:     michaelsh@nvidia.com
Cc:     linux-hwmon@vger.kernel.org, vadimp@nvidia.com
Subject: Re: [PATCH v2 1/2] hwmon: powr1220: Upgrade driver to support hwmon
 info infrastructure
Message-ID: <20220114184912.GA1751258@roeck-us.net>
References: <20220111173239.21006-1-michaelsh@nvidia.com>
 <20220111173239.21006-2-michaelsh@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220111173239.21006-2-michaelsh@nvidia.com>
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On Tue, Jan 11, 2022 at 07:32:38PM +0200, michaelsh@nvidia.com wrote:
> From: Michael Shych <michaelsh@nvidia.com>
> 
> Reduce code by using devm_hwmon_device_register_with_groups() API by
> devm_hwmon_device_register_with_info() API.
> The motivation is to reduce code and to allow easy support for similar
> devices by the same driver.
> 
> Signed-off-by: Michael Shych <michaelsh@nvidia.com>
> Reviewed-by: Vadim Pasternak <vadimp@nvidia.com>

There are vaious unrelated changes in this patch: Multi-line alignment
changes, and udelay() -> usleep(). Especially tyhe latter may introduce
a significant additional delay; it often results in long sleep times
(the kernel may sleep as long as it wants). This can have significant
performance impact. It would probably be much better to use usleep_range()
since that provides an upper bound for the sleep time.

Please split unrelated changes into separate patch(es).

Thanks,
Guenter

> ---
>  drivers/hwmon/powr1220.c | 216 +++++++++++++++++++++--------------------------
>  1 file changed, 95 insertions(+), 121 deletions(-)
> 
> diff --git a/drivers/hwmon/powr1220.c b/drivers/hwmon/powr1220.c
> index 9e086338dcba..1b833781e89d 100644
> --- a/drivers/hwmon/powr1220.c
> +++ b/drivers/hwmon/powr1220.c
> @@ -111,7 +111,7 @@ static int powr1220_read_adc(struct device *dev, int ch_num)
>  	mutex_lock(&data->update_lock);
>  
>  	if (time_after(jiffies, data->adc_last_updated[ch_num] + HZ) ||
> -			!data->adc_valid[ch_num]) {
> +	    !data->adc_valid[ch_num]) {
>  		/*
>  		 * figure out if we need to use the attenuator for
>  		 * high inputs or inputs that we don't yet have a measurement
> @@ -119,12 +119,12 @@ static int powr1220_read_adc(struct device *dev, int ch_num)
>  		 * max reading.
>  		 */
>  		if (data->adc_maxes[ch_num] > ADC_MAX_LOW_MEASUREMENT_MV ||
> -				data->adc_maxes[ch_num] == 0)
> +		    data->adc_maxes[ch_num] == 0)
>  			adc_range = 1 << 4;
>  
>  		/* set the attenuator and mux */
>  		result = i2c_smbus_write_byte_data(data->client, ADC_MUX,
> -				adc_range | ch_num);
> +						   adc_range | ch_num);
>  		if (result)
>  			goto exit;
>  
> @@ -132,7 +132,7 @@ static int powr1220_read_adc(struct device *dev, int ch_num)
>  		 * wait at least Tconvert time (200 us) for the
>  		 * conversion to complete
>  		 */
> -		udelay(200);
> +		usleep(200);
>  
>  		/* get the ADC reading */
>  		result = i2c_smbus_read_byte_data(data->client, ADC_VALUE_LOW);
> @@ -163,139 +163,112 @@ static int powr1220_read_adc(struct device *dev, int ch_num)
>  
>  exit:
>  	mutex_unlock(&data->update_lock);
> -
>  	return result;
>  }
>  
> -/* Shows the voltage associated with the specified ADC channel */
> -static ssize_t powr1220_voltage_show(struct device *dev,
> -				     struct device_attribute *dev_attr,
> -				     char *buf)
> +static umode_t
> +powr1220_is_visible(const void *data, enum hwmon_sensor_types type, u32
> +		    attr, int channel)
>  {
> -	struct sensor_device_attribute *attr = to_sensor_dev_attr(dev_attr);
> -	int adc_val = powr1220_read_adc(dev, attr->index);
> -
> -	if (adc_val < 0)
> -		return adc_val;
> +	switch (type) {
> +	case hwmon_in:
> +		switch (attr) {
> +		case hwmon_in_input:
> +		case hwmon_in_highest:
> +		case hwmon_in_label:
> +			return 0444;
> +		default:
> +			break;
> +		}
> +
> +	default:
> +		break;
> +	}
>  
> -	return sprintf(buf, "%d\n", adc_val);
> +	return 0;
>  }
>  
> -/* Shows the maximum setting associated with the specified ADC channel */
> -static ssize_t powr1220_max_show(struct device *dev,
> -				 struct device_attribute *dev_attr, char *buf)
> +static int
> +powr1220_read_string(struct device *dev, enum hwmon_sensor_types type, u32 attr,
> +		     int channel, const char **str)
>  {
> -	struct sensor_device_attribute *attr = to_sensor_dev_attr(dev_attr);
> -	struct powr1220_data *data = dev_get_drvdata(dev);
> +	switch (type) {
> +	case hwmon_in:
> +		switch (attr) {
> +		case hwmon_in_label:
> +			*str = input_names[channel];
> +			return 0;
> +		default:
> +			return -EOPNOTSUPP;
> +		}
> +		break;
> +	default:
> +		return -EOPNOTSUPP;
> +	}
>  
> -	return sprintf(buf, "%d\n", data->adc_maxes[attr->index]);
> +	return -EOPNOTSUPP;
>  }
>  
> -/* Shows the label associated with the specified ADC channel */
> -static ssize_t powr1220_label_show(struct device *dev,
> -				   struct device_attribute *dev_attr,
> -				   char *buf)
> +static int
> +powr1220_read(struct device *dev, enum hwmon_sensor_types type, u32
> +	      attr, int channel, long *val)
>  {
> -	struct sensor_device_attribute *attr = to_sensor_dev_attr(dev_attr);
> +	struct powr1220_data *data = dev_get_drvdata(dev);
> +	int ret;
> +
> +	switch (type) {
> +	case hwmon_in:
> +		switch (attr) {
> +		case hwmon_in_input:
> +			ret = powr1220_read_adc(dev, channel);
> +			if (ret < 0)
> +				return ret;
> +			*val = ret;
> +			break;
> +		case hwmon_in_highest:
> +			*val = data->adc_maxes[channel];
> +			break;
> +		default:
> +			return -EOPNOTSUPP;
> +		}
> +		break;
> +	default:
> +		return -EOPNOTSUPP;
> +	}
>  
> -	return sprintf(buf, "%s\n", input_names[attr->index]);
> +	return 0;
>  }
>  
> -static SENSOR_DEVICE_ATTR_RO(in0_input, powr1220_voltage, VMON1);
> -static SENSOR_DEVICE_ATTR_RO(in1_input, powr1220_voltage, VMON2);
> -static SENSOR_DEVICE_ATTR_RO(in2_input, powr1220_voltage, VMON3);
> -static SENSOR_DEVICE_ATTR_RO(in3_input, powr1220_voltage, VMON4);
> -static SENSOR_DEVICE_ATTR_RO(in4_input, powr1220_voltage, VMON5);
> -static SENSOR_DEVICE_ATTR_RO(in5_input, powr1220_voltage, VMON6);
> -static SENSOR_DEVICE_ATTR_RO(in6_input, powr1220_voltage, VMON7);
> -static SENSOR_DEVICE_ATTR_RO(in7_input, powr1220_voltage, VMON8);
> -static SENSOR_DEVICE_ATTR_RO(in8_input, powr1220_voltage, VMON9);
> -static SENSOR_DEVICE_ATTR_RO(in9_input, powr1220_voltage, VMON10);
> -static SENSOR_DEVICE_ATTR_RO(in10_input, powr1220_voltage, VMON11);
> -static SENSOR_DEVICE_ATTR_RO(in11_input, powr1220_voltage, VMON12);
> -static SENSOR_DEVICE_ATTR_RO(in12_input, powr1220_voltage, VCCA);
> -static SENSOR_DEVICE_ATTR_RO(in13_input, powr1220_voltage, VCCINP);
> -
> -static SENSOR_DEVICE_ATTR_RO(in0_highest, powr1220_max, VMON1);
> -static SENSOR_DEVICE_ATTR_RO(in1_highest, powr1220_max, VMON2);
> -static SENSOR_DEVICE_ATTR_RO(in2_highest, powr1220_max, VMON3);
> -static SENSOR_DEVICE_ATTR_RO(in3_highest, powr1220_max, VMON4);
> -static SENSOR_DEVICE_ATTR_RO(in4_highest, powr1220_max, VMON5);
> -static SENSOR_DEVICE_ATTR_RO(in5_highest, powr1220_max, VMON6);
> -static SENSOR_DEVICE_ATTR_RO(in6_highest, powr1220_max, VMON7);
> -static SENSOR_DEVICE_ATTR_RO(in7_highest, powr1220_max, VMON8);
> -static SENSOR_DEVICE_ATTR_RO(in8_highest, powr1220_max, VMON9);
> -static SENSOR_DEVICE_ATTR_RO(in9_highest, powr1220_max, VMON10);
> -static SENSOR_DEVICE_ATTR_RO(in10_highest, powr1220_max, VMON11);
> -static SENSOR_DEVICE_ATTR_RO(in11_highest, powr1220_max, VMON12);
> -static SENSOR_DEVICE_ATTR_RO(in12_highest, powr1220_max, VCCA);
> -static SENSOR_DEVICE_ATTR_RO(in13_highest, powr1220_max, VCCINP);
> -
> -static SENSOR_DEVICE_ATTR_RO(in0_label, powr1220_label, VMON1);
> -static SENSOR_DEVICE_ATTR_RO(in1_label, powr1220_label, VMON2);
> -static SENSOR_DEVICE_ATTR_RO(in2_label, powr1220_label, VMON3);
> -static SENSOR_DEVICE_ATTR_RO(in3_label, powr1220_label, VMON4);
> -static SENSOR_DEVICE_ATTR_RO(in4_label, powr1220_label, VMON5);
> -static SENSOR_DEVICE_ATTR_RO(in5_label, powr1220_label, VMON6);
> -static SENSOR_DEVICE_ATTR_RO(in6_label, powr1220_label, VMON7);
> -static SENSOR_DEVICE_ATTR_RO(in7_label, powr1220_label, VMON8);
> -static SENSOR_DEVICE_ATTR_RO(in8_label, powr1220_label, VMON9);
> -static SENSOR_DEVICE_ATTR_RO(in9_label, powr1220_label, VMON10);
> -static SENSOR_DEVICE_ATTR_RO(in10_label, powr1220_label, VMON11);
> -static SENSOR_DEVICE_ATTR_RO(in11_label, powr1220_label, VMON12);
> -static SENSOR_DEVICE_ATTR_RO(in12_label, powr1220_label, VCCA);
> -static SENSOR_DEVICE_ATTR_RO(in13_label, powr1220_label, VCCINP);
> -
> -static struct attribute *powr1220_attrs[] = {
> -	&sensor_dev_attr_in0_input.dev_attr.attr,
> -	&sensor_dev_attr_in1_input.dev_attr.attr,
> -	&sensor_dev_attr_in2_input.dev_attr.attr,
> -	&sensor_dev_attr_in3_input.dev_attr.attr,
> -	&sensor_dev_attr_in4_input.dev_attr.attr,
> -	&sensor_dev_attr_in5_input.dev_attr.attr,
> -	&sensor_dev_attr_in6_input.dev_attr.attr,
> -	&sensor_dev_attr_in7_input.dev_attr.attr,
> -	&sensor_dev_attr_in8_input.dev_attr.attr,
> -	&sensor_dev_attr_in9_input.dev_attr.attr,
> -	&sensor_dev_attr_in10_input.dev_attr.attr,
> -	&sensor_dev_attr_in11_input.dev_attr.attr,
> -	&sensor_dev_attr_in12_input.dev_attr.attr,
> -	&sensor_dev_attr_in13_input.dev_attr.attr,
> -
> -	&sensor_dev_attr_in0_highest.dev_attr.attr,
> -	&sensor_dev_attr_in1_highest.dev_attr.attr,
> -	&sensor_dev_attr_in2_highest.dev_attr.attr,
> -	&sensor_dev_attr_in3_highest.dev_attr.attr,
> -	&sensor_dev_attr_in4_highest.dev_attr.attr,
> -	&sensor_dev_attr_in5_highest.dev_attr.attr,
> -	&sensor_dev_attr_in6_highest.dev_attr.attr,
> -	&sensor_dev_attr_in7_highest.dev_attr.attr,
> -	&sensor_dev_attr_in8_highest.dev_attr.attr,
> -	&sensor_dev_attr_in9_highest.dev_attr.attr,
> -	&sensor_dev_attr_in10_highest.dev_attr.attr,
> -	&sensor_dev_attr_in11_highest.dev_attr.attr,
> -	&sensor_dev_attr_in12_highest.dev_attr.attr,
> -	&sensor_dev_attr_in13_highest.dev_attr.attr,
> -
> -	&sensor_dev_attr_in0_label.dev_attr.attr,
> -	&sensor_dev_attr_in1_label.dev_attr.attr,
> -	&sensor_dev_attr_in2_label.dev_attr.attr,
> -	&sensor_dev_attr_in3_label.dev_attr.attr,
> -	&sensor_dev_attr_in4_label.dev_attr.attr,
> -	&sensor_dev_attr_in5_label.dev_attr.attr,
> -	&sensor_dev_attr_in6_label.dev_attr.attr,
> -	&sensor_dev_attr_in7_label.dev_attr.attr,
> -	&sensor_dev_attr_in8_label.dev_attr.attr,
> -	&sensor_dev_attr_in9_label.dev_attr.attr,
> -	&sensor_dev_attr_in10_label.dev_attr.attr,
> -	&sensor_dev_attr_in11_label.dev_attr.attr,
> -	&sensor_dev_attr_in12_label.dev_attr.attr,
> -	&sensor_dev_attr_in13_label.dev_attr.attr,
> +static const struct hwmon_channel_info *powr1220_info[] = {
> +	HWMON_CHANNEL_INFO(in,
> +			   HWMON_I_INPUT | HWMON_I_HIGHEST | HWMON_I_LABEL,
> +			   HWMON_I_INPUT | HWMON_I_HIGHEST | HWMON_I_LABEL,
> +			   HWMON_I_INPUT | HWMON_I_HIGHEST | HWMON_I_LABEL,
> +			   HWMON_I_INPUT | HWMON_I_HIGHEST | HWMON_I_LABEL,
> +			   HWMON_I_INPUT | HWMON_I_HIGHEST | HWMON_I_LABEL,
> +			   HWMON_I_INPUT | HWMON_I_HIGHEST | HWMON_I_LABEL,
> +			   HWMON_I_INPUT | HWMON_I_HIGHEST | HWMON_I_LABEL,
> +			   HWMON_I_INPUT | HWMON_I_HIGHEST | HWMON_I_LABEL,
> +			   HWMON_I_INPUT | HWMON_I_HIGHEST | HWMON_I_LABEL,
> +			   HWMON_I_INPUT | HWMON_I_HIGHEST | HWMON_I_LABEL,
> +			   HWMON_I_INPUT | HWMON_I_HIGHEST | HWMON_I_LABEL,
> +			   HWMON_I_INPUT | HWMON_I_HIGHEST | HWMON_I_LABEL,
> +			   HWMON_I_INPUT | HWMON_I_HIGHEST | HWMON_I_LABEL,
> +			   HWMON_I_INPUT | HWMON_I_HIGHEST | HWMON_I_LABEL),
>  
>  	NULL
>  };
>  
> -ATTRIBUTE_GROUPS(powr1220);
> +static const struct hwmon_ops powr1220_hwmon_ops = {
> +	.read = powr1220_read,
> +	.read_string = powr1220_read_string,
> +	.is_visible = powr1220_is_visible,
> +};
> +
> +static const struct hwmon_chip_info powr1220_chip_info = {
> +	.ops = &powr1220_hwmon_ops,
> +	.info = powr1220_info,
> +};
>  
>  static int powr1220_probe(struct i2c_client *client)
>  {
> @@ -312,9 +285,10 @@ static int powr1220_probe(struct i2c_client *client)
>  	mutex_init(&data->update_lock);
>  	data->client = client;
>  
> -	hwmon_dev = devm_hwmon_device_register_with_groups(&client->dev,
> -			client->name, data, powr1220_groups);
> -
> +	hwmon_dev = devm_hwmon_device_register_with_info(&client->dev,
> +							 client->name, data,
> +							 &powr1220_chip_info,
> +							 NULL);
>  	return PTR_ERR_OR_ZERO(hwmon_dev);
>  }
>  
