Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE40A4BFE76
	for <linux-hwmon@vger.kernel.org>; Wed,  9 Sep 2026 22:58:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788994696; cv=none; b=n6gs5PPkykJxX7q3NtcSF63A9SnKVb7u5vWkCT6w9nr7lFWhKzSe59s/Sqj22nLBzWi1cpZHMuW/ejsGF3CSVP5KcIv2Stn5DtPZcqRCrokQK/vbqc83Qy4/ySLnG3DytLCctR94iKbe70zmug9cZbMIcqshyYzk7z3AVYReZ+Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788994696; c=relaxed/simple;
	bh=YY01Hn88f1uavp0n5ntoQvcB+x+eigKvIL/ACcR394g=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=lB/v4IYqVa7EIdAdX/fw0UKILZYINFiASbU1wDkJ8bce3OOTbEhlGkMegEtmjis4A53nrbJKas4gNDM2kZQD5n1KUzPLa3MY2vozSyIpF9Zf+7uSr1G/JehwD6KVBe2SPMWWYGDPQUDjt+Xoq1Nnu4HFMSnpERwb18q2gL3SBWg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Kmeoeh4b; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Kmeoeh4b"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 972151F0089B;
	Wed,  9 Sep 2026 22:58:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788994680;
	bh=njt9s9hEPgxXydeSUyENOA2PRUwSwGjTmTydhTTCSTU=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Kmeoeh4bRQD3g0Cv28F15pZFWNOCdiO/hFFtVivVkgilkU1U1+SDvRzF/b0e/XHc0
	 pgkN0yvZa+ANra5KUFAwLk3eYDxN7hUfRbNMbKy9OZUJKUVK1cJM4Bs5DLfm1zq/Jm
	 tYmkJUgiUvUKFyQO5lrLOENAUBzgSSVGxs5RBDZBx6I5FtmwP6N4KnA/aEa1tqH8pw
	 LhrSnGHF5YTDNXpgky1exjXEvag2ccZnSFv6RrhFfgiHm9bQW10hR03Dy5xEqTTDQ2
	 mkjTJas9AePr4Zu3uqkJB+DT+lgAp8cijsujMyBbMkQ4ZIxj93O9bMcjn5nmjtafQ7
	 DTRBEQNZuBWwg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH net-next v3 6/6] eth: fbnic: firmware notifies hwmon on
 sensor threshold events
Reply-To: sashiko-reviews@lists.linux.dev
To: "Zinc Lim" <limzhineng2@gmail.com>
Cc: linux-hwmon@vger.kernel.org
In-Reply-To: <20260908225737.3034403-7-limzhineng2@gmail.com>
References: <20260908225737.3034403-1-limzhineng2@gmail.com>
 <20260908225737.3034403-7-limzhineng2@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 09 Sep 2026 22:58:00 +0000
Message-Id: <20260909225800.972151F0089B@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [Medium] Missing memory release semantics when publishing the `hwmon` poi=
nter allows concurrent IRQ handler to observe uninitialized memory.
- [Medium] Threshold comparison does not handle FBNIC_SENSOR_NO_DATA for mi=
ssing firmware capabilities, causing incorrect hwmon alarms.
--

commit 5008b411c2a8813d473926829690169559798a63
Author: Zinc Lim <limzhineng2@gmail.com>

eth: fbnic: firmware notifies hwmon on sensor threshold events
   =20
The firmware sends an unsolicited message via the new
FBNIC_TLV_MSG_ID_SENSOR_THRESHOLD_EXCEEDED_RESP IPC message when a
temperature or voltage sensor crosses one of its thresholds. Parse this
message and translate it into the corresponding hwmon alarm
(temp1_{min,max,crit}_alarm or in0_{min,max}_alarm) via
hwmon_notify_event(), so userspace listeners are woken on the relevant
sysfs attribute.
   =20
fbnic_hwmon_notify_event() is driven from the FW mailbox IRQ path, so it
can run concurrently with hwmon registration and teardown. Guard the
publish/teardown of fbd->hwmon: register publishes it with WRITE_ONCE()
only after a successful registration (and leaves it NULL on failure),
unregister clears it with WRITE_ONCE(NULL) and then
synchronize_irq(fbd->fw_msix_vector) to drain any in-flight mailbox IRQ
before unregistering, and notify_event reads it once with READ_ONCE() and
skips the notification when it is NULL.
   =20
Signed-off-by: Zinc Lim <limzhineng2@gmail.com>

[ ... ]

> diff --git a/drivers/net/ethernet/meta/fbnic/fbnic_hwmon.c b/drivers/net/=
ethernet/meta/fbnic/fbnic_hwmon.c
> index 11fa8aab0f5b2..2dff59bc0e8ba 100644
> --- a/drivers/net/ethernet/meta/fbnic/fbnic_hwmon.c
> +++ b/drivers/net/ethernet/meta/fbnic/fbnic_hwmon.c
> @@ -206,6 +206,8 @@ static const struct hwmon_chip_info fbnic_chip_info =
=3D {
> =20
>  void fbnic_hwmon_register(struct fbnic_dev *fbd)
>  {
[ ... ]
> -	fbd->hwmon =3D hwmon_device_register_with_info(fbd->dev, "fbnic",
> -						     fbd, &fbnic_chip_info,
> -						     NULL);
> -	if (IS_ERR(fbd->hwmon)) {
> +	hwmon =3D hwmon_device_register_with_info(fbd->dev, "fbnic", fbd,
> +						&fbnic_chip_info, NULL);
> +	if (IS_ERR(hwmon)) {
>  		dev_notice(fbd->dev,
>  			   "Failed to register hwmon device %pe\n",
> -			   fbd->hwmon);
> -		fbd->hwmon =3D NULL;
>  	}
> +
> +	WRITE_ONCE(fbd->hwmon, hwmon);

[Severity: Medium]
Could this WRITE_ONCE() allow an active IRQ handler to observe an
incompletely initialized hwmon device pointer?

The FW mailbox IRQ could already be active when fbnic_hwmon_register() is
called. If an unsolicited threshold event arrives right after this
WRITE_ONCE() executes, but before the memory stores that initialize the
hwmon device are globally visible, the IRQ handler might read the pointer
and access uninitialized fields.

Since WRITE_ONCE() provides atomicity but lacks memory release semantics, on
weakly ordered architectures the CPU is permitted to let the pointer store
float past the one-way unlock barrier inside the registration function.
Would it be safer to use smp_store_release() here (and smp_load_acquire()
in the reader) to ensure lockless publication rules are met?

>  }
> =20
>  void fbnic_hwmon_unregister(struct fbnic_dev *fbd)
>  {
[ ... ]
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

[Severity: Medium]
Does this threshold comparison handle missing firmware capabilities properl=
y?

If the firmware does not support a specific threshold (e.g., temp.crit), the
corresponding capability field is initialized to FBNIC_SENSOR_NO_DATA,
which expands to S32_MIN (-2147483648).

When a threshold event arrives for a valid threshold (like temp.max), these
sequential checks evaluate the missing threshold first. Any valid positive
temperature will evaluate (val >=3D fbd->fw_cap.temp.crit) as true since it
is comparing against S32_MIN.

Could this trigger false alarms and shadow lower-priority valid thresholds?
Should the logic validate against FBNIC_SENSOR_NO_DATA before performing
these comparisons?

> +
> +		break;
> +	case FBNIC_SENSOR_VOLTAGE:
> +		type =3D hwmon_in;
> +
> +		if (val <=3D fbd->fw_cap.volt.min)
> +			attr =3D hwmon_in_min_alarm;
> +		else if (val >=3D fbd->fw_cap.volt.max)
> +			attr =3D hwmon_in_max_alarm;

[Severity: Medium]
Does the voltage threshold logic suffer from the same issue where
unsupported limits could trigger false alarms?

> +
> +		break;
> +	default:
> +		return;
> +	}
> +
> +	/* Pair with WRITE_ONCE() in fbnic_hwmon_unregister(). Skip the
> +	 * notification if hwmon failed to register or has already been torn
> +	 * down.
> +	 */
> +	hwmon =3D READ_ONCE(fbd->hwmon);

[Severity: Medium]
To pair with the publication in fbnic_hwmon_register(), should this be an
smp_load_acquire() to prevent reading the pointer before its contents are
fully initialized?

> +	if (attr >=3D 0 && hwmon)
> +		hwmon_notify_event(hwmon, type, attr, 0);
>  }

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260908225737.3034=
403-1-limzhineng2@gmail.com?part=3D6
