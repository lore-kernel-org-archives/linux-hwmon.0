Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D372330C617
	for <linux-hwmon@vger.kernel.org>; Mon, 31 Aug 2026 18:26:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788200804; cv=none; b=NF+NVsWU/5yzKAcsJYzuFgFOmdl2qYOwfTyQ1Wmgdk7+EOtDZ8luGtOJD4y7lHCNoAmkfOAYucS1dQdmD9jyXdWbZlt6DlHfTsH7kb6inQv8LHk1sJlyJtj8iyASLel+HBDc4cvOrFGvepl1zXhYQ6j1yZGcydBxhO/lL6JHZbY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788200804; c=relaxed/simple;
	bh=vECsEzikcbH08LUl4XlfL8JZJMjnXksS/qqkjvEVzA8=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=h1KHsge+2SlsFR/4urjyO7zfnmZsNQt32oLkhviwK/RdJvxoSCT9/socWTrGIUgCzpPznZT6u9sMQf/SJySDtkxujF1YJojEw9enBE1YGw9kAyKWYy5mftirOdrwy4WcKuFFQ/QrgdeHGUyJzPcK4QfoHdPKg+/tirlRasuVdYU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=VjBzLJRM; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="VjBzLJRM"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 56BD91F000E9;
	Mon, 31 Aug 2026 18:26:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788200802;
	bh=oxhmVwh/Eq5ujK9gWqhbNUezfr8HxKXbzZvvLqOjxC4=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=VjBzLJRM3JBdoEmHjmAhD4adO27L/9wwjBZksfDJ7YUsoJc3k0V4+kQ6R9fdGW1Ng
	 remPCj3/VbzjND83U0JHANVv/dHGXW1k0iwzLDHLJlgUbQNc5WJufusGev/m7KJ7rc
	 gTzRRMcpY5LM5wZbuXZ9EU5TdXO8gNnj9d8MtVo4m9Ivbao27ecHHJOskWClxm7/up
	 NaQyY89QFruXP7Z5W5AkKWQWvYiLB4eL4JSs8iYLCIc3eZ4hi67//vcCPJemhrJoL+
	 fSnvoehCfsPLlEBwtNxsJykXLw0DJCOMiVIZSwIZbpVprQxYF+uovAotAsh5eWLwRl
	 BeyuoWCnlbGrw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 2/2] platform: arm64: radxa-svc: Add hwmon sensors
Reply-To: sashiko-reviews@lists.linux.dev
To: "Xilin Wu" <sophon@radxa.com>
Cc: linux-hwmon@vger.kernel.org
In-Reply-To: <20260831-radxa-svc-v1-2-7c028de6a387@radxa.com>
References: <20260831-radxa-svc-v1-0-7c028de6a387@radxa.com>
 <20260831-radxa-svc-v1-2-7c028de6a387@radxa.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 31 Aug 2026 18:26:41 +0000
Message-Id: <20260831182642.56BD91F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:
- [Medium] The driver registers hardware monitoring devices directly from t=
he `drivers/platform/arm64/` directory, violating the HWMON subsystem layer=
ing guidelines.
- [Medium] The driver incorrectly registers a separate hwmon device for eac=
h individual sensor instead of grouping them under a single hwmon device.
- [Medium] Strict validation of firmware response lengths and bitmasks brea=
ks forward compatibility with newer firmware versions.
--

commit 4fb96e4e2a24b97521dad5da3953d3fd473daf20
Author: Xilin Wu <sophon@radxa.com>

platform: arm64: radxa-svc: Add hwmon sensors

Add support for the optional sensor discovery and sampling operations.
Expose firmware temperature, voltage, current, and combined sensors as
read-only hwmon devices.

> diff --git a/drivers/platform/arm64/radxa_svc_glink.c b/drivers/platform/=
arm64/radxa_svc_glink.c
> index 1c91bfabcd126..b2a4f0c5317ac 100644
> --- a/drivers/platform/arm64/radxa_svc_glink.c
> +++ b/drivers/platform/arm64/radxa_svc_glink.c
[ ... ]
> @@ -428,6 +496,403 @@ static int radxa_svc_rpmsg_callback(struct rpmsg_de=
vice *rpdev, void *data,
>  	return 0;
>  }
> =20
> +static u32 radxa_svc_sensor_expected_mask(u32 sensor_type)
[ ... ]
> +static int radxa_svc_sensor_update(struct radxa_svc_sensor *sensor)
> +{
> +	struct radxa_svc_sensor_read_req req;
> +	struct radxa_svc_sensor_read_resp resp =3D {};
> +	unsigned long cache_expires;
> +	u32 expected_mask;
> +	u32 valid_mask;
> +	size_t len =3D sizeof(resp);
> +	int ret;
[ ... ]
> +	req.sensor_id =3D cpu_to_le32(sensor->sensor_id);
> +	ret =3D radxa_svc_request(sensor->svc, RADXA_SVC_OP_SENSOR_READ,
> +				&req, sizeof(req), &resp, &len);
> +	if (ret)
> +		goto out_unlock;
> +
> +	if (len !=3D sizeof(resp) ||
> +	    le32_to_cpu(resp.sensor_id) !=3D sensor->sensor_id) {
> +		ret =3D -EPROTO;
> +		goto out_unlock;
> +	}
> +
> +	valid_mask =3D le32_to_cpu(resp.valid_mask);
> +	expected_mask =3D radxa_svc_sensor_expected_mask(sensor->sensor_type);
> +	if ((valid_mask & RADXA_SVC_SENSOR_VALID_MASK) !=3D expected_mask ||
> +	    valid_mask & ~RADXA_SVC_SENSOR_VALID_MASK) {
> +		ret =3D -EPROTO;
> +		goto out_unlock;
> +	}

[Severity: Medium]
Does this strict validation of firmware response lengths and bitmasks break
forward compatibility with newer firmware versions?

If a newer firmware version adds additional capability bits or appends extra
data to the response, the checks valid_mask & ~RADXA_SVC_SENSOR_VALID_MASK
and len !=3D sizeof(resp) will trigger an -EPROTO error, completely failing
to read sensors.

> +
> +	sensor->temp_millic =3D (s32)le32_to_cpu(resp.temp_millic);
> +	sensor->voltage_mv =3D (s32)le32_to_cpu(resp.voltage_mv);
[ ... ]
> +static int radxa_svc_sensor_hwmon_init(struct radxa_svc_glink *svc)
> +{
> +	struct radxa_svc_sensor_list_resp *resp;
> +	struct radxa_svc_sensor_list_req req;
> +	const struct hwmon_chip_info *chip_info;
[ ... ]
> +	svc->num_sensors =3D total;
> +	for (i =3D 0; i < svc->num_sensors; i++) {
> +		struct radxa_svc_sensor *sensor =3D &svc->sensors[i];
> +
> +		chip_info =3D radxa_svc_sensor_chip_info(sensor->sensor_type);
> +		hwmon_name =3D devm_hwmon_sanitize_name(svc->dev, sensor->name);
> +		if (IS_ERR(hwmon_name)) {
> +			ret =3D PTR_ERR(hwmon_name);
> +			goto out_free;
> +		}
> +
> +		sensor->hwmon_dev =3D
> +			devm_hwmon_device_register_with_info(svc->dev, hwmon_name,
> +							     sensor, chip_info, NULL);

[Severity: Medium]
Does this loop incorrectly register a separate hwmon device for each indivi=
dual
sensor instead of grouping them under a single multi-channel hwmon device?

This clutters the /sys/class/hwmon/ namespace with up to 64 separate hwmon
devices.

[Severity: Medium]
Is it appropriate to register hardware monitoring devices directly from a
driver in the drivers/platform/arm64/ directory?

This bypasses maintainer review and increases driver complexity outside of
the hwmon subsystem, violating standard hwmon architecture layering guideli=
nes.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260831-radxa-svc-=
v1-0-7c028de6a387@radxa.com?part=3D2
