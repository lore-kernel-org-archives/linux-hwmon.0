Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6915A2EEE94;
	Fri,  5 Jun 2026 06:41:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780641679; cv=none; b=nFXodsJiMh8mcOmzRHg7LDgoOWbD/IIDyYgusqYlpRnCTbfc+S6J3wjDYGPDhmbOHLiQPguQKKGiGBglC/q2t3N6TaJbcAJWGMpK2rG1LVmb2YJ53dB3QVhvFmXRpQms8keSn2v6DweQcDWxVZIQRlbeN9VBgfns10vQzp9aB5o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780641679; c=relaxed/simple;
	bh=uR8m2yLwYEWQ1SbuKy0/li2AhC9n3f4vozlm5rWOwLs=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=Fsh2le8ZzpLC6UIV3Ew4Wcp3X8QhVcgSYRfq6UzOZv8PgAqxI06xdlK81v2atzdJhelz4fXBjqrz2WxWvOCPbU09BjYGQv86vf1uca52UYGcjXL/UtxTr1WLNIoC4tsQS36l0G5pGP58K1da7bagxtlPDQez/MnQeGVXK0TogVI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=B/Afc4cj; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="B/Afc4cj"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B7BD31F00893;
	Fri,  5 Jun 2026 06:41:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780641678;
	bh=ud3k7fZU9XfEFQU9vT/+h49lwVNX//F+OZPEFdeaMwI=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=B/Afc4cjleMcdoIUAiXR2NHXX57phBVPl/YuhSehXvFSxUMQuZo7zK53Npp1nR6Tq
	 RPgZuau/frF9Frj8h0WXfKW/zgGyBNHzkD6UIcleAB75mHGdCAjLSb9IZYsXuU2UoN
	 W+Mjd+8qRtM3x7IzK4d7cyRYfVowiBPY/GBhYqGSvthuiO2en91BBFKhEvH3nKxg3o
	 lE2PiTNrxjNIPCw0Vg87Xf5GJ9trs3F7/sU0eRWbx5EXJYvL95lE8TKgCat7XVJ94+
	 78p77CCQFUtUPiFgReLNQgJuoDWuxSndWPd7bmMvjPrT9lZo5GOL0ojlizw59CTGwg
	 uZlc9MYpoSxyg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 2/3] hwmon: pmbus: Add support for Silergy SQ24860
Reply-To: sashiko-reviews@lists.linux.dev
To: "Ziming Zhu" <zmzhu0630@163.com>
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, linux-hwmon@vger.kernel.org, robh@kernel.org
In-Reply-To: <20260605063042.91776-3-zmzhu0630@163.com>
References: <20260605063042.91776-3-zmzhu0630@163.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 05 Jun 2026 06:41:17 +0000
Message-Id: <20260605064117.B7BD31F00893@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [High] Passing a 64-bit divisor to `div_u64()` silently truncates the div=
isor to 32 bits, causing an incorrect calculation that unconditionally fail=
s probe, and potentially triggering a kernel panic due to division by zero.
- [High] Unsigned underflow when writing a low `PMBUS_IIN_OC_FAULT_LIMIT` v=
alue inadvertently configures the maximum hardware over-current limit, defe=
ating hardware protection.
--

commit ba80340cc247f7eb04cd41303e3f6374716421eb
Author: Ziming Zhu <ziming.zhu@silergycorp.com>

hwmon: pmbus: Add support for Silergy SQ24860

Add PMBus hwmon support for the Silergy SQ24860 eFuse.
The driver reports input voltage, output voltage, auxiliary voltage,
input current, input power, and temperature.

> diff --git a/drivers/hwmon/pmbus/sq24860.c b/drivers/hwmon/pmbus/sq24860.c
> new file mode 100644
> index 0000000000000..43a2cb542169c
> --- /dev/null
> +++ b/drivers/hwmon/pmbus/sq24860.c

[ ... ]

> +static int sq24860_write_iin_cal_gain(struct i2c_client *client, u32 rim=
on,
> +					u32 gimon)
> +{
> +	u64 temp =3D (u64)6400 * 1000000000 * 1000;
> +	u64 denom;
> +	u64 word;
> +
> +	if (!rimon || !gimon)
> +		return -EINVAL;
> +
> +	denom =3D (u64)rimon * gimon;
> +	word =3D div_u64(temp, denom);
> +	if (word > U16_MAX)
> +		return -ERANGE;

[Severity: High]
Does this code inadvertently truncate the 64-bit divisor?

Because denom is a 64-bit unsigned integer, passing it to div_u64() which
expects a 32-bit divisor will silently truncate denom to its lower 32 bits.

With the default values (rimon =3D 1600000000, gimon =3D 18180), denom eval=
uates
to 29,088,000,000,000. Truncating this to 32 bits yields 1,044,881,408, cau=
sing
the division to incorrectly yield 6,125,096 instead of 220.

Since this exceeds U16_MAX, won't this unconditionally return -ERANGE and
fail the probe? Also, if denom happens to be an exact multiple of 2^32,
could the truncated divisor become 0 and trigger a kernel panic?

Should this use div64_u64() instead?

[ ... ]

> +static int sq24860_write_word_data(struct i2c_client *client,
> +				    int page, int reg, u16 value)
> +{
> +	int ret;
> +
> +	switch (reg) {

[ ... ]

> +	case PMBUS_IIN_OC_FAULT_LIMIT:
> +		value -=3D SQ24860_IIN_OCF_OFF;
> +		value =3D DIV_ROUND_CLOSEST(((unsigned int)value) * SQ24860_IIN_OCF_DI=
V,
> +					  SQ24860_IIN_OCF_NUM);
> +		value =3D clamp_val(value, 0, 0x3f);
> +		ret =3D pmbus_write_byte_data(client, page, SQ24860_VIREF, value);
> +		break;

[Severity: High]
Will subtracting from value underflow if it is less than 165?

Since value is an unsigned 16-bit integer, if user space requests a
restrictive over-current limit corresponding to a value less than
SQ24860_IIN_OCF_OFF (165), value will underflow and wrap around to a
large positive number.

Because this large value is subsequently clamped to 0x3f (63), won't
attempting to set a restrictive over-current limit inadvertently configure
the hardware to its absolute maximum limit instead?

Could value be checked against SQ24860_IIN_OCF_OFF before the subtraction
to prevent silently defeating the hardware protection?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260605063042.9177=
6-1-zmzhu0630@163.com?part=3D2
