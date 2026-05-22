Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCF96362153;
	Fri, 22 May 2026 09:24:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779441895; cv=none; b=YElFW3N/q5vsttp25V/KS+6cpaJDOz2HiHYCS8Uq/hD/y0iO7VHhEer6g4NZbItObsNYw/pEKJd/EjONsE76zz0KZX5KGrPpl/NNlM7M7vIO8rTwiJAsB5euEik4S8px6LfMeJyYQ/UMRC6GSeM+iJF5sr3BJtytUriuj8goS7o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779441895; c=relaxed/simple;
	bh=GLmIHREC5Dq+6M1YcXCln4a9f7hLA0XBNNOCd7+TsA0=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=opWeL19kQ8+3McYnxs7CSF35kGlbIlKuvNk9wm8bZuMd/3Ezg+yfXLFD5OAFeO+mJTMn01/KsXSoLMGk3ilDJzJDOyxptk78FvFgFxiuAh/uKlvDgBxwCfgVO0var3E6lJs6ZWT25Op58X5ySViLk2hhED61I0k3cvwM7l8dYJc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=akejbH0K; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="akejbH0K"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7927B1F00A3F;
	Fri, 22 May 2026 09:24:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779441893;
	bh=nohLK0VMBgP7+6fSfYtReDo1NflPHBuIg76Lw1XUEdE=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=akejbH0KCDwl3fZQBvDFDv4N2jwuTUjaYScWMlaSHE4OYrQSTeptkTI1ezOw65X8O
	 9pbgOIvuDPk1ry66FRGW/CiVSAQIQakO/jJ69kR7+2WY4N9iIemdQpX6GkqJRODJTH
	 AzAb+9OvMDhb+ZlWyPpspJFeLMr9KKcpOZ5ETPQtwMgKQR+NcRK/YhtBhmqPKCJmZj
	 Mt3Et5uqgZmkLn/rFRV2nj6KBix0Z9SngK97HAlIMbVWQrn31He7dAD4cKdXmyTpRa
	 FfYG6SHxGOLhawB70KSRfRmmi57CVJJIhPY2RjIijLTFImwXFR4pRF9zMHSzbzQL/V
	 qbUaog+rZurow==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 3/4] dt-bindings: hwmon: pmbus/tps25990: Add TPS1689
Reply-To: sashiko-reviews@lists.linux.dev
To: "Stoyan Bogdanov" <sbogdanov@baylibre.com>
Cc: conor+dt@kernel.org, robh@kernel.org, devicetree@vger.kernel.org, linux-hwmon@vger.kernel.org
In-Reply-To: <20260522082349.2749970-4-sbogdanov@baylibre.com>
References: <20260522082349.2749970-4-sbogdanov@baylibre.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 22 May 2026 09:24:52 +0000
Message-Id: <20260522092453.7927B1F00A3F@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Critical] The driver incorrectly uses `i2c_get_clientdata()` to retrieve=
 the `pmbus_driver_info` pointer, resulting in a type mismatch and out-of-b=
ounds memory access.
--

commit 11131ea034ce953233470df60e4f6a1c34cca609
Author: Stoyan Bogdanov <sbogdanov@baylibre.com>

hwmon: (pmbus/tps25990): Rework TPS25990 direct conversion handling

Rework the existing implementation of direct format conversion for TPS25990
non-standard parameters to improve code reusability. It introduces structur=
es
for per-device coefficients and uses generic PMBus conversion helpers.

> diff --git a/drivers/hwmon/pmbus/tps25990.c b/drivers/hwmon/pmbus/tps2599=
0.c
> index 05c6288ecafcc..1e252844217b8 100644
> --- a/drivers/hwmon/pmbus/tps25990.c
> +++ b/drivers/hwmon/pmbus/tps25990.c

[ ... ]

> @@ -36,17 +36,63 @@
>  #define  TPS25990_UNLOCKED		BIT(7)
> =20
>  #define TPS25990_8B_SHIFT		2

[ ... ]

> +struct tps25990_data {
> +	struct pmbus_driver_info info;
> +	struct tps25990_local_direct_value info_local;
> +};
> +
> +static s64 tps25990_reg2data_direct(struct i2c_client *client, int param=
, s32 raw)
> +{
> +	struct pmbus_driver_info *info =3D i2c_get_clientdata(client);
> +	struct tps25990_data *data =3D container_of(info, struct tps25990_data,=
 info);

[Severity: Critical]
Does this code correctly retrieve the pmbus_driver_info pointer?

In pmbus_core.c, pmbus_do_probe() sets the I2C client data to a newly
allocated struct pmbus_data object, not struct pmbus_driver_info.

Because info is the first member of struct tps25990_data, container_of()
evaluates to the same pointer, causing the driver to mistakenly interpret t=
he
pmbus_data object as a tps25990_data object.

When accessing the info_local member, it reads from an offset, yielding gar=
bage
values for the calculation constants m, b, and R. If the garbage m value
happens to be zero, reading sensors via sysfs could cause a divide-by-zero
kernel panic in pmbus_reg2data_direct_calc().

Should this use pmbus_get_driver_info(client) instead of i2c_get_clientdata=
()?

> +	struct tps25990_local_direct_value *info_local =3D &data->info_local;
> +	s64 b, val;
> +	s32 m, R;
> +
> +	val =3D (s16)raw;
> +	m =3D info_local->m[param];
> +	b =3D info_local->b[param];
> +	R =3D info_local->R[param];
> +
> +	return pmbus_reg2data_direct_calc(val, b, m, R);
> +}
> +
> +static u16 tps25990_data2reg_direct(struct i2c_client *client, int param=
, s64 val)
> +{
> +	struct pmbus_driver_info *info =3D i2c_get_clientdata(client);
> +	struct tps25990_data *data =3D container_of(info, struct tps25990_data,=
 info);

[Severity: Critical]
Does this face the same type mismatch regression?

Since the I2C client data points to a struct pmbus_data, using
i2c_get_clientdata() here will also misinterpret the object and result in
out-of-bounds memory access when reading info_local.

Could this be updated to use pmbus_get_driver_info(client) as well?

> +	struct tps25990_local_direct_value *info_local =3D &data->info_local;
> +	s32 m, R;
> +	s64 b;
> +
> +	m =3D info_local->m[param];
> +	b =3D info_local->b[param];
> +	R =3D info_local->R[param];
> +
> +	return pmbus_data2reg_direct_calc(val, b, m, R);
> +}

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260522082349.2749=
970-1-sbogdanov@baylibre.com?part=3D3
