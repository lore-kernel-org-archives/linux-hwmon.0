Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF1F623ABBE;
	Wed, 29 Jul 2026 05:03:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785301437; cv=none; b=ZHc6y8BMaLgK08VjtuuQUgTn8eO27n6AXzRne5Tl0I5w7pdcjz/8Huyk6vk+X9QU3Z0CZ/hrx5C2ybnq47IrJLvcc1pKA4hxirYzy2yPrgEIOrBa+65mJl30xbx2Q9Ddo+Ta7e/bh4zFahYH0gpitK6NNrBnNYwo+/F/gzDEBuE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785301437; c=relaxed/simple;
	bh=KG8PIgqzc0LgBhDeoo7FsguwSk1sdUsa7AUJ3lSHtAA=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=QeB/IKzXsRDFc3+iQOADsl1Y9Hrl71/MVH9+sN/mkGugwOSvEybzMlyxtUjFNvfn6vbw9VP38OTj6nUQns1Z2t1yUukp+5nmZ2y/FBKySJEJiCbl8Rz+w1KT4i3OLUMGPxjkMrzRmaa2plG4OHDPGjsEDX1EYqJM+pUUCnZwSJc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cpTPj7CD; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="cpTPj7CD"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C91D21F000E9;
	Wed, 29 Jul 2026 05:03:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785301435;
	bh=4eBJ/TdYBY5QCia/izfQXOEvMjBJPIVgvX3MF51gk4Q=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=cpTPj7CDHdbk8H3YQyjK9LV9I5zKAiw/UGwW+qllKQkhgIC3qwsg6ne5lcWszQ8Vg
	 puJRAGCKBMc4HPBrBDe0HwCJG90VYiqE7R5C04sVHce0vyxNK1kQ0Qy/lmPCVc8D+b
	 ALBeuU3GBZG9tdPLxDH60JoriudUkHu4p4LCNYAKfGlHqlRLmFMbJhWqBXfC9XCasM
	 Pa+i/5ej8UlsTvoOCj6WtoEs64Kd8pL1ZxbevOyWjzkdFK3SY3uTbt/hemE+bKcQnN
	 bwz5R8MEWL/UKiOe8iKcp+4y21+/j5YaZj1QNSgeMSXc+gQtsKke+JvYEa85qmS750
	 LVpECGJtYUhHg==
From: sashiko-bot@kernel.org
Subject: Re: [hwmon-next PATCH v4 4/4] hwmon: (adt7470) Add thermal zone
 sensor support
Reply-To: sashiko-reviews@lists.linux.dev
To: "Luiz Angelo Daros de Luca" <luizluca@gmail.com>
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org, linux-hwmon@vger.kernel.org
In-Reply-To: <20260729-adt7470_thermalzone-v4-4-c14039dfa0e6@gmail.com>
References: <20260729-adt7470_thermalzone-v4-0-c14039dfa0e6@gmail.com>
 <20260729-adt7470_thermalzone-v4-4-c14039dfa0e6@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 29 Jul 2026 05:03:54 +0000
Message-Id: <20260729050354.C91D21F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:

New issues:
- [Medium] The driver implements PWM functionality directly rather than usi=
ng an auxiliary device.

Pre-existing issues:
- [High] The driver holds a mutex for up to 2 seconds while sleeping during=
 temperature reads, which will severely block thermal core polling.
- [Medium] The driver implements its own lock (`data->lock`) for extra sysf=
s attributes instead of using the required `hwmon_lock()` API.
--

--- Patch [4]: [hwmon-next PATCH v4 4/4] hwmon: (adt7470) Add thermal zone =
sensor support ---
commit a0151226eff53f9134558a65871681b2e48deb5c
Author: Luiz Angelo Daros de Luca <luizluca@gmail.com>

hwmon: (adt7470) Add thermal zone sensor support

This patch registers the ADT7470 temperature channels as thermal zone senso=
rs.

> diff --git a/drivers/hwmon/adt7470.c b/drivers/hwmon/adt7470.c
> index 883838fdcd7db..6cc246aa12851 100644
> --- a/drivers/hwmon/adt7470.c
> +++ b/drivers/hwmon/adt7470.c
> @@ -1349,6 +1349,8 @@ static const struct hwmon_ops adt7470_hwmon_ops =3D=
 {
>  };
> =20
>  static const struct hwmon_channel_info * const adt7470_info[] =3D {
> +	HWMON_CHANNEL_INFO(chip,
> +			   HWMON_C_REGISTER_TZ),

[Severity: High]
This is a pre-existing issue, but does registering the thermal zone cause t=
he
thermal core to severely block on reading temperatures?

The adt7470_update_thread repeatedly acquires data->lock and calls
adt7470_read_temperatures(), which sleeps for up to 2000 ms:

drivers/hwmon/adt7470.c:adt7470_read_temperatures() {
    ...
    res =3D msleep_interruptible((data->num_temp_sensors >=3D 0 ?
                                data->num_temp_sensors * 200 :
                                TEMP_COLLECTION_TIME));
    ...
}

Concurrently, the kernel thermal subsystem automatically polls the temperat=
ure
because this patch registers the sensors as a thermal zone.

The thermal core calls adt7470_update_device(), which blocks on data->lock.
Blocking the thermal core's system-wide freezable workqueue for up to 2
seconds per read causes significant delays for other thermal zones and
background tasks.

[ ... ]

[Severity: Medium]
This is a pre-existing issue, but does the driver violate the subsystem
locking rules by implementing its own lock for sysfs attributes?

drivers/hwmon/adt7470.c:pwm_min_store() {
    ...
    mutex_lock(&data->lock);
    data->pwm_min[attr->index] =3D temp;
    ...
}

The hardware monitoring subsystem guidelines strictly state that drivers mu=
st
use hwmon_lock() and hwmon_unlock() for attributes registered by other mean=
s.

[Severity: Medium]
Is pwm functionality implemented directly within the hardware monitoring
driver rather than using an auxiliary device?

drivers/hwmon/adt7470.c:adt7470_probe() {
    ...
    chip =3D devm_pwmchip_alloc(dev, ADT7470_PWM_COUNT, 0);
    ...
    err =3D devm_pwmchip_add(dev, chip);
    ...
}

The hwmon subsystem guide explicitly mandates that secondary functionalities
must be implemented as an auxiliary device, with the driver residing in the
appropriate subsystem directory.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260729-adt7470_th=
ermalzone-v4-0-c14039dfa0e6@gmail.com?part=3D4
