Received: from todd.t-8ch.de (todd.t-8ch.de [159.69.126.157])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1402E39D6FA
	for <linux-hwmon@vger.kernel.org>; Sat, 30 May 2026 11:04:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.69.126.157
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780139048; cv=none; b=klx7GWdt3wcXqzG5aVRjt0LeXECsUra2QQgGkaGDvC3DObSHizXoWvivMWUOY09try7tZng6pdoFbga35bkVB7O9RBRqujECT6zt84+oa4jlQBYFWEbFX6IjnXzcZI/o7TkuCDhoJTgeCqbo7UAwK8sSeQfBGwtkLP1XZx+kNbE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780139048; c=relaxed/simple;
	bh=wWawFLaPVS+C0TT7LGI8PekcGkzYU+jEv0GJH51lyeE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=b4bZ49WZUm0+WNTNZAlU3da0F+VwfZ+Vb4nDm2kfVbx3JyvO6JXFOsOPNUz1jPs93ld4iv6kA1d3paECjwPC/Tw5qxBv6r5GkP2t7Ko11AxYZIsQlcREqrorz1QGClwWNfLuQxunUcXXwB5KjZMJnKYN+GZvVEHKbWihEnmCR6Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net; spf=pass smtp.mailfrom=weissschuh.net; dkim=pass (1024-bit key) header.d=weissschuh.net header.i=@weissschuh.net header.b=RgjbkbzE; arc=none smtp.client-ip=159.69.126.157
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=weissschuh.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=weissschuh.net header.i=@weissschuh.net header.b="RgjbkbzE"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=weissschuh.net;
	s=mail; t=1780139045;
	bh=wWawFLaPVS+C0TT7LGI8PekcGkzYU+jEv0GJH51lyeE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=RgjbkbzEuPxXOSSFspFC6JUXJOrIj0JEpdAtGm40Or/hD+rQMzLiV9AJvc3I9HgK5
	 4Evws+l5hJUOj8QCWItcNgRu3hi8Wrgmt+j0oDjpYVPgoEr0tdGbrSv/llysKXAALT
	 2r1gaVy7dzeVCFOYWsrxnnpL/PUBZ4iOCNSNPA2k=
Date: Sat, 30 May 2026 13:04:04 +0200
From: Thomas =?utf-8?Q?Wei=C3=9Fschuh?= <linux@weissschuh.net>
To: sashiko-reviews@lists.linux.dev
Cc: linux-hwmon@vger.kernel.org
Subject: Re: [PATCH 4/5] hwmon: (cros_ec) Add support for displaying fan
 curves
Message-ID: <ae7ff79c-8180-4f76-ab38-f0ab38ecf556@t-8ch.de>
References: <20260529-cros_ec-hwmon-fan-curve-v1-4-da6792b3830f@weissschuh.net>
 <20260529212602.6AD3B1F00893@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260529212602.6AD3B1F00893@smtp.kernel.org>

On 2026-05-29 21:26:01+0000, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [Medium] Missing endianness conversion for EC thermal config data and sensor_num.
> --
> 
> commit be72df851dc1a1ab2ed2868ddf58166c69fe3c4c
> Author: Thomas Weißschuh <linux@weissschuh.net>
> 
> hwmon: (cros_ec) Add support for displaying fan curves
> 
> The automatic fan control mode of the embedded controller uses fan curves
> with two trigger points to calculate the target fan speed. All temperature
> sensors affect all fans. Expose these fan curves through the standard
> hwmon sysfs ABI.
> 
> > diff --git a/drivers/hwmon/cros_ec_hwmon.c b/drivers/hwmon/cros_ec_hwmon.c
> > index a6cc909e56b7e..731143f8c6b2a 100644
> > --- a/drivers/hwmon/cros_ec_hwmon.c
> > +++ b/drivers/hwmon/cros_ec_hwmon.c
> > @@ -372,6 +375,141 @@ static umode_t cros_ec_hwmon_is_visible(const void *data, enum hwmon_sensor_type
> >  	return 0;
> >  }
> 
> [ ... ]
> 
> > +static ssize_t temp_auto_point_temp_show(struct device *dev, struct device_attribute *attr,
> > +					 char *buf)
> > +{
> > +	struct sensor_device_attribute_2 *sattr = to_sensor_dev_attr_2(attr);
> > +	struct cros_ec_hwmon_priv *priv = dev_get_drvdata(dev);
> > +	struct ec_thermal_config config;
> > +	u32 temp;
> > +	int ret;
> > +
> > +	scoped_guard(hwmon_lock, dev) {
> > +		ret = cros_ec_hwmon_get_thermal_config(priv->cros_ec, sattr->index, &config);
> > +		if (ret)
> > +			return ret;
> > +	}
> > +
> > +	if (cros_ec_hwmon_attr_is_temp_fan_off(sattr))
> > +		temp = config.temp_fan_off;
> > +	else /* temp_fan_max */
> > +		temp = config.temp_fan_max;
> 
> [Severity: Medium]
> Since the Chrome OS EC wire protocol is little-endian, do these raw u32
> fields need to be converted using le32_to_cpu() to prevent corrupted values
> on big-endian hosts?
> 
> It looks like the pre-existing cros_ec_hwmon_get_thermal_config() helper
> similarly fails to use cpu_to_le32() when assigning req.sensor_num, which
> could cause the EC to receive a byte-swapped sensor number.

None of the cros_ec drivers handle big-endian systems properly.
But the drivers can only be used on little-endian systems anyways
through the dependency chain SENSORS_CROS_EC -> MFD_CROS_EC_DEV ->
CROS_EC -> X86 || ARM || ARM64 || COMPILE_TEST.

So we can ignore this for now in my opinion.

To properly use leXX_to_cpu() helpers we would also need to change the
protocol structs in include/linux/platform_data/cros_ec_commands.h to
use the actual __leXX types.

> > +
> > +	if (temp == 0)
> > +		return -ENODATA;
> > +
> > +	return sysfs_emit(buf, "%ld\n", cros_ec_hwmon_kelvin_to_millicelsius(temp));
> > +}
> 
> -- 
> Sashiko AI review · https://sashiko.dev/#/patchset/20260529-cros_ec-hwmon-fan-curve-v1-0-da6792b3830f@weissschuh.net?part=4
