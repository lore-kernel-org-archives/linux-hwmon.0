Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F8212C0261
	for <linux-hwmon@vger.kernel.org>; Tue, 30 Jun 2026 21:11:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782853881; cv=none; b=eaOocBB1NPpCHlAKXvT+CGropFycatMyYDwucTx4Td63D52HHhJ2/pXlE9qfkPcwjJRgQPaRZoIh+DjFHwmf9QukunCzwrVsOTvcMZYhANZ3fKScLRsUp4kmo4ndLjzPYdX7aNicfrxRaM1m33FFVWzcrklP2+YYvI9Q+ANXdNY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782853881; c=relaxed/simple;
	bh=CRY/CxK5Fxa5GwqfNQiL8L1/nX9GlVmodtyr2KvkbCg=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=HRlE6heKJfeQv67tBWR9BdXtoHHf0RoI9c7QOwbk8AR/evAP7i4ZuT8VZGn5+wu97+RjSo+rMWpE0TWkgERjTIq96HJ0QCgWn3PMe6c1imAlL3LcLMRAwgRFC7KSGOgQYlcvCRhrxO/jq2jRfueYMMF5w2q/iduCRFftPG0lL7c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=E9Z7Bftb; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="E9Z7Bftb"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 063A81F00A3A;
	Tue, 30 Jun 2026 21:11:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782853880;
	bh=+cRmkLtfnUu8NDQaa3n5S5C7SW32Q3ezq+WFtMDRrDo=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=E9Z7BftbINdVuf29anCDaCb7vWLylDwYdLTOWYf7VKej8iNpoChoCaCxkUykgE3QP
	 kNDnQwdsB0qU4Zroh5WyP54rNO3CRPswpKLrF7WYOSuZORev8S2OByNYvAfZEIRL7+
	 Ypl6waMtE9GmMeFztx3brO4rQ7XMKMzEd+//fyEFgTBUaVMi3YIg9sdIjTtyLOFiDD
	 H9ByH8ATpKDPUlsDdhO/khB9bDalxvcEXYPlklNQnOfVMNwk8znCO+PCSaqcBV4FH5
	 ACzqcYD0IqzBz+HpC17jafCKr2Jzr88VDBnaJqyBl4bBEr0hn7nG5nk1TS2KJ+oJIw
	 QRkfh0PF1cNYA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 1/2] hwmon: (cros_ec) Implement custom kelvin to celsius
 conversions
Reply-To: sashiko-reviews@lists.linux.dev
To: =?utf-8?b?VGhvbWFzIFdlacOfc2NodWg=?= <linux@weissschuh.net>
Cc: linux-hwmon@vger.kernel.org
In-Reply-To: <20260630-cros_ec-hwmon-overflow-v1-1-3d2ecd3eb0f2@weissschuh.net>
References: <20260630-cros_ec-hwmon-overflow-v1-0-3d2ecd3eb0f2@weissschuh.net>
 <20260630-cros_ec-hwmon-overflow-v1-1-3d2ecd3eb0f2@weissschuh.net>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 30 Jun 2026 21:11:19 +0000
Message-Id: <20260630211120.063A81F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:

Pre-existing issues:
- [High] Missing hwmon core serialization in thermal cooling device callbac=
ks, causing potential race conditions.
--

commit ee3fdfc1d667eaecb682b673010b74478f9bb80e
Author: Thomas Wei=C3=9Fschuh <linux@weissschuh.net>

hwmon: (cros_ec) Implement custom kelvin to celsius conversions

The ChromeOS EC APIs use integers representing degrees kelvin for
temperatures. This commit implements a custom conversion which
preserves round values.

> diff --git a/drivers/hwmon/cros_ec_hwmon.c b/drivers/hwmon/cros_ec_hwmon.c
> index ea24056ae6467..44291799dd8e4 100644
> --- a/drivers/hwmon/cros_ec_hwmon.c
> +++ b/drivers/hwmon/cros_ec_hwmon.c

[ ... ]

> @@ -228,7 +236,7 @@ static int cros_ec_hwmon_read(struct device *dev, enu=
m hwmon_sensor_types type,
>  								cros_ec_hwmon_attr_to_thres(attr),
>  								&threshold);
>  			if (ret =3D=3D 0)
> -				*val =3D kelvin_to_millicelsius(threshold);
> +				*val =3D cros_ec_hwmon_kelvin_to_millicelsius(threshold);
>  		}
>  	}
> =20

While reviewing this driver, I noticed the following in the same file:

> static int cros_ec_hwmon_cooling_set_cur_state(struct thermal_cooling_dev=
ice *cdev,
> 					       unsigned long val)
> {
> 	const struct cros_ec_hwmon_cooling_priv *priv =3D cdev->devdata;
>=20
> 	return cros_ec_hwmon_write_pwm_input(priv->hwmon_priv->cros_ec, priv->in=
dex, val);
> }

[Severity: High]
This is a pre-existing issue, but does this cooling device callback need to
take the hwmon lock to prevent race conditions?

The thermal subsystem calls cros_ec_hwmon_cooling_set_cur_state()
asynchronously, which bypasses the hwmon core serialization.

Looking at cros_ec_hwmon_write_pwm_input(), it performs a read-modify-write
sequence on the EC PWM state:

cros_ec_hwmon_write_pwm_input()
    cros_ec_hwmon_read_pwm_enable(cros_ec, index, &control_method);
    if (control_method !=3D 1)=20
        return -EOPNOTSUPP;
    cros_ec_hwmon_set_fan_pwm_val(cros_ec, index, val);

Can this race with a concurrent sysfs write modifying the fan PWM, leading
to an incorrect fan control state?=20

The hardware monitoring subsystem guidelines require drivers to use
hwmon_lock() and hwmon_unlock() for attributes registered outside the core
info parameter, such as these thermal cooling state callbacks.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260630-cros_ec-hw=
mon-overflow-v1-0-3d2ecd3eb0f2@weissschuh.net?part=3D1
