Received: from todd.t-8ch.de (todd.t-8ch.de [159.69.126.157])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A823C2EF64F
	for <linux-hwmon@vger.kernel.org>; Sat, 30 May 2026 11:12:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.69.126.157
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780139525; cv=none; b=MYsMW4jsGBeKYYZgrtodDa4UgWzTJcpsUv5t+zZ3EpNW6Hk50JgroIrNBnyepcnQlo606FBJYzI3Rp1FKPNmZWiIsuzJ3/53cJPRHEOXwH7ZXW9qhNxFi9YxFGDyYKnLqR5+eBDe88PxASiZyZOsTjVj17jkgODSX77HKc6YUjc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780139525; c=relaxed/simple;
	bh=a3QfrfJrYV1QYELjkBT3JtGsAN00rF3x2xbml8aM+Ao=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mhmzTqKUBboFjV6EhBuZQUZe5xrqWygbwQdYseyoBb4kekMgLh0rZT18ufQ5AqWlmcpsTbbia/shCmXTIewdLWZ96oQ3o3eMaliTQggakuPKttntGbZXDNTFKbdX2LWY9tcG8zCm96YtaDb65ih24Xzy79NBbGc7V8Ak5Hj/bdA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net; spf=pass smtp.mailfrom=weissschuh.net; dkim=pass (1024-bit key) header.d=weissschuh.net header.i=@weissschuh.net header.b=OD+b5SzS; arc=none smtp.client-ip=159.69.126.157
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=weissschuh.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=weissschuh.net header.i=@weissschuh.net header.b="OD+b5SzS"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=weissschuh.net;
	s=mail; t=1780139521;
	bh=a3QfrfJrYV1QYELjkBT3JtGsAN00rF3x2xbml8aM+Ao=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=OD+b5SzS/s0HYDKmEhQ9sabfR0ooKXHyk2xYadKVpWouHWIW49qZs/V911rl6RNML
	 7nO7NUMcqcEeiz7aoi8APNQk3e+SqkMaDiphpFOY7imzSawRsFChUreO2PgGrXEk/X
	 9yOT3StQXa5sVTTJ9NuN4bFYRzOuC/EmbpjE20fA=
Date: Sat, 30 May 2026 13:12:01 +0200
From: Thomas =?utf-8?Q?Wei=C3=9Fschuh?= <linux@weissschuh.net>
To: sashiko-reviews@lists.linux.dev
Cc: linux-hwmon@vger.kernel.org
Subject: Re: [PATCH 5/5] hwmon: (cros_ec) Allow modification of fan curves
Message-ID: <20159ced-3959-47da-9245-8d562d656f43@t-8ch.de>
References: <20260529-cros_ec-hwmon-fan-curve-v1-5-da6792b3830f@weissschuh.net>
 <20260529213842.354A51F00893@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260529213842.354A51F00893@smtp.kernel.org>

On 2026-05-29 21:38:41+0000, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 2 potential issue(s) to consider:
> - [High] Aggressiveness check incorrectly handles the disabled state (0 K), permanently locking unconfigured sensors and allowing fans to be disabled.
> - [Medium] Integer truncation on 32-bit architectures bypasses input bounds validation.
> --
> 
> commit 84e7ddf64f7f5ac65172c3a7ccc4e158bbb73094
> Author: Thomas Weißschuh <linux@weissschuh.net>
> 
> hwmon: (cros_ec) Allow modification of fan curves
> 
> This commit exposes the EC fan curves through the standard hwmon sysfs
> ABI, allowing both reading and writing. It includes logic to ensure
> the curves can only be made more aggressive than their current state.
> 
> > diff --git a/drivers/hwmon/cros_ec_hwmon.c b/drivers/hwmon/cros_ec_hwmon.c
> > index 731143f8c6b2a..fb73a00ebeebd 100644
> > --- a/drivers/hwmon/cros_ec_hwmon.c
> > +++ b/drivers/hwmon/cros_ec_hwmon.c
> 
> [ ... ]
> 
> > @@ -417,14 +435,60 @@ static ssize_t temp_auto_point_temp_show(struct device *dev, struct device_attri
> >  	return sysfs_emit(buf, "%ld\n", cros_ec_hwmon_kelvin_to_millicelsius(temp));
> >  }
> >  
> > +static ssize_t temp_auto_point_temp_store(struct device *dev, struct device_attribute *attr,
> > +					  const char *buf, size_t size)
> > +{
> > +	struct sensor_device_attribute_2 *sattr = to_sensor_dev_attr_2(attr);
> > +	struct cros_ec_hwmon_priv *priv = dev_get_drvdata(dev);
> > +	struct ec_thermal_config config;
> > +	u32 *temp_field;
> > +	s64 temp;
> > +	int ret;
> > +
> > +	ret = kstrtos64(buf, 10, &temp);
> > +	if (ret)
> > +		return ret;
> > +
> > +	temp = cros_ec_hwmon_millicelsius_to_kelvin(temp);
> 
> [Severity: Medium]
> Does this silently truncate values on 32-bit platforms?
> 
> The cros_ec_hwmon_millicelsius_to_kelvin() function takes a long parameter:
> 
> static long cros_ec_hwmon_millicelsius_to_kelvin(long t)
> 
> Since temp is parsed as an s64, passing an extremely large out-of-bounds
> value on a 32-bit architecture might truncate to a small valid value.

We don't care about overflows anywhere else, so I am not sure that we
should do so here. I'll switch the millicelsius to kelvin conversions
to s32 to keep the logic more uniform, though.

> Could this bypass the aggressiveness and overflow checks below, allowing
> invalid internal values to be applied?

I don't see how it would bypass the checks.

> > +
> > +	if (overflows_type(temp, config.temp_fan_off))
> > +		return -ERANGE;
> > +
> > +	guard(hwmon_lock)(dev);
> > +
> > +	ret = cros_ec_hwmon_get_thermal_config(priv->cros_ec, sattr->index, &config);
> > +	if (ret)
> > +		return ret;
> > +
> > +	if (cros_ec_hwmon_attr_is_temp_fan_off(sattr))
> > +		temp_field = &config.temp_fan_off;
> > +	else /* temp_fan_max */
> > +		temp_field = &config.temp_fan_max;
> > +
> > +	/* Only allow values which are more aggressive than the current ones */
> > +	if (temp > *temp_field)
> > +		return -EINVAL;
> 
> [Severity: High]
> How does this handle the disabled state where the current threshold is 0 K?
> 
> If a sensor is currently uninitialized or disabled where *temp_field is 0,
> any valid positive temperature input evaluates to true here, rejecting the
> configuration. This seems to make it impossible to configure uninitialized
> fan curves.

If the sensor is currently disabled, I think we should reject *any* write
to it. If somebody has a usecase for that, they can argue for it.

> Conversely, if a user inputs -273150 mC representing 0 K, the check evaluates
> to false. This bypasses the check and sets the threshold to 0, which disables
> the fan. Would this allow the fans to be made less aggressive, contradicting
> the documented policy?

I'll add a check to reject writing '0' kelvin.

> > +
> > +	*temp_field = temp;
> > +
> > +	if (config.temp_fan_off > config.temp_fan_max)
> > +		return -EINVAL;
> > +
> > +	ret = cros_ec_hwmon_set_thermal_config(priv->cros_ec, sattr->index, &config);
> > +	if (ret)
> > +		return ret;
> > +
> > +	return size;
> > +}
> 
> -- 
> Sashiko AI review · https://sashiko.dev/#/patchset/20260529-cros_ec-hwmon-fan-curve-v1-0-da6792b3830f@weissschuh.net?part=5
