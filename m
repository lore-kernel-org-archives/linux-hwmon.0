Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC436370D7C
	for <linux-hwmon@vger.kernel.org>; Sat, 26 Sep 2026 20:20:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790454045; cv=none; b=Hp3PoftP1CJCc/+leqedrD+lGrqomdmKPQ6lr637wRaDLiXUOea5L03Mik4vdQad6EIScTptgCOHstaeEnd+vFrRNpS7RGrXagxJmd0bdvohR7BdstdU0001Lt530Zj+/39pJhGrJR7MRo7oq45I663yXiPiyQwqBHfjHZd1ams=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790454045; c=relaxed/simple;
	bh=iwsMjUKjI0FHnjZ/rfB/le2ZPTfY7ZrphdfdJ4ycOOI=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=IAdkRxRajJxefI6+kTE1+yfv38dRkn2xDD5Wh/9Bq9QQ4RO5qg9H53mCY6tKABQUUE7HawbxvbHLSLIV1+oS7itFCSBVgb2BhyTBm6qCmSoi+FKUYHs7whVoz6eexJNmd1/f4rpTf4JYnnGyni/ozRZEhdxug2ZYcAGgZnefL1I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=UrT5rsqf; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="UrT5rsqf"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 46CDE1F000FF;
	Sat, 26 Sep 2026 20:20:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790454044;
	bh=VH1HUNeULkZmRi4BePywi16txL5koTfGKYxX32EYrFQ=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=UrT5rsqfC69vXQbZULR/wpoZ+Aepv92xBezE4+4zeVz4jnLigr2HS2ABklpGnSIOZ
	 4dtwsu4b7wAMUxul9OTnCFWdKzboqPAKRzVDcBJ7nV1kXZRbTlDAh5AxLfzX8ZttnP
	 c9oqUqlt76hKwWlmwid43jSccEuXHB+yRhFpU+5oRHut+HreUY4rAIJFLRzO3WpnSy
	 VXAyqJe2lh/43xaVlWwWKZ/7ma20IMXcRGWBNoevETXu9uAIELU+gtXkK0j1sNooiG
	 HT9NZlQEN0ZAQ/6FnkYNoejQcLuDpIAQIY3A5QoHqdirI1tYYkt6kXUeSUxMHauFbb
	 oV+0RddJuCcpQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 2/2] hwmon: (gpd-fan) Register both fans on the GPD
 Win 5
Reply-To: sashiko-reviews@lists.linux.dev
To: "Alexei Solcanu" <alexei.solcanu@pm.me>
Cc: linux-hwmon@vger.kernel.org
In-Reply-To: <20260926-gpd-fan-duo-auto-v2-2-0a2ea41ee3b5@pm.me>
References: <20260926-gpd-fan-duo-auto-v2-0-0a2ea41ee3b5@pm.me>
 <20260926-gpd-fan-duo-auto-v2-2-0a2ea41ee3b5@pm.me>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 26 Sep 2026 20:20:43 +0000
Message-Id: <20260926202044.46CDE1F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] hwmon: gpd-fan: missing gpd_win5_drvdata in gpd_module_drvdata
--

commit 288529d887048f9c76f06b48689bb509162e7569
Author: Alexei Solcanu <alexei.solcanu@pm.me>

hwmon: (gpd-fan) Register both fans on the GPD Win 5

The GPD Win 5 uses gpd_duo_drvdata, which exposes a single fan and pwm
channel. This patch adds separate board data for the Win 5 and registers
one channel per fan.

> diff --git a/drivers/hwmon/gpd-fan.c b/drivers/hwmon/gpd-fan.c
> index b3b75f99f5883..e03b0dde66f94 100644
> --- a/drivers/hwmon/gpd-fan.c
> +++ b/drivers/hwmon/gpd-fan.c
[ ... ]
> @@ -214,7 +233,7 @@ static const struct dmi_system_id dmi_table[] =3D {
>  			DMI_MATCH(DMI_SYS_VENDOR, "GPD"),
>  			DMI_MATCH(DMI_PRODUCT_NAME, "G1618-05"),
>  		},
> -		.driver_data =3D &gpd_duo_drvdata,
> +		.driver_data =3D &gpd_win5_drvdata,
>  	},
>  	{
>  		// GPD Pocket 4

[Severity: Low]
Is the new gpd_win5_drvdata also supposed to be added to gpd_module_drvdata?

Looking at the module parameter implementation in gpd-fan.c,
gpd_module_drvdata is iterated to match the module parameter when overriding
DMI detection:

static const struct gpd_fan_drvdata *gpd_module_drvdata[] =3D {
	&gpd_win_mini_drvdata, &gpd_win4_drvdata, &gpd_wm2_drvdata, &gpd_mpc2_drvd=
ata, NULL
};

Since gpd_win5_drvdata is missing from this array, does this mean users can=
not
force the GPD Win 5 configuration using the gpd_fan_board=3D"win5" module
parameter?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260926-gpd-fan-du=
o-auto-v2-0-0a2ea41ee3b5@pm.me?part=3D2
