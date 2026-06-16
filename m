Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6430305688
	for <linux-hwmon@vger.kernel.org>; Tue, 16 Jun 2026 23:25:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781652318; cv=none; b=Xonfem5x+7YuZXF94qb2mm2T4EY5G/4kjCbnCx3nDKMwprfHd/iKyrUaFNwVU7mBSNc71hV3tQTwqYBV4z94K2RKUY4ONDSaWWse0Rsb5aBV7VrBMK+proZ26MggOZeTQQjBDhmkfyfRJcRyjiZOhQw3b+nZfNaX+WAX0aNqWkQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781652318; c=relaxed/simple;
	bh=k7tFvpA+mSsscdVXyJo72e7PiQDHdDDOS3jpDYHBYlA=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=ggmof0qXJDf0QxCkQ3rI1g9PUmoBacF4diwjE+QavSdDDjmDJ5eLrKqtELlRY+TWN3VE1hJtO5ei+S4uUnkcHIjcyoFBWvH6YYJ4vZEb2e+XyWtzFUq4FcEY539DcsdrnJTDpG7gIP2DJcft1aYj6LXzuSVs8GgFTATZqKf1f7E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Oojc089L; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Oojc089L"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 536DC1F000E9;
	Tue, 16 Jun 2026 23:25:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781652317;
	bh=2FnAjKFrH0zjTrYaxYqDONAN8dl9XW8slUfRHFRsoxw=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Oojc089LKMeRNelwVzqP44qh0IQVFTYpvU/+cUMau5gh9TkdoJQ94bIWbIW3nCJ/E
	 Qz7HOOSME/GM6NKSTW4LzX2ksGhevvANzMqcy97rnUJyd1q4621OJhdIghKwl98EKj
	 6PS3ySzzB1J/BkcVJ/Nn8FbtVBkPmEBcOZlbfPEP/ZjyJ2+XE/1WMx6Ay75smsS/Wh
	 yX2wD/Oe4wTFjpf91MPI+ahc7AqCy4SYV/lcTnAwnzb5U2nV2njtDoc+IdDmnLVla6
	 G32KfzhmWGPDywRB8Jqj8lNpiaVWXlBD8M7lJMUoPSit+M+Ww/y5MxWsKpqM2sw/PI
	 vhI26k5bq1xnw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v5] hwmon: (ina2xx) Fix overflow issues
Reply-To: sashiko-reviews@lists.linux.dev
To: "Guenter Roeck" <linux@roeck-us.net>
Cc: linux-hwmon@vger.kernel.org
In-Reply-To: <20260616231323.3971915-1-linux@roeck-us.net>
References: <20260616231323.3971915-1-linux@roeck-us.net>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 16 Jun 2026 23:25:16 +0000
Message-Id: <20260616232517.536DC1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:

Pre-existing issues:
- [High] Incomplete fix for integer overflow in `ina226_alert_to_reg` for `=
INA2XX_CURRENT`.
--

commit 66f6bbb6849145fb218d70b58635416ea1a7ba0d
Author: Guenter Roeck <linux@roeck-us.net>

    hwmon: (ina2xx) Fix overflow issues

    This commit addresses several integer overflow problems in the ina2xx
    driver by introducing various value clamps and switching to larger data
    types. Specifically, it attempts to fix overflows in ina2xx_get_value()
    and ina226_alert_to_reg().

> diff --git a/drivers/hwmon/ina2xx.c b/drivers/hwmon/ina2xx.c
> index c4742e84b999d..8a219514b03be 100644
> --- a/drivers/hwmon/ina2xx.c
> +++ b/drivers/hwmon/ina2xx.c
[ ... ]
> @@ -378,23 +381,26 @@ static int ina2xx_read_init(struct device *dev, int=
 reg, long *val)
>   */
>  static u16 ina226_alert_to_reg(struct ina2xx_data *data, int reg, long v=
al)
>  {
> +	long limit;
> +
>  	switch (reg) {
[ ... ]
>  	case INA2XX_CURRENT:
> -		val =3D clamp_val(val, INT_MIN / 1000, INT_MAX / 1000);
> +		limit =3D (LONG_MAX - (data->current_lsb_uA / 2)) / 1000;
> +		val =3D clamp_val(val, -limit, limit);

[Severity: High]
This is a pre-existing issue, but does this initial clamp properly account
for the current_shift?

The commit message explicitly states: "To address the INA2XX_CURRENT
problem in ina226_alert_to_reg(), take current_shift into acount for the
initial clamp to avoid the overflow."

However, data->config->current_shift doesn't appear to be used in the
calculation of the limit here.

>  		/* signed register, result in mA */
>  		val =3D DIV_ROUND_CLOSEST(val * 1000, data->current_lsb_uA);
>  		val <<=3D data->config->current_shift;

If a user writes a very large limit on a 32-bit platform to disable the
alert (e.g., INT_MAX), val is clamped to approximately 2,147,483.
val * 1000 evaluates to 2,147,483,000.

After DIV_ROUND_CLOSEST with a small current_lsb_uA (e.g., 10 for a
typical 0.2-ohm shunt), val becomes 214,748,300.

When left-shifting by current_shift (e.g., 4 for the INA234), val becomes
3,435,972,800. Since val is a 32-bit signed long, this exceeds LONG_MAX
and wraps around to -858,994,496.

This negative value will then be clamped to SHRT_MIN in the return
statement, programming the hardware to immediately trigger false alerts
when the user's intent was to disable them.

Should current_shift be included in the initial clamp calculation to
prevent this?

>  		return clamp_val(val, SHRT_MIN, SHRT_MAX);
>  	default:

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260616231323.3971=
915-1-linux@roeck-us.net?part=3D1
