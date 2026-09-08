Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 933BE4AD7F6
	for <linux-hwmon@vger.kernel.org>; Tue,  8 Sep 2026 09:59:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788861565; cv=none; b=Kc9v74Cw0pyOoCchn//5MhmNk2vLsoS6ePwy5iklyFr8vt7tLeOZy5R5lYIRcIVZyXPfvWcG1ojGkGRRoK6i+hbUpVMO2kxhfbx/stqJl9+6s6fkIYMTAslOGuYNMKJ+iF+4cBNOK8G8aMBjDCfBFLnbxQ0SjJ4eFv+1iGGd+ls=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788861565; c=relaxed/simple;
	bh=b9zqyW1gnVOLd7218TxYCtXejoQucjAQWtNqCRNpkGo=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=ODVfpDAScn1kB1r6/3n/CINNSQqudmJwVJpSza6M5Fe8xJiLBfpyn5IwE6tF8PDuOJindZdfYW/tECoSn8AYEyY4erRZo8p97ZO8SyfcGPAHSaMmr8MQvA79mNqJWUwKOZPr4phXfvLyBmVeWjdAXboOO/YcTpllRVg12dq4ycs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=DbBTBBsO; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="DbBTBBsO"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0778D1F00A3E;
	Tue,  8 Sep 2026 09:59:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788861564;
	bh=8f2CVCxew0XIpy3AUz+N9xDdkI8A4FZ3zBMF+mamE5s=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=DbBTBBsO/x4xE6yyyL+lmbsIkBjsF8vXaYNrfISFEGUFXX38OGgWMXqPoylyBoBaU
	 FbARO41IjSJkzt5vTHPHjfPZfeF3O1gfvUVKlY1JFltNY7jWPCzGFEB5fz72980mlH
	 I1Y1ripYcAoO5VxsTjt6evLPjM1uM/mTGo4E6qeGjWmF1xKbQnAAoZ7vWn6efX3+lq
	 cfGkheOT7wlCi6cg78YMmilYPxjFzUFRY/gqWKYxn6/V69FqxEseEzraF9NL6i21a2
	 b/zs0hz3nei24on+GV5O2JScCzht9yzcmwM3tpWbPf4UKXB2yEhVu1XXHo84ujYGFE
	 gg5bHcJC1sVCA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2] hwmon: (yogafan) Add support for new Lenovo models
Reply-To: sashiko-reviews@lists.linux.dev
To: "Sergio Melas" <sergiomelas@gmail.com>
Cc: linux-hwmon@vger.kernel.org
In-Reply-To: <20260908094931.2227049-1-sergiomelas@gmail.com>
References: <20260908094931.2227049-1-sergiomelas@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 08 Sep 2026 09:59:23 +0000
Message-Id: <20260908095924.0778D1F00A3E@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] The new DMI quirk entry for 'Yoga 14cACN 2021' is fully redundant a=
nd has no effect.
--

commit a58d4537b52bbed66e2772abc8773ca0b3f84710
Author: Sergio Melas <sergiomelas@gmail.com>

hwmon: (yogafan) Add support for new Lenovo models

Add DMI quirk entries and map correct ACPI paths and configurations for
additional Lenovo laptop models: Yoga 14cACN 2021, IdeaPad 3 15ALC6 Ub
and Yoga 740-15IML, leveraging DMI product family matching.

> diff --git a/drivers/hwmon/yogafan.c b/drivers/hwmon/yogafan.c
> index 48fa5148d9e2c..2f86a8f6e0aeb 100644
> --- a/drivers/hwmon/yogafan.c
> +++ b/drivers/hwmon/yogafan.c

[ ... ]

> @@ -189,6 +194,30 @@ static const struct hwmon_chip_info yoga_fan_chip_in=
fo =3D {
>  };
> =20
>  static const struct dmi_system_id yogafan_quirks[] =3D {

[ ... ]

> +	{
> +		.ident =3D "Yoga 14cACN 2021",
> +		.matches =3D {
> +			DMI_MATCH(DMI_SYS_VENDOR, "LENOVO"),
> +			DMI_MATCH(DMI_PRODUCT_FAMILY, "Yoga 14cACN 2021"),
> +		},
> +		.driver_data =3D (void *)&yoga_8bit_fans_cfg,
> +	},

[Severity: Low]
Is this explicit entry for "Yoga 14cACN 2021" necessary?

Since the kernel's DMI_MATCH() macro uses substring matching, a product
family of "Yoga 14cACN 2021" will naturally fall through and match the
existing generic "Lenovo Yoga" fallback entry located later in the array:

	{
		.ident =3D "Lenovo Yoga",
		.matches =3D {
			DMI_MATCH(DMI_SYS_VENDOR, "LENOVO"),
			DMI_MATCH(DMI_PRODUCT_FAMILY, "Yoga"),
		},
		.driver_data =3D (void *)&yoga_8bit_fans_cfg,
	},

Because both the explicit entry and the generic fallback map to the exact
same driver configuration (yoga_8bit_fans_cfg), adding this specific entry
appears to be logically redundant.

>  	{
>  		.ident =3D "Lenovo LOQ 15IAX9",
>  		.matches =3D {

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260908094931.2227=
049-1-sergiomelas@gmail.com?part=3D1
