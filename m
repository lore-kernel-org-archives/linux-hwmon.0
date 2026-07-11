Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B99B3C1093
	for <linux-hwmon@vger.kernel.org>; Sat, 11 Jul 2026 12:42:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783773769; cv=none; b=TBKgGNV5zgCn+sKheP1qW7b9wYVPXghnczijkiBKEibgv4/+fjzt5NyaJRGNhsRtIfmWO5XkPR7PAqzwauTkzI8KoFEfsor4QmLZgjOmFqsaKgOR/gxkbP+z2Syp/6GeQXUiiBpSUQpBuRjhgky0HsZFrPEYX6D9G6DC+J3RMpQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783773769; c=relaxed/simple;
	bh=9TEnhIu10fyLR/G7Fs/J4yUmIZ8CE7+R2lfRfgqmoLg=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=kt+tZV4RXdNPfoHbOzRBpl8TApRfAnL/3ChLIsNCdFfJdKJUJRDa28xjDri9FQoMO04D60rEECqjwXPhZN5Eg0y5RaPgkmJg1GEcPioE7GBiZLRH1Xx70i1GsMHpRyogefJ9w/5I079Xz73sYKwe2YofoQJ7b7sKoYxNyBJ06JI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=EDw4lrrV; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="EDw4lrrV"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C82AB1F000E9;
	Sat, 11 Jul 2026 12:42:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783773768;
	bh=/qQOH0HYyh5z7PvDBt9XEQrIA0dqb4I2/es3Srj+TRI=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=EDw4lrrVwMvLpiz6NuGOc6eZynN02tOMKQD0BLwTO24T0x9YqInppKswJHaHwij72
	 0H9rOxezhB19M8hc9Kh1G2txp4L7VBoSGydyESb2Tvaf+BT/NzgajmhNh0Ra3tcJfN
	 rc/fy8iROgFa5IZtd5x/OBFk9oigmvtF08jpLJfM3btbyZ3QQlvfoAxEs9oSCpZA1v
	 t6UHGSBv3Kr0IBxfOvSjJJEfXDlOMKbae6hK210he9TfAjNJapLO1amNqQzG1H+Zk4
	 SEB0XEgf8+vLWcBWjYu3BH5gzuvYwJ+IawSlXOvKf2dfrAhCp0DHKZPrVh1S+juUek
	 q1yd3L4UpRpZg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 1/1] hwmon: (asus-ec-sensors) detect unconnected
 physical sensors
Reply-To: sashiko-reviews@lists.linux.dev
To: "Eugene Shalygin" <eugene.shalygin@gmail.com>
Cc: linux-hwmon@vger.kernel.org
In-Reply-To: <20260711122937.594989-2-eugene.shalygin@gmail.com>
References: <20260711122937.594989-1-eugene.shalygin@gmail.com>
 <20260711122937.594989-2-eugene.shalygin@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 11 Jul 2026 12:42:47 +0000
Message-Id: <20260711124247.C82AB1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:

Pre-existing issues:
- [High] This problem wasn't introduced by this patch, but the zero-initial=
ized `last_updated` timestamp causes hwmon to report stale 0 values for the=
 first 5 minutes of system uptime.
--

--- Patch [1]: [PATCH v3 1/1] hwmon: (asus-ec-sensors) detect unconnected p=
hysical sensors ---
commit 5f0c212609da2bfbdab37b7fbc65fb23b0a4589a
Author: Eugene Shalygin <eugene.shalygin@gmail.com>

hwmon: (asus-ec-sensors) detect unconnected physical sensors

When there is no physical sensor connected to the motherboard socket,
reading the EC register returns one of several special values (-62, -60,
-40). This commit tests for these values and returns -ENODATA to hwmon.

> diff --git a/drivers/hwmon/asus-ec-sensors.c b/drivers/hwmon/asus-ec-sens=
ors.c
> index 29a23484cbe7b..3936006adeb6c 100644
> --- a/drivers/hwmon/asus-ec-sensors.c
> +++ b/drivers/hwmon/asus-ec-sensors.c
[ ... ]
> @@ -1309,12 +1343,19 @@ static int asus_ec_hwmon_read(struct device *dev,=
 enum hwmon_sensor_types type,
>  	}
> =20
>  	ret =3D get_cached_value_or_update(dev, sidx, state, &value);

[Severity: High]
This isn't a bug introduced by this patch, but doesn't this result in stale=
 0
values being returned for the first 5 minutes of system uptime?

During probe, struct ec_sensors_data is allocated via devm_kzalloc(), which
zero-initializes the last_updated field.

Because the kernel initializes jiffies to a large negative value (typically
-300 * HZ to catch wrap-around bugs), the timestamp check in
get_cached_value_or_update() effectively becomes:

    time_after(negative_val, HZ)

This evaluates to false, as (long)(HZ - negative_val) < 0 is false.

The condition remains false until jiffies wraps around and passes HZ,
which takes approximately 300 seconds. This can cause userspace fan control
daemons to disable cooling, leading to unexpected throttling.

Should last_updated be initialized to jiffies - HZ during allocation to
ensure the first sensor read correctly triggers an update?

> -	if (!ret) {
> -		*val =3D scale_sensor_value(value,
> -					  get_sensor_info(state, sidx)->type);
> +	if (ret)
> +		return ret;
> +
> +	sensor_info =3D get_sensor_info(state, sidx);
> +	if (sensor_info->type =3D=3D hwmon_temp) {
> +		ec_sensor =3D get_ec_sensor_type(state, sidx);
> +		if ((environment_temp_sensors & BIT(ec_sensor)) &&
> +		    is_blank_temperature_value(value))
> +			return -ENODATA;
>  	}
> +	*val =3D scale_sensor_value(value, sensor_info->type);
> =20
> -	return ret;
> +	return 0;
>  }

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260711122937.5949=
89-2-eugene.shalygin@gmail.com?part=3D1
