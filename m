Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0479A3DB62F;
	Fri, 26 Jun 2026 07:35:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782459323; cv=none; b=d7A3JhdgonxhHHnFnr8jhtcyKvc90w3ZBhFsDMlFD249dagLtuBGrksM+GDIe/weNpmQco1TxC2a3ryD28Te0bHtZDlUYTwC72okLOCT+bPHb0u/J1EalceGMDTpSLhh+Xvp7LPhPfcDXXrN12VgCCpTxdVjkTcm6IQCi4yJUng=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782459323; c=relaxed/simple;
	bh=z45vmdd53GHeYrkigurFxzU4erJc7jfwenc8JerYWLk=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=StNopli9Evfmgw4Bg8jIvGdcpgWao2RXACpstPEhONBrr4eJDyAywYaOlbhmjMplUBSyJNv/a5clpnUz0zoj5sGRMqkBPPzLHsvl7uAWzgOHBh78EW//Ai9UHW8ScF9StrBX2U+3HGfvYHA9UpOlKKOWsNYRtoeLZ/YSftv7XZ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=RSXBpkkd; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="RSXBpkkd"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 337D81F00AC4;
	Fri, 26 Jun 2026 07:35:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782459321;
	bh=fkbxbQ4MgOZ3maHI9+amJkEJt9Pq33/cqSVn5CWowag=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=RSXBpkkd1aXpWuTCW2fRbdU81gJ4IwqqsYR0yIRK4wBhMkpItUaeTYSpHU8y8FT8O
	 5MR+FtyP4rMpP/3+kiroT9hdmnItWDqjU011XPCf6YmW2p8ggQ8/Isww9OjifAHeaZ
	 w4FdNjvZevoOjLTSRA1aDdVmgWGLr/h9PwfSKOnSxxk48lV+Gw/5hZhtvar3GDUHk9
	 heDjuUWt0kHg/K+pVfmCisD/DgwvAz/zS8m8uFb70Bj7FcN47EyQw/Ow3MDXvUkLKo
	 1p2X3/1Lq4s5EMRUbERm89+0ESFBdgokgmnA+bqozRN+hVRkSsYP/Csjl3fcgpOWoX
	 PfCOkTHYfCFHw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 3/9] hwmon: adm1275: Detect coefficient overflow
Reply-To: sashiko-reviews@lists.linux.dev
To: "Matti Vaittinen" <matti.vaittinen@linux.dev>
Cc: linux-hwmon@vger.kernel.org, conor+dt@kernel.org, robh@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <d9e3320dbd62e094ff89598cb3aac5b5e716f9e7.1782458224.git.mazziesaccount@gmail.com>
References: <cover.1782458224.git.mazziesaccount@gmail.com>
 <d9e3320dbd62e094ff89598cb3aac5b5e716f9e7.1782458224.git.mazziesaccount@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 26 Jun 2026 07:35:20 +0000
Message-Id: <20260626073521.337D81F00AC4@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] The patch introduces spurious probe failures by restricting the in=
termediate `shunt * m` multiplication to a 32-bit limit instead of using a =
64-bit calculation, needlessly rejecting perfectly valid shunt resistor con=
figurations.
--

commit 02af229d429dc5c77e875edeb815b9caba7e6da2
Author: Matti Vaittinen <mazziesaccount@gmail.com>

hwmon: adm1275: Detect coefficient overflow

This commit detects potential coefficient overflow when a large shunt
resistor is used and aborts the probe if an overflow is detected.

> diff --git a/drivers/hwmon/pmbus/adm1275.c b/drivers/hwmon/pmbus/adm1275.c
> index 43baa5ded35e5..ccc3ad21e38e7 100644
> --- a/drivers/hwmon/pmbus/adm1275.c
> +++ b/drivers/hwmon/pmbus/adm1275.c
> @@ -839,15 +839,25 @@ static int adm1275_probe(struct i2c_client *client)
>  		info->R[PSC_VOLTAGE_OUT] =3D coefficients[voindex].R;
>  	}
>  	if (cindex >=3D 0) {
> +		u32 m;
> +
>  		/* Scale current with sense resistor value */
> -		info->m[PSC_CURRENT_OUT] =3D
> -			coefficients[cindex].m * shunt / 1000;
> +		if (unlikely(check_mul_overflow(coefficients[cindex].m, shunt, &m))) {

[Severity: High]
Does this code introduce a spurious probe failure for valid setups?

By checking for overflow on the intermediate product using a 32-bit
unsigned integer, the probe will fail for configurations where the
product exceeds U32_MAX, but the final scaled value after dividing by
1000 would safely fit into the 32-bit signed integer target field.

Could we use a 64-bit intermediate calculation instead, such as
div_s64((s64)coefficients[cindex].m * shunt, 1000), to prevent this
regression and avoid needlessly rejecting valid shunt resistor setups?

> +			dev_err(&client->dev, "Current coefficient overflow\n");
> +			return -EOVERFLOW;
> +		}
> +		info->m[PSC_CURRENT_OUT] =3D m / 1000;
>  		info->b[PSC_CURRENT_OUT] =3D coefficients[cindex].b;
>  		info->R[PSC_CURRENT_OUT] =3D coefficients[cindex].R;
>  	}
>  	if (pindex >=3D 0) {
> -		info->m[PSC_POWER] =3D
> -			coefficients[pindex].m * shunt / 1000;
> +		u32 m;
> +
> +		if (unlikely(check_mul_overflow(coefficients[pindex].m, shunt, &m))) {

[Severity: High]
Can this similarly cause the probe to abort prematurely?

For example, configuring an ADM1293 on the 100mV range with a 250000 uOhm
shunt resistor yields a power coefficient product of 26042 * 250000, which
is 6,510,500,000. This mathematically overflows the 32-bit check here, but
the final value of 6,510,500 easily fits in the target field.

Would it be better to calculate this using 64-bit math so the device can
successfully initialize all of its sensors?

> +			dev_err(&client->dev, "Power coefficient overflow\n");
> +			return -EOVERFLOW;
> +		}
> +		info->m[PSC_POWER] =3D m / 1000;

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/cover.1782458224.gi=
t.mazziesaccount@gmail.com?part=3D3
