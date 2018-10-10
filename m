Return-Path: <linux-hwmon-owner@vger.kernel.org>
Return-path: <linux-hwmon-owner@vger.kernel.org>
Received: from mail-pl1-f194.google.com ([209.85.214.194]:33766 "EHLO
        mail-pl1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726206AbeJJUow (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Wed, 10 Oct 2018 16:44:52 -0400
Subject: Re: [PATCH 2/2] hwmon: (ina3221) Add operating mode support
To: Nicolin Chen <nicoleotsuka@gmail.com>, jdelvare@suse.com
Cc: linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org,
        corbet@lwn.net, linux-doc@vger.kernel.org
References: <20181010043310.30873-1-nicoleotsuka@gmail.com>
 <20181010043310.30873-3-nicoleotsuka@gmail.com>
From: Guenter Roeck <linux@roeck-us.net>
Message-ID: <32c22986-544e-aca1-12bf-9080667cf499@roeck-us.net>
Date: Wed, 10 Oct 2018 06:22:39 -0700
MIME-Version: 1.0
In-Reply-To: <20181010043310.30873-3-nicoleotsuka@gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

Hi Nicolin,

On 10/09/2018 09:33 PM, Nicolin Chen wrote:
> The hwmon core now has a new optional mode interface. So this patch
> just implements this mode support so that user space can check and
> configure via sysfs node its operating modes: power-down, one-shot,
> and continuous modes.
> 

One-shot mode on its own does not make sense or add value: It would require
explicit driver support to trigger a reading, wait for the result, and
report it back to the user. If the intent here is to have the user write the
mode (which triggers the one-shot reading), wait a bit, and then read the
results, that doesn't make sense because standard userspace applications
won't know that. Also, that would be unsynchronized - one has to read the
CVRF bit in the mask/enable register to know if the reading is complete.
The effort to do all this using CPU cycles would in most if not all cases
outweigh any perceived power savings. As such, I just don't see the
practical use case.

power-down mode effectively reinvents runtime power management (runtime
suspend/resume support) and is thus simply unacceptable.

I am open to help explore adding support for runtime power management
to the hwmon subsystem, but that would be less than straightforward and
require an actual use case to warrant the effort.

As such, NACK, sorry.

Thanks,
Guenter

> Signed-off-by: Nicolin Chen <nicoleotsuka@gmail.com>
> ---
>   drivers/hwmon/ina3221.c | 64 +++++++++++++++++++++++++++++++++++++++++
>   1 file changed, 64 insertions(+)
> 
> diff --git a/drivers/hwmon/ina3221.c b/drivers/hwmon/ina3221.c
> index d61688f04594..5218fd85506d 100644
> --- a/drivers/hwmon/ina3221.c
> +++ b/drivers/hwmon/ina3221.c
> @@ -77,6 +77,28 @@ enum ina3221_channels {
>   	INA3221_NUM_CHANNELS
>   };
>   
> +enum ina3221_modes {
> +	INA3221_MODE_POWERDOWN,
> +	INA3221_MODE_ONESHOT,
> +	INA3221_MODE_CONTINUOUS,
> +	INA3221_NUM_MODES,
> +};
> +
> +static const char *ina3221_mode_names[INA3221_NUM_MODES] = {
> +	[INA3221_MODE_POWERDOWN] = "power-down",
> +	[INA3221_MODE_ONESHOT] = "one-shot",
> +	[INA3221_MODE_CONTINUOUS] = "continuous",
> +};
> +
> +static const u16 ina3221_mode_val[] = {
> +	[INA3221_MODE_POWERDOWN] = INA3221_CONFIG_MODE_POWERDOWN,
> +	[INA3221_MODE_ONESHOT] = INA3221_CONFIG_MODE_SHUNT |
> +				     INA3221_CONFIG_MODE_BUS,
> +	[INA3221_MODE_CONTINUOUS] = INA3221_CONFIG_MODE_CONTINUOUS |
> +				    INA3221_CONFIG_MODE_SHUNT |
> +				    INA3221_CONFIG_MODE_BUS,
> +};
> +
>   /**
>    * struct ina3221_input - channel input source specific information
>    * @label: label of channel input source
> @@ -386,9 +408,51 @@ static const struct hwmon_ops ina3221_hwmon_ops = {
>   	.write = ina3221_write,
>   };
>   
> +static int ina3221_mode_get_index(struct device *dev, unsigned int *index)
> +{
> +	struct ina3221_data *ina = dev_get_drvdata(dev);
> +	u16 mode = ina->reg_config & INA3221_CONFIG_MODE_MASK;
> +
> +	if (mode == INA3221_CONFIG_MODE_POWERDOWN)
> +		*index = INA3221_MODE_POWERDOWN;
> +	if (mode & INA3221_CONFIG_MODE_CONTINUOUS)
> +		*index = INA3221_MODE_CONTINUOUS;
> +	else
> +		*index = INA3221_MODE_ONESHOT;
> +
> +	return 0;
> +}
> +
> +static int ina3221_mode_set_index(struct device *dev, unsigned int index)
> +{
> +	struct ina3221_data *ina = dev_get_drvdata(dev);
> +	int ret;
> +
> +	ret = regmap_update_bits(ina->regmap, INA3221_CONFIG,
> +				 INA3221_CONFIG_MODE_MASK,
> +				 ina3221_mode_val[index]);
> +	if (ret)
> +		return ret;
> +
> +	/* Cache the latest config register value */
> +	ret = regmap_read(ina->regmap, INA3221_CONFIG, &ina->reg_config);
> +	if (ret)
> +		return ret;
> +
> +	return 0;
> +}
> +
> +static const struct hwmon_mode ina3221_hwmon_mode = {
> +	.names = ina3221_mode_names,
> +	.list_size = INA3221_NUM_MODES,
> +	.get_index = ina3221_mode_get_index,
> +	.set_index = ina3221_mode_set_index,
> +};
> +
>   static const struct hwmon_chip_info ina3221_chip_info = {
>   	.ops = &ina3221_hwmon_ops,
>   	.info = ina3221_info,
> +	.mode = &ina3221_hwmon_mode,
>   };
>   
>   /* Extra attribute groups */
> 
