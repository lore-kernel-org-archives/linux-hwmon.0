Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795765975;
	b=Yr8E5zrGXV034jfx3rFqtEqYmG3mTEf4w3hrTtbcOXnv7VH7PXlDllTGtT1SZ7I5ee9r
	 zzAaCp/D5ZKwcmTf1Z/PaSAPkspMzmBODiEp8RWRICq78ZP9Jl+rN9v0lOlXiscJc3dXm
	 nyvacbu/TfMf9KLUIkfGtqjHfEe1GyKvP4NdfmrRFC6kTE4e8VrIxuLbkiV0Utz2ZLRgq
	 utx6wNOvzUazcloa98dm5xY+G8zCKKvaBtwuowPu5HfN54+DvCcucoCfgoWTqW65h+2Qv
	 ajcGrjkdSYrN5gt7C+UucgoHP0cp2Uog740EBEX3Vl2Cl6dgAjqg2GEmI5GyZbcVxbQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795765975;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=7vgDQdHRnns5sjGa1EK8We7TrQkF8nJPoseR5zcXyok=;
	b=Y5OBvGurt0rXjRvfLfJ571sNPpZqLBB0RZB4XWj+9R8UQsLHEnC5UXfUXGXRq/9SQJeh
	 kOEQ+lelyK+/h/IpUr8Q0HEjkr05cbnjN2gqd5IgbV+kOoJ7lx6iFbBU6vaUilV9ydG/x
	 UCQ34HIZRFAYTYXknj5rqbebij0MW4YVAOgNJIznAUq8ffmIXGMzPWfaNLmq/Ndh0iyBv
	 N2Dd61/hEEYNpxT0m+JofgYpQ7VDsO/PlS5FXGjNDQVgYzLK9r0U5gEMyH3jgtuO/Glop
	 6DsNqGQYsncjYqdkLht7R7TiqgO7ag5Ws0L9HwHiLffYJIhoQGNCt/4bw7l4SZC2KLQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=JrHoVJXv;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0581E606A31C
	for <linux-hwmon@vger.kernel.org>; Fri, 27 Nov 2026 07:52:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=JrHoVJXv
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8950D1F00897;
	Fri, 27 Nov 2026 07:52:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795765974;
	bh=7vgDQdHRnns5sjGa1EK8We7TrQkF8nJPoseR5zcXyok=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=JrHoVJXvHMccIYAh9yCINdRS4BNI+LrDUOyKf/JrSDQiZ4d1jqTEMO+kOy6BSw4w1
	 RSKhGG/GxZ1nTQErBQHH+H+vXp/zgz/lHaROzzxWBuyStHs0FyipcvOmLSZ0cTKLJa
	 0UKozy+/26MQdHwRTf40tKdaXPMSJaePB2Amxk8KvzusIDje5nm8C5dKc2xNgOmRqj
	 Bc4fjJ+yyJ3Z2S00LGrt/z1bH036PvrQQU4V5g7jwG+uz1Uq4AeA7KKv7Nb5IgptY8
	 14KnKdMoj8Zr2VVVZ/p2Q/leAtAtTEgDqhB7k0j7ySjXsUbvhgJLlpw4y2lPpNQhAh
	 pGQmvIdBS2akA==
Message-ID: <sashiko-outbox-236839@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 3/3] platform/x86: dasharo-acpi: Add EC fan curve
 support
Reply-To: sashiko-reviews@lists.linux.dev
To: =?utf-8?b?RmlsaXAgR2/FgmHFmw==?= <filip.golas@3mdeb.com>
Cc: linux-hwmon@vger.kernel.org
In-Reply-To: <20261127074518.3244152-4-filip.golas@3mdeb.com>
References: <20261127074518.3244152-1-filip.golas@3mdeb.com>
 <20261127074518.3244152-4-filip.golas@3mdeb.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 27 Nov 2026 07:52:54 +0000
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Post: <mailto:linux-hwmon@vger.kernel.org>
List-Help: <mailto:linux-hwmon+help@vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-hwmon+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 3 potential
issues to consider:
- [High] platform/x86: dasharo-acpi: missing channels 3..24 in
  dasharo_point_attrs
- [Low] platform/x86: dasharo-acpi: unused variable ret in
  dasharo_probe()
- [Low] platform/x86: dasharo-acpi: signed overflow in
  curve_point_temp_store()
--

commit 9cf5d657df4ad48be24caa750474d3b7ec90257c
Author: Filip Go=C5=82a=C5=9B <filip.golas@3mdeb.com>

platform/x86: dasharo-acpi: Add EC fan curve support

This commit exposes the four-point EC fan curve through hwmon
pwmN_auto_pointM_temp and pwmN_auto_pointM_pwm attributes and asks the
firmware to persist the curve on shutdown.

> diff --git a/drivers/platform/x86/dasharo-acpi.c b/drivers/platform/x86/d=
asharo-acpi.c
> index 85f88b11fcf98..c0b65f5e4146f 100644
> --- a/drivers/platform/x86/dasharo-acpi.c
> +++ b/drivers/platform/x86/dasharo-acpi.c
[ ... ]
> @@ -407,6 +409,197 @@ static const struct hwmon_chip_info dasharo_hwmon_c=
hip_info =3D {
[ ... ]
> +static ssize_t curve_point_temp_store(struct device *dev, struct device_=
attribute *attr,
> +				      const char *buf, size_t count)
> +{
> +	struct sensor_device_attribute_2 *sattr =3D to_sensor_dev_attr_2(attr);
> +	struct dasharo_data *data =3D dev_get_drvdata(dev);
> +	long val;
> +	int err;
> +
> +	err =3D kstrtol(buf, 10, &val);
> +	if (err)
> +		return err;
> +
> +	if (val < 0)
> +		return -EINVAL;
> +
> +	val =3D DIV_ROUND_CLOSEST(val, MILLIDEGREE_PER_DEGREE);
> +	if (val > U8_MAX)
> +		return -EINVAL;

[Severity: Low]
Can DIV_ROUND_CLOSEST(val, MILLIDEGREE_PER_DEGREE) overflow signed long
when val is within 499 of LONG_MAX?  Adding 500 wraps val to a negative
number that bypasses the val > U8_MAX check and is sign-extended to u64
when passed to dasharo_curve_point_store().

[ ... ]

> +DASHARO_POINT_ATTRS(1);
> +DASHARO_POINT_ATTRS(2);
> +DASHARO_POINT_ATTRS(3);
[ ... ]
> +DASHARO_POINT_ATTRS(24);
> +
> +static struct attribute *dasharo_point_attrs[] =3D {
> +	DASHARO_CHANNEL_PTRS(1),
> +	DASHARO_CHANNEL_PTRS(2),
> +	NULL
> +};

[Severity: High]
As reported by Micha=C5=82 Kope=C4=87 on v2 [1], should dasharo_point_attrs=
[] also
include DASHARO_CHANNEL_PTRS(3) through DASHARO_CHANNEL_PTRS(24)?
Omitting them leaves the static attribute structs for channels 3..24
unreferenced, triggering 176 -Wunused-variable warnings (breaking
CONFIG_WERROR=3Dy builds) and leaving channels 3..24 without curve point
sysfs attributes.

[ ... ]

> @@ -437,21 +630,33 @@ static int dasharo_probe(struct platform_device *pd=
ev)
>  {
>  	struct dasharo_data *data;
>  	struct device *hwmon;
> +	int ret;

[Severity: Low]
Is ret unused in dasharo_probe(), causing a -Wunused-variable warning?

[1] https://lore.kernel.org/r/20261126165506.2793034-1-michal.kopec@3mdeb.c=
om

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261127074518.3244=
152-1-filip.golas@3mdeb.com?part=3D3
