Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DDB7927A462;
	Mon, 15 Jun 2026 10:03:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781517813; cv=none; b=tis/od63HMJBiH5zQsx8uPfl+1L0wGCQE1NqWRG8c586XTqhg070oSoA7yqy1FW8IxpZ5W5pLXyR2zh4nKD1Y/YdkIgsRV8xRDjaMZavWH0Blt+vlckaEWM5MX9izaQJwqQTzCfWDZzHp+Eqk3SVYppe7oPehlT4lSwGhB4R9kM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781517813; c=relaxed/simple;
	bh=O04REPNhf3jOCmU8SZv2zATqTjQM2ZBFIoUbxdaWfDg=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=JFBC3t6p6Xsd1371/ueFuGBeYVbkNJtj3hBhxCkhMJkl+623bkbIbakPVLKcdwmmdB+A7Fdk8LI2ETO8n1VR+CbpVHiqTzho3K81WJodpgSLBbp2Zfa+oyl/NhqbhY7FNuX/+kOa2WM1rBCv5hiIyRY2wYMjAItjaZgcy2WB73I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=N4dZ6kbB; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="N4dZ6kbB"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3B8081F000E9;
	Mon, 15 Jun 2026 10:03:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781517812;
	bh=0uGELnOGy56F4Zp44Q6NTD8mW7g2BT6XlvgZzGDus+U=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=N4dZ6kbB5HXLylBhQwqhh2WDlxn+/oa5qFOmcYS1xPemIxQgS5slAWFMdoQGaPGbT
	 S0JDQTDfpK5tzk1NQAeyfk5FZ8DzZ5clqEZOkTxaKtM4cY14h7hsIAQCxrpecvOq6g
	 CnVYMxCtcCKl7lUwQnHESHVOA8TnOUSk5SXRIZ3rN1Mr+mUFPGHWiG5jQ8TlWLZrLm
	 9VTHRzmw889z5LJDLRxJvfHl08l3fkTVsmh9e6rNzT8uusIoGez3sOalSujWj8zJ9m
	 kN/cGuinjKKv93qvyxzVTOTmRiuWst9v4qo7TS12EweRB9Bxi8XupWqSdFMsWLRpRs
	 cKEi66kAPiBEg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 2/2] hwmon: (pmbus/lm25066) add current limit
 configuration support
Reply-To: sashiko-reviews@lists.linux.dev
To: "Potin Lai" <potin.lai.pt@gmail.com>
Cc: robh@kernel.org, conor+dt@kernel.org, linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260615-lm25066-cl-config-v3-2-decb4f5b0b77@gmail.com>
References: <20260615-lm25066-cl-config-v3-2-decb4f5b0b77@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 15 Jun 2026 10:03:31 +0000
Message-Id: <20260615100332.3B8081F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:

Pre-existing issues:
- [High] The PMBus coefficient selection logic uses swapped Bit 4 semantics=
 for non-LM25066 chips, causing incorrect telemetry scaling.
- [High] Missing `R` exponent update when alternative current limit (`_L`) =
coefficients are selected.
--

commit 5b618ea6bd8652d84454a36d0af72de96fc3501b
Author: Potin Lai <potin.lai.pt@gmail.com>

hwmon: (pmbus/lm25066) add current limit configuration support

Add support for the 'ti,current-range' devicetree property to configure
the current limit via the DEVICE_SETUP (0xD9) register, overriding the
physical CL pin setting.

> diff --git a/drivers/hwmon/pmbus/lm25066.c b/drivers/hwmon/pmbus/lm25066.c
> index dd7275a67a0ab..53d274033d66f 100644
> --- a/drivers/hwmon/pmbus/lm25066.c
> +++ b/drivers/hwmon/pmbus/lm25066.c

[ ... ]

> @@ -484,6 +485,42 @@ static int lm25066_probe(struct i2c_client *client)
> =20
>  	data->id =3D (enum chips)(unsigned long)i2c_get_match_data(client);
> =20
> +	if (data->id !=3D lm25056) {
> +		int config_new =3D config;
> +		const char *cl_setting;
> +		int ret;
> +
> +		if (!of_property_read_string(client->dev.of_node,
> +					     "ti,current-range", &cl_setting)) {
> +			config_new |=3D LM25066_DEV_SETUP_CL_CFG;
> +			if (strcmp(cl_setting, "high") =3D=3D 0) {
> +				if (data->id =3D=3D lm25066)
> +					config_new |=3D LM25066_DEV_SETUP_CL;
> +				else
> +					config_new &=3D ~LM25066_DEV_SETUP_CL;

[Severity: High]
This is a pre-existing issue, but does this bit swapping logic expose a
mismatch in how the PMBus coefficients are selected later in lm25066_probe(=
)?

While this patch correctly clears LM25066_DEV_SETUP_CL for the 'high' range
on non-LM25066 chips, the pre-existing coefficient logic unconditionally
checks Bit 4 without accounting for the chip ID:

    if (config & LM25066_DEV_SETUP_CL) {
        info->m[PSC_CURRENT_IN] =3D coeff[PSC_CURRENT_IN_L].m;
        ...
    } else {
        info->m[PSC_CURRENT_IN] =3D coeff[PSC_CURRENT_IN].m;
        ...

For example, on an LM5066, requesting 'high' sets Bit 4 to 0. This causes
the logic to take the else branch and use the standard CURRENT_IN coefficie=
nts
(intended for the 'low' limit). Will this cause the hardware monitoring dri=
ver
to report current and power values that are off by roughly a factor of 2?

> +			} else if (strcmp(cl_setting, "low") =3D=3D 0) {
> +				if (data->id =3D=3D lm25066)
> +					config_new &=3D ~LM25066_DEV_SETUP_CL;
> +				else
> +					config_new |=3D LM25066_DEV_SETUP_CL;
> +			} else {
> +				dev_err(&client->dev,
> +					"invalid current-range setting: %s\n",
> +					cl_setting);
> +				return -EINVAL;
> +			}
> +		}
> +
> +		if (config_new !=3D config) {
> +			ret =3D i2c_smbus_write_byte_data(client,
> +							LM25066_DEVICE_SETUP,
> +							config_new);
> +			if (ret < 0)
> +				return ret;
> +			config =3D config_new;
> +		}
> +	}

[Severity: High]
This isn't a bug introduced by this patch, but while reviewing the coeffici=
ent
selection logic in lm25066_probe(), is there a missing update for the R
exponent?

When the alternative current limit (_L) coefficients are selected, the m an=
d b
values are updated but R is not:

    info->R[PSC_POWER] =3D coeff[PSC_POWER].R;
    if (config & LM25066_DEV_SETUP_CL) {
        info->m[PSC_CURRENT_IN] =3D coeff[PSC_CURRENT_IN_L].m;
        info->b[PSC_CURRENT_IN] =3D coeff[PSC_CURRENT_IN_L].b;
        info->m[PSC_POWER] =3D coeff[PSC_POWER_L].m;
        info->b[PSC_POWER] =3D coeff[PSC_POWER_L].b;
    } else {
        ...

For the lm25056 chip, the POWER_L coefficient array entry has R =3D -4, whi=
le
the standard POWER coefficient has R =3D -3. Because info->R[PSC_POWER] is
only initialized from the base coefficient, could power readings be
miscalculated by a factor of 10 when the alternative limit is active?

>  	info =3D &data->info;
> =20
>  	info->pages =3D 1;

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260615-lm25066-cl=
-config-v3-0-decb4f5b0b77@gmail.com?part=3D2
