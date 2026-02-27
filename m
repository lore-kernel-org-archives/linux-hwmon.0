Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA32E3290DA;
	Fri, 27 Feb 2026 09:49:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772185799; cv=none; b=lFFyx8D/isRcJpAoibOtt6E7KSjbyXlm4bUVOGofNCTYz6m/Rb7RvJdqdnpT8PT8oMMxZi6IXeWjpRxUNn7r4HAI4Ns+HASB66FRurU7xNRJbVfIz7FbBQ6AHuFu3REK4SIyZKB1dFq1rCMc0Zy8MeJi5QZMsxR6r6pC7JOY/JQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772185799; c=relaxed/simple;
	bh=asngTag3zYvylC/yoe41u7eejah9wkmXhWZZd615ALg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GFN8i91h3VzydC9iWe84OSGX9PNXLe9b85yz9rMVjPLdTg5FSh6xEo1Tn9Ra5tzrQzzhY1mazdJe1ZTUU4Zv6XpRaKQYoTa1H7xsNIZv4hiTORHioS7qnjF5WEkgzcXjL7GAIp7OPANK3ZAF+8ys0yDPu1Y0c7k19dazhoOFdVg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=GNzZnUDp; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="GNzZnUDp"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0AF27C116C6;
	Fri, 27 Feb 2026 09:49:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772185798;
	bh=asngTag3zYvylC/yoe41u7eejah9wkmXhWZZd615ALg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=GNzZnUDpkBzcFL+FM1MNpgCyCADefD/E9sVs21o75lx07Sm7CFwcNG5p7G/U+TpzX
	 o+Bg8kUpyRSR1jhCpmvjundHD7KmZxJ+oTxGcO/5xGmNeGVz2pPhBBXtqwpdd4rItU
	 cIsX8HMx3dV5SXBXCrW4znZ4s4MhzHVS2dRW9C1yKmoJla4RqfEFN0+GAqWBJTRCwY
	 qlvPMu0M4Dvjxh7WbhB+76DU7bjpzhjHHmCJe4MSD9Rtkf89CLjSFQUEDviAHGVeNE
	 WM9+T11k0+24/mxM1Fq8a+lBw793KM5aMzrpPGrVdbYPK2ZW62b3/+qJpj0Fxb5dbJ
	 XirqdPVKA9QQQ==
Date: Fri, 27 Feb 2026 10:49:56 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Alexey Charkov <alchark@flipper.net>
Cc: Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, linux-hwmon@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] hwmon: Add support for TI INA4230 power monitor
Message-ID: <20260227-victorious-parakeet-of-control-bef3ea@quoll>
References: <20260225-ina4230-v1-0-92b1de981d46@flipper.net>
 <20260225-ina4230-v1-2-92b1de981d46@flipper.net>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260225-ina4230-v1-2-92b1de981d46@flipper.net>

On Wed, Feb 25, 2026 at 01:29:12PM +0400, Alexey Charkov wrote:
> Add a driver for the TI INA4230, a 4-channel power monitor with I2C
> interface.
> 
> The driver supports voltage, current, power and energy measurements, but
> skips the alert functionality in this initial implementation.
> 
> Signed-off-by: Alexey Charkov <alchark@flipper.net>
> ---
>  MAINTAINERS             |   6 +
>  drivers/hwmon/Kconfig   |  11 +
>  drivers/hwmon/Makefile  |   1 +
>  drivers/hwmon/ina4230.c | 997 ++++++++++++++++++++++++++++++++++++++++++++++++
>  4 files changed, 1015 insertions(+)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 4d879f6a7b51..77f7a416e682 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -12511,6 +12511,12 @@ S:	Maintained
>  F:	Documentation/hwmon/ina233.rst
>  F:	drivers/hwmon/pmbus/ina233.c
>  
> +INA4230 HWMON DRIVER
> +M:	Alexey Charkov <alchark@flipper.net>
> +L:	linux-hwmon@vger.kernel.org
> +S:	Maintained
> +F:	drivers/hwmon/ina4230.c

List here binding as well, please.


...

> +
> +static int ina4230_probe_child_from_dt(struct device *dev,
> +				       struct device_node *child,
> +				       struct ina4230_data *ina)
> +{
> +	struct ina4230_input *input;
> +	u32 val;
> +	int ret;
> +
> +	ret = of_property_read_u32(child, "reg", &val);
> +	if (ret) {
> +		dev_err(dev, "missing reg property of %pOFn\n", child);
> +		return ret;
> +	} else if (val > INA4230_CHANNEL4) {
> +		dev_err(dev, "invalid reg %d of %pOFn\n", val, child);

All these are probe, so return dev_err_probe

> +		return -EINVAL;
> +	}
> +

...

> +	ina->regmap = devm_regmap_init_i2c(client, &ina4230_regmap_config);
> +	if (IS_ERR(ina->regmap)) {
> +		dev_err(dev, "Unable to allocate register map\n");
> +		return PTR_ERR(ina->regmap);
> +	}
> +
> +	for (i = 0; i < F_MAX_FIELDS; i++) {
> +		ina->fields[i] = devm_regmap_field_alloc(dev,
> +							 ina->regmap,
> +							 ina4230_reg_fields[i]);
> +		if (IS_ERR(ina->fields[i])) {
> +			dev_err(dev, "Unable to allocate regmap fields\n");
> +			return PTR_ERR(ina->fields[i]);

Syntax is return dev_err_probe, but allocations should not have printks.
It is not possible to get there any other error code.

> +		}
> +	}
> +
> +	for (i = 0; i < INA4230_NUM_CHANNELS; i++) {
> +		ina->inputs[i].shunt_resistor = INA4230_RSHUNT_DEFAULT;
> +		/* Default for 1mA LSB current measurements */
> +		ina->inputs[i].max_expected_current = 32768000;
> +	}
> +
> +	ret = ina4230_probe_from_dt(dev, ina);
> +	if (ret) {
> +		dev_err(dev, "Unable to probe from device tree\n");
> +		return ret;

return dev_err_probe

> +	}
> +
> +	/* The driver will be reset, so use reset value */
> +	ina->reg_config1 = INA4230_CONFIG_DEFAULT;
> +	ina->reg_config2 = 0;
> +
> +	if (ina->single_shot)
> +		FIELD_MODIFY(INA4230_CONFIG1_MODE_MASK, &ina->reg_config1,
> +			     INA4230_MODE_BUS_SHUNT_SINGLE);
> +
> +	/* Disable channels if their inputs are disconnected */
> +	for (i = 0; i < INA4230_NUM_CHANNELS; i++) {
> +		if (ina->inputs[i].disconnected)
> +			ina->reg_config1 &= ~INA4230_CONFIG_CHx_EN(i);
> +	}
> +
> +	/* Set calibration values */
> +	for (i = 0; i < INA4230_NUM_CHANNELS; i++) {
> +		if (!ina->inputs[i].disconnected)
> +			ina4230_set_calibration(ina, i);
> +	}
> +
> +	ina->pm_dev = dev;
> +	dev_set_drvdata(dev, ina);
> +
> +	/* Enable PM runtime -- status is suspended by default */
> +	pm_runtime_enable(ina->pm_dev);
> +
> +	/* Initialize (resume) the device */
> +	for (i = 0; i < INA4230_NUM_CHANNELS; i++) {
> +		if (ina->inputs[i].disconnected)
> +			continue;
> +		/* Match the refcount with number of enabled channels */
> +		ret = pm_runtime_get_sync(ina->pm_dev);
> +		if (ret < 0)
> +			goto fail;
> +	}
> +
> +	hwmon_dev = devm_hwmon_device_register_with_info(dev, client->name, ina,
> +							 &ina4230_chip_info,
> +							 ina4230_groups);
> +	if (IS_ERR(hwmon_dev)) {
> +		dev_err(dev, "Unable to register hwmon device\n");
> +		ret = PTR_ERR(hwmon_dev);

just ret = dev_err_probe

> +		goto fail;
> +	}
> +
> +	return 0;
> +
> +fail:
> +	pm_runtime_disable(ina->pm_dev);
> +	pm_runtime_set_suspended(ina->pm_dev);
> +	/* pm_runtime_put_noidle() will decrease the PM refcount until 0 */
> +	for (i = 0; i < INA4230_NUM_CHANNELS; i++)
> +		pm_runtime_put_noidle(ina->pm_dev);
> +
> +	return ret;
> +}
> +
> +static void ina4230_remove(struct i2c_client *client)
> +{
> +	struct ina4230_data *ina = dev_get_drvdata(&client->dev);
> +	int i;
> +
> +	pm_runtime_disable(ina->pm_dev);
> +	pm_runtime_set_suspended(ina->pm_dev);
> +
> +	/* pm_runtime_put_noidle() will decrease the PM refcount until 0 */
> +	for (i = 0; i < INA4230_NUM_CHANNELS; i++)
> +		pm_runtime_put_noidle(ina->pm_dev);
> +}
> +
> +static int ina4230_suspend(struct device *dev)
> +{
> +	struct ina4230_data *ina = dev_get_drvdata(dev);
> +	int ret;
> +
> +	/* Save config register value and enable cache-only */
> +	ret = regmap_read(ina->regmap, INA4230_CONFIG1, &ina->reg_config1);
> +	if (ret)
> +		return ret;
> +
> +	regcache_cache_only(ina->regmap, true);
> +	regcache_mark_dirty(ina->regmap);
> +
> +	return 0;
> +}
> +
> +static int ina4230_resume(struct device *dev)
> +{
> +	struct ina4230_data *ina = dev_get_drvdata(dev);
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
> +	return 0;
> +}
> +
> +static DEFINE_RUNTIME_DEV_PM_OPS(ina4230_pm, ina4230_suspend, ina4230_resume,
> +				 NULL);
> +
> +static const struct of_device_id ina4230_of_match_table[] = {
> +	{ .compatible = "ti,ina4230", },
> +	{ /* sentinel */ }
> +};
> +MODULE_DEVICE_TABLE(of, ina4230_of_match_table);
> +
> +static const struct i2c_device_id ina4230_ids[] = {
> +	{ "ina4230" },
> +	{ /* sentinel */ }
> +};
> +MODULE_DEVICE_TABLE(i2c, ina4230_ids);
> +
> +static struct i2c_driver ina4230_i2c_driver = {
> +	.probe = ina4230_probe,
> +	.remove = ina4230_remove,
> +	.driver = {
> +		.name = INA4230_DRIVER_NAME,
> +		.of_match_table = ina4230_of_match_table,
> +		.pm = pm_ptr(&ina4230_pm),
> +	},
> +	.id_table = ina4230_ids,
> +};
> +module_i2c_driver(ina4230_i2c_driver);
> +
> +MODULE_AUTHOR("Alexey Charkov <alchark@flipper.net>");
> +MODULE_DESCRIPTION("Texas Instruments INA4230 HWMon Driver");
> +MODULE_LICENSE("GPL");
> 
> -- 
> 2.52.0
> 
