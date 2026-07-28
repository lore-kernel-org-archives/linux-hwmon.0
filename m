Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34995379C38
	for <linux-hwmon@vger.kernel.org>; Tue, 28 Jul 2026 16:48:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785257319; cv=none; b=EplG98LZBbyQ7whdFTeUDcTLhYp3FhiLHGbzpUzhQ5HraNnqF2Iuc7q7wFoQRm3KMx4UkPuOpvJmiyXRtnICAWlrC7+yA+lKdw+/GHbBTSnUTRhMDJa1OToyUBIlMXpPslMjKvRUa7IbCiQokW+Vtd/sWUoxOUzGr9j6P5vqXrQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785257319; c=relaxed/simple;
	bh=yhqmqECHd9PK+6tUXVBPLt+hxavjsZdvFMTEfXtgHTo=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=SH0pvHoXvwEbG0Wg3hnE6dDDQ1kC8hFVX1pKvSeZFXHFtiP34w9NdBtiCd1ES3dK0PvJcuqQ3bTeH+dq8Hvs7tBaUJ/9beoRFIhMP1fABtFzWthT9RkLSxpK34nLOu0B9rCVYjPjyJQ39vG1omh3ZGLN6e+CIDnRAbNYyhCZ3js=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=eda3TxBs; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="eda3TxBs"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9C94E1F000E9;
	Tue, 28 Jul 2026 16:48:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785257317;
	bh=Ync5K40SAMhUD1rOHZXrOS8kOprqLpx6UKI55P5XbZg=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=eda3TxBsotj240oEgSVNfbux2/+hcE9U4zupdP4jh1lIwOO29068jjkWv5EDH7iPJ
	 GaMB3O5gI1jNai3Bw9hB/bi6z6FN0+W7/Kav3Th40SnG43R9OKAHFFLKbukwrr8kPw
	 BHEd++/8nnjic8MwEio8dO5Y3UP3Ah6w/kO1AbkpmwDc5V7orL174uxrPuskVvtu3f
	 6fq8YiidC9B1Q9X97DwqFlZZPwernohqDEouRwxGJ9j0PRSvnUhAZQaRy/EkiD2abs
	 fSHXLsIPSWjxtVJGkGGmebWMjCq++CXnWlpSFA22d/OnuBUZbnaKM6JT15StmOywQR
	 MO+Q+2aNjlnUQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] hwmon: (cros_ec): Hide unconfigured temperature
 thresholds
Reply-To: sashiko-reviews@lists.linux.dev
To: "Daniel Schaefer" <dhs@frame.work>
Cc: linux-hwmon@vger.kernel.org
In-Reply-To: <20260729-crosec-hwmon-warn-default-v1-1-d1eb39656a60@frame.work>
References: <20260729-crosec-hwmon-warn-default-v1-1-d1eb39656a60@frame.work>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 28 Jul 2026 16:48:37 +0000
Message-Id: <20260728164837.9C94E1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] Transient EC communication errors during driver probe permanentl=
y hide thermal threshold sysfs attributes.
--

--- Patch [1]: [PATCH] hwmon: (cros_ec): Hide unconfigured temperature thre=
sholds ---
commit de61a2547d7ffb8ebe260dea1df08c0623451745
Author: Daniel Schaefer <dhs@frame.work>

hwmon: (cros_ec): Hide unconfigured temperature thresholds

This commit updates the cros_ec_hwmon driver to hide sysfs temperature
threshold attributes when the EC reports they are unconfigured (0 K). It
achieves this by evaluating the threshold value during the is_visible
callback and returning 0 when the threshold is 0 or if the read fails.

> diff --git a/drivers/hwmon/cros_ec_hwmon.c b/drivers/hwmon/cros_ec_hwmon.c
> index 03bfcc40bb7c3..57158443dafe6 100644
> --- a/drivers/hwmon/cros_ec_hwmon.c
> +++ b/drivers/hwmon/cros_ec_hwmon.c

[ ... ]

> @@ -334,8 +335,17 @@ static umode_t cros_ec_hwmon_is_visible(const void *=
data, enum hwmon_sensor_type
>  	} else if (type =3D=3D hwmon_temp) {
>  		if (priv->temp_sensor_names[channel]) {
>  			if (cros_ec_hwmon_attr_is_temp_threshold(attr)) {
> -				if (priv->temp_threshold_supported)
> -					return 0444;
> +				if (!priv->temp_threshold_supported)
> +					return 0;
> +
> +				if (cros_ec_hwmon_read_temp_threshold(priv->cros_ec, channel,
> +								      cros_ec_hwmon_attr_to_thres(attr),
> +								      &threshold) !=3D 0)
> +					return 0;

[Severity: Medium]
Will this permanently hide valid thermal threshold attributes if there
is a transient EC communication error during driver probe?

The hwmon subsystem calls the is_visible callback during registration.
If cros_ec_hwmon_read_temp_threshold() encounters a temporary transport
error (such as -EIO or -ETIMEDOUT), it returns a non-zero error code.

Since this check returns 0 on any error, the attribute is permanently
suppressed. Should this perhaps only return 0 if the error is exactly
-EOPNOTSUPP, similar to how hwmon_fan_target is handled earlier in
this function?

> +				if (threshold =3D=3D 0)
> +					return 0;
> +
> +				return 0444;
>  			} else {
>  				return 0444;
>  			}

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260729-crosec-hwm=
on-warn-default-v1-1-d1eb39656a60@frame.work?part=3D1
