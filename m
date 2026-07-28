Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DB5519D8BC
	for <linux-hwmon@vger.kernel.org>; Tue, 28 Jul 2026 00:37:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785199069; cv=none; b=IiNTLl+oqWfyF47lkUKCjCUWAN0Z8nPOUknKUvXXzgd8GsIzhU7zuW7LChy7AQou+EoIJkc/pugs9QzvAkytiEPsgiCz/DSU/4dCjFtUnbTrbyKcnTLAlcMUG3WtlDIAG0ur8KiZXD0VfknCnRCte3ApOJA+GJHASBiOsCzmwnU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785199069; c=relaxed/simple;
	bh=/3epqcyqoDb3s8tDnOkVxGRfjhWvHt/GRHU1JYn7YBI=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=a8CEMibR9PJ46HG1MlJoiCdi0LHBx8WcjmVFk4DPfDlCV72xOy2+07mRvwfkrcE39k0hcH0l88xjEgC7byHT6G8/CrL15XM71UPvTNL5M0ajGxsHQ79Ep9Eu66iIFiONCvxV6VIMyv3ILub5CF0fJLbnSyf6Ai4eACljVYSm7RM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=W7A1fnoR; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="W7A1fnoR"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B67731F000E9;
	Tue, 28 Jul 2026 00:37:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785199067;
	bh=pjqLe5v7P4/7FC6A/WkmokNFpk84UjpXNBJiqErIDeY=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=W7A1fnoRLHlQVEUq22O8LILeL9o4Y8KIpujN/mWKRWt7ca8hJ9it0tozh/W1l42kr
	 Vb4d9hlgVXl3mhQ38usfMBV2NFp8dyVXU7yJIh9UrkynQOt8WZaoodsiEi+0To24Pt
	 WVfhAkgGlWPqdky4d7g6CM9rJp6W9xg9GKJXTEZGmwCGbFs/zQKJ88eHjTCMFqNiSs
	 tkHM4IUJ54z+UZh89GkniXxcztwLurtgJm9IfQ89ojYFpdv9AfQB2WXnmhAwXG9oBE
	 OCMevC9lnSVjtx/U2ThZ763Z/yZ+GCbbmMC0nPCfsYU7uYOY7KYMqiPZo6FWYDsGMe
	 3Zw650/zjHFDQ==
From: sashiko-bot@kernel.org
Subject: Re: [hwmon PATCH v2 3/8] hwmon: (adt7470) Fix busy-loop and I2C
 flooding in update thread
Reply-To: sashiko-reviews@lists.linux.dev
To: "Luiz Angelo Daros de Luca" <luizluca@gmail.com>
Cc: linux-hwmon@vger.kernel.org
In-Reply-To: <20260727-adt7470_fixes-v2-3-598e38a46ba6@gmail.com>
References: <20260727-adt7470_fixes-v2-0-598e38a46ba6@gmail.com>
 <20260727-adt7470_fixes-v2-3-598e38a46ba6@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 28 Jul 2026 00:37:47 +0000
Message-Id: <20260728003747.B67731F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:

Pre-existing issues:
- [High] Setting `num_temp_sensors` to a non-negative value before temperat=
ures have been probed permanently breaks temperature reporting and stalls s=
ysfs reads.
--

--- Patch [3]: [hwmon PATCH v2 3/8] hwmon: (adt7470) Fix busy-loop and I2C =
flooding in update thread ---
commit 34430e742760a7d00b9b258ac39d10dadd63f0d0
Author: Luiz Angelo Daros de Luca <luizluca@gmail.com>

hwmon: (adt7470) Fix busy-loop and I2C flooding in update thread

This commit fixes a busy-loop vulnerability in the background thread.
It clamps the minimum auto_update_interval to 500ms to guarantee a
reasonable minimum sleep window between sensor updates.

Reported-by: sashiko-bot@kernel.org
Closes: https://lore.kernel.org/r/20260716213252.EACA71F000E9@smtp.kernel.o=
rg
Fixes: 89fac11cb3e7 ("adt7470: make automatic fan control really work")

> diff --git a/drivers/hwmon/adt7470.c b/drivers/hwmon/adt7470.c
> index 62ec68ea0a406..0b19b0925d1c7 100644
> --- a/drivers/hwmon/adt7470.c
> +++ b/drivers/hwmon/adt7470.c
> @@ -509,7 +509,7 @@ static ssize_t auto_update_interval_store(struct devi=
ce *dev,
>  	if (kstrtol(buf, 10, &temp))
>  		return -EINVAL;
> =20
> -	temp =3D clamp_val(temp, 0, 60000);
> +	temp =3D clamp_val(temp, 500, 60000);
> =20
>  	mutex_lock(&data->lock);
>  	data->auto_update_interval =3D temp;

[Severity: High]
This is a pre-existing issue, but does setting num_temp_sensors before
temperatures are probed prevent temperature reporting and stall sysfs reads?

If userspace writes a non-negative value to the num_temp_sensors sysfs node
before data->temperatures_probed is set to 1, data->temperatures_probed
remains 0:

drivers/hwmon/adt7470.c:num_temp_sensors_store() {
	...
	data->num_temp_sensors =3D temp;
	if (temp < 0)
		data->temperatures_probed =3D 0;
	...
}

Because temperatures_probed is 0, adt7470_update_sensors() will always call
adt7470_read_temperatures() rather than a bulk read. Inside
adt7470_read_temperatures(), it checks the sensor count:

drivers/hwmon/adt7470.c:adt7470_read_temperatures() {
	...
	/* Only count fans if we have to */
	if (data->num_temp_sensors >=3D 0)
		return 0;

	err =3D regmap_bulk_read(data->regmap, ADT7470_TEMP_REG(0),
			       &data->temp[0], ADT7470_TEMP_COUNT);
	...
	data->temperatures_probed =3D 1;
	return 0;
}

Since num_temp_sensors >=3D 0, it returns early and never actually reads the
temperature registers or sets data->temperatures_probed =3D 1. This appears=
 to
cause every subsequent sensor update to stall the driver with the probe sle=
ep
time while never actually updating data->temp.

Could num_temp_sensors_store() also set data->temperatures_probed =3D 1 when
temp >=3D 0, or should adt7470_read_temperatures() read the registers
regardless of the num_temp_sensors value?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260727-adt7470_fi=
xes-v2-0-598e38a46ba6@gmail.com?part=3D3
