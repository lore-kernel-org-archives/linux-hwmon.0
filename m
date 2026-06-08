Received: from todd.t-8ch.de (todd.t-8ch.de [159.69.126.157])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20F55318EE6;
	Mon,  8 Jun 2026 15:53:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.69.126.157
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780934022; cv=none; b=JGwR1+MY1lfye6oyh4rdrhrWPMVTdEeyFTjJzIhB7O3wRMkAz6M5O38jr7GBnUSUxQJ/EWOAcp1b32fTyetSrIHOf0sQnSzLgZ7H1U82wJX2Yu3YJBQhVJB1cBrOelA48tKiDLLVyHBHNnVxSF1GvqjUkxpj9L8S+0+sUrHS4WI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780934022; c=relaxed/simple;
	bh=Gsdkj7Xwjn/mxP4dcUshnWSdQPSCwBmj0okkEY70A+o=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=k9J2n6gHwduP+1sDlHgaffLsZfKJIhz0LQD1kQ0lTty098TVoGJSwFev4l20RZKnRMzlkQk7U4yZBcd0X2GzB0dO2a34yo36Q419OWvyGNH3jMimKLH7COVw0u2BDZAimJGauawka7zhjDyNRTXjTStBVuZ7zHUMdm3GbkOi1Ic=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net; spf=pass smtp.mailfrom=weissschuh.net; dkim=pass (1024-bit key) header.d=weissschuh.net header.i=@weissschuh.net header.b=UD4WQgj0; arc=none smtp.client-ip=159.69.126.157
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=weissschuh.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=weissschuh.net header.i=@weissschuh.net header.b="UD4WQgj0"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=weissschuh.net;
	s=mail; t=1780934012;
	bh=Gsdkj7Xwjn/mxP4dcUshnWSdQPSCwBmj0okkEY70A+o=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=UD4WQgj0/ug4woY/AAuvMWRRMRlpcV3Lh6SRzcNBtRec7tFeBKyobfKRPoo9Y6wLw
	 /pkyw/aCZDq6dhR61dCCd6Hxzk7C6/IbSZruBt6v3Nll6sTSSrDEs2I/sdKpI17iZG
	 79xBDdb8fp515hnmDn1X1qUtbbb0uqFmlK7xknxY=
Date: Mon, 8 Jun 2026 17:53:29 +0200
From: Thomas =?utf-8?Q?Wei=C3=9Fschuh?= <linux@weissschuh.net>
To: Guenter Roeck <linux@roeck-us.net>
Cc: Armin Wolf <W_Armin@gmx.de>, Benson Leung <bleung@chromium.org>, 
	Shuah Khan <skhan@linuxfoundation.org>, Guenter Roeck <groeck@chromium.org>, 
	chrome-platform@lists.linux.dev, linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 5/5] hwmon: (cros_ec) Allow modification of fan curves
Message-ID: <bfacbd84-4fcd-4e84-bdda-8bcb900ca6c9@t-8ch.de>
References: <20260529-cros_ec-hwmon-fan-curve-v1-0-da6792b3830f@weissschuh.net>
 <20260529-cros_ec-hwmon-fan-curve-v1-5-da6792b3830f@weissschuh.net>
 <87825203-0bbb-46a4-8939-a904f5a546ab@gmx.de>
 <6a4a2d2c-4717-4cc9-8dd3-05f8b0905865@t-8ch.de>
 <8b8f5a9f-4a44-4e93-9ff6-c2e13a6b8797@gmx.de>
 <243e6f71-b777-478c-802a-d8f3ed47b3fc@roeck-us.net>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <243e6f71-b777-478c-802a-d8f3ed47b3fc@roeck-us.net>

On 2026-06-08 06:34:43-0700, Guenter Roeck wrote:
> On 6/4/26 03:33, Armin Wolf wrote:
> > Am 04.06.26 um 11:04 schrieb Thomas Weißschuh:
> > > On 2026-05-30 18:37:32+0200, Armin Wolf wrote:
> > > > Am 29.05.26 um 22:31 schrieb Thomas Weißschuh:
> > > 
> > > (...)
> > > 
> > > > > +static ssize_t temp_auto_point_temp_store(struct device *dev, struct device_attribute *attr,
> > > > > +                      const char *buf, size_t size)
> > > > > +{
> > > > > +    struct sensor_device_attribute_2 *sattr = to_sensor_dev_attr_2(attr);
> > > > > +    struct cros_ec_hwmon_priv *priv = dev_get_drvdata(dev);
> > > > > +    struct ec_thermal_config config;
> > > > > +    u32 *temp_field;
> > > > > +    s64 temp;
> > > > > +    int ret;
> > > > > +
> > > > > +    ret = kstrtos64(buf, 10, &temp);
> > > > > +    if (ret)
> > > > > +        return ret;
> > > > > +
> > > > > +    temp = cros_ec_hwmon_millicelsius_to_kelvin(temp);
> > > > > +
> > > > > +    if (overflows_type(temp, config.temp_fan_off))
> > > > > +        return -ERANGE;
> > > > > +
> > > > > +    guard(hwmon_lock)(dev);
> > > > > +
> > > > > +    ret = cros_ec_hwmon_get_thermal_config(priv->cros_ec, sattr->index, &config);
> > > > > +    if (ret)
> > > > > +        return ret;
> > > > > +
> > > > > +    if (cros_ec_hwmon_attr_is_temp_fan_off(sattr))
> > > > > +        temp_field = &config.temp_fan_off;
> > > > > +    else /* temp_fan_max */
> > > > > +        temp_field = &config.temp_fan_max;
> > > > > +
> > > > > +    /* Only allow values which are more aggressive than the current ones */
> > > > > +    if (temp > *temp_field)
> > > > > +        return -EINVAL;
> > > > 
> > > > i think it would be more practical for users to increase and later decrease the fan curve values.
> > > > Could the driver copy the original fan curve configuration and use that instead? This would also
> > > > require to restore the original fan curve during shutdown and removal.
> > > 
> > > That would be possible. We would would have to expose these limits
> > > through a new UAPI as otherwise the user has no way to know about them.
> > > Restoring the original on shutdown shouldn't be necessary, as the EC
> > > will reset the curves at shutdown anyways.
> > 
> > (And what about kexec?)
> > 
> > Ok, i myself would also interested in having a UAPI for communicating fan curve constraints to userspace as i am planning to add a similar feature to the uniwill-laptop driver.
> > 
> > I can think of two approaches:
> > 
> > 1. Clamp the values into the supported range, userspace will have to read back the written value to know the current setting.
> > 
> 
> ... which is widely used in hwmon drivers, so it is not special.
> We don't usually expect userspace to know the valid attribute range.

That works for me.

What should be clamp to, though?
The range active during probe or the currently active one?

> > 2. Introducing a new tempX_auto_pointY_temp_min attribute to communicate the constraint to userspace.
> > 
> > Guenter, do you have a preference for one of the approaches? Personally
> > i would prefer approach number 2.
> > 
> 
> Again, we don't usually provide constraints for limit attributes
> to userspace. Otherwise we would need separate _min and _max attributes
> for literally every limit attribute. That would add a lot of complexity
> for little if any gain.

One constraint that exists today is the range accepted by kstrtol(),
which can return -ERANGE. Not that I want to argue that this is an
issue and requires change, just pointing it out.

> Worse, almost all attributes do not just have min/max constraints but
> step size constraints as well. Hardware does not typically accept values
> in millisecond/millivolt etc. but have varying step sizes. How would you
> express that ? The hardware won't accept a temperature of, say, 27.123
> degrees C. Hwmon drivers are expected to adjust that to the next supported
> value. That means userspace has to read the value back to know that value
> anyway. Or do you plan to provide the step size to userspace as well ?
> What would you do if the step size is non-linear ?

To me the step size argument is slightly different than the range one.
The difference between the values provided by the user and the one
actually used ones should be fairly small, while for the range it may be
much larger. Not that it makes a difference here.

> On top of that, _min and _max attributes are already associated with
> limits. I would find it confusing if new attributes would redefine that
> naming scheme to supported ranges.

Ack.

(...)
