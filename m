Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795105083;
	b=iTbxpJpMv8lHzzYxG0v7Wxu3y753g1Tdl9b10oaEi81GJxmWdoOAaEO+VgjcXvzVkiyz
	 Cf8xaqE1hZnjl/dxzKtGQMOtIze3lYSQP+epO7QQEFdGYmrrywciTWXRVdB0XnSYYf2va
	 JvEMJPt+1gOAKL/a+f+1byyP8EjbxvUDiq2GL0wlnhkWoPe5Ii/BhnKj1iuo2uULdITIw
	 0kPORgodPA6BgJlBolpMke2vp9MZGZNowamO5eEQahpHb1JMHROg3MLkoeP2McMKxsTq6
	 gh1QEXxY7Vimm5wIYIE1c/zrvzlmFtOPMpB8nIGPvpQmSLKrICAUGnjvcFWLEpm7M3A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795105083;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=RWnEMkDkC/RdrZWyTACDFpaySqt8duG8zMrTV4QH52o=;
	b=Fx4Wx2TGXD7Ucyj7n3g3y/A1m37+B/SBQHq7Zsld7cmv81kxa+n14dg/C+tzGupClTug
	 9oJHYyi2h2JNeogecuBBYEWcR/Myr0RL0DDi9UcH50k13W0UsfmKvafbripIPpzBUHC1E
	 hWAUHUuiPL25Tb3eGBP2pk6ydGHnFeAV3ToSi+P+G1PzDp8HcUET+rR1KxMF2ZZd4SSb+
	 MOuTwVL1YsJNuLkkpdI9L5fHMpmFgR5BkqTHHQGbLYGGroOwGr+FiTQrpM8Ipb7jL/wax
	 u1PClC7SUPTlXPW4ur0nsEbeqSYABnCS5mPn0jU+XtSrUPo5YE6cRAsrTbWslLcR/7g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=gZdRHn0n;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8ACFE606A333
	for <linux-hwmon@vger.kernel.org>; Thu, 19 Nov 2026 16:18:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=gZdRHn0n
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 05C731F000C5;
	Thu, 19 Nov 2026 16:18:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795105083;
	bh=RWnEMkDkC/RdrZWyTACDFpaySqt8duG8zMrTV4QH52o=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=gZdRHn0nps2/a83/l1fOxUTmUTVRudcw+xgthdNdLH9j88qrnNMFBV+g56e4kUCyC
	 H/9gzIa18Secq2y5sgUIF9+s1fkarJA2SJXWXGQ5AkXge5hzmA2ljJNbLa28K+vRre
	 /ag4ixGFTeOxfOQZXfXTTWlF23oLx/O6sNbcAGP+8t1Vi90R0tgagx/uOQfZy8iOmz
	 8aLM0/wIme4FV7lVfHQuGNjcIG3NX2I94HTWKoslLqiAgCHCV/KY1E0S9VKA40ivI3
	 54cgzQ9AkP8Tkl7azVoPETPZ4EDzR0QrmTTEeOi/V/ORmsXR5578gQdyE47unuI2/D
	 fQXs6i0fXpVpQ==
Message-ID: <sashiko-outbox-223506@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 1/2] hwmon: simatic-ipc-ec-sensors: add BX-54A EC
 driver
Reply-To: sashiko-reviews@lists.linux.dev
To: "Benedikt Niedermayr" <benedikt.niedermayr@siemens.com>
Cc: linux-hwmon@vger.kernel.org
In-Reply-To: <20261119160210.1257890-2-benedikt.niedermayr@siemens.com>
References: <20261119160210.1257890-1-benedikt.niedermayr@siemens.com>
 <20261119160210.1257890-2-benedikt.niedermayr@siemens.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 19 Nov 2026 16:18:02 +0000
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Post: <mailto:linux-hwmon@vger.kernel.org>
List-Help: <mailto:linux-hwmon+help@vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-hwmon+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 1 potential
issue to consider:
- [Medium] hwmon: shared mutable temp config array in
  simatic_ipc_ec_hwmon_probe()
--

commit d1d68eaeccfb28c478d4c0f38bfdd8c663f3ba61
Author: Benedikt Niedermayr <benedikt.niedermayr@siemens.com>

hwmon: simatic-ipc-ec-sensors: add BX-54A EC driver

This commit adds a hardware monitoring driver for temperature sensors and
fan control on the embedded controller of Siemens SIMATIC IPC BX-54A
systems.

> diff --git a/drivers/hwmon/simatic-ipc-ec-sensors.c b/drivers/hwmon/simat=
ic-ipc-ec-sensors.c
> new file mode 100644
> index 0000000000000..05a48faaa1b0d
> --- /dev/null
> +++ b/drivers/hwmon/simatic-ipc-ec-sensors.c

[ ... ]

> +/*
> + * The number of temperature sensor's channels comes from ACPI as it may=
 be different for
> + * different projects. One extra zeroed entry terminates the array.
> + */
> +static u32 simatic_ipc_ec_temp_config[TEMP_MAX_CHANNELS + 1];
> +
> +static struct hwmon_channel_info simatic_ipc_ec_temp_ch_info =3D {
> +	.type =3D hwmon_temp,
> +	.config =3D simatic_ipc_ec_temp_config,
> +};
> +
> +static const struct hwmon_channel_info * const simatic_ipc_ec_hwmon_ch_i=
nfo[] =3D {
> +	&simatic_ipc_ec_temp_ch_info,
> +	NULL
> +};
> +
> +static const struct hwmon_channel_info * const simatic_ipc_ec_fan_ch_inf=
o[] =3D {
> +	HWMON_CHANNEL_INFO(fan, HWMON_F_INPUT | HWMON_F_LABEL),
> +	HWMON_CHANNEL_INFO(pwm, HWMON_PWM_INPUT | HWMON_PWM_ENABLE),
> +	NULL
> +};
> +
> +static const struct hwmon_chip_info simatic_ipc_ec_hwmon_info =3D {
> +	.ops =3D &simatic_ipc_ec_ops,
> +	.info =3D simatic_ipc_ec_hwmon_ch_info,
> +};
> +
> +static const struct hwmon_chip_info simatic_ipc_ec_fan_info =3D {
> +	.ops =3D &simatic_ipc_ec_ops,
> +	.info =3D simatic_ipc_ec_fan_ch_info,
> +};
> +
> +static int simatic_ipc_ec_hwmon_probe(struct device *dev, struct simatic=
_ipc_ec_sensor *data)
> +{
> +	struct simatic_ipc_ec_temp *temp;
> +	struct device *hwmon_dev;
> +	u8 temp_count;
> +	u8 temp_base;
> +	u8 value;
> +	int ret;
> +	u8 ch;
> +
> +	ret =3D device_property_read_u8(dev, "TempRegOffset", &temp_base);
> +	if (ret < 0)
> +		return ret;
> +
> +	ret =3D device_property_read_u8(dev, "TempCount", &temp_count);
> +	if (ret < 0)
> +		return ret;
> +
> +	if (temp_base + temp_count * SIZE_OF_TEMP_REG > 256)
> +		return -EINVAL;
> +
> +	temp =3D devm_kzalloc(dev, sizeof(*temp), GFP_KERNEL);
> +	if (!temp)
> +		return -ENOMEM;
> +
> +	/* Clear flags left over from a previous probe */
> +	memset(simatic_ipc_ec_temp_config, 0, sizeof(simatic_ipc_ec_temp_config=
));
> +
> +	temp->base =3D temp_base;
> +	temp->count =3D temp_count;
> +
> +	data->temp =3D temp;
> +
> +	/* Dynamically create temperature sensor channels */
> +	for (ch =3D 0; ch < temp_count; ch++) {
> +		ret =3D ec_read(temp_reg(temp_base, ch, TEMP_REG_CTR_STATUS), &value);
> +		if (ret < 0)
> +			return ret;
> +
> +		simatic_ipc_ec_temp_config[ch] |=3D HWMON_T_INPUT;
> +
> +		if (value & ALARM_SUPPORT)
> +			simatic_ipc_ec_temp_config[ch] |=3D HWMON_T_MIN | HWMON_T_MAX;
> +
> +		if (value & CRITICAL_SUPPORT)
> +			simatic_ipc_ec_temp_config[ch] |=3D HWMON_T_CRIT;
> +	}
> +
> +	hwmon_dev =3D devm_hwmon_device_register_with_info(dev, "simatic_ipc_ec=
_hwmon",
> +							 data, &simatic_ipc_ec_hwmon_info,
> +							 NULL);

[Severity: Medium]
Can mutating the file-scope simatic_ipc_ec_temp_config[] array in
simatic_ipc_ec_hwmon_probe() corrupt an existing device's configuration or
overflow the attribute array during concurrent probes?

Because hwdev->chip retains a pointer to simatic_ipc_ec_hwmon_info and its
config array for the lifetime of the hwmon device, probing a second
110A5004 instance zeroes and overwrites the channel config backing an
already-registered device.  Also, if two probes run concurrently while
ec_read() sleeps, mutating simatic_ipc_ec_temp_config[] between the
sizing pass (hwmon_num_channel_attrs()) and the population pass
(hwmon_genattrs()) in __hwmon_create_attrs() can write past the end of
the allocated attrs array:

CPU0                                  CPU1
simatic_ipc_ec_hwmon_probe()
  populate simatic_ipc_ec_temp_config
  ...
    __hwmon_create_attrs()
      nattrs =3D hwmon_num_channel_attrs()
      attrs =3D kzalloc_objs(..., nattrs + 1)
                                      simatic_ipc_ec_hwmon_probe()
                                        memset(simatic_ipc_ec_temp_config, =
0, ...)
                                        for (ch =3D 0; ch < temp_count; ch+=
+)
                                          ec_read()
                                          simatic_ipc_ec_temp_config[ch] |=
=3D ...
      hwmon_genattrs()
        attrs[aindex++] =3D ...  <-- heap buffer overflow

Could the channel config be allocated per device, or could a const static
config table be paired with dynamic visibility checks in
simatic_ipc_ec_temp_is_visible()?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261119160210.1257=
890-1-benedikt.niedermayr@siemens.com?part=3D1
