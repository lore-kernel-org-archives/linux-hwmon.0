Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0C983B0AC6
	for <linux-hwmon@vger.kernel.org>; Tue,  1 Sep 2026 21:23:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788297787; cv=none; b=EvtX3/K2kJfrVMUori8DRerLXirqZRAPC8H0TL05vhgljv87Gf6IJU59fFMmktqyH4/pkdjTlfn6O8BgZEziTxOXSn4yqjYJkGsvHb67VwBUIvdKhBDf8VqdS9E2pTu8vXELnVZ2TDVNWBrIzmk1vE/VrgIuH98cJ6aE0vk8TNI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788297787; c=relaxed/simple;
	bh=iM2pAxiB38LacVZiMBowvHoSaRCM4MHNSWhzBQkRYTU=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=P9SbJLXg/VzItkeKeTOJIg8LxAIvh53HZ8EHjVu0sbTLc2FTuJst5O7saBkae4g+7/BfQ6YZkPMAjdDvWC201fV3OKbPIsN/1Q2DTtx1lvYMRgL+lE3RE4cS9hBzwhe1I0JFFP/WpwANQIvVXRHQTE1afXhuPiL6FWKm+xEm5Og=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=MXL29gsz; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="MXL29gsz"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8B8611F000E9;
	Tue,  1 Sep 2026 21:23:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788297785;
	bh=CBntn2NenCPv60B1yT/66v1Kc+wjSc0BEOv6YVUfNgg=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=MXL29gszlUkaHe9sj2zLvCUSazc+5fTJSMSPPtz5hAwxE49CedVCUAH9jfNocExpU
	 iZxvak6EJv4THRr66ZQKGimyMQcBtzRrbXyRx7nEfcXIOCsoKTHOSVYClUQ824klpi
	 i4ebzwqYcIhUaM3tDEnYjJWnrxH7IVY7ofck3w0mBW9wOB+FfbWjqwjzzqZCvclNtZ
	 QxNxxvI302DYFifZdNR2zhlh7N3lE0R11Nt69MC7CKtyHVXrIQ+0KgUACvo0Yar60y
	 lYNXfTz/oPpdbxhgFsKWVmlbM/ZWr6CBSjDw2wdA3hcbCwck+WX0RkUw+kMt86pfbD
	 5KOJWTemVoVkw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH net-next v2 6/6] eth: fbnic: firmware notifies hwmon on
 sensor threshold events
Reply-To: sashiko-reviews@lists.linux.dev
To: "Zinc Lim" <limzhineng2@gmail.com>
Cc: linux-hwmon@vger.kernel.org
In-Reply-To: <20260831212234.1212971-7-limzhineng2@gmail.com>
References: <20260831212234.1212971-1-limzhineng2@gmail.com>
 <20260831212234.1212971-7-limzhineng2@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 01 Sep 2026 21:23:05 +0000
Message-Id: <20260901212305.8B8611F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [High] Unpopulated firmware thresholds (FBNIC_SENSOR_NO_DATA / S32_MIN) a=
re incorrectly evaluated as crossed, causing wrong alarms to be attributed.
- [Medium] Calling synchronize_irq() with an uninitialized or freed IRQ vec=
tor (0) can block on unrelated system interrupts.
--

commit 29bf1cd49123c450c788d4c7179ddacd012338e7
Author: Zinc Lim <limzhineng2@gmail.com>

eth: fbnic: firmware notifies hwmon on sensor threshold events

This patch handles firmware notifications for sensor threshold events, pars=
ing
the IPC message and mapping it to the corresponding hwmon alarm. It also ad=
ds
concurrency guards to the hwmon registration and teardown paths.

[ ... ]
> diff --git a/drivers/net/ethernet/meta/fbnic/fbnic_hwmon.c b/drivers/net/=
ethernet/meta/fbnic/fbnic_hwmon.c
> index c5cddd9cef124..3f33522fcfd2b 100644
> --- a/drivers/net/ethernet/meta/fbnic/fbnic_hwmon.c
> +++ b/drivers/net/ethernet/meta/fbnic/fbnic_hwmon.c
[ ... ]
> @@ -214,22 +216,75 @@ void fbnic_hwmon_register(struct fbnic_dev *fbd)
>  void fbnic_hwmon_unregister(struct fbnic_dev *fbd)
>  {
> +	struct device *hwmon;
> +
>  	if (!IS_REACHABLE(CONFIG_HWMON) || !fbd->hwmon)
>  		return;
> =20
> -	hwmon_device_unregister(fbd->hwmon);
> -	fbd->hwmon =3D NULL;
> +	hwmon =3D fbd->hwmon;
> +	/* Pair with READ_ONCE() in fbnic_hwmon_notify_event(). Publish NULL
> +	 * and wait for any in-flight FW mailbox IRQ handler to finish so it
> +	 * cannot dereference the hwmon device after we unregister it.
> +	 */
> +	WRITE_ONCE(fbd->hwmon, NULL);
> +	synchronize_irq(fbd->fw_msix_vector);

[Severity: Medium]
Could this call block on unrelated system interrupts if the vector is 0?

During device suspend, fbnic_pm_suspend() frees the mailbox IRQ and sets
fbd->fw_msix_vector =3D 0. If the device is subsequently removed (e.g., via
hotplug or driver unload while suspended), fbnic_remove() calls
fbnic_hwmon_unregister() which then unconditionally calls
synchronize_irq(0).

On architectures like x86, IRQ 0 is a valid system interrupt (such as the
PIT timer). Will this cause the driver to pointlessly block waiting for
the timer interrupt handler to finish?

> +
> +	hwmon_device_unregister(hwmon);
> +}
> +
> +void fbnic_hwmon_notify_event(struct fbnic_dev *fbd, int id, long val)
> +{
> +	enum hwmon_sensor_types type;
> +	struct device *hwmon;
> +	s32 attr =3D -1;
> +
> +	if (!IS_REACHABLE(CONFIG_HWMON))
> +		return;
> +
> +	switch (id) {
> +	case FBNIC_SENSOR_TEMP:
> +		type =3D hwmon_temp;
> +
> +		if (val <=3D fbd->fw_cap.temp.min)
> +			attr =3D hwmon_temp_min_alarm;
> +		else if (val >=3D fbd->fw_cap.temp.crit)
> +			attr =3D hwmon_temp_crit_alarm;
> +		else if (val >=3D fbd->fw_cap.temp.max)
> +			attr =3D hwmon_temp_max_alarm;

[Severity: High]
Does this logic correctly handle unpopulated firmware thresholds?

If a limit such as fbd->fw_cap.temp.crit is unpopulated, it is stored as
FBNIC_SENSOR_NO_DATA (S32_MIN). Since any valid sensor reading will be
greater than S32_MIN, the condition (val >=3D fbd->fw_cap.temp.crit) will
evaluate to true.

Can this falsely trigger hwmon_temp_crit_alarm for normal sensor values
and mask other valid alarms like hwmon_temp_max_alarm? Should we verify
that the threshold is valid (!=3D FBNIC_SENSOR_NO_DATA) before comparing it
against the sensor reading?

> +
> +		break;
> +	case FBNIC_SENSOR_VOLTAGE:
> +		type =3D hwmon_in;
> +
> +		if (val <=3D fbd->fw_cap.volt.min)
> +			attr =3D hwmon_in_min_alarm;
> +		else if (val >=3D fbd->fw_cap.volt.max)
> +			attr =3D hwmon_in_max_alarm;

[Severity: High]
Does the same issue apply here for missing voltage maximum thresholds?

If fbd->fw_cap.volt.max is FBNIC_SENSOR_NO_DATA (S32_MIN), will this
incorrectly trigger an alarm for any valid voltage reading?

> +
> +		break;
> +	default:
> +		return;
> +	}
[ ... ]

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260831212234.1212=
971-1-limzhineng2@gmail.com?part=3D6
