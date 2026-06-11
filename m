Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8969D3A254C;
	Thu, 11 Jun 2026 10:10:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781172616; cv=none; b=gUuPPur/OEJn/OaXdgkvI5lpj91WocU2xP9LbTb/3DYOdz8D+54oW8fXReI2QWU1l7t48XyLSPFxlOgQsT6xATD7cRbxvttB3zN6qgnBvU9OYJRDTVx6dp5+sCNQ/dVKLisxpUjTDLpyFlKIBPOvy8KVWLTNX/fL+VqZ62iQZV4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781172616; c=relaxed/simple;
	bh=N1JhRURHL/Yuc3RxGfXIhRtzLN4LvSCYrwdy60aiaXk=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=gOdLtkvqEZxzLgLIIf30h3866OCvWOWB5uI2Dr2Ef9m3cMGs4rOIG1gxeBDcOGq3TccI/j+oJgJc0xSRdGnnKbWEmxNkpLORq6WD+v0CnqhEGYCh/hDLCXNaAS9KjAv6iIpZkFdm464qDI0CQkj0zfRQuzYfK6BgymhtCm7sfi8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gX+UYqVr; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gX+UYqVr"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F38991F00893;
	Thu, 11 Jun 2026 10:10:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781172615;
	bh=Jor4211aEXnUMQuN6/Bqp+Ss22Q46kNjB53fP5mInyI=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=gX+UYqVrXfPqsslMSfvzRZUXfddQCOhgSe7qAuGZmwZQDsHEzSLs7lEh3p6/2lsRi
	 PQ/45YvSo4jl4ipSJgvTMkXIIeTLL/zEqD/1OiBfJnKeMm5D3+Owu2knPcNh69AmWe
	 7w/UHApl1vq/B7Mtq1Rq8AR8yQSDydOTZ/woXVECzxO08BNaiXBQKe58P4KVMrLK6p
	 leY84TlC1Huh9DBvBqWn009OVAi/TacweakQjvqcRzzLESL4zQasA71ojev1t7Kt98
	 O2ci49qMna1F4EkgHlUQGDi08QYiKlxMFDsEdrDkG9ZNQX2OA5sC9ZAfmSBCseP35Y
	 at+HqqpkiFNDw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 2/2] hwmon: (pmbus/lm25066) add SMBus current limit
 configuration support
Reply-To: sashiko-reviews@lists.linux.dev
To: "Potin Lai" <potin.lai.pt@gmail.com>
Cc: robh@kernel.org, devicetree@vger.kernel.org, linux-hwmon@vger.kernel.org, conor+dt@kernel.org
In-Reply-To: <20260611-lm25066-cl-config-v1-2-02e567bf3d91@gmail.com>
References: <20260611-lm25066-cl-config-v1-2-02e567bf3d91@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 11 Jun 2026 10:10:14 +0000
Message-Id: <20260611101014.F38991F00893@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:

Pre-existing issues:
- [High] The driver incorrectly scales current and power telemetry for LM50=
64/LM5066/LM5066i chips by a factor of 2 because it fails to account for a =
swapped hardware bit mapping when selecting PMBus coefficients.
--

commit c83de5ba055b8d019bcdbf2292f57ea088b2924b
Author: Potin Lai <potin.lai.pt@gmail.com>

hwmon: (pmbus/lm25066) add SMBus current limit configuration support

This commit adds support for the 'ti,cl-smbus-high' and 'ti,cl-smbus-low'
devicetree properties to configure the current limit via SMBus. It sets
the Current Limit Configuration and Current Limit Setting bits, accounting
for swapped bit mapping on certain chips.

> diff --git a/drivers/hwmon/pmbus/lm25066.c b/drivers/hwmon/pmbus/lm25066.c
> index dd7275a67a0ab..20e114bdc882d 100644
> --- a/drivers/hwmon/pmbus/lm25066.c
> +++ b/drivers/hwmon/pmbus/lm25066.c
> @@ -464,6 +465,8 @@ MODULE_DEVICE_TABLE(of, lm25066_of_match);
>  static int lm25066_probe(struct i2c_client *client)
>  {
>  	int config;
> +	int config_new;
> +	int ret;
>  	u32 shunt;
>  	struct lm25066_data *data;
>  	struct pmbus_driver_info *info;

[ ... ]

> @@ -484,6 +487,28 @@ static int lm25066_probe(struct i2c_client *client)
> =20
>  	data->id =3D (enum chips)(unsigned long)i2c_get_match_data(client);
> =20
> +	config_new =3D config;
> +	if (of_property_read_bool(client->dev.of_node, "ti,cl-smbus-high")) {
> +		config_new |=3D LM25066_DEV_SETUP_CL_CFG;
> +		if (data->id =3D=3D lm25056 || data->id =3D=3D lm25066)
> +			config_new |=3D LM25066_DEV_SETUP_CL;
> +		else
> +			config_new &=3D ~LM25066_DEV_SETUP_CL;
> +	} else if (of_property_read_bool(client->dev.of_node, "ti,cl-smbus-low"=
)) {
> +		config_new |=3D LM25066_DEV_SETUP_CL_CFG;
> +		if (data->id =3D=3D lm25056 || data->id =3D=3D lm25066)
> +			config_new &=3D ~LM25066_DEV_SETUP_CL;
> +		else
> +			config_new |=3D LM25066_DEV_SETUP_CL;
> +	}
> +
> +	if (config_new !=3D config) {
> +		ret =3D i2c_smbus_write_byte_data(client, LM25066_DEVICE_SETUP, config=
_new);
> +		if (ret < 0)
> +			return ret;
> +		config =3D config_new;
> +	}
> +

[Severity: High]
This is a pre-existing issue, but does this patch leave the new explicit
device tree configuration feature broken for some chips?

The new code correctly identifies that the DEVICE_SETUP Current Limit bit
(Bit 4) mapping is swapped between the LM25056/LM25066 chips (1 =3D High
limit) and LM5064/LM5066/LM5066i chips (0 =3D High limit).

However, further down in lm25066_probe(), the coefficient selection logic
fails to account for this chip-specific swap:

    if (config & LM25066_DEV_SETUP_CL) {
        info->m[PSC_CURRENT_IN] =3D coeff[PSC_CURRENT_IN_L].m;
        info->b[PSC_CURRENT_IN] =3D coeff[PSC_CURRENT_IN_L].b;
        ...
    } else {
        info->m[PSC_CURRENT_IN] =3D coeff[PSC_CURRENT_IN].m;
        info->b[PSC_CURRENT_IN] =3D coeff[PSC_CURRENT_IN].b;
        ...
    }

When an LM5066 is configured to the high limit via ti,cl-smbus-high, the
driver clears Bit 4. The coefficient logic then sees Bit 4 is 0 and
incorrectly selects the PSC_CURRENT_IN (Low limit) coefficients.

Could this cause the calculated current and power telemetry for the LM5064,
LM5066, and LM5066i chips to be under-reported by roughly 2x?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260611-lm25066-cl=
-config-v1-0-02e567bf3d91@gmail.com?part=3D2
