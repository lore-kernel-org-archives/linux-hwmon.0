Return-Path: <linux-hwmon-owner@vger.kernel.org>
Return-path: <linux-hwmon-owner@vger.kernel.org>
Received: from mail-pg1-f193.google.com ([209.85.215.193]:46825 "EHLO
        mail-pg1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726816AbeI3WBS (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Sun, 30 Sep 2018 18:01:18 -0400
Date: Sun, 30 Sep 2018 08:27:49 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Nicolin Chen <nicoleotsuka@gmail.com>
Cc: jdelvare@suse.com, afd@ti.com, linux-hwmon@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 3/3] hwmon: ina3221: Add suspend and resume functions
Message-ID: <20180930152749.GA16746@roeck-us.net>
References: <20180929214407.27208-1-nicoleotsuka@gmail.com>
 <20180929214407.27208-4-nicoleotsuka@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20180929214407.27208-4-nicoleotsuka@gmail.com>
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

On Sat, Sep 29, 2018 at 02:44:07PM -0700, Nicolin Chen wrote:
> Depending on the hardware design, an INA3221 chip might lose
> its power during system suspend/resume. So this patch adds
> a set of suspend and resume functions to cache the register
> values including config register value and limit settings.
> 
> Signed-off-by: Nicolin Chen <nicoleotsuka@gmail.com>

Applied to hwmon-next, with a minor change; see below.

Thanks,
Guenter

> ---
> Changelog
> v1->v2:
>  * Added power-down setting during suspend for power saving
> 
>  drivers/hwmon/ina3221.c | 63 +++++++++++++++++++++++++++++++++++++++++
>  1 file changed, 63 insertions(+)
> 
> diff --git a/drivers/hwmon/ina3221.c b/drivers/hwmon/ina3221.c
> index e0c4f4d83f4e..877952efaa88 100644
> --- a/drivers/hwmon/ina3221.c
> +++ b/drivers/hwmon/ina3221.c
> @@ -38,6 +38,8 @@
>  #define INA3221_WARN3			0x0c
>  #define INA3221_MASK_ENABLE		0x0f
>  
> +#define INA3221_CONFIG_MODE_MASK	GENMASK(2, 0)
> +#define INA3221_CONFIG_MODE_POWERDOWN	0
>  #define INA3221_CONFIG_MODE_SHUNT	BIT(0)
>  #define INA3221_CONFIG_MODE_BUS		BIT(1)
>  #define INA3221_CONFIG_MODE_CONTINUOUS	BIT(2)
> @@ -91,11 +93,13 @@ static const unsigned int register_channel[] = {
>   * @regmap: Register map of the device
>   * @fields: Register fields of the device
>   * @shunt_resistors: Array of resistor values per channel
> + * @reg_config: Register value of INA3221_CONFIG
>   */
>  struct ina3221_data {
>  	struct regmap *regmap;
>  	struct regmap_field *fields[F_MAX_FIELDS];
>  	int shunt_resistors[INA3221_NUM_CHANNELS];
> +	u32 reg_config;
>  };
>  
>  static int ina3221_read_value(struct ina3221_data *ina, unsigned int reg,
> @@ -415,9 +419,67 @@ static int ina3221_probe(struct i2c_client *client,
>  		return PTR_ERR(hwmon_dev);
>  	}
>  
> +	dev_set_drvdata(dev, ina);
> +

It is better to call that function before registering the hwmon device,
to avoid the theroretical possibility that suspend is called before drvdata
is set. I moved the call accordingly.

>  	return 0;
>  }
>  
> +#ifdef CONFIG_PM
> +static int ina3221_suspend(struct device *dev)
> +{
> +	struct ina3221_data *ina = dev_get_drvdata(dev);
> +	int ret;
> +
> +	/* Save config register value and enable cache-only */
> +	ret = regmap_read(ina->regmap, INA3221_CONFIG, &ina->reg_config);
> +	if (ret)
> +		return ret;
> +
> +	/* Set to power-down mode for power saving */
> +	ret = regmap_update_bits(ina->regmap, INA3221_CONFIG,
> +				 INA3221_CONFIG_MODE_MASK,
> +				 INA3221_CONFIG_MODE_POWERDOWN);
> +	if (ret)
> +		return ret;
> +
> +	regcache_cache_only(ina->regmap, true);
> +	regcache_mark_dirty(ina->regmap);
> +
> +	return 0;
> +}
> +
> +static int ina3221_resume(struct device *dev)
> +{
> +	struct ina3221_data *ina = dev_get_drvdata(dev);
> +	int ret;
> +
> +	regcache_cache_only(ina->regmap, false);
> +
> +	/* Software reset the chip */
> +	ret = regmap_field_write(ina->fields[F_RST], true);
> +	if (ret) {
> +		dev_err(dev, "Unable to reset device\n");
> +		return ret;
> +	}
> +
> +	/* Restore cached register values to hardware */
> +	ret = regcache_sync(ina->regmap);
> +	if (ret)
> +		return ret;
> +
> +	/* Restore config register value to hardware */
> +	ret = regmap_write(ina->regmap, INA3221_CONFIG, ina->reg_config);
> +	if (ret)
> +		return ret;
> +
> +	return 0;
> +}
> +#endif
> +
> +static const struct dev_pm_ops ina3221_pm = {
> +	SET_SYSTEM_SLEEP_PM_OPS(ina3221_suspend, ina3221_resume)
> +};
> +
>  static const struct of_device_id ina3221_of_match_table[] = {
>  	{ .compatible = "ti,ina3221", },
>  	{ /* sentinel */ }
> @@ -435,6 +497,7 @@ static struct i2c_driver ina3221_i2c_driver = {
>  	.driver = {
>  		.name = INA3221_DRIVER_NAME,
>  		.of_match_table = ina3221_of_match_table,
> +		.pm = &ina3221_pm,
>  	},
>  	.id_table = ina3221_ids,
>  };
