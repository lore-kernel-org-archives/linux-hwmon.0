Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86F8C253F13;
	Mon, 15 Jun 2026 03:21:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781493708; cv=none; b=hmAELq2NhrdZ4m2RVqVECN2QDagW+85msIauyd2/zsHvy/2UGYxmhBROnDsVJFRliubGeZ6yc3868Tnq/zTi4cXhB1EYdrzzedqrUnOE3xtxhgnxWVTFVaWSgLy7zN9khMPFTWY9njI97K/VrbfVhgPCZJvuC9zLRvBDxbXA65I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781493708; c=relaxed/simple;
	bh=JISHiDPEYHs8mzVpByvThELI6ydx57fI6Vy07cdrMj8=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=ZOJ8rKZj5aPk4jO9bZNszfL3f41qZ2w+fVubNMY8j7anWQlAwqmFMsNeC36lgTvQpatHx/gs6oxzdedqzCxHvWCwil6JFHKLhmYvDDFc0RGBPaP6bhivolKE5oknWTMGJRMBhsCwvMUTxpWBMGTqebNLL2c+rD4eLLY4E8ejhbM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=iMyHQWQv; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="iMyHQWQv"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C2DEC1F000E9;
	Mon, 15 Jun 2026 03:21:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781493707;
	bh=yuF2/Z/rb2OaB5TOB7mWDNmCsRcF60P9BS5EX3aMWEU=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=iMyHQWQvcR4X8cUFF7Ta3iq1XHCg+D9+e2Uo8ItVZVbKjOwF/EDLAeYTulr63wpse
	 S3D9SkMK7pug11OdCPA4hNj72c8o2Yk3IK22hyJ9Ecv1QR9wrKZ817aoRJY8SYMBw+
	 3uxki9xX5waOs8JhJkyIRaSka/zGze50BTO6rHaihvVZuTvxTz6cQqbCxolzdhYGEp
	 s0Q/Hd4/9b92GexeC6GtA3QU1iGY1hU+lo04n290B6qYzDMeyWH5wOet1foA8xh3Co
	 +M64X2CcrCp6uQ5+6BoXEzuFfX/PVPWsis8bn+txZyMhvXx6RwC9AXMPrqDVxNkHDo
	 zK6ns3faRqE/Q==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 2/2] hwmon: (pmbus/lm25066) add current limit
 configuration support
Reply-To: sashiko-reviews@lists.linux.dev
To: "Potin Lai" <potin.lai.pt@gmail.com>
Cc: linux-hwmon@vger.kernel.org, robh@kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org
In-Reply-To: <20260615-lm25066-cl-config-v2-2-59be46e67d5a@gmail.com>
References: <20260615-lm25066-cl-config-v2-2-59be46e67d5a@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 15 Jun 2026 03:21:46 +0000
Message-Id: <20260615032146.C2DEC1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:

Pre-existing issues:
- [High] Telemetry coefficient selection mismatch due to unhandled hardware=
 bit swap for current limit configuration.
--

commit 7163f92448b58cfee498d1fa9089543f75ba9068
Author: Potin Lai <potin.lai.pt@gmail.com>

hwmon: (pmbus/lm25066) add current limit configuration support

This patch adds support for the ti,current-limit devicetree property
to configure the current limit via the DEVICE_SETUP register. It dynamically
handles the Bit 4 mapping for High/Low current limits, which is swapped
for the lm25066 compared to other chips in the family.

> diff --git a/drivers/hwmon/pmbus/lm25066.c b/drivers/hwmon/pmbus/lm25066.c
> index dd7275a67a0ab..c8e7aa7c3acd3 100644
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
> +					     "ti,current-limit", &cl_setting)) {
> +			config_new |=3D LM25066_DEV_SETUP_CL_CFG;
> +			if (strcmp(cl_setting, "high") =3D=3D 0) {
> +				if (data->id =3D=3D lm25066)
> +					config_new |=3D LM25066_DEV_SETUP_CL;
> +				else
> +					config_new &=3D ~LM25066_DEV_SETUP_CL;
> +			} else if (strcmp(cl_setting, "low") =3D=3D 0) {
> +				if (data->id =3D=3D lm25066)
> +					config_new &=3D ~LM25066_DEV_SETUP_CL;
> +				else
> +					config_new |=3D LM25066_DEV_SETUP_CL;

[Severity: High]
This isn't a bug introduced by this patch, but does the telemetry coefficie=
nt
selection further down in lm25066_probe() also need to account for this
hardware bit logic swap?

Later in lm25066_probe(), the coefficient selection unconditionally assumes
Bit 4 (LM25066_DEV_SETUP_CL) being set means the High limit
(coeff[PSC_CURRENT_IN_L]) for all chips:

	if (config & LM25066_DEV_SETUP_CL) {
		info->m[PSC_CURRENT_IN] =3D coeff[PSC_CURRENT_IN_L].m;
		info->b[PSC_CURRENT_IN] =3D coeff[PSC_CURRENT_IN_L].b;
		info->m[PSC_POWER] =3D coeff[PSC_POWER_L].m;
		info->b[PSC_POWER] =3D coeff[PSC_POWER_L].b;
	} else {
		info->m[PSC_CURRENT_IN] =3D coeff[PSC_CURRENT_IN].m;
		info->b[PSC_CURRENT_IN] =3D coeff[PSC_CURRENT_IN].b;
		...
	}

For chips like the LM5064, if they are configured for the High current limi=
t,
Bit 4 will be 0 based on the DT parsing logic above.

Could this cause the driver to erroneously select the normal coefficients
(Low current limit) instead of the _L coefficients, potentially throwing the
reported current and power telemetry off by a factor of ~2x?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260615-lm25066-cl=
-config-v2-0-59be46e67d5a@gmail.com?part=3D2
