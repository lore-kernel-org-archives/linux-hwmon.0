Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2BEC63161AB;
	Tue, 16 Jun 2026 06:59:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781593186; cv=none; b=WNP8nA+xrX0GnRtGqCHW0/ruxSq8OgOShgrT5Ml803VbnZp9Nahz7YebYXCOWk4Q2XeGlwZFDKc7PvcIiQsN5za8atg7P3tWC+rsDMKkDmoXPNtlYaNTpB615r3GhujyrPP+SLOFLhwP4NPOy921SrS9GjyCL2XB5b3HChZMcys=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781593186; c=relaxed/simple;
	bh=cxC+mD5zrqmy6I3NCcBstHrGE4s1swuMYmzoguwq+sI=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=pYSMBf/Wfej5Pkhd8GAz6lHboua6lb3zXcr2C14TU8qgtLcrqJXV8H8x3VQqM6nLxCR2kdL1DUjToF6M5fpTLAy35pmP/QZIXYEh140zQfeOj/0ZAPntrKDrgPrrq64pQUeO1PzRSR1jEexajC5YK6K3Jahv6b2f3dMvfCEAQ48=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=C3teDY3k; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="C3teDY3k"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 95FF11F00A3A;
	Tue, 16 Jun 2026 06:59:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781593184;
	bh=qdfebtWn0PVZShYT0aBvjFSuvtYgsTTRcjHOuOVVLlg=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=C3teDY3kHi4NrccwBEyvQ22WhaYzmilWf47HUWzqWb3e99hCq68TFSO8dEfAOf2eu
	 XAtGTIrS9Turuq6O0JSK5GT8Kh3XmipvQFkriCzKJnstWtSPF6jIX02NAIEtafvkHO
	 FpGZw0NW8dxwbnkDGUeudSb83jr7lU/A9r+fZLU3enjEARfPWOu2MGF41qPd4fu5/a
	 a/zyeOl8lDxs0gXNOHvrJ8V3VW+gsIIAz1MSlSUWqGhh1AcG/Hy1aqpc47OLZMhOoj
	 HcWbXlbyt7o9nIgysFQN2FVQGOS8sW9+xuYQg/2ZPqebIHwVO169BdlVFAEi8kFlS0
	 QIIs/18sfIIxQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 6/7] hwmon: adm1275: Support ROHM BD12790
Reply-To: sashiko-reviews@lists.linux.dev
To: "Matti Vaittinen" <matti.vaittinen@linux.dev>
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, linux-hwmon@vger.kernel.org, robh@kernel.org
In-Reply-To: <8ca875d21f2d9a4d53a87b47a5e6efab48266178.1781591132.git.mazziesaccount@gmail.com>
References: <8ca875d21f2d9a4d53a87b47a5e6efab48266178.1781591132.git.mazziesaccount@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 16 Jun 2026 06:59:44 +0000
Message-Id: <20260616065944.95FF11F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:

Pre-existing issues:
- [High] The driver compares the device-returned PMBUS_MFR_MODEL string usi=
ng strncasecmp without verifying the returned length, leading to uninitiali=
zed stack memory reads.
- [High] Multiplication of power and current coefficients by `shunt` overfl=
ows a 32-bit unsigned integer for larger shunt resistors.
--

commit 8dff4bf5659b589eabe7fc876665de9339faae1f
Author: Matti Vaittinen <mazziesaccount@gmail.com>

hwmon: adm1275: Support ROHM BD12790

Add support for ROHM BD12790 hot-swap controller which is largely
similar to Analog Devices adm1272.

> diff --git a/drivers/hwmon/pmbus/adm1275.c b/drivers/hwmon/pmbus/adm1275.c
> --- a/drivers/hwmon/pmbus/adm1275.c
> +++ b/drivers/hwmon/pmbus/adm1275.c
[ ... ]
> @@ -581,7 +606,8 @@ static int adm1275_probe(struct i2c_client *client)
>  	if (mid->driver_data =3D=3D adm1272 || mid->driver_data =3D=3D adm1273 =
||
>  	    mid->driver_data =3D=3D adm1278 || mid->driver_data =3D=3D adm1281 =
||
>  	    mid->driver_data =3D=3D adm1293 || mid->driver_data =3D=3D adm1294 =
||
> -	    mid->driver_data =3D=3D bd12780 || mid->driver_data =3D=3D sq24905c)
> +	    mid->driver_data =3D=3D bd12780 || mid->driver_data =3D=3D bd12790 =
||
> +	    mid->driver_data =3D=3D sq24905c)
>  		config_read_fn =3D i2c_smbus_read_word_data;
>  	else

[Severity: High]
This is a pre-existing issue, but I noticed that just before this block in
adm1275_probe(), there might be an out-of-bounds stack read:

    ret =3D i2c_smbus_read_block_data(client, PMBUS_MFR_MODEL, block_buffer=
);
    if (ret < 0) { ... }
    for (mid =3D adm1275_id; mid->name[0]; mid++) {
            if (!strncasecmp(mid->name, block_buffer, strlen(mid->name)))
                    break;
    }

Does this code read uninitialized stack memory if the device returns a
string that matches a valid model name prefix, but is shorter than the valid
model name length?

Since i2c_smbus_read_block_data() reads up to 32 bytes into the uninitializ=
ed
stack array block_buffer without appending a null terminator, strncasecmp()
could read past the valid bytes returned in ret.

For example, if the device returns a shorter string like "adm12", checking
it against "adm1275" up to the length of "adm1275" will continue reading
into uninitialized stack bounds.

[ ... ]
> @@ -685,12 +722,23 @@ static int adm1275_probe(struct i2c_client *client)
>  		break;
>  	case adm1272:
>  	case adm1273:
> +	case bd12790:
> +	{
[ ... ]

[Severity: High]
This isn't a bug introduced by this patch, but looking further down in
adm1275_probe(), could the coefficient calculations for current and power
overflow a 32-bit unsigned integer?

    info->m[PSC_CURRENT_OUT] =3D
        coefficients[cindex].m * shunt / 1000;

    info->m[PSC_POWER] =3D
        coefficients[pindex].m * shunt / 1000;

If a larger shunt resistor value is provided via device tree
(e.g., 200,000 micro-ohms to measure lower currents), multiplying this by
larger coefficients like 30631 (used for ADM1293) evaluates to 6,126,200,00=
0.

Since shunt is a u32 and the coefficient promotes to int, this operation us=
es
32-bit unsigned arithmetic.=20

Does this wrap-around the maximum 32-bit value of 4,294,967,295 and result
in drastically incorrect telemetry scaling factors?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/cover.1781591132.gi=
t.mazziesaccount@gmail.com?part=3D6
