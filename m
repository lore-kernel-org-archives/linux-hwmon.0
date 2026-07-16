Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74A601A0B15;
	Thu, 16 Jul 2026 21:37:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784237831; cv=none; b=XtpfMOZvu210MwnCU4BagXWjsLTMraj8owKV+74lD6AHVTbu4AhuZ9lnWlHjAvqYOnatKw+j1/0tN3006wkcKafr0fo9dLqJhu82OxyA+8iCwOBxcaWFdlkXam4aYocRZwK7pags47nxDQ7ylL7nXPWotuyOEnbT7Aujgh54OpQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784237831; c=relaxed/simple;
	bh=kJIyqYpfQow1TS/3SmBswAfbEcuHT3cvZ8unMSy2O4s=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=FMyXO5ROLyXGJqpkBPvSgpsj2z87QQnmD2yyCS+ofn9oDVYwraQaYfiyM1EOjPcfiBB/LwSXkwlQoHp1hy71pg7eDbrAXAd36VbevDRVPEps499T7jHnolVd3rgNoiAePG8Psayi3R56SLSJF568Ypwpwp6orpPC0j+f/FPcZ18=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fVTuG4zn; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fVTuG4zn"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B6D651F000E9;
	Thu, 16 Jul 2026 21:37:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784237830;
	bh=pxZEod5uNe4GZICUj9v9Smnan7/Y3Wax+NjppLkSAeM=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=fVTuG4znLdYnHm3IEUJmt1CuKWshYbgvEJkNwAMoBniqN1t6iRbWgRQec/zJIvzMi
	 dAzDwRHNhlRCqYdDYFRqbYQegkxHqDGPjGQs4udGVPTAriVJgojKar4oMgiL2n3zDu
	 F/dUJx6KEbMyLBhqEHhfChyMHwhXFHR0pLSkfF7Pb09y0JhAP278U1K4FvlB6WFujq
	 OjT6aslMlRp4guIKqleBxDcLr/WlMZXNGe1uN03NiupTHr1DgzRmFZCZX4F+6aiZkc
	 SrMY19SnOpI9jMvMG18+4SlIxWGGQzPGgJixdzJdPLNXLQ/9AxdcP6FccDVt8YAKZ7
	 I/TnGbQUV1SGg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 3/4] hwmon: (adt7470) Add thermal cooling device support
Reply-To: sashiko-reviews@lists.linux.dev
To: "Luiz Angelo Daros de Luca" <luizluca@gmail.com>
Cc: linux-hwmon@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260716-adt7470_thermalzone-v1-3-cc55ef35edde@gmail.com>
References: <20260716-adt7470_thermalzone-v1-0-cc55ef35edde@gmail.com>
 <20260716-adt7470_thermalzone-v1-3-cc55ef35edde@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 16 Jul 2026 21:37:09 +0000
Message-Id: <20260716213709.B6D651F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:
- [High] All 4 PWM cooling devices are registered with identical device tre=
e nodes and cdev_id, preventing independent thermal zone binding.
- [High] `adt7470_update_sensors()` is called locklessly in `adt7470_probe(=
)` after the hwmon device is registered, leading to a severe data race.
- [Medium] The driver unconditionally registers all 4 cooling devices, fail=
ing to make them optional based on `#cooling-cells`, contrary to the commit=
 message.
--

--- Patch [3]: [PATCH 3/4] hwmon: (adt7470) Add thermal cooling device supp=
ort ---
commit f3b7f3fcc935f749dd7f53e14d3533656b277e5b
Author: Luiz Angelo Daros de Luca <luizluca@gmail.com>

hwmon: (adt7470) Add thermal cooling device support

The ADT7470 has four PWM outputs that can be used to control fans.
Register each PWM output as an optional thermal cooling device via
Device Tree so it can be referenced by thermal zones.

When the thermal subsystem sets a cooling state, the driver switches
the corresponding PWM channel to manual mode so that the requested duty
cycle takes effect.

> Registration is optional: when the "#cooling-cells" property is absent,
> devm_thermal_of_child_cooling_device_register() returns -ENODEV and the
> driver silently skips that PWM channel.

[Severity: Medium]
Is this description accurate? Looking at thermal_of_cooling_device_register=
(),
it does not appear to parse the device tree for #cooling-cells during
registration. Since it doesn't return -ENODEV for a missing property,
doesn't this result in unconditionally registering all 4 cooling devices
even if the device tree does not specify them?

[ ... ]

> diff --git a/drivers/hwmon/adt7470.c b/drivers/hwmon/adt7470.c
> index 4ac292cd7f47e..b865f4bd50f87 100644
> --- a/drivers/hwmon/adt7470.c
> +++ b/drivers/hwmon/adt7470.c

[ ... ]

> @@ -846,6 +856,107 @@ static int adt7470_pwm_write(struct device *dev, u3=
2 attr, int channel, long val
[ ... ]
> +static int adt7470_register_cooling_devices(struct device *dev,
> +					    struct adt7470_data *data)
> +{
> +	int i;
> +
> +	for (i =3D 0; i < ADT7470_PWM_COUNT; i++) {
> +		struct thermal_cooling_device *cdev;
> +		char cdev_name[THERMAL_NAME_LENGTH];
> +
> +		data->cooling_devices[i].data =3D data;
> +		data->cooling_devices[i].pwm_index =3D i;
> +
> +		snprintf(cdev_name, sizeof(cdev_name), "adt7470-pwm%d", i);
> +		cdev =3D devm_thermal_of_child_cooling_device_register(dev,
> +								     dev->of_node, cdev_name,
> +								     &data->cooling_devices[i],
> +								     &adt7470_cooling_ops);

[Severity: High]
When registering the cooling devices in a loop, does passing the same parent
dev->of_node for every PWM channel prevent independent thermal zone binding?

Since __devm_thermal_of_cooling_device_register() binds them all with the
same node, they will all get assigned cdev_id =3D 0. When the thermal core
parses a DT cooling map requiring a specific cdev_id, will it fail to match
the individual channels since they are indistinguishable?

> +
> +		if (IS_ERR(cdev)) {
> +			if (PTR_ERR(cdev) =3D=3D -ENODEV)
> +				continue;

[Severity: Medium]
Will this check ever be hit? As noted in the commit message review above,
the thermal registration API does not return -ENODEV for missing device
tree properties, which causes all PWM channels to be registered
unconditionally.

> +			return dev_warn_probe(dev, PTR_ERR(cdev),
> +					      "failed to register cooling device %s\n",
> +					      cdev_name);
> +		}
> +	}
> +
> +	return 0;
> +}

[ ... ]

> @@ -1281,6 +1392,17 @@ static int adt7470_probe(struct i2c_client *client)
>  	if (IS_ERR(hwmon_dev))
>  		return PTR_ERR(hwmon_dev);
> =20
> +	if (IS_ENABLED(CONFIG_THERMAL)) {
> +		/* fill the cache before registering the cooling devices */
> +		err =3D adt7470_update_sensors(data);

[Severity: High]
Can this call to adt7470_update_sensors() cause hardware configuration
corruption due to a missing lock?

This is executed in adt7470_probe() immediately after the hwmon device is
registered, meaning sysfs attributes are already exposed to userspace.

Since adt7470_update_sensors() calls adt7470_read_temperatures(), which
explicitly assumes data->lock is held while performing multi-step register
manipulations and a 2-second sleep, what prevents a concurrent userspace sy=
sfs
access from racing during this window and corrupting the PWM configuration?

> +		if (err)
> +			return err;
> +
> +		err =3D adt7470_register_cooling_devices(dev, data);
> +		if (err)
> +			return err;
> +	}
> +
>  	data->auto_update =3D kthread_run(adt7470_update_thread, client, "%s",
>  					dev_name(hwmon_dev));

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260716-adt7470_th=
ermalzone-v1-0-cc55ef35edde@gmail.com?part=3D3
