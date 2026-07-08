Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C24133B27FA
	for <linux-hwmon@vger.kernel.org>; Wed,  8 Jul 2026 02:08:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783476532; cv=none; b=FJ5vc6xYceDVNJ0Wi+6Tr3v+8thxdCismscgdMhHP3+tPhzycw3QLIK03oyOo1nZ76YTwU499zTsmFN5cO7WyzpYxa/D4rVD1yPwDyyoYk+H5BDWnFrNKAkTvXn8oOF/1IJ1eaH0WLzTmxS+MTqWOPFkUX/34ykSIHDltdVTYgU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783476532; c=relaxed/simple;
	bh=M0pDzK1zb5LT3g5ZQOm9Qu0tPCCz3cBSY6XGzSt8rvw=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=bl+tEHD2QJ0SMBU0aR1skYd5aBlKGilKcNs/wLddt4/1Ncm5B/gTr08317innpioGHvyJQd5flB4LVSP9T2JC7A1gQ4OczPjIbcOeiOPxpH0wfsGoPGLRgaOM85LjlBbz+S9ddYCWc235KdQPYuV9jR5Wle6WmT5qsg6FNato2w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=VYutfxZa; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="VYutfxZa"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 58A2D1F000E9;
	Wed,  8 Jul 2026 02:08:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783476531;
	bh=gJhtGxyABXXdaJpi2n7o5jIcz5icE3FQrLN3p8jnoJE=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=VYutfxZaDInns/AOXPOG+9kQ65uXmfXvu1PFqvj+jZenr4x3Rugux1hzzHcgGbn69
	 WTXaVn4XtbJ35KW5bKUFGGeTNY8Ph77n+v+HrTYOtB3w5CtQNG6zjpeqd4sV17HDXD
	 lZConMNDcMmUIDev04BT+HVVE/HNTaxRPLSwa5ZqoC1UKlTGSxJYiVhsg+7MThBL3Z
	 3llWaxdooURkdEYHDEnA1nwraTEaqApdG+/mVQobcFpjNhLZLiZGLj8Z7z8FPH6yJ+
	 pbz54EQXisUwpTNbQi6+3xHuzxKxPGfZq9VGSEHxW+YnnalR9cpSXf1hMTbAZExmSL
	 YJ79syztpSY8A==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 2/4] hwmon: (gigabyte_waterforce) Stop device IO before
 calling hid_hw_stop
Reply-To: sashiko-reviews@lists.linux.dev
To: "Guenter Roeck" <linux@roeck-us.net>
Cc: linux-hwmon@vger.kernel.org
In-Reply-To: <20260708015806.213790-3-linux@roeck-us.net>
References: <20260708015806.213790-1-linux@roeck-us.net>
 <20260708015806.213790-3-linux@roeck-us.net>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 08 Jul 2026 02:08:50 +0000
Message-Id: <20260708020851.58A2D1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 4 potential issue(=
s) to consider:

New issues:
- [Medium] Unconditional invocation of `hid_device_io_stop()` in the probe =
error path triggers spurious kernel warnings on early failures and inverts =
the teardown order.

Pre-existing issues:
- [High] Missing bounds check on the `size` parameter in `waterforce_raw_ev=
ent()` allows out-of-bounds memory reads.
- [High] Potential deadlock due to using `spin_lock_bh()` in process contex=
t while the same lock is acquired in hardware interrupt context.
- [High] Data race and unprotected multi-variable access between `waterforc=
e_raw_event()` and `waterforce_read()`.
--

--- Patch [2]: [PATCH 2/4] hwmon: (gigabyte_waterforce) Stop device IO befo=
re calling hid_hw_stop ---
commit 5f26e64b65cc1e460573670ab5b05e083da3d241
Author: Guenter Roeck <linux@roeck-us.net>

hwmon: (gigabyte_waterforce) Stop device IO before calling hid_hw_stop

This commit fixes a use-after-free vulnerability by calling
hid_device_io_stop() before hid_hw_stop() in the probe error path.

> diff --git a/drivers/hwmon/gigabyte_waterforce.c b/drivers/hwmon/gigabyte=
_waterforce.c
> --- a/drivers/hwmon/gigabyte_waterforce.c
> +++ b/drivers/hwmon/gigabyte_waterforce.c
> @@ -381,6 +381,7 @@ static int waterforce_probe(struct hid_device *hdev, =
const struct hid_device_id
>  fail_and_close:
>  	hid_hw_close(hdev);
>  fail_and_stop:
> +	hid_device_io_stop(hdev);
[Severity: Medium]
Will this unconditionally calling hid_device_io_stop() here trigger spurious
warnings on early failures?

If an early failure occurs, such as hid_hw_open() failing, the code jumps to
fail_and_stop. At this point, hid_device_io_start() has not been called, so
hdev->io_started is false, causing hid_device_io_stop() to emit a spurious
warning.

Also, for later failures that jump to fail_and_close, does this result in
an inverted teardown order by calling hid_hw_close() before
hid_device_io_stop()?

>  	hid_hw_stop(hdev);
>  	return ret;
>  }

[Severity: High]
This is a pre-existing issue, but does waterforce_raw_event() lack a bounds
check on the size parameter?

In waterforce_raw_event():

    if (data[0] =3D=3D get_firmware_ver_cmd[0] && ...

and later:

    priv->temp_input[0] =3D data[WATERFORCE_TEMP_SENSOR] * 1000;

If a malicious or malfunctioning HID device sends a short report, could
accessing data at WATERFORCE_TEMP_SENSOR result in an out-of-bounds memory
read?

[Severity: High]
This isn't a bug introduced by this patch, but is there a potential deadlock
between process context and hardware interrupt context?

waterforce_get_status() runs in process context and uses spin_lock_bh():

    spin_lock_bh(&priv->status_report_request_lock);

while waterforce_raw_event() can execute in hardirq context and acquires
the same lock:

    spin_lock(&priv->status_report_request_lock);

If waterforce_raw_event() is triggered by an interrupt on the same CPU
while waterforce_get_status() is holding the lock, will the interrupt
handler attempt to acquire the lock and spin forever?

[Severity: High]
This is a pre-existing issue, but does this code have a data race between
the interrupt handler and the sysfs read function?

waterforce_raw_event() executes asynchronously and updates sensor values
without a lock protecting the data arrays:

    priv->speed_input[0] =3D get_unaligned_le16(data + WATERFORCE_FAN_SPEED=
);
    priv->speed_input[1] =3D get_unaligned_le16(data + WATERFORCE_PUMP_SPEE=
D);

waterforce_read() is called from sysfs and reads these fields locklessly
after releasing the status mutex:

    switch (type) {
    case hwmon_temp:
        *val =3D priv->temp_input[channel];

Can this result in torn reads and bogus sysfs values if the interrupt
handler overwrites the fields concurrently?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260708015806.2137=
90-1-linux@roeck-us.net?part=3D2
