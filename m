Return-Path: <linux-hwmon-owner@vger.kernel.org>
Received: from mail-pg1-f193.google.com ([209.85.215.193]:38121 "EHLO
        mail-pg1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726103AbeKMO3H (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Tue, 13 Nov 2018 09:29:07 -0500
Date: Mon, 12 Nov 2018 20:32:48 -0800
From: Guenter Roeck <linux@roeck-us.net>
To: Nicolin Chen <nicoleotsuka@gmail.com>
Cc: jdelvare@suse.com, linux-hwmon@vger.kernel.org,
        linux-kernel@vger.kernel.org, corbet@lwn.net,
        linux-doc@vger.kernel.org
Subject: Re: [PATCH] hwmon (ina3221) Add single-shot mode support
Message-ID: <20181113043248.GB11205@roeck-us.net>
References: <20181113042353.1507-1-nicoleotsuka@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20181113042353.1507-1-nicoleotsuka@gmail.com>
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

On Mon, Nov 12, 2018 at 08:23:53PM -0800, Nicolin Chen wrote:
> INA3221 supports both continuous and single-shot modes. When
> running in the continuous mode, it keeps measuring the inputs
> and converting them to the data register even if there are no
> users reading the data out. In this use case, this could be a
> power waste.
> 
> So this patch adds a single-shot mode support so that ina3221
> could do measurement and conversion only if users trigger it,
> depending on the use case where it only needs to poll data in
> a lower frequency.
> 
> The change also exposes "mode" and "available_modes" nodes to
> allow users to switch between two operating modes.
> 
Lots and lots of complexity for little gain. Sorry, I don't see
the point of this change.

Guenter

> Signed-off-by: Nicolin Chen <nicoleotsuka@gmail.com>
> ---
>  Documentation/hwmon/ina3221 |   3 +
>  drivers/hwmon/ina3221.c     | 109 ++++++++++++++++++++++++++++++++++++
>  2 files changed, 112 insertions(+)
> 
> diff --git a/Documentation/hwmon/ina3221 b/Documentation/hwmon/ina3221
> index 4b82cbfb551c..b03f4ad901ee 100644
> --- a/Documentation/hwmon/ina3221
> +++ b/Documentation/hwmon/ina3221
> @@ -35,3 +35,6 @@ curr[123]_max           Warning alert current(mA) setting, activates the
>                            average is above this value.
>  curr[123]_max_alarm     Warning alert current limit exceeded
>  in[456]_input           Shunt voltage(uV) for channels 1, 2, and 3 respectively
> +available_modes         Available operating modes of the chip:
> +                          continuous mode; single-shot mode
> +mode                    Current operating mode of the chip
> diff --git a/drivers/hwmon/ina3221.c b/drivers/hwmon/ina3221.c
> index 17a57dbc0424..8f7da3f75d53 100644
> --- a/drivers/hwmon/ina3221.c
> +++ b/drivers/hwmon/ina3221.c
> @@ -91,6 +91,17 @@ enum ina3221_channels {
>  	INA3221_NUM_CHANNELS
>  };
>  
> +enum ina3221_modes {
> +	INA3221_MODE_SINGLE_SHOT,
> +	INA3221_MODE_CONTINUOUS,
> +	INA3221_NUM_MODES,
> +};
> +
> +static const char * const ina3221_mode_names[] = {
> +	[INA3221_MODE_SINGLE_SHOT] = "single-shot",
> +	[INA3221_MODE_CONTINUOUS] = "continuous",
> +};
> +
>  /**
>   * struct ina3221_input - channel input source specific information
>   * @label: label of channel input source
> @@ -127,6 +138,11 @@ static inline bool ina3221_is_enabled(struct ina3221_data *ina, int channel)
>  	       (ina->reg_config & INA3221_CONFIG_CHx_EN(channel));
>  }
>  
> +static inline bool ina3221_is_singleshot_mode(struct ina3221_data *ina)
> +{
> +	return !(ina->reg_config & INA3221_CONFIG_MODE_CONTINUOUS);
> +}
> +
>  /* Lookup table for Bus and Shunt conversion times in usec */
>  static const u16 ina3221_conv_time[] = {
>  	140, 204, 332, 588, 1100, 2116, 4156, 8244,
> @@ -188,6 +204,11 @@ static int ina3221_read_in(struct device *dev, u32 attr, int channel, long *val)
>  		if (!ina3221_is_enabled(ina, channel))
>  			return -ENODATA;
>  
> +		/* Write CONFIG register to trigger a single-shot measurement */
> +		if (ina3221_is_singleshot_mode(ina))
> +			regmap_write(ina->regmap, INA3221_CONFIG,
> +				     ina->reg_config);
> +
>  		ret = ina3221_wait_for_data(ina);
>  		if (ret)
>  			return ret;
> @@ -232,6 +253,11 @@ static int ina3221_read_curr(struct device *dev, u32 attr,
>  		if (!ina3221_is_enabled(ina, channel))
>  			return -ENODATA;
>  
> +		/* Write CONFIG register to trigger a single-shot measurement */
> +		if (ina3221_is_singleshot_mode(ina))
> +			regmap_write(ina->regmap, INA3221_CONFIG,
> +				     ina->reg_config);
> +
>  		ret = ina3221_wait_for_data(ina);
>  		if (ret)
>  			return ret;
> @@ -532,6 +558,82 @@ static ssize_t ina3221_set_shunt(struct device *dev,
>  	return count;
>  }
>  
> +static ssize_t available_modes_show(struct device *dev,
> +				    struct device_attribute *attr, char *buf)
> +{
> +	int i;
> +
> +	for (i = 0; i < ARRAY_SIZE(ina3221_mode_names); i++)
> +		snprintf(buf, PAGE_SIZE, "%s%s ", buf, ina3221_mode_names[i]);
> +
> +	return snprintf(buf, PAGE_SIZE, "%s\n", buf);
> +}
> +
> +static ssize_t mode_show(struct device *dev,
> +			 struct device_attribute *attr, char *buf)
> +{
> +	struct ina3221_data *ina = dev_get_drvdata(dev);
> +	int mode;
> +
> +	if (ina->reg_config & INA3221_CONFIG_MODE_CONTINUOUS)
> +		mode = INA3221_MODE_CONTINUOUS;
> +	else
> +		mode = INA3221_MODE_SINGLE_SHOT;
> +
> +	return snprintf(buf, PAGE_SIZE, "%s\n", ina3221_mode_names[mode]);
> +}
> +
> +static ssize_t mode_store(struct device *dev,
> +			  struct device_attribute *attr,
> +			  const char *buf, size_t count)
> +{
> +	struct ina3221_data *ina = dev_get_drvdata(dev);
> +	u16 mask = INA3221_CONFIG_MODE_CONTINUOUS;
> +	u16 continuous;
> +	int mode, ret;
> +	char name[32];
> +
> +	mutex_lock(&ina->lock);
> +
> +	snprintf(name, sizeof(name), "%s", buf);
> +	strim(name);
> +
> +	for (mode = 0; mode < INA3221_NUM_MODES; mode++) {
> +		if (!strcmp(name, ina3221_mode_names[mode]))
> +			break;
> +	}
> +
> +	switch (mode) {
> +	case INA3221_MODE_SINGLE_SHOT:
> +		continuous = 0;
> +		break;
> +	case INA3221_MODE_CONTINUOUS:
> +		continuous = INA3221_CONFIG_MODE_CONTINUOUS;
> +		break;
> +	default:
> +		mutex_unlock(&ina->lock);
> +		return -EINVAL;
> +	}
> +
> +	/* Set register to configure single-shot or continuous mode */
> +	ret = regmap_update_bits(ina->regmap, INA3221_CONFIG, mask, continuous);
> +	if (ret) {
> +		mutex_unlock(&ina->lock);
> +		return ret;
> +	}
> +
> +	/* Cache the latest config register value */
> +	ret = regmap_read(ina->regmap, INA3221_CONFIG, &ina->reg_config);
> +	if (ret) {
> +		mutex_unlock(&ina->lock);
> +		return ret;
> +	}
> +
> +	mutex_unlock(&ina->lock);
> +
> +	return count;
> +}
> +
>  /* shunt resistance */
>  static SENSOR_DEVICE_ATTR(shunt1_resistor, S_IRUGO | S_IWUSR,
>  		ina3221_show_shunt, ina3221_set_shunt, INA3221_CHANNEL1);
> @@ -540,10 +642,17 @@ static SENSOR_DEVICE_ATTR(shunt2_resistor, S_IRUGO | S_IWUSR,
>  static SENSOR_DEVICE_ATTR(shunt3_resistor, S_IRUGO | S_IWUSR,
>  		ina3221_show_shunt, ina3221_set_shunt, INA3221_CHANNEL3);
>  
> +/* operating mode */
> +static DEVICE_ATTR_RW(mode);
> +static DEVICE_ATTR_RO(available_modes);
> +
>  static struct attribute *ina3221_attrs[] = {
>  	&sensor_dev_attr_shunt1_resistor.dev_attr.attr,
>  	&sensor_dev_attr_shunt2_resistor.dev_attr.attr,
>  	&sensor_dev_attr_shunt3_resistor.dev_attr.attr,
> +	/* common attributes */
> +	&dev_attr_mode.attr,
> +	&dev_attr_available_modes.attr,
>  	NULL,
>  };
>  ATTRIBUTE_GROUPS(ina3221);
> -- 
> 2.17.1
> 
