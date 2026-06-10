Received: from todd.t-8ch.de (todd.t-8ch.de [159.69.126.157])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 862D0405844
	for <linux-hwmon@vger.kernel.org>; Wed, 10 Jun 2026 12:02:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.69.126.157
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781092972; cv=none; b=hjMUNeEHUdwspjSzydMzS4USO7Zw0xZCOgM+qk9w/5EIb5JxG8G67KbR8ZrRqN66GKUWLjbZmcs5LsTETEy8oKUCq7I6Ev7Ua/mR9szmOwy6UdpWvNLKcCuiv+3IVmExLTPRdI39vvWXSiYWcKmv0PZW1vTnyPa83OhTVGGmzKg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781092972; c=relaxed/simple;
	bh=tIbUR0O2eIN5egP+g/eD4rND0lSNhGFGyzKyCRatP3M=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tgt+uu4ICdaVYJTuUUlKtvUX/1KJZs0auEVzS98tdxq8AHNEHspooHezcKGPCtsLrqWaOqUbKwOLF+j617h+UVfeasB6OcwZhHRyjmcrQ64iHWFr6vvJ8Qeogl+UDGZ69OrzG9PKB0wpcsr1/JpD563qWWWsLQ1Q4CvOVn3ThwY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net; spf=pass smtp.mailfrom=weissschuh.net; dkim=pass (1024-bit key) header.d=weissschuh.net header.i=@weissschuh.net header.b=fkxmkE2Z; arc=none smtp.client-ip=159.69.126.157
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=weissschuh.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=weissschuh.net header.i=@weissschuh.net header.b="fkxmkE2Z"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=weissschuh.net;
	s=mail; t=1781092960;
	bh=tIbUR0O2eIN5egP+g/eD4rND0lSNhGFGyzKyCRatP3M=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=fkxmkE2Zj4ag9Jm5KSvcOhxKh+dbTs/xnkBkwlQvdgHW8AtQwiyutOSlPSDxVwCmP
	 BR7BPiEKRvpZwxZWH2W3hyWZUYZf+B9SJABIJTWPQeeUYjzVA14AbTxV7HwX+7iumG
	 Ow8lbk186DxZwm7jyQMAl/usJpXf6YMF6yvt0OcM=
Date: Wed, 10 Jun 2026 14:02:39 +0200
From: Thomas =?utf-8?Q?Wei=C3=9Fschuh?= <linux@weissschuh.net>
To: Guenter Roeck <linux@roeck-us.net>
Cc: sashiko-reviews@lists.linux.dev, linux-hwmon@vger.kernel.org
Subject: Re: [PATCH 5/5] hwmon: (cros_ec) Allow modification of fan curves
Message-ID: <263a9a98-c427-4d3a-8971-b42a27dab976@t-8ch.de>
References: <20260529-cros_ec-hwmon-fan-curve-v1-5-da6792b3830f@weissschuh.net>
 <20260529213842.354A51F00893@smtp.kernel.org>
 <20159ced-3959-47da-9245-8d562d656f43@t-8ch.de>
 <81dc547c-7c62-4e34-aa90-5a48ebe46b9b@roeck-us.net>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <81dc547c-7c62-4e34-aa90-5a48ebe46b9b@roeck-us.net>

On 2026-06-08 15:13:09-0700, Guenter Roeck wrote:
> On 5/30/26 04:12, Thomas Weißschuh wrote:
> > On 2026-05-29 21:38:41+0000, sashiko-bot@kernel.org wrote:
> > > Thank you for your contribution! Sashiko AI review found 2 potential issue(s) to consider:
> > > - [High] Aggressiveness check incorrectly handles the disabled state (0 K), permanently locking unconfigured sensors and allowing fans to be disabled.
> > > - [Medium] Integer truncation on 32-bit architectures bypasses input bounds validation.
> > > --
> > > 
> > > commit 84e7ddf64f7f5ac65172c3a7ccc4e158bbb73094
> > > Author: Thomas Weißschuh <linux@weissschuh.net>
> > > 
> > > hwmon: (cros_ec) Allow modification of fan curves
> > > 
> > > This commit exposes the EC fan curves through the standard hwmon sysfs
> > > ABI, allowing both reading and writing. It includes logic to ensure
> > > the curves can only be made more aggressive than their current state.
> > > 
> > > > diff --git a/drivers/hwmon/cros_ec_hwmon.c b/drivers/hwmon/cros_ec_hwmon.c
> > > > index 731143f8c6b2a..fb73a00ebeebd 100644
> > > > --- a/drivers/hwmon/cros_ec_hwmon.c
> > > > +++ b/drivers/hwmon/cros_ec_hwmon.c
> > > 
> > > [ ... ]
> > > 
> > > > @@ -417,14 +435,60 @@ static ssize_t temp_auto_point_temp_show(struct device *dev, struct device_attri
> > > >   	return sysfs_emit(buf, "%ld\n", cros_ec_hwmon_kelvin_to_millicelsius(temp));
> > > >   }
> > > > +static ssize_t temp_auto_point_temp_store(struct device *dev, struct device_attribute *attr,
> > > > +					  const char *buf, size_t size)
> > > > +{
> > > > +	struct sensor_device_attribute_2 *sattr = to_sensor_dev_attr_2(attr);
> > > > +	struct cros_ec_hwmon_priv *priv = dev_get_drvdata(dev);
> > > > +	struct ec_thermal_config config;
> > > > +	u32 *temp_field;
> > > > +	s64 temp;
> > > > +	int ret;
> > > > +
> > > > +	ret = kstrtos64(buf, 10, &temp);
> > > > +	if (ret)
> > > > +		return ret;
> > > > +
> > > > +	temp = cros_ec_hwmon_millicelsius_to_kelvin(temp);
> > > 
> > > [Severity: Medium]
> > > Does this silently truncate values on 32-bit platforms?
> > > 
> > > The cros_ec_hwmon_millicelsius_to_kelvin() function takes a long parameter:
> > > 
> > > static long cros_ec_hwmon_millicelsius_to_kelvin(long t)
> > > 
> > > Since temp is parsed as an s64, passing an extremely large out-of-bounds
> > > value on a 32-bit architecture might truncate to a small valid value.
> > 
> > We don't care about overflows anywhere else, so I am not sure that we
> > should do so here. I'll switch the millicelsius to kelvin conversions
> 
> Oh help. "The driver already has bugs, so introducing more bugs should
> be acceptable".
> 
> Who said that we (whoever that is) don't care about overflows ? Did you
> consider the possibility that maybe we (or at least I) do care, but
> that code reviews are not perfect and tend to overlook them ?

"We", all the users of linux/units.h who haven't bothered for years to
even implement overflow-aware variants.

> Sashiko is explicitly directed to look for overflows in hardware monitoring
> drivers because its maintainer _does_ care.

Nice! This was not obvious. I am happy to fix it up properly.

> No, it is not ok to introduce new bugs to a driver because the driver is
> already buggy.

Technically it would have been the same bug that already existed before.

> Why kstrtos64() in the first place ? That is completely pointless.

The idea was consistency. So that the same inputs produce the same
result (or error) on all systems. I am fine with not doing that.


Given that patch 1 of this series introduces a compiler warning,
could you drop the whole series and I'll resend it after -rc1?
(I'll have to doublecheck why I didn't notice the warning before)


Thomas
