Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2BEE5418A30
	for <linux-hwmon@vger.kernel.org>; Tue, 28 Jul 2026 10:24:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785234242; cv=none; b=meSJkbONVPOIxEES7RtcGzUiPWUBptZXVTKRIyeiZMFC/gnouRVmNb6yEnCnw6wqPlWwPEnJeWQxty29B7u3Dg9fguTwVilHye4Xaqq+U+aW+gG3Ui9+PiIgA/0s8ikbCVYjtqMGuw7zTULAiBRk7uVF5xTg3aDVTNkqTlUo1Lk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785234242; c=relaxed/simple;
	bh=4c08QpXCPntru7YP5RXuIGDjL/AM/TouUo3k5CKmnTE=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=CSe2+e2UK998N2b1v/SKxdgDbZLpaVPIoZ2ZcyHBDpWTs3jfJfkzwHsUbTw0Y6HXSMNQKUQaFqUFv9XKgCgA2dg6w8zfdp2V+rww3sshS8cN4Vo9l8gjIAsMISVM9oIoq/nt3WrFQ1dsrFouKGrUBBDgtBwfZ6EKjmmuVfIRWME=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Bl0yEEVm; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Bl0yEEVm"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A9DB01F000E9;
	Tue, 28 Jul 2026 10:24:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785234240;
	bh=XV0kTWAW8Q4LaeU5yWNhdrPd5uMwvQLvX2uzgZYGlvQ=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Bl0yEEVmZ2fSfQfVP5aklCsDKJqm1K27bYmQPkKsQEP0/gT1kP00mLos2Tt9rfQVw
	 oZcRprpwaz2DEVVIptreiA7kZlNcsYXVBta22pugBNTCgXH/OFKMPwQ/lFqB1lkKv3
	 K4SImJQzZeq0KizqeCjmU4IOSPu8iODZtMoGY3FdA2Em1Wugg0LnlUlvJ73gzPwTgn
	 cyoT557N+YXhxy7xG/DOsi+3+BiJIcR5HATWKf0Mj2VnIjPDw8KN3YgPurZhfxxG7t
	 PZMg1DbWsgrCVuHjpkMK1jPMMQII1uPSMHoBsx+HEoFi0vCOOtixD++NtS5qFNCqiI
	 pLIFcbQiPnCSg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2] hwmon: (cros_ec) Handle temperature conversion
 overflows
Reply-To: sashiko-reviews@lists.linux.dev
To: =?utf-8?b?VGhvbWFzIFdlacOfc2NodWg=?= <linux@weissschuh.net>
Cc: linux-hwmon@vger.kernel.org
In-Reply-To: <20260728-cros_ec-hwmon-overflow-v2-1-d24e24d0792b@weissschuh.net>
References: <20260728-cros_ec-hwmon-overflow-v2-1-d24e24d0792b@weissschuh.net>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 28 Jul 2026 10:24:00 +0000
Message-Id: <20260728102400.A9DB01F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] Missing `else` statement causes clamped threshold values to be inc=
orrectly overwritten by the fallback calculation on 32-bit systems.
--

--- Patch [1]: [PATCH v2] hwmon: (cros_ec) Handle temperature conversion ov=
erflows ---
commit 89530e9a6ba047e5c308ed9d02243a168afc676c
Author: Thomas Wei=C3=9Fschuh <linux@weissschuh.net>

hwmon: (cros_ec) Handle temperature conversion overflows

This commit detects potential arithmetic overflows when converting between
different temperature units on 32-bit systems and aims to clamp the returned
values to avoid reporting incorrect data.

> diff --git a/drivers/hwmon/cros_ec_hwmon.c b/drivers/hwmon/cros_ec_hwmon.c
> index 1337b646e0228..004a8180b665e 100644
> --- a/drivers/hwmon/cros_ec_hwmon.c
> +++ b/drivers/hwmon/cros_ec_hwmon.c

[ ... ]

> @@ -236,8 +252,13 @@ static int cros_ec_hwmon_read(struct device *dev, en=
um hwmon_sensor_types type,
>  			ret =3D cros_ec_hwmon_read_temp_threshold(priv->cros_ec, channel,
>  								cros_ec_hwmon_attr_to_thres(attr),
>  								&threshold);
> -			if (ret =3D=3D 0)
> -				*val =3D cros_ec_hwmon_kelvin_to_millicelsius(threshold);
> +			if (ret =3D=3D 0) {
> +				if (overflows_type(threshold, long))
> +					*val =3D LONG_MAX;
> +
> +				if (cros_ec_hwmon_kelvin_to_millicelsius_overflow(threshold, val))
> +					*val =3D LONG_MAX;

[Severity: High]
Does the lack of an else statement here cause the clamped LONG_MAX value to
be overwritten?

If the threshold is a large u32 value (e.g., 0xFFFFFFFF) on a 32-bit system,
overflows_type() returns true and sets *val to LONG_MAX. However, because
there is no else clause before the next check,
cros_ec_hwmon_kelvin_to_millicelsius_overflow() is unconditionally evaluate=
d.

Since threshold is implicitly cast to long when passed into the function, t=
he
large u32 value can become a small negative number (like -1) on 32-bit
architectures. The subsequent arithmetic inside the function would not
overflow, and the out-parameter assignment overwrites the LONG_MAX in *val
with an incorrect negative value (such as -274000).

> +			}
>  		}
>  	}

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260728-cros_ec-hw=
mon-overflow-v2-1-d24e24d0792b@weissschuh.net?part=3D1
