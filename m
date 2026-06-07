Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E86A936C9CA
	for <linux-hwmon@vger.kernel.org>; Sun,  7 Jun 2026 14:59:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780844353; cv=none; b=N8ExFt0Iz1qowk9Yw36e2tlGjWID1lEG93c8fqaoURAjVikzuPzDfruxPVzndvULYVOOpIht3/hoc6tF5gaZE8BNBmpnUrsxErggnl/HryYS9Cu6/sBTJbfYF8vrPN5SsclmJHmzFJ/o6msCyXwKujMUr7TQKnpe1KF8qBov+Ao=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780844353; c=relaxed/simple;
	bh=5+bWTuWncggu6cqblFVfbox2WRWIc2tctcjuOGoCCyE=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=fZieoFcCFXQ+XHEz/f/gGSSxZJ7VKazwKWWXgTOrGHDbNkAy9aMkoYoaweYmoXOyHhN9ZbBKNmpGUM5G5wlPwHBhiLciKKQJoFCZrFwlXw9SKhV1PqpLOR9Da9mKliRdS09miQnpQZL0koRVqRmGIT5ks6lYMSyvk1FkzeCUydg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=H/Yvc5vk; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="H/Yvc5vk"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 558FF1F00893;
	Sun,  7 Jun 2026 14:59:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780844352;
	bh=cWwk7daEVmhgPa7HqPhexMs81mTm65cSe1SJgWyRH+Y=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=H/Yvc5vkqEWeugzXJPsLQEPOSSm4LGQkXkKPdNvHRL0I3uKo55UZJKvln7rOo4GxB
	 K2DA7HekxlLSTJHFpGSPIq/NMUL7FwULCtZ25fvI1Vy3L9U2RYOwvickNs5ZII/L3A
	 xhbqikK02gkRAAaZ7NADWJ26Oijp6tGaA+FvIsN0Bmx0DM44o7T2De+SCApyMWNJFp
	 KI9hjIf0k2IT+RpKzBsh9iDUnL8ypr+URdMr7rgo0y1uCvUJM/+8Xj0yJx3TYC1HCW
	 iJ8hWKdDCio8lDdROBGlPMAgDQJMlaE05agXJH69iOj13Rh65WZKj6SozS9OE5PmeC
	 TDQlaF0JnfOhA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] hwmon: (asus-ec-sensors) add ROG MAXIMUS Z790 EXTREME
Reply-To: sashiko-reviews@lists.linux.dev
To: "Eugene Shalygin" <eugene.shalygin@gmail.com>
Cc: linux-hwmon@vger.kernel.org
In-Reply-To: <20260607144238.128259-1-eugene.shalygin@gmail.com>
References: <20260607144238.128259-1-eugene.shalygin@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 07 Jun 2026 14:59:11 +0000
Message-Id: <20260607145912.558FF1F00893@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] Missing sensor metadata for ROG MAXIMUS Z790 EXTREME causes requ=
ested sensors to be silently ignored.
--

commit 409e24c49843127f834ed70831b89be991b9e50c
Author: Brian Downey <bdowne01@gmail.com>

hwmon: (asus-ec-sensors) add ROG MAXIMUS Z790 EXTREME
   =20
Add support for ROG MAXIMUS Z790 EXTREME

> diff --git a/drivers/hwmon/asus-ec-sensors.c b/drivers/hwmon/asus-ec-sens=
ors.c
> index b5d97a27f80d3..34f96aba5cb99 100644
> --- a/drivers/hwmon/asus-ec-sensors.c
> +++ b/drivers/hwmon/asus-ec-sensors.c
[ ... ]
> @@ -514,6 +514,13 @@ static const struct ec_board_info board_info_maximus=
_z690_formula =3D {
>  	.family =3D family_intel_600_series,
>  };
> =20
> +static const struct ec_board_info board_info_maximus_z790_extreme =3D {
> +	.sensors =3D SENSOR_TEMP_T_SENSOR | SENSOR_TEMP_VRM |
> +		SENSOR_SET_TEMP_WATER | SENSOR_FAN_WATER_FLOW,
> +	.mutex_path =3D ASUS_HW_ACCESS_MUTEX_RMTW_ASMX,
> +	.family =3D family_intel_700_series,
> +};
> +

[Severity: Medium]
Will these water sensors be successfully exposed to userspace?

The newly added board configuration specifies SENSOR_SET_TEMP_WATER and
SENSOR_FAN_WATER_FLOW. However, looking at the sensors_family_intel_700 arr=
ay
used for family_intel_700_series:

static const struct ec_sensor_info sensors_family_intel_700[] =3D {
	[ec_sensor_temp_t_sensor] =3D
		EC_SENSOR("T_Sensor", hwmon_temp, 1, 0x01, 0x09),
	[ec_sensor_temp_t_sensor_2] =3D
		EC_SENSOR("T_Sensor 2", hwmon_temp, 1, 0x01, 0x05),
	[ec_sensor_temp_vrm] =3D EC_SENSOR("VRM", hwmon_temp, 1, 0x00, 0x33),
	[ec_sensor_fan_cpu_opt] =3D
		EC_SENSOR("CPU_Opt", hwmon_fan, 2, 0x00, 0xb0),
};

This array lacks the initializers for the requested water sensors. Because
they are not explicitly initialized, their definitions default to zero and
they will be silently ignored during sysfs creation.

While the driver safely handles zeroed structs without causing out-of-bounds
reads or sysfs corruption (because get_sensor_value() returns 0 when size=
=3D0
and hwmon_genattrs skips attributes without templates), this regression
means the requested water sensors will not be exposed to userspace.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260607144238.1282=
59-1-eugene.shalygin@gmail.com?part=3D1
