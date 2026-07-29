Received: from todd.t-8ch.de (todd.t-8ch.de [159.69.126.157])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B65E64119EB;
	Wed, 29 Jul 2026 15:35:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.69.126.157
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785339327; cv=none; b=FmXNj1tyN1JVR41Qw8+h5MYN2aAfKzDwwJP18lkJSA+WX7GxvrSh1hxby5T/RVAikYVEyARQJk4MkFs6RUmiVzeeesmOp2FH3PiiKDgadZTqw5vu6PoBekGY2smNgrSLc8M9Y0tDZ1LEFD/8XEWzO/ChWh6x0LenkdBiZCq7BOI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785339327; c=relaxed/simple;
	bh=l0NCnI6JOuhb++b95efRhL0Y/0C3ZAtA3MWlgH3zA2c=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TABAEq2mu2pnUZKixoIeZhotmdAYJZ4bMjDR55DqDtXEEWdYamfu2ZouuPXHxon/LQ7BKgKeK/++5cgXS89+jjwXRWtMc8DIWZe+9yEzmjdtHoVZm193wE/RajL3YyrXpRV8GdIoFVgvRIFbsGRtLx7uZGymrMbSCQ63Fk1yzPk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net; spf=pass smtp.mailfrom=weissschuh.net; dkim=pass (1024-bit key) header.d=weissschuh.net header.i=@weissschuh.net header.b=BWyXI9hH; arc=none smtp.client-ip=159.69.126.157
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=weissschuh.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=weissschuh.net header.i=@weissschuh.net header.b="BWyXI9hH"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=weissschuh.net;
	s=mail; t=1785339316;
	bh=l0NCnI6JOuhb++b95efRhL0Y/0C3ZAtA3MWlgH3zA2c=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=BWyXI9hHDmmA7SrILfJCTnQulplcF3cLGT05iTMDA9lh7nbJxNDR/eJaU8gDDXZIm
	 5AabpRJ1ajdHM/TK6WHmoNbLDBTPUlX29m8KcPDT8YIyfnuwishB6ywBOyCOggChoz
	 h+kzJfvj6U0OnDcfQX4QpaWVHfHTLtRLaA2P2nBs=
Date: Wed, 29 Jul 2026 17:35:15 +0200
From: Thomas =?utf-8?Q?Wei=C3=9Fschuh?= <linux@weissschuh.net>
To: dhs@frame.work
Cc: Guenter Roeck <linux@roeck-us.net>, Benson Leung <bleung@chromium.org>, 
	Guenter Roeck <groeck@chromium.org>, chrome-platform@lists.linux.dev, linux-hwmon@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Tzung-Bi Shih <tzungbi@kernel.org>, linux@frame.work
Subject: Re: [PATCH] hwmon: (cros_ec): Hide unconfigured temperature
 thresholds
Message-ID: <1020ffb2-5c50-4440-ba88-8f40f02a754f@t-8ch.de>
References: <20260729-crosec-hwmon-warn-default-v1-1-d1eb39656a60@frame.work>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260729-crosec-hwmon-warn-default-v1-1-d1eb39656a60@frame.work>

On 2026-07-29 00:38:16+0800, Daniel Schaefer via B4 Relay wrote:
> From: Daniel Schaefer <dhs@frame.work>

Welcome to upstream!

> The EC reports a threshold of 0 K for host thresholds that are not
> configured. Most Framework Computer systems don't use all thresholds.
> E.g. temp_host_warn is left unset and stays at its -273 C / 0 K
> default), see the EC code in zephyr/shim/src/thermal.c:
> 
>   DT_PROP_OR(node_id, temp_host_warn,  -273)
> 
> Previously these unconfigured thresholds were exposed as sysfs limits
> that read back as -273.15 C, which userspace (e.g. s-tui) interpreted as
> a real, permanently-exceeded limit.

In current hwmon-next this should read back as -273C. See commit
9f14280c5ef3 ("hwmon: (cros_ec) Implement custom kelvin to celsius conversions")

> To avoid this we can hide the sysfs attribute for that threshold.

"Avoid this by hiding ..."

> See truncated example below.
> 
> Before:
> 
> > sensors cros_ec-isa-000c
> cpu_f75303@4d:       +36.9°C  (crit = +74.8°C, emerg = +84.8°C)
> 
> After:
> 
> > sensors cros_ec-isa-000c
> cpu_f75303@4d:       +36.9°C  (high = -273.1°C, crit = +74.8°C)
>                               (emerg = +84.8°C)

"Before:" and "After:" are swapped?

> Cc: Tzung-Bi Shih <tzungbi@kernel.org>
> Cc: Thomas Weißschuh <linux@weissschuh.net>
> Cc: linux@frame.work
> Signed-off-by: Daniel Schaefer <dhs@frame.work>
> ---
>  drivers/hwmon/cros_ec_hwmon.c | 14 ++++++++++++--
>  1 file changed, 12 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/hwmon/cros_ec_hwmon.c b/drivers/hwmon/cros_ec_hwmon.c
> index 03bfcc40bb7c..57158443dafe 100644
> --- a/drivers/hwmon/cros_ec_hwmon.c
> +++ b/drivers/hwmon/cros_ec_hwmon.c
> @@ -319,6 +319,7 @@ static umode_t cros_ec_hwmon_is_visible(const void *data, enum hwmon_sensor_type
>  					u32 attr, int channel)
>  {
>  	const struct cros_ec_hwmon_priv *priv = data;
> +	u32 threshold;
>  	u16 speed;
>  
>  	if (type == hwmon_fan) {
> @@ -334,8 +335,17 @@ static umode_t cros_ec_hwmon_is_visible(const void *data, enum hwmon_sensor_type
>  	} else if (type == hwmon_temp) {
>  		if (priv->temp_sensor_names[channel]) {
>  			if (cros_ec_hwmon_attr_is_temp_threshold(attr)) {
> -				if (priv->temp_threshold_supported)
> -					return 0444;
> +				if (!priv->temp_threshold_supported)
> +					return 0;
> +
> +				if (cros_ec_hwmon_read_temp_threshold(priv->cros_ec, channel,
> +								      cros_ec_hwmon_attr_to_thres(attr),
> +								      &threshold) != 0)

Probing would be a bit faster by not calling this for each threshold,
but only doing it once. cros_ec_hwmon_priv::temp_threshold_supported
could become a bitmask for supported thresholds to be read in is_visible().
This can also replace is_cros_ec_cmd_available(EC_CMD_THERMAL_GET_THRESHOLD).

> +					return 0;
> +				if (threshold == 0)
> +					return 0;
> +
> +				return 0444;
>  			} else {
>  				return 0444;
>  			}
