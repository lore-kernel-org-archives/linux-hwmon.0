Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ABC6A39E9D6
	for <linux-hwmon@vger.kernel.org>; Sat, 11 Jul 2026 10:18:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783765126; cv=none; b=O2GUoMU5j/QrML/AN9flnucVXdABXiJLv25CGovnS02xrhgrI2DcfbeJXYjJdN9GOFoACvIJz8AyDXEn1Fhdri4YvipJJM+vhQmDpvcqFVO7Q3/ihZs3c3WSU4cwL6bM44FUJksh7MK/hneAxrB6+Bbxnq4j2Bx0Ip3OmWz+Sl8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783765126; c=relaxed/simple;
	bh=bJ35nC1bjGd8m2IosJgzNfzqjq+xqP3WFIEKE3jdN+g=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=ks1gWHV/Ut0M2RWVVs0zjpDVr+tK1KhWp26j+f7RTLj8JqCkKSERb6Uns/appJeHo5IfeCL68nSdOMnG6XmIYjHP+f2pX59KBsInkBBFqGhC7dCJ2DeQ53SJml1GaDzruGtZjZQLatjLoexl9fcMtASLsFKfN2AI8W+Ak9nKI3o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=SCRDZg6G; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="SCRDZg6G"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1885F1F000E9;
	Sat, 11 Jul 2026 10:18:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783765125;
	bh=5pG1UIznZRFaG4xm16FY/JHAUi9a/KYHYUSd+3cIxbU=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=SCRDZg6GwC/a1mEj5fER0rkxQcFfmbQ/iqdiDzsd8qzFE/fCXI8xd4J/BhBDWXlJZ
	 A4yfSwlt+lY0+kC2Tac0cWvULB38l8tWGt2NbNLjKmrWB6y/9CrZn24Ttb9TpaS9fk
	 7Xtx0Sx+5fOfsMcQZK3q81zGPOuMMPKw6xuLgzMrBx2sL8igeOaVeed7gHEmUB9lp+
	 RZ9/Au/en15tDMsNss8QhFRj2liM9GNObWEop1hJp7Km9BmubKswdfzwAJ5FNXflb9
	 DABc6iuG4hQ98O5j6gMaROKYNBIp6OBSMTSX29dI10IfaE54izZITAkbemhvyeZnaG
	 3tvOQ5DCLZ3ug==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 1/1] hwmon: (asus-ec-sensors) detect unconnected
 physical sensors
Reply-To: sashiko-reviews@lists.linux.dev
To: "Eugene Shalygin" <eugene.shalygin@gmail.com>
Cc: linux-hwmon@vger.kernel.org
In-Reply-To: <20260711101143.571191-2-eugene.shalygin@gmail.com>
References: <20260711101143.571191-1-eugene.shalygin@gmail.com>
 <20260711101143.571191-2-eugene.shalygin@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 11 Jul 2026 10:18:44 +0000
Message-Id: <20260711101845.1885F1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] Blank temperature check applies to all thermal sensors, causing =
false `-ENODATA` errors during extreme subzero cooling.
--

--- Patch [1]: [PATCH v2 1/1] hwmon: (asus-ec-sensors) detect unconnected p=
hysical sensors ---
commit a1732d7627cd4596df1c72251d94e446dc0be771
Author: Eugene Shalygin <eugene.shalygin@gmail.com>

hwmon: (asus-ec-sensors) detect unconnected physical sensors

This commit adds a check for specific special values (-62, -60, -40)
returned by the EC when a temperature sensor is unconnected. When these
values are detected, the driver now returns -ENODATA instead of the raw
value to the hwmon subsystem.

> diff --git a/drivers/hwmon/asus-ec-sensors.c b/drivers/hwmon/asus-ec-sens=
ors.c
> index 29a23484cbe7b..d805de5da7b24 100644
> --- a/drivers/hwmon/asus-ec-sensors.c
> +++ b/drivers/hwmon/asus-ec-sensors.c

[ ... ]

> @@ -1310,8 +1329,12 @@ static int asus_ec_hwmon_read(struct device *dev, =
enum hwmon_sensor_types type,
> =20
>  	ret =3D get_cached_value_or_update(dev, sidx, state, &value);
>  	if (!ret) {
> -		*val =3D scale_sensor_value(value,
> -					  get_sensor_info(state, sidx)->type);
> +		sensor_info =3D get_sensor_info(state, sidx);
> +		if (sensor_info->type =3D=3D hwmon_temp &&
> +		    is_blank_temperature_value(value)) {
> +			return -ENODATA;
> +		}

[Severity: Medium]
Could this check inadvertently cause false read errors for legitimate subze=
ro
temperatures?

Because this filter applies broadly to all hwmon_temp sensors in
asus_ec_hwmon_read(), it appears it would intercept valid extreme negative
temperatures, such as those seen during Liquid Nitrogen cooling setups. For
fixed onboard sensors like the CPU and VRM, values like -40, -60, or -62
might represent either genuine readings or the minimum clamped value of the
sensor's thermistor table.

Does this code risk disrupting monitoring tools and fan control daemons
during extreme subzero cooling by returning -ENODATA instead of the valid
clamped temperature?

> +		*val =3D scale_sensor_value(value, sensor_info->type);
>  	}
> =20
>  	return ret;

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260711101143.5711=
91-2-eugene.shalygin@gmail.com?part=3D1
