Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81C4D18DB35
	for <linux-hwmon@vger.kernel.org>; Tue,  8 Sep 2026 02:03:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788833021; cv=none; b=il/q4T9vfQyfhfEQOpNI4j2K1rgWE5/or7+Kk2f3a6zzZI6X5apwEF9bLIks5YfMiD9bMVOnKwgpmTlFsjIlftb7UXwHElBqvExI5wfE2ymKR5jPQUkS3ncusVj+rxm5Nn/nIsY+9kp3oPuYI+IvSfs777G2WVy70gWBfJaPsqM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788833021; c=relaxed/simple;
	bh=rLihSZtIb35h1sUKgpt1wYy4e8+lr2xCXyQ3qzXvw5M=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=PoOC9UTS3UUBH+WMVfRrdJdobex0j3y61c0IrjCs/KFt5TjIY4t3O/PkIp0w+io8WT/CN7x9UsuJ4X4QSvQVSukJ19fRnSNeTO092qX4ilOSoMHgdMo8fj64agHoOLm938ttJyfFAHl+FRYMm+XoIY1dpbT1OtlfZap0ZxV4s7c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=EFKHSIZ+; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="EFKHSIZ+"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F16FC1F00A3A;
	Tue,  8 Sep 2026 02:03:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788833020;
	bh=YScMUHIcvkafQAgE143H4NHQv1iW6llVq2IV2mo/L9s=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=EFKHSIZ+7ytvMWRlGDrX42sC5+q50NTZGLlQBdiPbZiNBDYdrGWQ+FhUmxNOxb4k5
	 11pxP6ZC4Jyz+7MdqdY0dsymVh8nWIR8fFxDg2dbVVtODd/ySyHtC+7PklqUb9M+af
	 w/LOmx168Kqen2ILgTggMXuIeC/Od/gfEYQCAhizJy+d7naCXSsk1pDUeLGmRFEnyg
	 jS8XTuJkbaoPA77Yu/2jVQIvm5rNk/UZD0JgC0k2WubS4w+vF4ZCMyaDYY8C2/5ak1
	 QeMg384nxDFDiJa9v8RN2nOJfe5cc5B8BF6H3psfArHQB3ytLWba2cR/7G5swoCVIv
	 MRACy/x0DxmFA==
From: sashiko-bot@kernel.org
Subject: Re: [RFC PATCH 1/2] platform: arm64: qcom-hamoa-ec: monitor Slim 7x
 legacy sensors
Reply-To: sashiko-reviews@lists.linux.dev
To: "Birk Skyum" <birk.skyum@pm.me>
Cc: linux-hwmon@vger.kernel.org
In-Reply-To: <20260908015650.84401-2-birk.skyum@pm.me>
References: <20260908015650.84401-1-birk.skyum@pm.me>
 <20260908015650.84401-2-birk.skyum@pm.me>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 08 Sep 2026 02:03:39 +0000
Message-Id: <20260908020339.F16FC1F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] Hardware monitoring functionality is registered directly from a pla=
tform driver outside of the drivers/hwmon/ directory.
--

commit 763b40f1f55a5efec49b9919dd06a1242c3e47c2
Author: Birk Skyum <birk.skyum@pm.me>

platform: arm64: qcom-hamoa-ec: monitor Slim 7x legacy sensors

This commit adds read-only fan speed and thermistor monitoring for the
Lenovo Yoga Slim 7x embedded controller using a legacy interface.

Link: https://github.com/aarch64-laptops/build/blob/2e58842f5fa2f87771c2df0=
17ae4d8c65225ef10/misc/lenovo-yoga-slim-7x/acpi/dsdt.dsl
Link: https://lkml.iu.edu/hypermail/linux/kernel/2607.3/08806.html

> diff --git a/drivers/platform/arm64/qcom-hamoa-ec.c b/drivers/platform/ar=
m64/qcom-hamoa-ec.c
> index 4d2ad042a7f84..3a4ca8a0de5c8 100644
> --- a/drivers/platform/arm64/qcom-hamoa-ec.c
> +++ b/drivers/platform/arm64/qcom-hamoa-ec.c

[ ... ]

> +static int qcom_ec_hwmon_probe(struct qcom_ec *ec)
> +{
> +	struct device *dev =3D &ec->client->dev;
> +	struct device *hwmon;
> +	long rpm;
> +	int ret;
> +
> +	if (!i2c_check_functionality(ec->client->adapter,
> +				     I2C_FUNC_I2C | I2C_FUNC_SMBUS_READ_BYTE_DATA))
> +		return -EOPNOTSUPP;
> +
> +	ret =3D qcom_ec_read_fan_rpm(ec, &rpm);
> +	if (ret)
> +		return dev_err_probe(dev, ret, "Failed to read fan RPM\n");
> +
> +	hwmon =3D devm_hwmon_device_register_with_info(dev, "qcom_ec", ec,
> +						     &qcom_ec_hwmon_chip_info, NULL);

[Severity: Low]
Does this violate the hardware monitoring subsystem layering rules by
registering a hwmon device directly from drivers/platform/arm64/ within
qcom_ec_hwmon_probe?

Since the main functionality of this EC chip is not hardware monitoring,
should the hwmon functionality be implemented as an auxiliary device driver
residing in drivers/hwmon/ to avoid bypassing maintainer review and
increasing driver complexity?

> +	return PTR_ERR_OR_ZERO(hwmon);
> +}

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260908015650.8440=
1-1-birk.skyum@pm.me?part=3D1
