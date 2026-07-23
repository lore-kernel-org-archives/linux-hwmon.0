Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32D0138887B
	for <linux-hwmon@vger.kernel.org>; Thu, 23 Jul 2026 21:25:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784841935; cv=none; b=a8357Ha7Bl7iMOAfPSkz3EUklaTRcaWzWgChDoKZyaAj82L4kknZsoZkDObua3n29zKXY1TVkg+bTLcMZi1xLlL7ijJT7ugNXaJkr1llukuhCeWAsfQ1v8/mThMTrZ711qZKNcx8tZ8xxcdtW6//qFb9H0owuSo1o3PTydFYJoM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784841935; c=relaxed/simple;
	bh=gdbEVcvYvqWas2R4v0lRcMbP4XemCsUphj70iY3Rjk0=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=AQUY+QKOwEAhl9mcqLlaBVyvFt3+vC3p82dxkiXB6/2aAr+800KM81aZOHQ6RVAjC8Lu1mCo+PvoOIiIV5BVayNWKejqBcrmOgMOdCX6l1nwLAODoKWeEQDgQxFebNlMR5oD2qDNJSaChJx9WZwS520IOMzLv7zRE8xDJi6WxAI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=aa8x/0C4; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="aa8x/0C4"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8DB101F000E9;
	Thu, 23 Jul 2026 21:25:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784841933;
	bh=6HTfZjHxCIfLRA9XIIwtV00bE4iOvVRCvLmEeIRsEA8=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=aa8x/0C4T4aDF07pIqVKFiExDtTWx1iuHpHGivlBrA6s/OYLmdz6exsHbDrxEwm0i
	 fXdaqWbRfUChKz+kSFScAkLwH7rgx+p5vL7ePGrFX16tHgp92SZ1t09CvW4z+cXu1W
	 dzmelf/k0dqKMucadaDvINI5c+BTNg73660+CXYYiyhUU5rIy9QkYYbWkZfUJJ4U3i
	 FHkgIIfm7vCdZEgpcFLW91gxNVGLM/ue6t6ejyoH4syHZdVuMkebTGKzf/C//kViuG
	 TbLtUPEaBz4oLHKJKZl/CX5zSst7z7XOeThCZfrEmKQhb1D5TjVbCSVdm1KCPvqWJQ
	 cGpCvu5vXtNPg==
From: sashiko-bot@kernel.org
Subject: Re: [RFT PATCH] hwmon: (pmbus) Fix type confusion in notification
 logic
Reply-To: sashiko-reviews@lists.linux.dev
To: "Guenter Roeck" <linux@roeck-us.net>
Cc: linux-hwmon@vger.kernel.org
In-Reply-To: <20260723211336.3046042-1-linux@roeck-us.net>
References: <20260723211336.3046042-1-linux@roeck-us.net>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 23 Jul 2026 21:25:33 +0000
Message-Id: <20260723212533.8DB101F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:

Pre-existing issues:
- [High] sysfs_notify and kobject_uevent are called on the wrong kobject (d=
ata->dev->kobj instead of data->hwmon_dev->kobj), silently breaking hwmon e=
vent notifications.
--

--- Patch [1]: [RFT PATCH] hwmon: (pmbus) Fix type confusion in notificatio=
n logic ---
commit 05911e6740d7877a722e1540f907a611d74a3925
Author: Guenter Roeck <linux@roeck-us.net>

hwmon: (pmbus) Fix type confusion in notification logic

This commit fixes a potential slab-out-of-bounds read and garbage mask issue
in pmbus_notify() caused by casting non-sensor attributes to struct
sensor_device_attribute. It introduces a proper sensor_device_attribute
embedded in pmbus_sensor and pmbus_label and initializes their index to -1 =
so
they can be filtered out during notifications.

> diff --git a/drivers/hwmon/pmbus/pmbus_core.c b/drivers/hwmon/pmbus/pmbus=
_core.c
> index 3143b9e0316c4..dfe7e071017d2 100644
> --- a/drivers/hwmon/pmbus/pmbus_core.c
> +++ b/drivers/hwmon/pmbus/pmbus_core.c

[ ... ]

> @@ -2979,9 +2986,15 @@ static void pmbus_notify(struct pmbus_data *data, =
int page, int reg, int flags)
>  		struct device_attribute *da =3D to_dev_attr(data->group.attrs[i]);
>  		struct sensor_device_attribute *attr =3D to_sensor_dev_attr(da);
>  		int index =3D attr->index;
> -		u16 smask =3D pb_index_to_mask(index);
> -		u8 spage =3D pb_index_to_page(index);
> -		u16 sreg =3D pb_index_to_reg(index);
> +		u16 smask, sreg;
> +		u8 spage;
> +
> +		if (index =3D=3D -1)
> +			continue;
> +
> +		smask =3D pb_index_to_mask(index);
> +		spage =3D pb_index_to_page(index);
> +		sreg =3D pb_index_to_reg(index);
> =20
>  		if (reg =3D=3D sreg && page =3D=3D spage && (smask & flags)) {
>  			dev_dbg(data->dev, "sysfs notify: %s", da->attr.name);

[Severity: High]
This isn't a bug introduced by this patch, but is it intended to notify on
the parent I2C device kobject instead of the hwmon class device?

Looking at the subsequent lines in pmbus_notify() in
drivers/hwmon/pmbus/pmbus_core.c, sysfs_notify() and kobject_uevent() are
called using data->dev->kobj instead of data->hwmon_dev->kobj:

		if (reg =3D=3D sreg && page =3D=3D spage && (smask & flags)) {
			dev_dbg(data->dev, "sysfs notify: %s", da->attr.name);
			sysfs_notify(&data->dev->kobj, NULL, da->attr.name);
			kobject_uevent(&data->dev->kobj, KOBJ_CHANGE);
			flags &=3D ~smask;
		}

Since the hwmon attributes are registered under the hwmon class device, will
this silently fail to wake up userspace applications monitoring these sysfs
files because the target attributes are not on data->dev->kobj?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260723211336.3046=
042-1-linux@roeck-us.net?part=3D1
