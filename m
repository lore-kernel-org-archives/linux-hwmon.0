Received: from todd.t-8ch.de (todd.t-8ch.de [159.69.126.157])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A1E13F0AA4;
	Thu,  4 Jun 2026 09:04:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.69.126.157
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780563852; cv=none; b=i3dwUeaV+e5FueRdvnjDpti4NOTvzaObwv46dFknLamxWtw5hfXjOZBOMjt4YJWL/pdjIKwDNKjxihjsNqxmDzg5WFm7kJcQiqnx3xIo8L2KD+CTfmDvM9lbsSfCI/srmhY0uiywWbWbRIqwkydEZ3288a5me6fLpgsho4kJwDQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780563852; c=relaxed/simple;
	bh=HZBFPt3AHs032vytSSq82zqyY8ui1J8IKqNS5bkFEYg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fvlSC2KvInARhSM4TGTds7WKYAzLWeGWFL2QM1cUFPidy9uAD0vBvYwNE8B7rF2Iqyxz5gG9/YVamVFWWX8QQxhJfJW8FPAMOuFr0aRd2WMW9O8vFR5a8SMVsMPjaXN5MJsfKpPeW2H368S958ooDvKhnhSm6UpT81E21jwHzAw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net; spf=pass smtp.mailfrom=weissschuh.net; dkim=pass (1024-bit key) header.d=weissschuh.net header.i=@weissschuh.net header.b=XZuvmnYB; arc=none smtp.client-ip=159.69.126.157
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=weissschuh.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=weissschuh.net header.i=@weissschuh.net header.b="XZuvmnYB"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=weissschuh.net;
	s=mail; t=1780563842;
	bh=HZBFPt3AHs032vytSSq82zqyY8ui1J8IKqNS5bkFEYg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=XZuvmnYB9kIIXSt9CtsuK5/ULfpziWeWrKpTh7NnFxMW8v79O+mqTkZ43bLhY1xVo
	 EoBKOaRQBTKdMbnVab0uxYegkB2jnLHFZ7Cce4bYXQzWvUvOPfqdNI67SQj2seAX1B
	 D49FtvNcPc+tSRG0TMO/PU6I9sabxMIXzPVoD15M=
Date: Thu, 4 Jun 2026 11:04:02 +0200
From: Thomas =?utf-8?Q?Wei=C3=9Fschuh?= <linux@weissschuh.net>
To: Armin Wolf <W_Armin@gmx.de>
Cc: Guenter Roeck <linux@roeck-us.net>, Benson Leung <bleung@chromium.org>, 
	Shuah Khan <skhan@linuxfoundation.org>, Guenter Roeck <groeck@chromium.org>, 
	chrome-platform@lists.linux.dev, linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 5/5] hwmon: (cros_ec) Allow modification of fan curves
Message-ID: <6a4a2d2c-4717-4cc9-8dd3-05f8b0905865@t-8ch.de>
References: <20260529-cros_ec-hwmon-fan-curve-v1-0-da6792b3830f@weissschuh.net>
 <20260529-cros_ec-hwmon-fan-curve-v1-5-da6792b3830f@weissschuh.net>
 <87825203-0bbb-46a4-8939-a904f5a546ab@gmx.de>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <87825203-0bbb-46a4-8939-a904f5a546ab@gmx.de>

On 2026-05-30 18:37:32+0200, Armin Wolf wrote:
> Am 29.05.26 um 22:31 schrieb Thomas Weißschuh:

(...)

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
> i think it would be more practical for users to increase and later decrease the fan curve values.
> Could the driver copy the original fan curve configuration and use that instead? This would also
> require to restore the original fan curve during shutdown and removal.

That would be possible. We would would have to expose these limits
through a new UAPI as otherwise the user has no way to know about them.
Restoring the original on shutdown shouldn't be necessary, as the EC
will reset the curves at shutdown anyways.

I am not so sure that it would be generally useful though. Let's hear
what other people think about it.

> Thanks,
> Armin Wolf
> 
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

(...)
