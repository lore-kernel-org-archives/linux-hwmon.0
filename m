Return-Path: <SRS0=Qoc9=6S=vger.kernel.org=linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.1 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 026E5C3A5A9
	for <linux-hwmon@archiver.kernel.org>; Mon,  4 May 2020 23:54:32 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id C91DB20675
	for <linux-hwmon@archiver.kernel.org>; Mon,  4 May 2020 23:54:31 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lQC2UzvO"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728481AbgEDXyb (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Mon, 4 May 2020 19:54:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55912 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728394AbgEDXyb (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Mon, 4 May 2020 19:54:31 -0400
Received: from mail-pj1-x1042.google.com (mail-pj1-x1042.google.com [IPv6:2607:f8b0:4864:20::1042])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E77BBC061A0E
        for <linux-hwmon@vger.kernel.org>; Mon,  4 May 2020 16:54:30 -0700 (PDT)
Received: by mail-pj1-x1042.google.com with SMTP id a5so198435pjh.2
        for <linux-hwmon@vger.kernel.org>; Mon, 04 May 2020 16:54:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=JTvpmF4pc0xOwXsO0Z5O2dIXEAzicQiqcz+W088VdZg=;
        b=lQC2UzvOBj+FaYQXxw6htkzf3SdcFzIyPIAQhLfq3l8+XCUGPrq+HHddekWsULKlmW
         ZAy5j1XW2Rzmq9rjKiXQDx6+Zg8gXUDMKvSSCgvP8AjqLHue5CjcfW2JT9dfxREpbfla
         R8NtUTRN+d6NoeoRxo9tj0psEJ0xaMtkh47s3EMj53p5wUNNqleXcYVWQu/XZo7P0HVs
         de0rQUbPV5VGIcsDm5XUq/yZOjovOcjl+/Ugcck6qYDejwemXOzLBAgcHKIDQptO7vJ4
         EHuBaAsSXHIEYOJJcw6DLYiLzHrEyxYuB7H5UXjI/lAbNBfjxxZ5Cg94UkE54u6vJUDc
         E23A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition:in-reply-to:user-agent;
        bh=JTvpmF4pc0xOwXsO0Z5O2dIXEAzicQiqcz+W088VdZg=;
        b=M3rnnKGv50SPjryWMT1tGPiZwWPI1vCmFWFXDclcf3SS9hDSHTBQYd32Ny4qSd2mik
         nlD74djMFDGsiaBwr/T4yykdPhwbCUMyji9nUu0cuNajLgJuxkYD4VW1d1Lg0RZ7oNBQ
         0sEH8m8e99f8KAl0E5AhYoTPFBxOizyimZ9WbqfqcF5QTQdssPz8IJxN7iZaltx7yDuL
         gbC96IQZGDJTFzzJiSdFTUC4n2fTkkbdx17ujy3ePVEJq6NDKshEcv7HMdkDAiaCo9Fa
         wVsvNQaJP7swbiXEaL7JqvxqYtwevNRb/65gC0yxUpr8rIxiSoNc9giJGaud3lE3Dq5k
         e1Pg==
X-Gm-Message-State: AGi0Pubr440fdpxDGoEDgXvikheQVHqo1UVprxEYobUBpLxUYcz/kJP1
        noVWYZP34Y+vFkq0BzKcokc=
X-Google-Smtp-Source: APiQypJO++4c4NzO9YtesQdPKF8T1DOR9emKFVL/0o6taAnJKPnvnvNyatk7sn/vX3qYqZ43WfVLNQ==
X-Received: by 2002:a17:902:522:: with SMTP id 31mr477451plf.68.1588636470369;
        Mon, 04 May 2020 16:54:30 -0700 (PDT)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id p19sm211606pfn.19.2020.05.04.16.54.29
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 04 May 2020 16:54:29 -0700 (PDT)
Date:   Mon, 4 May 2020 16:54:28 -0700
From:   Guenter Roeck <linux@roeck-us.net>
To:     Alex Qiu <xqiu@google.com>
Cc:     linux-hwmon@vger.kernel.org
Subject: Re: [PATCH] hwmon: (ina2xx) Implement alert functions
Message-ID: <20200504235428.GA122247@roeck-us.net>
References: <20200504224247.128922-1-xqiu@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200504224247.128922-1-xqiu@google.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-hwmon-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On Mon, May 04, 2020 at 03:42:47PM -0700, Alex Qiu wrote:
> Implement alert functions for INA226, INA230 and INA231. Expose 06h
> Mask/Enable and 07h Alert Limit registers via alert setting and alarm
> files.
> 
> Signed-off-by: Alex Qiu <xqiu@google.com>
> ---
>  Documentation/hwmon/ina2xx.rst |  19 ++++
>  drivers/hwmon/ina2xx.c         | 174 +++++++++++++++++++++++++++++++++
>  2 files changed, 193 insertions(+)
> 
> diff --git a/Documentation/hwmon/ina2xx.rst b/Documentation/hwmon/ina2xx.rst
> index 94b9a260c518..ed81f5416331 100644
> --- a/Documentation/hwmon/ina2xx.rst
> +++ b/Documentation/hwmon/ina2xx.rst
> @@ -99,6 +99,25 @@ Sysfs entries for ina226, ina230 and ina231 only
>  ------------------------------------------------
>  
>  ======================= ====================================================
> +in0_lcrit		Critical low shunt voltage
> +in0_crit		Critical high shunt voltage
> +in0_lcrit_alarm		Shunt voltage critical low alarm
> +in0_crit_alarm		Shunt voltage critical high alarm
> +in1_lcrit		Critical low bus voltage
> +in1_crit		Critical high bus voltage
> +in1_lcrit_alarm		Bus voltage critical low alarm
> +in1_crit_alarm		Bus voltage critical high alarm
> +power1_crit		Critical high power
> +power1_crit_alarm	Power critical high alarm
>  update_interval		data conversion time; affects number of samples used
>  			to average results for shunt and bus voltages.
>  ======================= ====================================================
> +
> +.. note::
> +
> +   - Configure `shunt_resistor` before configure `power1_crit`, because power
> +     value is calculated based on `shunt_resistor` set.
> +   - Because of the underlying register implementation, only one `*crit` setting
> +     and its `alarm` can be active. Writing to one `*crit` setting clears other
> +     `*crit` settings and alarms. Writing 0 to any `*crit` setting clears all
> +     `*crit` settings and alarms.
> diff --git a/drivers/hwmon/ina2xx.c b/drivers/hwmon/ina2xx.c
> index e9e78c0b7212..0ce54e0a071d 100644
> --- a/drivers/hwmon/ina2xx.c
> +++ b/drivers/hwmon/ina2xx.c
> @@ -74,6 +74,17 @@
>  #define INA226_READ_AVG(reg)		(((reg) & INA226_AVG_RD_MASK) >> 9)
>  #define INA226_SHIFT_AVG(val)		((val) << 9)
>  
> +/* bit number of alert functions in Mask/Enable Register */
> +#define INA226_SHUNT_OVER_VOLTAGE_BIT	15
> +#define INA226_SHUNT_UNDER_VOLTAGE_BIT	14
> +#define INA226_BUS_OVER_VOLTAGE_BIT	13
> +#define INA226_BUS_UNDER_VOLTAGE_BIT	12
> +#define INA226_POWER_OVER_LIMIT_BIT	11
> +
> +/* bit mask for alert config bits of Mask/Enable Register */
> +#define INA226_ALERT_CONFIG_MASK	0xFC00
> +#define INA226_ALERT_FUNCTION_FLAG	BIT(4)
> +
>  /* common attrs, ina226 attrs and NULL */
>  #define INA2XX_MAX_ATTRIBUTE_GROUPS	3
>  
> @@ -303,6 +314,136 @@ static ssize_t ina2xx_value_show(struct device *dev,
>  			ina2xx_get_value(data, attr->index, regval));
>  }
>  
> +static int ina226_reg_to_alert(struct ina2xx_data *data, u8 bit, u16 regval)
> +{
> +	int get_value_reg_map;

"reg" is really good enough as variable name here.

> +
> +	switch (bit) {
> +	case INA226_SHUNT_OVER_VOLTAGE_BIT:
> +	case INA226_SHUNT_UNDER_VOLTAGE_BIT:
> +		get_value_reg_map = INA2XX_SHUNT_VOLTAGE;
> +		break;
> +	case INA226_BUS_OVER_VOLTAGE_BIT:
> +	case INA226_BUS_UNDER_VOLTAGE_BIT:
> +		get_value_reg_map = INA2XX_BUS_VOLTAGE;
> +		break;
> +	case INA226_POWER_OVER_LIMIT_BIT:
> +		get_value_reg_map = INA2XX_POWER;
> +		break;
> +	default:
> +		/* programmer goofed */
> +		WARN_ON_ONCE(1);
> +		return 0;
> +	}
> +
> +	return ina2xx_get_value(data, get_value_reg_map, regval);
> +}
> +
> +/*
> + * Turns alert limit values into register values.
> + * Opposite of the formula in ina2xx_get_value().
> + */
> +static s16 ina226_alert_to_reg(struct ina2xx_data *data, u8 bit, int val)
> +{
> +	switch (bit) {
> +	case INA226_SHUNT_OVER_VOLTAGE_BIT:
> +	case INA226_SHUNT_UNDER_VOLTAGE_BIT:
> +		val *= data->config->shunt_div;
> +		return clamp_val(val, SHRT_MIN, SHRT_MAX);
> +	case INA226_BUS_OVER_VOLTAGE_BIT:
> +	case INA226_BUS_UNDER_VOLTAGE_BIT:
> +		val = (val * 1000) << data->config->bus_voltage_shift;
> +		val = DIV_ROUND_CLOSEST(val, data->config->bus_voltage_lsb);
> +		return clamp_val(val, 0, SHRT_MAX);
> +	case INA226_POWER_OVER_LIMIT_BIT:
> +		val = DIV_ROUND_CLOSEST(val, data->power_lsb_uW);
> +		return clamp_val(val, 0, USHRT_MAX);
> +	default:
> +		/* programmer goofed */
> +		WARN_ON_ONCE(1);
> +		return 0;
> +	}
> +}
> +
> +static ssize_t ina226_alert_show(struct device *dev,
> +				 struct device_attribute *da, char *buf)
> +{
> +	struct sensor_device_attribute *attr = to_sensor_dev_attr(da);
> +	struct ina2xx_data *data = dev_get_drvdata(dev);
> +	int regval;
> +	int val = 0;
> +	int ret;
> +
> +	ret = regmap_read(data->regmap, INA226_MASK_ENABLE, &regval);
> +	if (ret)
> +		return ret;
> +
> +	if (regval & BIT(attr->index)) {
> +		ret = regmap_read(data->regmap, INA226_ALERT_LIMIT, &regval);
> +		if (ret)
> +			return ret;
> +		val = ina226_reg_to_alert(data, attr->index, regval);
> +	}

This will need mutex protection. Otherwise the active bit can change in
the write function between the two reads.

> +
> +	return snprintf(buf, PAGE_SIZE, "%d\n", val);
> +}
> +
> +static ssize_t ina226_alert_store(struct device *dev,
> +				  struct device_attribute *da,
> +				  const char *buf, size_t count)
> +{
> +	struct sensor_device_attribute *attr = to_sensor_dev_attr(da);
> +	struct ina2xx_data *data = dev_get_drvdata(dev);
> +	unsigned long val;
> +	int ret;
> +
> +	ret = kstrtoul(buf, 10, &val);
> +	if (ret < 0)
> +		return ret;
> +
> +	/*
> +	 * Clear all alerts first to avoid accidentally triggering ALERT pin
> +	 * due to register write sequence. Then, only enable the alert
> +	 * if the value is non-zero.
> +	 */
> +	ret = regmap_update_bits(data->regmap, INA226_MASK_ENABLE,
> +				 INA226_ALERT_CONFIG_MASK, 0);
> +	if (ret < 0)
> +		return ret;
> +
> +	ret = regmap_write(data->regmap, INA226_ALERT_LIMIT,
> +			   ina226_alert_to_reg(data, attr->index, val));
> +	if (ret < 0)
> +		return ret;
> +
> +	if (val != 0) {
> +		ret = regmap_update_bits(data->regmap, INA226_MASK_ENABLE,
> +					 INA226_ALERT_CONFIG_MASK,
> +					 BIT(attr->index));
> +		if (ret < 0)
> +			return ret;
> +	}
Same here; the write sequence needs to be mutex protected. 

> +	return count;
> +}
> +
> +static ssize_t ina226_alarm_show(struct device *dev,
> +				 struct device_attribute *da, char *buf)
> +{
> +	struct sensor_device_attribute *attr = to_sensor_dev_attr(da);
> +	struct ina2xx_data *data = dev_get_drvdata(dev);
> +	int regval;
> +	int alarm = 0;
> +	int ret;
> +
> +	ret = regmap_read(data->regmap, INA226_MASK_ENABLE, &regval);
> +	if (ret)
> +		return ret;
> +
> +	alarm = (regval & BIT(attr->index)) &&
> +		(regval & INA226_ALERT_FUNCTION_FLAG);
> +	return snprintf(buf, PAGE_SIZE, "%d\n", alarm);
> +}
> +
>  /*
>   * In order to keep calibration register value fixed, the product
>   * of current_lsb and shunt_resistor should also be fixed and equal
> @@ -392,15 +533,38 @@ static ssize_t ina226_interval_show(struct device *dev,
>  
>  /* shunt voltage */
>  static SENSOR_DEVICE_ATTR_RO(in0_input, ina2xx_value, INA2XX_SHUNT_VOLTAGE);
> +/* shunt voltage over/under voltage alert setting and alarm */
> +static SENSOR_DEVICE_ATTR_RW(in0_crit, ina226_alert,
> +			     INA226_SHUNT_OVER_VOLTAGE_BIT);
> +static SENSOR_DEVICE_ATTR_RW(in0_lcrit, ina226_alert,
> +			     INA226_SHUNT_UNDER_VOLTAGE_BIT);
> +static SENSOR_DEVICE_ATTR_RO(in0_crit_alarm, ina226_alarm,
> +			     INA226_SHUNT_OVER_VOLTAGE_BIT);
> +static SENSOR_DEVICE_ATTR_RO(in0_lcrit_alarm, ina226_alarm,
> +			     INA226_SHUNT_UNDER_VOLTAGE_BIT);
>  
>  /* bus voltage */
>  static SENSOR_DEVICE_ATTR_RO(in1_input, ina2xx_value, INA2XX_BUS_VOLTAGE);
> +/* bus voltage over/under voltage alert setting and alarm */
> +static SENSOR_DEVICE_ATTR_RW(in1_crit, ina226_alert,
> +			     INA226_BUS_OVER_VOLTAGE_BIT);
> +static SENSOR_DEVICE_ATTR_RW(in1_lcrit, ina226_alert,
> +			     INA226_BUS_UNDER_VOLTAGE_BIT);
> +static SENSOR_DEVICE_ATTR_RO(in1_crit_alarm, ina226_alarm,
> +			     INA226_BUS_OVER_VOLTAGE_BIT);
> +static SENSOR_DEVICE_ATTR_RO(in1_lcrit_alarm, ina226_alarm,
> +			     INA226_BUS_UNDER_VOLTAGE_BIT);
>  
>  /* calculated current */
>  static SENSOR_DEVICE_ATTR_RO(curr1_input, ina2xx_value, INA2XX_CURRENT);
>  
>  /* calculated power */
>  static SENSOR_DEVICE_ATTR_RO(power1_input, ina2xx_value, INA2XX_POWER);
> +/* over-limit power alert setting and alarm */
> +static SENSOR_DEVICE_ATTR_RW(power1_crit, ina226_alert,
> +			     INA226_POWER_OVER_LIMIT_BIT);
> +static SENSOR_DEVICE_ATTR_RO(power1_crit_alarm, ina226_alarm,
> +			     INA226_POWER_OVER_LIMIT_BIT);
>  
>  /* shunt resistance */
>  static SENSOR_DEVICE_ATTR_RW(shunt_resistor, ina2xx_shunt, INA2XX_CALIBRATION);
> @@ -423,6 +587,16 @@ static const struct attribute_group ina2xx_group = {
>  };
>  
>  static struct attribute *ina226_attrs[] = {
> +	&sensor_dev_attr_in0_crit.dev_attr.attr,
> +	&sensor_dev_attr_in0_lcrit.dev_attr.attr,
> +	&sensor_dev_attr_in0_crit_alarm.dev_attr.attr,
> +	&sensor_dev_attr_in0_lcrit_alarm.dev_attr.attr,
> +	&sensor_dev_attr_in1_crit.dev_attr.attr,
> +	&sensor_dev_attr_in1_lcrit.dev_attr.attr,
> +	&sensor_dev_attr_in1_crit_alarm.dev_attr.attr,
> +	&sensor_dev_attr_in1_lcrit_alarm.dev_attr.attr,
> +	&sensor_dev_attr_power1_crit.dev_attr.attr,
> +	&sensor_dev_attr_power1_crit_alarm.dev_attr.attr,
>  	&sensor_dev_attr_update_interval.dev_attr.attr,
>  	NULL,
>  };
> -- 
> 2.26.2.526.g744177e7f7-goog
> 
