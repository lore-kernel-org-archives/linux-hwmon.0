Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59FAF3CCFD4;
	Thu, 30 Jul 2026 21:43:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785447796; cv=none; b=Azg9ZGPxppiYkHOV0imSrVMLAOL32zDHdbpzqK2OHbuIe4KvVq6VIkIbYuY41TsHye/tVaz/h4zQRF8kozE2ynfafsLFRTcbb0omgB6meYw+q0A7UBURVZ4zWKXDJic6x6l/KyV7M88fnlLJV2F/8TAnIW9hrXvvmL79wlSnIeA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785447796; c=relaxed/simple;
	bh=V9rYynbSE+1wHx1sDb7iECiRI5J+f8taN6rZWUqWtEg=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=AAilkMy08exkstJZtORXm8JnKmidScL7fuc8BGodetdmteQXckZUF4u2692LOnfT9xODYcOzY6nNzzDd/WA5BP1FVLBGaWf7+bjSVd5guC+PKP7hYeIWnwFZnEaRvc5JeoS+B7A3Cl3z0ojAbmYgv16VOEhNiuFQJVBujqtLcrc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CVwYX2dN; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CVwYX2dN"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 427691F000E9;
	Thu, 30 Jul 2026 21:43:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785447795;
	bh=4FUmNq/usI5vewlnY/6oOnz5o3JSNvbj54eRDZLgEY0=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=CVwYX2dNha22tV3mDPPRTFwLiF+uQeagHW6mMR5GDuA8o9B8VgHyaFPO3GEnPp+XZ
	 4bPVGK7BegZ65fG88L4JET2oMl26N19DPGKL5Xe/PTamX3c0RaKXj3dHl7ZSglaqb3
	 HMoBctje2wFqhHAMn4TZfrofhLmIwxoLoMDU+dkebcUHXWOAjf2gDaNagmjWJzDXHw
	 Gr2EoSN1XHvIPq0aSweRaHhWZCggDYTvJTFP6y+9ImQZol+LZTTNBs1mA45Inmqclk
	 k8DSGBt0HTVx5hBEZD26hg1O0jEZ5Mbnyz22SuUx++OWLicmaNBbv5aLryqsTX0z2a
	 r3ZsQjZnzUsCg==
From: sashiko-bot@kernel.org
Subject: Re: [hwmon-next PATCH v5 4/4] hwmon: (adt7470) Add thermal zone
 sensor support
Reply-To: sashiko-reviews@lists.linux.dev
To: "Luiz Angelo Daros de Luca" <luizluca@gmail.com>
Cc: robh@kernel.org, linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org
In-Reply-To: <20260730-adt7470_thermalzone-v5-4-42995a6bb8c5@gmail.com>
References: <20260730-adt7470_thermalzone-v5-0-42995a6bb8c5@gmail.com>
 <20260730-adt7470_thermalzone-v5-4-42995a6bb8c5@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 30 Jul 2026 21:43:13 +0000
Message-Id: <20260730214314.427691F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] Registering the device as a thermal zone exposes the thermal subsy=
stem to severe latency stalls.
--

--- Patch [4]: [hwmon-next PATCH v5 4/4] hwmon: (adt7470) Add thermal zone =
sensor support ---
commit ee08dfc4b8ac9e072681b3ebf92b63eb473bf1a7
Author: Luiz Angelo Daros de Luca <luizluca@gmail.com>

hwmon: (adt7470) Add thermal zone sensor support

This commit registers the ADT7470 temperature channels as thermal zone
sensors.

> diff --git a/drivers/hwmon/adt7470.c b/drivers/hwmon/adt7470.c
> index eeec3db0da88d..f652532f2f32e 100644
> --- a/drivers/hwmon/adt7470.c
> +++ b/drivers/hwmon/adt7470.c
> @@ -1396,6 +1396,8 @@ static const struct hwmon_ops adt7470_hwmon_ops =3D=
 {
>  };
> =20
>  static const struct hwmon_channel_info * const adt7470_info[] =3D {
> +	HWMON_CHANNEL_INFO(chip,
> +			   HWMON_C_REGISTER_TZ),

[Severity: High]
Will registering this device as a thermal zone cause severe latency stalls
for the thermal subsystem?

Looking at the background thread in the driver, it acquires the internal lo=
ck
before initiating a slow temperature read:

adt7470_update_thread() {
    ...
    mutex_lock(&data->lock);
    adt7470_read_temperatures(data);
    mutex_unlock(&data->lock);
    ...
}

Inside adt7470_read_temperatures(), the thread can sleep for up to 2 seconds
while still holding this lock:

adt7470_read_temperatures() {
    ...
    res =3D msleep_interruptible((data->num_temp_sensors >=3D 0 ?
                                data->num_temp_sensors * 200 :
                                TEMP_COLLECTION_TIME));
    ...
}

Since thermal zone registration causes the thermal core to automatically
and periodically poll the device, the thermal worker thread will attempt to
acquire data->lock. Because the lock is held for up to 2 seconds by the
background kthread, the thermal polling thread will be frequently delayed.

Additionally, while the thermal thread waits for data->lock, it also holds
the core hwdev->lock, which means any other userspace sysfs reads or writes
to this hwmon device will also stall.

Could this delay thermal mitigations for other devices on the system?

>  	HWMON_CHANNEL_INFO(temp,
>  			   HWMON_T_INPUT | HWMON_T_MIN | HWMON_T_MAX | HWMON_T_ALARM,
>  			   HWMON_T_INPUT | HWMON_T_MIN | HWMON_T_MAX | HWMON_T_ALARM,

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260730-adt7470_th=
ermalzone-v5-0-42995a6bb8c5@gmail.com?part=3D4
