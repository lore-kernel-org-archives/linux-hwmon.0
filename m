Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8624212548
	for <linux-hwmon@vger.kernel.org>; Thu, 11 Jun 2026 02:10:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781143807; cv=none; b=JCbjhdmmcIlpIT2LVydFA/KZwCAV52eTtrbl3VRZ4sXWIreogoTadsbdaUCAgtjxoowdKWYDD5BkHHWEmm7QC8jvc05hj8Yo3Bfv/etLFsAtz3ro0OCEBQG3PPVqOxR0XK0H9Mn4FFf91JW8jZL1On5beAQadlPcjbbliJ4eyw0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781143807; c=relaxed/simple;
	bh=5nMIBSf8cFwP7f0AYe94AdY33//5uzAOeR1r9rKf63M=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=IdqMwh9Z7L8KdrsD78RSNLwjihFm0pGygB8+qDIM5tQ+zx42dF34TJZujzwvJQOu/XCGYGwDA2SRpq34BGpjHfBE1i3SxqPUtgQJHOrFc9SF+O68AE8GINUqjJFePODU3Jp7N4K13WW9DpGCCBjOUHSLek9IFZGkgqk/bMxEDXA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Enr8U9Je; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Enr8U9Je"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 37D341F00893;
	Thu, 11 Jun 2026 02:10:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781143806;
	bh=4HKmQnLg518ZOpnElyDMxb8/CNWUtOSm6RAHVDyZDlg=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Enr8U9JeL68jx8WRhmSx6lm5VQRCZ50MEexBAN7OUmZQ4Y7rR2AtdRbw8vIDaV3BG
	 RKZkUPvZ2MUxzrrY6/Jw75aiRpg9aBQwPFyDp7adf3y1vfjk15omC6r9qmaps4RJCV
	 uXEXNgLmzC+HEqxutY6QW85tm1CO/cLEakYotBY6ORuapaxZTpR/aVrksyuAFwmEUU
	 apxG7Vecbkt1QmCkzrIzxvjkAuiLb4U/i9eloEfXn3Te+7Va/Ler4c08wl/AB9yMIl
	 3YAJ+adBsYvvHVX/9e1twxpTSiWsK8rhZ6DJLORLCyDhWK2Pq1XJ3mnBOuRxeYdxRw
	 lTTA70cvwj54Q==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2] hwmon: (pmbus/lm25066) Fix PMBus coefficients for
 LM5064/5066/5066i
Reply-To: sashiko-reviews@lists.linux.dev
To: "Potin Lai" <potin.lai.pt@gmail.com>
Cc: linux-hwmon@vger.kernel.org
In-Reply-To: <20260611-lm25066-driver-fix-v2-1-5d28861b0d8e@quantatw.com>
References: <20260611-lm25066-driver-fix-v2-1-5d28861b0d8e@quantatw.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 11 Jun 2026 02:10:05 +0000
Message-Id: <20260611021006.37D341F00893@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:

Pre-existing issues:
- [High] Multiplication of `info->m` with `shunt` can overflow a 32-bit uns=
igned integer, leading to drastically incorrect PMBus coefficients.
--

commit afaf15dfc17bb11eae6bb630c7de46aab3eda6b1
Author: Potin Lai <potin.lai.pt@gmail.com>

hwmon: (pmbus/lm25066) Fix PMBus coefficients for LM5064/5066/5066i

This commit swaps the high and low setting coefficients in the lm25066_coeff
table for the LM5064, LM5066, and LM5066i. It also dynamically assigns the
exponent (R) registers inside the LM25066_DEV_SETUP_CL check in the probe
function.

> diff --git a/drivers/hwmon/pmbus/lm25066.c b/drivers/hwmon/pmbus/lm25066.c
> --- a/drivers/hwmon/pmbus/lm25066.c
> +++ b/drivers/hwmon/pmbus/lm25066.c
[ ... ]
> @@ -519,18 +519,20 @@ static int lm25066_probe(struct i2c_client *client)
>  	} else {
>  		info->m[PSC_CURRENT_IN] =3D coeff[PSC_CURRENT_IN].m;
>  		info->b[PSC_CURRENT_IN] =3D coeff[PSC_CURRENT_IN].b;
> +		info->R[PSC_CURRENT_IN] =3D coeff[PSC_CURRENT_IN].R;
>  		info->m[PSC_POWER] =3D coeff[PSC_POWER].m;
>  		info->b[PSC_POWER] =3D coeff[PSC_POWER].b;
> +		info->R[PSC_POWER] =3D coeff[PSC_POWER].R;
>  	}
> =20
>  	/*

[Severity: High]
This is a pre-existing issue, but could this multiplication overflow a 32-b=
it
unsigned integer?

Looking at the lines immediately following this block in lm25066_probe():

	info->m[PSC_CURRENT_IN] =3D info->m[PSC_CURRENT_IN] * shunt / 1000;
	info->m[PSC_POWER] =3D info->m[PSC_POWER] * shunt / 1000;

The calculations evaluate the multiplication using 32-bit arithmetic because
info->m is an int and shunt is a u32. For large coefficients like 26882=20
(LM25056) or 15076 (LM5066i), a device tree shunt-resistor-micro-ohms value
exceeding roughly 159,000 causes the intermediate product to exceed UINT_MAX
(4,294,967,295), silently wrapping around before the division by 1000.=20

If the wrapped value has the most significant bit set, converting it back to
the signed int info->m results in negative coefficients. This leads to
incorrect current and power readings, which could cause erratic thermal or
power management behavior.

Should these calculations be cast to a 64-bit integer before multiplication=
 to
avoid the overflow?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260611-lm25066-dr=
iver-fix-v2-1-5d28861b0d8e@quantatw.com?part=3D1
