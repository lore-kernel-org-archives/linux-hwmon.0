Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1C0D342C80;
	Tue, 13 Oct 2026 13:10:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791897036; cv=none; b=c+8QVuM95Z8hfx2bMagsK/czN4ud2zqTCOjQ8ceyARlllIjS4k+9Dv/GejzdEImjVF2OuhbGHggFZhQXd5ovr8Vwlvlh2UPEOP0vqy6PMQBT4fy6dbURy4fueztBS1U2NbHlE1PQflONTw53HTdaX1Ir14wSFENEbXK69hADNFo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791897036; c=relaxed/simple;
	bh=pcow4jy5wz3NRVSgUL3y8pZXCp3qJJWA8s5bTeT3JUM=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date; b=gji2iC1Cak5A8rE8h+YK1xVLPJFO9A2FCtiMx4xUABBMalfOG3fDjo2jMh5GbCXaXpnmHuHxKlfQG76h4zGrZERQZ2tWZ5ZDxvIBqgEFWaIkd0qcUlEfmvxo5SAzcZnmsX5fvkScxu7GgATdHQPPTepyO4QbvbSKRD/ycij7dLM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LdVSLkC2; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LdVSLkC2"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 26D431F00893;
	Tue, 13 Oct 2026 13:10:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791897033;
	bh=ITwdmzDGS7U2/Sp2C/TIMsZAR/IxEOocADTnjz+EQgs=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=LdVSLkC24B3csjftw59TybUC6+VutrcHS9mNu24Gupog23m5u9EejinBkrrFZQIWI
	 q7jcUWLpIcBGpJAVMNHfMM1N1dKCWh4bzy6kOtcH8sGhXNMM7k6IbP4qPKIRZFXfeJ
	 WjoRVldtbk45PVNYdfEUNoolZl8fMCK0xharIvQ2YzDSlpsR/a+2XAo11RJbEOCh/8
	 PzVkmVvYn3QMM/j/quK08Lz/lvNqEbZzEZPh4U78RjGb/jqnrYsdSCl/6M9IVVYNs9
	 oWwN45m/fgowWEsvLES9CZ6+bDrjaBqyUH81jLak9rgOrXD037gu/2pWJDBNvYRnKb
	 gbL0CH2Zc0xKg==
Message-ID: <sashiko-outbox-169777@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 4/6] hwmon: sparx5: add LAN969x PWM support
Reply-To: sashiko-reviews@lists.linux.dev
To: "Robert Marko" <robert.marko@sartura.hr>, linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org
Cc: robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261013125735.1542349-4-robert.marko@sartura.hr>
References: <20261013125735.1542349-1-robert.marko@sartura.hr>
 <20261013125735.1542349-4-robert.marko@sartura.hr>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 13 Oct 2026 13:10:32 +0000
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] hwmon: redundant custom lock violates subsystem locking guidelines
--

commit 28a1c23dcff1b1ead30305d4b8a45894536ca4ec
Author: Robert Marko <robert.marko@sartura.hr>

    hwmon: sparx5: add LAN969x PWM support

This commit adds PWM support for the LAN969x fan controller, exposing pwm1
and pwm1_freq attributes. It implements a custom mutex to serialize fan
controller register access and parses standard PWM specifier properties from
the device tree to configure the hardware.

> diff --git a/drivers/hwmon/sparx5-temp.c b/drivers/hwmon/sparx5-temp.c
> index 922c3c33a049a..5130140e1b579 100644
> --- a/drivers/hwmon/sparx5-temp.c
> +++ b/drivers/hwmon/sparx5-temp.c
> @@ -41,8 +48,11 @@ struct s5_hwmon {
>  	void __iomem *base;
>  	void __iomem *fan;
>  	struct clk *clk;
> +	struct mutex lock; /* protects fan controller state and registers */

[Severity: Low]
Is this custom mutex necessary?

The hwmon subsystem core already serializes sysfs operations for attributes
registered with the info parameter of devm_hwmon_device_register_with_info()
via its own internal locking in hwmon_attr_show() and hwmon_attr_store().

If follow-up patches in the series introduce a thermal cooling device that
requires serialization against sysfs, the hwmon architectural guidelines
explicitly mandate using the hwmon_lock() and hwmon_unlock() API instead of
a private mutex.

Could this private lock be replaced with the hwmon core locking to avoid
violating the subsystem's API contract?

[ ... ]

> +static int s5_write_pwm_freq(struct s5_hwmon *hwmon, long val)
> +{
> +	unsigned long rate, divider;
> +	u32 data;
> +
> +	if (val <=3D 0)
> +		return -EINVAL;
> +
> +	rate =3D DIV_ROUND_CLOSEST(hwmon->clk_rate, FAN_PWM_FREQ_SCALE);
> +	if (val < DIV_ROUND_CLOSEST(rate, FIELD_MAX(FAN_PWM_FREQ_DIV)) ||
> +	    val > rate)
> +		return -ERANGE;
> +
> +	divider =3D DIV_ROUND_CLOSEST(rate, val);
> +	divider =3D min_t(unsigned long, divider, FIELD_MAX(FAN_PWM_FREQ_DIV));
> +
> +	mutex_lock(&hwmon->lock);

[Severity: Low]
Since s5_write_pwm_freq() is invoked via sysfs for an info-registered
attribute, the execution is already serialized by the hwmon core. There is
also no concurrency during probe() for this driver.

Does taking hwmon->lock here add redundant locking complexity that can be
safely removed?

> +	data =3D readl_relaxed(hwmon->fan + FAN_PWM_FREQ);
> +	data &=3D ~FAN_PWM_FREQ_DIV;
> +	data |=3D FIELD_PREP(FAN_PWM_FREQ_DIV, divider);
> +	writel_relaxed(data, hwmon->fan + FAN_PWM_FREQ);
> +	mutex_unlock(&hwmon->lock);
> +
> +	return 0;
> +}

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261013125735.1542=
349-1-robert.marko@sartura.hr?part=3D4
