Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DEE92192F9
	for <linux-hwmon@vger.kernel.org>; Tue, 28 Jul 2026 00:37:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785199028; cv=none; b=oEzJr2nPiixf93bSTSaH4fUAQVLogAxDvmzERWwisVxJIZLKLmo0niF0pxC+3CR2S0KX7BQ1A3W9KDwTTHGvVEfPtXxjlJSzButVV1HQNnrs6AS2LgH397kiPxqpeLdK8223nxyO0qDT7+nbr9YJBujy8IgXS3EZVydhmdUnxbo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785199028; c=relaxed/simple;
	bh=PVeoiF6gT5jnFBjvkF0SN/7GwFfISNz9eGJvbvNGFAs=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=nkcI9i+KnDVNByohZntRw92jJ2JZcEcDZRvp26H4UGJsEGMgaL3WEqzh/U8cnSD0SaCR8UvyhwPlmGq5/wRfbqUZfn5ENzE4Y2+89NURObw15BtBKropF6BGUrXfaJWZXAehwyHKHDWN/j/6su6McTKVjDQsHSgxhsKn4F3rzlQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Ds39b/gs; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Ds39b/gs"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B070F1F000E9;
	Tue, 28 Jul 2026 00:37:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785199026;
	bh=CGOKX93kiF5cwMa9/9HWLHFR94Wx3aIpL4vEWSIyoaI=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Ds39b/gs8zeor/kAbvThHWtlnG7VKi8AfMQ8bG1CVB09PjApStgVkItAIlej578QI
	 YoCpk3xhn8wcnM9fo2By9F5gS1H9qn32ilsh8/5hH4lWd3WT5coaaNnjm4XSsyIJHQ
	 DGv0oF7/Bys0GFUlNwZbVx6tQjaS2h+NbiJl0EE7DwKO2EI19fF/WowU4WKYfZmNjv
	 ymbatn3aCcoDHLvdGb+d+45Vp5jvEk61ovkfZuFcpOcqJzq7gk3SuuIDj0bxNIfW6Q
	 YZQHI+V1zX2R90H6UEHsjQlfCS42zzlG1EkS4D9+3tiGCTFwcXQa0oPx/zlDN/EzXx
	 OTkib0pskpXOw==
From: sashiko-bot@kernel.org
Subject: Re: [hwmon PATCH v2 7/8] hwmon: (adt7470) Fix divide-by-zero TOCTOU
 crash in fan speed read
Reply-To: sashiko-reviews@lists.linux.dev
To: "Luiz Angelo Daros de Luca" <luizluca@gmail.com>
Cc: linux-hwmon@vger.kernel.org
In-Reply-To: <20260727-adt7470_fixes-v2-7-598e38a46ba6@gmail.com>
References: <20260727-adt7470_fixes-v2-0-598e38a46ba6@gmail.com>
 <20260727-adt7470_fixes-v2-7-598e38a46ba6@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 28 Jul 2026 00:37:06 +0000
Message-Id: <20260728003706.B070F1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:

Pre-existing issues:
- [High] Pre-existing TOCTOU vulnerabilities in multiple hwmon drivers due =
to unsafe macro evaluation of unlocked array values, leading to divide-by-z=
ero crashes.
- [High] The driver violates hwmon subsystem guidelines by failing to use h=
wmon_lock() for extra sysfs attributes and the background kthread, leaving =
lockless accesses exposed to data races.
- [High] Transient zeroing of `data->alarm` state causes missing alarms due=
 to lockless sysfs reads.
--

--- Patch [7]: [hwmon PATCH v2 7/8] hwmon: (adt7470) Fix divide-by-zero TOC=
TOU crash in fan speed read ---
commit c42c0e5abb409dc36e59b29c77b757552ecfb7d9
Author: Luiz Angelo Daros de Luca <luizluca@gmail.com>

hwmon: (adt7470) Fix divide-by-zero TOCTOU crash in fan speed read
   =20
This commit fixes a time-of-check to time-of-use (TOCTOU) bug in the adt7470
driver by reading the fan data only once. Previously, a concurrent update
could zero out the fan data between the validation check and the RPM
conversion, causing a divide-by-zero.

Link: https://lore.kernel.org/r/20260727034929.E29B71F000E9@smtp.kernel.org/

> diff --git a/drivers/hwmon/adt7470.c b/drivers/hwmon/adt7470.c
> index 1fbca4869b7b6..772d2a409bb5c 100644
> --- a/drivers/hwmon/adt7470.c
> +++ b/drivers/hwmon/adt7470.c
> @@ -660,36 +660,33 @@ static ssize_t alarm_mask_store(struct device *dev,
>  static int adt7470_fan_read(struct device *dev, u32 attr, int channel, l=
ong *val)
>  {
>  	struct adt7470_data *data =3D adt7470_update_device(dev);

[Severity: High]
This is a pre-existing issue, but does this driver fail to serialize sysfs
attributes and the background kthread properly?

The hwmon subsystem guidelines mandate that drivers use hwmon_lock() and
hwmon_unlock() to serialize attributes registered by any other means than
the core info template.

This driver registers several extra attributes, such as alarm_mask_show(),
via the extra_groups parameter in adt7470_probe() and runs a background
auto_update kthread. None of these paths acquire hwmon_lock(), and instead
invoke adt7470_update_device(), which uses a private internal data->lock.

Meanwhile, standard hwmon core operations read from the cache arrays
locklessly, assuming the core holds hwmon_lock(). Can this architectural
locking mismatch create unprotected data races against concurrent updates?

> +	u16 fan_data;
> =20
>  	if (IS_ERR(data))
>  		return PTR_ERR(data);
> =20
>  	switch (attr) {

[ ... ]

>  	case hwmon_fan_alarm:
>  		*val =3D !!(data->alarm & FAN_ALARM_BIT(channel));

[Severity: High]
This isn't a bug introduced by this patch, but could this lockless read of
data->alarm evaluate to 0 incorrectly and miss an active alarm?

In adt7470_update_sensors(), data->alarm is first assigned the low byte:

	err =3D regmap_read(data->regmap, ADT7470_REG_ALARM1, &val);
	...
	data->alarm =3D val;
	if (data->alarm & ADT7470_OOL_ALARM) {
		...
		data->alarm |=3D ALARM2(val);
	}

This temporarily zeroes out the upper 8 bits. Because adt7470_fan_read()
accesses data->alarm locklessly after adt7470_update_device() releases
data->lock, could a concurrent sysfs read happen exactly during this transi=
ent
state and completely miss an active fan or high-channel temperature alarm?

> -		break;
> +		return 0;
>  	default:
>  		return -EOPNOTSUPP;
>  	}
> =20
> +	if (FAN_DATA_VALID(fan_data))
> +		*val =3D FAN_PERIOD_TO_RPM(fan_data);
> +	else
> +		*val =3D 0;
> +

[Severity: High]
This isn't a bug introduced by this patch, but do other hwmon drivers suffer
from the same TOCTOU bug that this patch fixes for adt7470?

In drivers/hwmon/adt7462.c:fan_show(), the shared array element is passed
directly to the FAN_PERIOD_TO_RPM macro without holding a lock:

	if (!fan_enabled(data, attr->index) ||
	    !FAN_DATA_VALID(data->fan[attr->index]))
		return sprintf(buf, "0\n");

	return sprintf(buf, "%d\n",
		       FAN_PERIOD_TO_RPM(data->fan[attr->index]));

Because the macro expands the argument multiple times, the shared state is =
read
once for the zero-check and again for the division. Could a concurrent upda=
te
modify the array element to zero immediately after the check, resulting in a
divide-by-zero?

>  	return 0;
>  }

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260727-adt7470_fi=
xes-v2-0-598e38a46ba6@gmail.com?part=3D7
