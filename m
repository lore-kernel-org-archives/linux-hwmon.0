Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0CC91A3029;
	Thu, 11 Jun 2026 07:54:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781164474; cv=none; b=ALNETreDr54pcGPX+zHVnF7nnWiMESs7U7kj+uzxZ8wy/tILD9fu6+xAq7zJDSEaGaRPZIxzSXh0HqsnMu6ZUfqFAmaJO5ZXS1RhOOvAbQu1z8vbF4QLMk+vQOwG31RK+orD5RpLbNJsQ9CEn+4chBzcGIc2OKapRUCmLJYFYoc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781164474; c=relaxed/simple;
	bh=dH3y3NeENglNd6JKcqyrWOhPdDBcZ9d+w47+01E2DaY=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=ZVQIi8PJfVMAa6QchPxrhuJpuck+yyIB5vHUbS0QcrjrcSN8ZGPoPpTlE85WEM9RbRz1cc6/uVwZm4iWf8htCpslWOnUG/w+dMI1UrDZ/4xBYTL2ZsSbtuQGOb8lxhni8pbJximY3kKv/sQgKlxTQXFW1xQaeXd9IvgnHh5ZzCs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NmRofoD4; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="NmRofoD4"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 325CB1F00893;
	Thu, 11 Jun 2026 07:54:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781164473;
	bh=8ojowWtTPVgPf5hhgoYc+r4f6nfa0IXXaUg5qB5PREc=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=NmRofoD4PQ4wGWWkmvhPcDassMd5dkmvsjaF0q5FE0tQp9S7a6Yev2FbFD0owc6r0
	 uHV3Vr6Jvqr7598Txt6xcDMfccRU0joUGgfS2DPWkjhfqj5ZfYU4pr2fWYOB7TE8/K
	 JXBdmCdcWdutiPWIOYdH//3RSC63Zxnxnik9pD/1mzC+FZ4UJHyTa96xZ5j2TeXLh7
	 YJ4qk4hWcSDsSnVm4RRASwuD9uOhC1VD4Gxsd2/fJx9iu4BEOENXF8aLNtCJQBa4om
	 vPj+IjH6WrtfrNP1lYppKui7IG2Y+tkXGVvqzRjudCX+Qu2DpO3Ozo7IZT+wLU8prw
	 Uidzt+G2OuC3Q==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 2/3] hwmon: pmbus: Add support for Silergy SQ24860
Reply-To: sashiko-reviews@lists.linux.dev
To: "Ziming Zhu" <zmzhu0630@163.com>
Cc: robh@kernel.org, linux-hwmon@vger.kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260611074335.4415-3-zmzhu0630@163.com>
References: <20260611074335.4415-3-zmzhu0630@163.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 11 Jun 2026 07:54:32 +0000
Message-Id: <20260611075433.325CB1F00893@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [High] Missing signedness check on PMBus limits causes negative inputs to=
 silently set maximum hardware limits.
- [Medium] Returns -EINVAL instead of clamping for out-of-bounds lower limi=
ts in PMBUS_IIN_OC_FAULT_LIMIT.
--

commit 1edf6322da1b629fce9b16a96496a18863aacef8
Author: Ziming Zhu <ziming.zhu@silergycorp.com>

hwmon: pmbus: Add support for Silergy SQ24860
   =20
Add PMBus hwmon support for the Silergy SQ24860 eFuse. The driver reports
voltage, current, power, and temperature, along with history attributes
and over-current fault limits.

> diff --git a/drivers/hwmon/pmbus/sq24860.c b/drivers/hwmon/pmbus/sq24860.c
> new file mode 100644
> index 0000000000000..f16f650ff7ba2
> --- /dev/null
> +++ b/drivers/hwmon/pmbus/sq24860.c
[ ... ]
> +static int sq24860_write_word_data(struct i2c_client *client,
> +				    int page, int reg, u16 value)
> +{
> +	int ret;
> +
> +	switch (reg) {
> +	case PMBUS_VIN_UV_WARN_LIMIT:
> +	case PMBUS_VIN_UV_FAULT_LIMIT:
> +	case PMBUS_VIN_OV_WARN_LIMIT:
> +	case PMBUS_VIN_OV_FAULT_LIMIT:
> +	case PMBUS_VOUT_UV_WARN_LIMIT:
> +	case PMBUS_IIN_OC_WARN_LIMIT:
> +	case PMBUS_OT_WARN_LIMIT:
> +	case PMBUS_OT_FAULT_LIMIT:
> +	case PMBUS_PIN_OP_WARN_LIMIT:
> +		value >>=3D SQ24860_8B_SHIFT;
> +		value =3D clamp_val(value, 0, 0xff);

[Severity: High]
Does this handle negative user inputs correctly?

The PMBus core converts limit values into 16-bit 2's complement integers
(s16), but passes them as u16 to sq24860_write_word_data(). Because this
driver treats value as an unsigned u16, a negative user limit written via
sysfs will become a large positive value (e.g., 0xFFFF).

When this large value is logically right-shifted and clamped here, it
results in setting the maximum possible hardware limit (0xff) instead of
clamping to the minimum limit (0).

> +		ret =3D pmbus_write_word_data(client, page, reg, value);
> +		break;
> +
> +	case PMBUS_IIN_OC_FAULT_LIMIT:
> +		if (value < SQ24860_IIN_OCF_OFF)
> +			return -EINVAL;

[Severity: High]
Could a negative user limit bypass this bounds check?

Since value is unsigned, a negative limit (e.g., 0xFFFF) will evaluate
as greater than SQ24860_IIN_OCF_OFF (165). This bypasses the check below
and overflows the 32-bit unsigned calculation, effectively disabling
over-current protection by incorrectly setting the hardware limit to its
maximum.

[Severity: Medium]
Should this clamp the value instead of returning an error?

The hwmon sysfs ABI convention requires drivers to silently clamp
out-of-range user limits to the nearest supported hardware value rather
than returning an error.

If the requested limit translates to a value below SQ24860_IIN_OCF_OFF,
returning -EINVAL violates this convention. Would it be better to clamp
the limit to SQ24860_IIN_OCF_OFF so the underlying register is set to 0?

> +		value -=3D SQ24860_IIN_OCF_OFF;
> +		value =3D DIV_ROUND_CLOSEST(((unsigned int)value) * SQ24860_IIN_OCF_DI=
V,
> +					  SQ24860_IIN_OCF_NUM);
> +		value =3D clamp_val(value, 0, 0x3f);
> +		ret =3D pmbus_write_byte_data(client, page, SQ24860_VIREF, value);
> +		break;

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260611074335.4415=
-1-zmzhu0630@163.com?part=3D2
