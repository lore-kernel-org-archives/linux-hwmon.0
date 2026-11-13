Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794557156;
	b=OLxRLZA58qcv7CbdsEbSq6aMFLtgnLjv8v6LhEjZrkJwM8KWcemxSphyEYLpIi0QwJQJ
	 TbaT3iPPkaAlBLAAlfOGSWmJY8+CFw/wDVQCybz/a4O1IpfeLLVw3d2XLvQ5Jekjh7GrX
	 evLFtB/eVXKo4TS41xXFsbqPTAQICOBM0jbIJye9ogaLGx3BdQWLHeXCRiHVoprt6hY1j
	 prXozu1W0eKZ/LhdvGJr4VlwYy640R045VKzvEVFKFLtVR7wWkPfnQc+zMVDvi3qzzXCk
	 lfSMh9sOUR/zta/qiB7Ifz2pCLwS0tv9XWouhiAs+Of0mYyZEQ4BlnEJS38zq7MrwJQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794557156;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=RGIG6yJ10nbnOCvCAXvSTuWKemLmKl4OKJFXJBsgiCs=;
	b=vEBVGZK0zMysgGPuRH4GjwsNNkIy4GjYOAgb7j/G7uVElRJfmBqEPBBswtaAe/Jqem2v
	 LIja0DIsKiVqwSjdyyaswvDdj4tna38yg0LPPc0Y9f81YTP5VVOPCn5RDVK8Kug34WWUN
	 Rcl9lW5BNsMlGUdBXl5FOsZeZ/fncp/GKAYAdzNzTZtfT7n+ygXPLHrNCeefOFO8QQ/5W
	 a4Fn+Q3S0XJ3srl2gpH5cmh1uOrRWDLT41RlCiywveZCw0T8KB4hZanEiGroQbAHxsyhu
	 o5JcTvPl/lbOGKTQOBvFF4SaenagnELNjiBuTtZGD4ukK8/kY4UoeLrIaQS4kOa7dEQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=XGw2f7Jj;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7894B606A330
	for <linux-hwmon@vger.kernel.org>; Fri, 13 Nov 2026 08:05:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=XGw2f7Jj
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E84021F000C4;
	Fri, 13 Nov 2026 08:05:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794557156;
	bh=RGIG6yJ10nbnOCvCAXvSTuWKemLmKl4OKJFXJBsgiCs=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=XGw2f7JjmWgkaGH7xkpwjjELRhbEGYiOg2dyqv0hfGwtgLkrGWFjRetRfawbI6hJx
	 mNc6V1FRcOXAsTKs6t8Fkw7NvAxkZ7FdubP0/rhx5vs/XKM6VXJIXWjCqOHEVI65os
	 FAiz3+WxGhWNUlBq/qEzUtYZMON7RKayK9bsVamxnlkf6Zsm18CvkhIB6TdRChq9xv
	 WnTIIwZj+dZCI5Xau2qaEVkZLLh5E3bNpz4my6FVrLFeh6jNltCso1jhdguDqqoCvI
	 JwIiKTdpZ9xmCQBdL0X99+vMycg8gSW4/LD7iOmncZRheOuia1IEfumBY3pLrM2Sds
	 mtS/CRzgD3TSw==
Message-ID: <sashiko-outbox-212381@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 3/3] platform/x86: dasharo-acpi: Add EC fan curve
 support
Reply-To: sashiko-reviews@lists.linux.dev
To: =?utf-8?b?RmlsaXAgR2/FgmHFmw==?= <filip.golas@3mdeb.com>
Cc: linux-hwmon@vger.kernel.org
In-Reply-To: <20261113074347.2301465-4-filip.golas@3mdeb.com>
References: <20261113074347.2301465-1-filip.golas@3mdeb.com>
 <20261113074347.2301465-4-filip.golas@3mdeb.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 13 Nov 2026 08:05:55 +0000
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Post: <mailto:linux-hwmon@vger.kernel.org>
List-Help: <mailto:linux-hwmon+help@vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-hwmon+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 5 potential
issues to consider:
- [Medium] platform/x86: dasharo-acpi: hardcoded channel 0 in
  dasharo_shutdown()
- [Medium] platform/x86: dasharo-acpi: unlocked update in
  dasharo_curve_point_store()
- [Medium] platform/x86: dasharo-acpi: 64-bit division in
  curve_point_pwm_show()
- [Low] platform/x86: dasharo-acpi: non-static attributes in
  DASHARO_POINT_ATTRS()
- [Low] platform/x86: dasharo-acpi: negative truncation in
  curve_point_temp_store()
--

commit b06965f45c7d7bc48a913eab6b04251f21b0daf9
Author: Filip Go=C5=82a=C5=9B <filip.golas@3mdeb.com>

platform/x86: dasharo-acpi: Add EC fan curve support

This commit exposes the four-point EC fan curve through hwmon
pwmN_auto_pointM_temp and pwmN_auto_pointM_pwm sysfs attributes and
persists the curve to firmware on shutdown.

> diff --git a/drivers/platform/x86/dasharo-acpi.c b/drivers/platform/x86/d=
asharo-acpi.c
> index 29afcf78564c5..7b21577158cb7 100644
> --- a/drivers/platform/x86/dasharo-acpi.c
> +++ b/drivers/platform/x86/dasharo-acpi.c
[ ... ]
> @@ -378,6 +380,150 @@ static const struct hwmon_chip_info dasharo_hwmon_c=
hip_info =3D {
>  	.info =3D dasharo_hwmon_info,
>  };
> =20
> +static int dasharo_curve_point_store(struct dasharo_data *data, int chan=
nel, const char *method,
> +				     unsigned int point, u64 value)
> +{
> +	u64 args[2] =3D { point, value };
> +	u64 ret;
> +	int err;
> +
> +	// set of temp/duty
> +	err =3D dasharo_call(data, method, DASHARO_FEATURE_FAN_POINTS, channel,=
 args, 2, &ret);
> +	if (err)
> +		return err;
> +	if (ret)
> +		return -EPERM;
> +
> +	// commit
> +	err =3D dasharo_call(data, "CFCV", DASHARO_FEATURE_FAN_POINTS, channel,=
 NULL, 0, &ret);
> +	if (err)
> +		return err;
> +
> +	// The EC rejected the curve
> +	return ret ? -EINVAL : 0;
> +}

[Severity: Medium]
Can concurrent sysfs accesses race across the two-step stage and commit in
dasharo_curve_point_store()?

Attributes in dasharo_groups are registered via extra_groups, so the hwmon
core does not take hwdev->lock around their show and store callbacks, and
kernfs only serializes writes per open file description.  Two writers to
different curve attributes on the same fan channel can interleave between
the stage call (SFPT/SFPD) and the commit call (CFCV):

CPU0                                    CPU1
curve_point_temp_store()
  dasharo_curve_point_store()
    dasharo_call(..., "SFPT", ...)
                                        curve_point_pwm_store()
                                          dasharo_curve_point_store()
                                            dasharo_call(..., "SFPD", ...)
    dasharo_call(..., "CFCV", ...)  <-- commits both or fails on CPU1's sta=
ge

A valid update can fail with -EINVAL because of another writer's staged
point, an invalid update can be overwritten and falsely succeed, or a
concurrent reader (GFPT/GFPD) can observe uncommitted values.  Taking
hwmon_lock(dev) around the curve callbacks would serialize these accesses.

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
> +	val /=3D MILLIDEGREE_PER_DEGREE;
> +	if (val < 0 || val > U8_MAX)
> +		return -EINVAL;

[Severity: Low]
Does dividing val by MILLIDEGREE_PER_DEGREE before checking val < 0 allow
negative inputs in [-999, -1] to pass as 0?  Integer division truncates
those negative millidegree values toward zero before the range check,
silently setting the point to 0 C instead of returning -EINVAL.

> +
> +	err =3D dasharo_curve_point_store(data, sattr->nr, "SFPT", sattr->index=
, val);
> +	return err ?: count;
> +}
> +
> +static ssize_t curve_point_pwm_show(struct device *dev, struct device_at=
tribute *attr, char *buf)
> +{
> +	struct sensor_device_attribute_2 *sattr =3D to_sensor_dev_attr_2(attr);
> +	struct dasharo_data *data =3D dev_get_drvdata(dev);
> +	u64 point =3D sattr->index;
> +	u64 val;
> +	int err;
> +
> +	err =3D dasharo_call(data, "GFPD", DASHARO_FEATURE_FAN_POINTS, sattr->n=
r, &point, 1, &val);
> +	if (err)
> +		return err;
> +
> +	return sysfs_emit(buf, "%llu\n", DIV_ROUND_CLOSEST(val * 255, 100));
> +}

[Severity: Medium]
Does DIV_ROUND_CLOSEST(val * 255, 100) fail to link on 32-bit x86 builds?
Because val is u64, DIV_ROUND_CLOSEST() performs a 64-bit unsigned division
using /, which emits an undefined reference to __udivdi3 on CONFIG_X86_32.
Using DIV_ROUND_CLOSEST_ULL() avoids the 64-bit / operator.

[ ... ]

> +#define DASHARO_POINT_ATTRS(ch, pt) \
> +	SENSOR_DEVICE_ATTR_2_RW(pwm##ch##_auto_point##pt##_temp, curve_point_te=
mp, \
> +				(ch) - 1, (pt) - 1); \
> +	SENSOR_DEVICE_ATTR_2_RW(pwm##ch##_auto_point##pt##_pwm, curve_point_pwm=
, \
> +				ch - 1, pt - 1)
> +
> +#define DASHARO_POINT_ATTR_PTRS(ch, pt) \
> +	&sensor_dev_attr_pwm##ch##_auto_point##pt##_temp.dev_attr.attr, \
> +	&sensor_dev_attr_pwm##ch##_auto_point##pt##_pwm.dev_attr.attr
> +
> +DASHARO_POINT_ATTRS(1, 1);
> +DASHARO_POINT_ATTRS(1, 2);
> +DASHARO_POINT_ATTRS(1, 3);
> +DASHARO_POINT_ATTRS(1, 4);
> +DASHARO_POINT_ATTRS(2, 1);
> +DASHARO_POINT_ATTRS(2, 2);
> +DASHARO_POINT_ATTRS(2, 3);
> +DASHARO_POINT_ATTRS(2, 4);

[Severity: Low]
Should the SENSOR_DEVICE_ATTR_2_RW() definitions in DASHARO_POINT_ATTRS()
be static?  SENSOR_DEVICE_ATTR_2_RW() does not include static, so expanding
DASHARO_POINT_ATTRS() at file scope exports 16 sensor_dev_attr_pwm*
symbols into the global namespace and triggers sparse and W=3D1
-Wmissing-variable-declarations warnings.

[ ... ]

> @@ -413,16 +559,27 @@ static int dasharo_probe(struct platform_device *pd=
ev)
[ ... ]
> +static void dasharo_shutdown(struct platform_device *pdev)
> +{
> +	struct dasharo_data *data =3D platform_get_drvdata(pdev);
> +	u64 ret;
> +
> +	/* Let the firmware persist the fan curve the EC runs */
> +	if (data->caps_found[DASHARO_FEATURE_FAN_POINTS])
> +		dasharo_call(data, "SFCS", DASHARO_FEATURE_FAN_POINTS, 0, NULL, 0, &re=
t);
> +}

[Severity: Medium]
Does dasharo_shutdown() leave fan curves on other channels unsaved when
more than one fan supports DASHARO_FEATURE_FAN_POINTS?

dasharo_call() passes data->capabilities[feat][channel].group and .index as
the first two ACPI arguments:

drivers/platform/x86/dasharo-acpi.c:dasharo_call() {
    ...
	obj[0].type =3D ACPI_TYPE_INTEGER;
	obj[0].integer.value =3D data->capabilities[feat][channel].group;
	obj[1].type =3D ACPI_TYPE_INTEGER;
	obj[1].integer.value =3D data->capabilities[feat][channel].index;
    ...
}

Because dasharo_shutdown() only calls SFCS for channel 0 instead of
iterating up to data->caps_found[DASHARO_FEATURE_FAN_POINTS], any curve
changes on pwm2 (channel 1) are not persisted on shutdown.  (Or if SFCS in
firmware is a global 0-argument method, calling it through dasharo_call()
passes two unexpected arguments.)

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261113074347.2301=
465-1-filip.golas@3mdeb.com?part=3D3
