Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77E2B23D297
	for <linux-hwmon@vger.kernel.org>; Sat, 11 Jul 2026 08:10:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783757434; cv=none; b=gSFRZVpY+bs7UxxdaXKo/+w2MvSGbs0pMiRXVe3JhNJapkncuvYkaaCy/mHiLYa2o+H9xoRz9nzRnq+Hn47STROxEiTyPFqCKxMBA7zp0uCBXOLQd6qDwQdNXj7in4b2DPDruWi1MMCM8GpyPzd1hYcagW/apE4nO8Xa/B8mjuc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783757434; c=relaxed/simple;
	bh=J7NZc7/GaN94GKFxYNTZBWSX9DOI1V/QiW1sIlpCDVU=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=P+tVYprP2WoTJR9BXMP7MZoJHdgpd5hYBW74o0xxA5vO8Mfa5awzfiT9fdv7EAsqvk0vkbiCXVfnRnXLQX6HFuVJuYK2umYxmzVAzIJC1POXCq/T+xEbsoIX76P2HzZd01JhlbzIMx+E/HIm9jL8EoBKnY0NAIC9u3aJTgl4CCw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kaGwEBoG; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kaGwEBoG"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EB2A21F000E9;
	Sat, 11 Jul 2026 08:10:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783757433;
	bh=Hu/fohblA+HEz1UalDzpBcM/Y6QTignnV1MyTATHX2U=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=kaGwEBoG0JvTdqug4ntUpsVSKxrpEDKd2V1exBG8g82TLPxcy1dhSlZm/zNV8PEY9
	 xWpiOcs/FznkibJhb3XJCqlx4zqEbXo8KPG5xo7+8rsuVmFbpqXSI+MEXu4Pb/X1Ff
	 YSetT8sH5CkdetQr3kCOhbV3OpnhjTXwY3jEcN+xsKmiMQBTzYjq3FvhmHtyRvJar3
	 1ASFyskJs/yjOpsHdYMbpXBYo65qnjjihzy67OH2LfDEM9vqzVNDLe1Pug9TsFNrSI
	 EQyVeH0SAnqNQ4nL102rEwmnmWti8TCtICCDKaiE5TDZh0wEPrHGa5H6ae8XwFPrLi
	 R1+QhxcMxK0OQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v5 2/3] hwmon: (applesmc) Fix lockless cache validation
 data race
Reply-To: sashiko-reviews@lists.linux.dev
To: "Shih-Yuan Lee" <fourdollars@debian.org>
Cc: linux-hwmon@vger.kernel.org
In-Reply-To: <20260711075754.11358-3-fourdollars@debian.org>
References: <20260710123236.10508-1-fourdollars@debian.org>
 <20260711075754.11358-1-fourdollars@debian.org>
 <20260711075754.11358-3-fourdollars@debian.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 11 Jul 2026 08:10:32 +0000
Message-Id: <20260711081032.EB2A21F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 4 potential issue(=
s) to consider:

Pre-existing issues:
- [High] Race condition in `applesmc_calibrate()` exposes intermediate inva=
lid state for coordinates
- [High] Unprotected read-modify-write cycle in `applesmc_store_fan_manual`=
 can lose configuration updates
- [High] Missing error handling in `applesmc_calibrate()` permanently corru=
pts resting baseline
- [High] Kernel stack information leak in `applesmc_light_show`
--

--- Patch [2]: [PATCH v5 2/3] hwmon: (applesmc) Fix lockless cache validati=
on data race ---
commit ad485314bce775beb0b1efb51243bec0e40a88b0
Author: Shih-Yuan Lee <fourdollars@debian.org>

hwmon: (applesmc) Fix lockless cache validation data race

This commit addresses a data race in applesmc_get_entry_by_index() where the
valid flag was checked locklessly. It introduces smp_load_acquire() and
smp_store_release() to ensure cache contents are safely committed before
being marked valid.

> diff --git a/drivers/hwmon/applesmc.c b/drivers/hwmon/applesmc.c
> index 9b2d9ecb20c09..317135fc4b73b 100644
> --- a/drivers/hwmon/applesmc.c
> +++ b/drivers/hwmon/applesmc.c

[ ... ]

> @@ -392,7 +394,8 @@ static const struct applesmc_entry *applesmc_get_entr=
y_by_index(int index)
>  	cache->len =3D info[0];
>  	memcpy(cache->type, &info[1], 4);
>  	cache->flags =3D info[5];
> -	cache->valid =3D true;
> +	/* Pairs with smp_load_acquire() to commit cache contents before settin=
g valid */
> +	smp_store_release(&cache->valid, true);
> =20
>  out:
>  	mutex_unlock(&smcreg.mutex);

[Severity: High]
This isn't a bug introduced by this patch, but I noticed a race condition
in applesmc_calibrate() that exposes an intermediate invalid state:

drivers/hwmon/applesmc.c:applesmc_calibrate() {
	...
	applesmc_read_s16(MOTION_SENSOR_X_KEY, &rest_x);
	applesmc_read_s16(MOTION_SENSOR_Y_KEY, &rest_y);
	rest_x =3D -rest_x;
	...
}

Since rest_x is updated without any locking, could concurrent readers obser=
ve
the raw positive value before it gets negated? If applesmc_idev_poll()
executes in this window, it computes the input event using the non-negated
value:

drivers/hwmon/applesmc.c:applesmc_idev_poll() {
	...
	input_report_abs(idev, ABS_X, x - rest_x);
	...
}

[Severity: High]
This is a pre-existing issue, but there appears to be missing error handling
in applesmc_calibrate() that could corrupt the resting baseline:

drivers/hwmon/applesmc.c:applesmc_calibrate() {
	...
	applesmc_read_s16(MOTION_SENSOR_X_KEY, &rest_x);
	applesmc_read_s16(MOTION_SENSOR_Y_KEY, &rest_y);
	rest_x =3D -rest_x;
	...
}

If the hardware read fails (e.g., transient I/O error), applesmc_read_s16()
leaves rest_x unmodified and returns an error code. Because the return value
is ignored, does this unconditionally execute rest_x =3D -rest_x and
arbitrarily flip the sign of the baseline on every failed read?

[Severity: High]
This is a pre-existing issue, but I noticed an unprotected read-modify-write
cycle in applesmc_store_fan_manual():

drivers/hwmon/applesmc.c:applesmc_store_fan_manual() {
	...
	ret =3D applesmc_read_key(FANS_MANUAL, buffer, 2);
	if (ret)
		goto out;

	val =3D (buffer[0] << 8 | buffer[1]);

	if (input)
		val =3D val | (0x01 << to_index(attr));
	else
		val =3D val & ~(0x01 << to_index(attr));

	buffer[0] =3D (val >> 8) & 0xFF;
	buffer[1] =3D val & 0xFF;

	ret =3D applesmc_write_key(FANS_MANUAL, buffer, 2);
	...
}

Since smcreg.mutex is acquired and released internally by applesmc_read_key=
()
and applesmc_write_key(), the lock is dropped during the modification. Could
concurrent calls for different fans read the same initial bitmask and
subsequently overwrite each other's configuration updates?

[Severity: High]
This isn't a bug introduced by this patch, but does applesmc_light_show()
leak uninitialized kernel stack memory?

drivers/hwmon/applesmc.c:applesmc_light_show() {
	...
	ret =3D applesmc_read_key(LIGHT_SENSOR_LEFT_KEY, buffer, data_length);
	if (ret)
		goto out;
	/* newer macbooks report a single 10-bit bigendian value */
	if (data_length =3D=3D 10) {
		left =3D be16_to_cpu(*(__be16 *)(buffer + 6)) >> 2;
		goto out;
	}
	left =3D buffer[2];
	...
	ret =3D applesmc_read_key(LIGHT_SENSOR_RIGHT_KEY, buffer, data_length);
	if (ret)
		goto out;
	right =3D buffer[2];

out:
	if (ret)
		return ret;

	return sysfs_emit(sysfsbuf, "(%d,%d)\n", left, right);
}

If the hardware reports a data_length of 1 or 2 bytes, only those bytes are
written into the uninitialized stack array buffer. Since the code then
unconditionally reads buffer[2], is it emitting uninitialized stack memory
to userspace via sysfs_emit()?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260711075754.1135=
8-1-fourdollars@debian.org?part=3D2
