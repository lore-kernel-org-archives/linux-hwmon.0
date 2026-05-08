Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71A35314B8F
	for <linux-hwmon@vger.kernel.org>; Fri,  8 May 2026 19:07:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778267226; cv=none; b=HSN/qhIgLzTNUXKvZqAg9ycFF1eUtAP2qmmmSQIHe7afbG+5HXnNd/km9ULqSw20bMgD2c25x0t3MBzeVfrs1DjXJjs+FAQJtiWRSupDWxNiINMzze1ivEpDcUWV6ri9Fxr9Q0NNVoE0T2/wRsIFO+6+pu8k/DJhNoNJHmxYw2U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778267226; c=relaxed/simple;
	bh=GIknDbj88+RKDv6/iF44RcXuLQs7MAoEkrxLWGpKqnM=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=miirLJ2hoqfSVXJC4Z50cD8jOyuAgcsz94V+/Vak8L8m7jVJNmZ4oxskSdCUuajXm5pvAMuE32pHfnuYLUtQM/OgVDCYtAoH2zD8IkJNpLbGyraBxzt/bwMY+C2VrBm96CcujfpyCEgg+NV2DOCJ4m1piUpWdR2fjvIuRkmFplk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fqDDaTH0; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fqDDaTH0"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DFDB1C2BCB0;
	Fri,  8 May 2026 19:07:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778267226;
	bh=GIknDbj88+RKDv6/iF44RcXuLQs7MAoEkrxLWGpKqnM=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date:From;
	b=fqDDaTH08mHFVER7X9UWSImxnWSunl//Fv0TlDuRCUQr3e1JMObpSV3BQXe5iojlY
	 +6/yKIQ/IDZNzvjqTq+m8c3d5McV1FrRF0KIuwvG7Ccwsz/PgrUVkaCe1mX+dcEcbu
	 mE8yI9xWOxx5VyTTylFgFGvCLib4U6TG6P+WtJMJY4nek5jUSBkdsn7arF99Jyc7Ab
	 B7brdzEO0v6fr40c0go21EXVWah4gdjeggrhf/lY9zmuNJ2eDp33j+rU24RptJq/HM
	 LxwOnREf5eGcTcJT6HBI5sjdZAvUBd5yF/FQRR9ZLT7Tyshw0zy/w3vzYl4chpVzZY
	 poS6KiADa13UQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v7 RESEND] hwmon: add driver for ARCTIC Fan Controller
Reply-To: sashiko@lists.linux.dev
To: "Aureo Serrano de Souza" <aureo.serrano@arctic.de>
Cc: linux-hwmon@vger.kernel.org
In-Reply-To: <20260508064405.38676-1-aureo.serrano@arctic.de>
References: <20260508064405.38676-1-aureo.serrano@arctic.de>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 08 May 2026 19:07:05 +0000
Message-Id: <20260508190705.DFDB1C2BCB0@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] A lock inversion exists between the HID core's `driver_input_loc=
k` and the driver's wait for `hwmon_device_unregister()`, causing a 1-secon=
d delay/deadlock if the device is removed while a sysfs write is pending.
--

commit 31fcf91aa0e4a85fe147c543e3c868ca27cd3001
Author: Aureo Serrano de Souza <aureo.serrano@arctic.de>

hwmon: add driver for ARCTIC Fan Controller

Adds a hwmon driver for the ARCTIC Fan Controller USB HID device. The
driver provides fan speed monitoring and PWM control via sysfs, using
out reports for configuration and waiting up to 1 second for ack reports.

> diff --git a/drivers/hwmon/arctic_fan_controller.c b/drivers/hwmon/arctic=
_fan_controller.c
> new file mode 100644
> index 0000000000000..dbe84cd93c083
> --- /dev/null
> +++ b/drivers/hwmon/arctic_fan_controller.c

[ ... ]

> +static void arctic_fan_remove(struct hid_device *hdev)
> +{
> +	struct arctic_fan_data *priv =3D hid_get_drvdata(hdev);
> +
> +	/*
> +	 * Unregister hwmon before stopping the HID transport. This removes
> +	 * the sysfs files and waits for any in-progress write() callback to
> +	 * return, so no hwmon op can call hid_hw_output_report() after
> +	 * hid_hw_stop() frees the underlying USB resources.
> +	 * Matches the pattern used by nzxt-smart2 and aquacomputer_d5next.
> +	 *
> +	 * The HID core clears hdev->io_started before invoking ->remove(),
> +	 * so hid_device_io_stop() is not called here; doing so would emit
> +	 * a spurious "io already stopped" warning.
> +	 */
> +	hwmon_device_unregister(priv->hwmon_dev);

Does calling hwmon_device_unregister() here cause a 1-second delay if the
device is removed while a sysfs write is pending?

When the device is unplugged, the hid core acquires hdev->driver_input_lock
and then calls this remove callback.

If a concurrent arctic_fan_write() is blocked on
wait_for_completion_timeout() waiting for an ack report,
hwmon_device_unregister() will block waiting for that sysfs operation to
finish.

Because driver_input_lock is already held by the remove thread, incoming
reports cannot be processed. The __hid_input_report() function will fail
its down_trylock() and return -EBUSY, dropping the ack report.

Will this cause the sysfs write to unconditionally stall for the full
1-second timeout during device removal?

> +	hid_hw_close(hdev);
> +	hid_hw_stop(hdev);
> +}

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260508064405.3867=
6-1-aureo.serrano@arctic.de?part=3D1
