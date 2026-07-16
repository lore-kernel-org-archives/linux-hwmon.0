Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76DB41A0B15;
	Thu, 16 Jul 2026 21:36:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784237814; cv=none; b=VpYnyiN9tvwDIzwLTwtORNa/bDHkXOJdZQKA51pyqum6klDUHGm+cs6TQhcCx8KfHYjOm7Nph/QFMQWHgVtMfo3H1+MErTgBh2paQDM9BhL+XskhB8VhM5fw2u35OeghlTqh0EY8u2zqvPSTVgHQkCyToIL3ufoE4mVN8ActoU4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784237814; c=relaxed/simple;
	bh=z7Q5WhJFmYj8Kd5jn3f1W7ajrbGwSotI7z/+foUi/mI=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=D9r45s1lqrnjazSUHoF3AJnSaXdyul6eZnm0N1lOphMCJmdpeCvdu5/KYYY3EP1xSE/NqeKNnDzNV8/KC3QZHZD5NY0+Cmw3e5jWpH5lipZyoYUHSy8zAQ7O5+5FYMHA8JdprGCUjGEVWxlscrcAjtVqc+qWmVZSeygTrIl6Cyc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=VkgkYrcV; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="VkgkYrcV"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B4FC51F000E9;
	Thu, 16 Jul 2026 21:36:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784237813;
	bh=4PlMiR/cc6csJh0fd7nT5NBxDj0ztoHklpHnBL/m2No=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=VkgkYrcV287PqvoLPg+adjgejk48yYXVGJn0Pdr2ZlOJ1cV9Ezrj85MeA+mnqANOG
	 wBLhnatz4ZakPNN6LsNhYMcmpGivIMlUVi1LNJ6JaLXuPMRXwLf36B1ZQUqsqop/2U
	 JuQorbEeq0zQ1KRqNB4NPVq2yGHY+b4sz8rrZI3UdJmohNS6INA1nCS5K8Bh116k7y
	 kW38DPZgy4KCPzgzb3b2ggDhComXiGBJCkAvNZttVWbgRpM9EbKvVAH3Fy/9Xt3OVP
	 OEOhnx7io3AEPgUKQbS/Db7TmbkT1MW28bIQm2GH+iSXsSLPhavj+4rgQr2mptkdwx
	 TC1hvNNKuGdwQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 4/4] hwmon: (adt7470) Add thermal zone sensor support
Reply-To: sashiko-reviews@lists.linux.dev
To: "Luiz Angelo Daros de Luca" <luizluca@gmail.com>
Cc: linux-hwmon@vger.kernel.org, robh@kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org
In-Reply-To: <20260716-adt7470_thermalzone-v1-4-cc55ef35edde@gmail.com>
References: <20260716-adt7470_thermalzone-v1-0-cc55ef35edde@gmail.com>
 <20260716-adt7470_thermalzone-v1-4-cc55ef35edde@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 16 Jul 2026 21:36:51 +0000
Message-Id: <20260716213652.B4FC51F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 5 potential issue(=
s) to consider:
- [High] The thermal zone callback `adt7470_get_temp()` relies on a cached =
temperature array (`data->temp`) that is never updated by the background th=
read, resulting in permanently stale temperature readings.
- [High] Severe lock contention on `data->lock` stalling the thermal pollin=
g worker for up to 2 seconds.
- [High] Unprotected call to `adt7470_update_sensors()` during probe races =
with sysfs reads, allowing concurrent execution and hardware state corrupti=
on.
- [High] Cooling device ID collision prevents independent PWM channel contr=
ol because `devm_thermal_of_child_cooling_device_register()` hardcodes `cde=
v_id =3D 0`.
- [Medium] The newly added thermal callback violates the hwmon subsystem lo=
cking guidelines by using a private mutex instead of `hwmon_lock()`.
--

--- Patch [4]: [PATCH 4/4] hwmon: (adt7470) Add thermal zone sensor support=
 ---
commit 76a97c2b3fe41c135377aaeddcae6f2428b2ba1f
Author: Luiz Angelo Daros de Luca <luizluca@gmail.com>

hwmon: (adt7470) Add thermal zone sensor support
   =20
Expose the ADT7470 external temperature sensors to the thermal framework
via Device Tree. The thermal callbacks use the driver's cached sensor data,
avoiding any I2C bus traffic during frequent polling by the thermal core.

> diff --git a/drivers/hwmon/adt7470.c b/drivers/hwmon/adt7470.c
> index b865f4bd50f87..44fe310f06506 100644
> --- a/drivers/hwmon/adt7470.c
> +++ b/drivers/hwmon/adt7470.c

[ ... ]

> @@ -957,6 +963,47 @@ static int adt7470_register_cooling_devices(struct d=
evice *dev,
>  	return 0;
>  }
> =20
> +static int adt7470_get_temp(struct thermal_zone_device *tz, int *temp)
> +{
> +	struct adt7470_thermal_sensor *sensor =3D thermal_zone_device_priv(tz);
> +	struct adt7470_data *data =3D sensor->data;
> +
> +	mutex_lock(&data->lock);

[Severity: Medium]
Does using this private mutex violate the hwmon subsystem locking guideline=
s?

The documentation specifies that drivers should use hwmon_lock() and
hwmon_unlock() for attributes registered outside the hwmon core, rather than
their internal lock.

[Severity: High]
Can taking this lock cause the thermal polling worker to stall?

The background thread adt7470_update_thread() acquires data->lock and then
sleeps for up to 2 seconds while waiting for hardware measurements:

adt7470_read_temperatures()
    res =3D msleep_interruptible((data->num_temp_sensors >=3D 0 ?
                                data->num_temp_sensors * 200 :
                                TEMP_COLLECTION_TIME));

Any concurrent attempt by the thermal core to call adt7470_get_temp() will
block on this exact same mutex for the duration of that sleep, potentially
starving the system thermal workqueue.

> +	*temp =3D 1000 * data->temp[sensor->id];

[Severity: High]
Will this temperature reading remain permanently stale?

The background thread adt7470_update_thread() calls
adt7470_read_temperatures(), which initiates conversions but returns early
without reading the values:

adt7470_read_temperatures()
    if (data->num_temp_sensors >=3D 0)
        return 0;

Since it bypasses reading the results into the data->temp cache, and the ca=
che
is exclusively updated when userspace reads sysfs attributes via
adt7470_update_sensors(), relying entirely on the thermal core for polling
will prevent the reported temperature from ever changing.

> +	mutex_unlock(&data->lock);
> +
> +	return 0;
> +}

[ ... ]

> @@ -1401,6 +1448,10 @@ static int adt7470_probe(struct i2c_client *client)
>  		err =3D adt7470_register_cooling_devices(dev, data);

[Severity: High]
Does this cause a cooling device ID collision?

In adt7470_register_cooling_devices(), the driver loops to register 4 separ=
ate
cooling devices using devm_thermal_of_child_cooling_device_register(), pass=
ing
the exact same device node:

adt7470_register_cooling_devices()
    cdev =3D devm_thermal_of_child_cooling_device_register(dev,
                                                         dev->of_node,
                                                         ...);

Because this child API internally hardcodes cdev_id =3D 0, all 4 channels e=
nd up
sharing identical matching criteria. This prevents the thermal framework fr=
om
distinguishing between the PWM cooling devices, destroying independent chan=
nel
control.

[Severity: High]
Is there a race condition with sysfs reads during probe?

Earlier in adt7470_probe(), the hwmon device is registered with
devm_hwmon_device_register_with_info(), exposing sysfs attributes to usersp=
ace.
Immediately after, adt7470_update_sensors(data) is called without holding
data->lock:

adt7470_probe()
    hwmon_dev =3D devm_hwmon_device_register_with_info(...)
    ...
    err =3D adt7470_update_sensors(data);

A concurrent sysfs read can trigger adt7470_update_device(), which takes the
lock and calls adt7470_update_sensors() simultaneously. This interleaved
execution inside adt7470_read_temperatures() could corrupt hardware sequenc=
es.

>  		if (err)
>  			return err;
> +
> +		err =3D adt7470_register_thermal_sensors(dev, data);
> +		if (err)
> +			return err;
>  	}

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260716-adt7470_th=
ermalzone-v1-0-cc55ef35edde@gmail.com?part=3D4
