Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5FA41E51E0
	for <linux-hwmon@vger.kernel.org>; Mon, 27 Jul 2026 22:02:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785189761; cv=none; b=bzO48aCnl2Ph5t00g1yRR47f/QAMnVnUZwSzClPhHmOHxD5eVRjCI862GXw33thgp0MCGriFHr79aLBfcaEUXjqk6c4R8SdN6R/KlXU8XCS++RI1HwRC7H0ENXVW2LYSgQqyado3S6h9eHdDTip5+IOMhDqayCmKySyesjJi3ic=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785189761; c=relaxed/simple;
	bh=WBTb8hX573wcWl7CRFMr+jf0CFBsEyxGPj+pz6CNeWA=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=u56vRzk3VFs9eXSJbpTQZ0jypRoDHMD7rUodm9v9JTkEcvvXUsIrB2R95846Um9kIBgijwjnarB31uKtxXNDZrlIs9RA+UqfAhwlSZxxs58L8gPTpCVrrj7+ODYl9zwNyr1KYl9xJ/D7KTmlUOsTWsZy72B+9KRyOFvT9R27tQM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lxK3Xe6R; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lxK3Xe6R"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 512071F000E9;
	Mon, 27 Jul 2026 22:02:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785189759;
	bh=6EIo5o60YcyYqXTTHGnjSLbG5U/7HeUmNuvdW4A3CtQ=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=lxK3Xe6RI3xEgKtE8J66YdxzCFBXrcOYM0pOZmCfmU5lNLwVIBd3qKtiNCpdTjKop
	 EgYsX3pDbau5mJg4P3HshLcRh7J5VdNBVeghHiQh+6CjMOOujnZm9rPUgGTBPlkXIr
	 uEMwwvUBhlaUybF7nuyvtJW7vKrCDAlEteTbSTqhzBlF0p/UCTk48Q+p9fRZNszv0v
	 BE5il89EPRi/CKiWhOgAOxXWRp+sAY3xXKNKsceK0IbhVBQa34yuaSwL7gqT4IXNyk
	 qmHnWRhgj9ne7vmFnJ9HvZRSpxtusiOZLu8lN/ppiZk3uXh7flV65eTBMTchKDCHqP
	 EYJ2e+LIUJOhg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] hwmon: (nct6775-core) Prevent access to unsupported
 weight registers
Reply-To: sashiko-reviews@lists.linux.dev
To: "Guenter Roeck" <linux@roeck-us.net>
Cc: linux-hwmon@vger.kernel.org
In-Reply-To: <20260727214839.3727592-1-linux@roeck-us.net>
References: <20260727214839.3727592-1-linux@roeck-us.net>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 27 Jul 2026 22:02:38 +0000
Message-Id: <20260727220239.512071F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:

Pre-existing issues:
- [High] The patch addresses out-of-bounds reads for PWM weight control reg=
isters but misses an identical vulnerability for `NCT6116_REG_TEMP_SOURCE`.=
 This array has only 3 elements but is accessed up to index 5 during the `n=
ct6775_probe` initialization, leading to an out-of-bounds read and arbitrar=
y hardware register corruption.
--

--- Patch [1]: [PATCH] hwmon: (nct6775-core) Prevent access to unsupported =
weight registers ---
commit 38ce01c21386add5f97d86c3020857301fde2125
Author: Guenter Roeck <linux@roeck-us.net>

hwmon: (nct6775-core) Prevent access to unsupported weight registers

During initialization of the nct6116 chip, the driver assigns several 3-ele=
ment
NCT6106 register arrays to data pointers, but subsequently iterates up to 5
times based on data->pwm_num. This causes an out-of-bounds read, fetching
garbage values that are then used as hardware register addresses. This patch
fixes the issue by extending the affected arrays with zeroed fields.

> diff --git a/drivers/hwmon/nct6775-core.c b/drivers/hwmon/nct6775-core.c
> index d668dc390def8..87fc2a21255a9 100644
> --- a/drivers/hwmon/nct6775-core.c
> +++ b/drivers/hwmon/nct6775-core.c
> @@ -791,12 +791,12 @@ static const u16 NCT6106_REG_TOLERANCE_H[] =3D { 0x=
112, 0x122, 0x132 };
> =20
>  static const u16 NCT6106_REG_TARGET[] =3D { 0x111, 0x121, 0x131 };
> =20
> -static const u16 NCT6106_REG_WEIGHT_TEMP_SEL[] =3D { 0x168, 0x178, 0x188=
 };
> -static const u16 NCT6106_REG_WEIGHT_TEMP_STEP[] =3D { 0x169, 0x179, 0x18=
9 };
> -static const u16 NCT6106_REG_WEIGHT_TEMP_STEP_TOL[] =3D { 0x16a, 0x17a, =
0x18a };
> -static const u16 NCT6106_REG_WEIGHT_DUTY_STEP[] =3D { 0x16b, 0x17b, 0x18=
b };
> -static const u16 NCT6106_REG_WEIGHT_TEMP_BASE[] =3D { 0x16c, 0x17c, 0x18=
c };
> -static const u16 NCT6106_REG_WEIGHT_DUTY_BASE[] =3D { 0x16d, 0x17d, 0x18=
d };
> +static const u16 NCT6106_REG_WEIGHT_TEMP_SEL[] =3D { 0x168, 0x178, 0x188=
, 0, 0 };
> +static const u16 NCT6106_REG_WEIGHT_TEMP_STEP[] =3D { 0x169, 0x179, 0x18=
9, 0, 0 };
> +static const u16 NCT6106_REG_WEIGHT_TEMP_STEP_TOL[] =3D { 0x16a, 0x17a, =
0x18a, 0, 0 };
> +static const u16 NCT6106_REG_WEIGHT_DUTY_STEP[] =3D { 0x16b, 0x17b, 0x18=
b, 0, 0 };
> +static const u16 NCT6106_REG_WEIGHT_TEMP_BASE[] =3D { 0x16c, 0x17c, 0x18=
c, 0, 0 };
> +static const u16 NCT6106_REG_WEIGHT_DUTY_BASE[] =3D { 0x16d, 0x17d, 0x18=
d, 0, 0 };

[Severity: High]
This isn't a bug introduced by this patch, but does the same problem exist
for NCT6116_REG_TEMP_SOURCE?

It appears NCT6116_REG_TEMP_SOURCE is defined with only 3 elements:

drivers/hwmon/nct6775-core.c:
static const u16 NCT6116_REG_TEMP_SOURCE[] =3D {
	0xb0, 0xb1, 0xb2 };

During initialization, num_reg_temp is set to 6. Later in nct6775_probe(),
the code iterates unconditionally up to num_reg_temp:

drivers/hwmon/nct6775-core.c:nct6775_probe() {
    ...
    err =3D nct6775_read_value(data, data->REG_TEMP_SOURCE[i], &src);
    ...
}

Could this cause a similar out-of-bounds read and subsequent corruption
when add_temp_sensors() writes the temperature source mapping to those
unintended hardware register addresses?

> =20
>  static const u16 NCT6106_REG_AUTO_TEMP[] =3D { 0x160, 0x170, 0x180 };

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260727214839.3727=
592-1-linux@roeck-us.net?part=3D1
