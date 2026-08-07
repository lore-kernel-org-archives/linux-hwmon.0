Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A328E4B0493
	for <linux-hwmon@vger.kernel.org>; Fri,  7 Aug 2026 00:10:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786061454; cv=none; b=Rrjm2RRLEfSBCI/6jx77Z5J/zeoB/uA8uBY/vHKleHYRgXbCRvgx3Hq2cAFJhYdiTsknl+TJ3mGHqrx7AGIhxTzUcGoo6WIEpD9OrSMk9BuvQrztPbTLoEKlx6Z/UnB/Xhh5myKcbKtV/K11FtyF8WnE4LbHz4fi7c6ETPyBq64=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786061454; c=relaxed/simple;
	bh=dKg8hw+/VD4kQ1vTTBlCg91VnAxfJACYoui2OUqRYs8=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=HMgFvj1eD++wQOsGKwaIokfwUOLuQhnNix+uD3XM6qCrrdbUqMEgG5WCf+hWsp7HIPaXj51b84aQ7hlpSy0bZrG7WPWAHMKwn8KEqI04djpwasP3ujnPXCzj8b3RIyWITY6+sVyLu7zzo7sVtRaAaASAr3Sydv/LljoArxjO3h0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CNkYBL5X; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CNkYBL5X"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2052C1F000E9;
	Fri,  7 Aug 2026 00:10:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786061453;
	bh=LVo/+bieuBaS2UqiWUBaZQGgy5l0qi+WikWS6oE6ErU=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=CNkYBL5XIH95kimIn+NiBAL6KJH709mByU81Q7y64TP9I+80KSOZjLLvLlfMb/9rY
	 NpA0shw8DR0BrbAnfRMQq+jxQCfkX6ynWzY2PKDsgNL9LHO3SWAej9yauCTYRXcOAk
	 OMiWzcVk/vscx6rCvM2AILHqCV6U8281wkE+BF7dm2UgoMCq4l8Bw+LSL/rnSUWK3a
	 0f7XinXLU7WmXwPNc3M2qW2390FQ4AwsbC56D8ZgpI8/1uSi4SM8MHObZBSxrTScpO
	 lOeZ5d5kGZcKPIvE/Cw+IuDR781FpUO2X/FDDYDFezMh6eDhNzNclaP0irQDFHWU7t
	 2/5E01Qzvgddg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 3/3] hwmon: (asus_rog_ryujin) Add ROG Ryujin III White
 Edition
Reply-To: sashiko-reviews@lists.linux.dev
To: "Arie Miller" <renari@arimil.com>
Cc: linux-hwmon@vger.kernel.org
In-Reply-To: <20260807000107.1786892-4-renari@arimil.com>
References: <20260807000107.1786892-1-renari@arimil.com>
 <20260807000107.1786892-4-renari@arimil.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 07 Aug 2026 00:10:52 +0000
Message-Id: <20260807001053.2052C1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 4 potential issue(=
s) to consider:

Pre-existing issues:
- [High] Hardware and input processing are started before wait queue comple=
tions are initialized, leading to potential NULL pointer dereferences.
- [High] The spinlock `status_report_request_lock` provides no mutual exclu=
sion against the raw event handler, leading to race conditions with complet=
ions.
- [High] The raw event handler fails to validate the size of incoming HID r=
eports.
- [High] The driver updates and reads shared sensor data fields concurrentl=
y between `rog_ryujin_raw_event` and sysfs operations without using the man=
dated `hwmon_lock()`.
--

--- Patch [3]: [PATCH 3/3] hwmon: (asus_rog_ryujin) Add ROG Ryujin III Whit=
e Edition ---
commit 7de73211f5a55165f52d68bf9aae14fa4ccb23f0
Author: Will Smith <github@notthatwillsmith.com>

hwmon: (asus_rog_ryujin) Add ROG Ryujin III White Edition

This commit adds support for the ROG Ryujin III White Edition liquid cooler.
It adds the USB device ID to the hardware monitoring driver and updates the
documentation.

Link: https://github.com/aleksamagicka/asus_rog_ryujin-hwmon/pull/10

> diff --git a/drivers/hwmon/asus_rog_ryujin.c b/drivers/hwmon/asus_rog_ryu=
jin.c
> --- a/drivers/hwmon/asus_rog_ryujin.c
> +++ b/drivers/hwmon/asus_rog_ryujin.c

[ ... ]

> @@ -587,6 +588,8 @@ static const struct hid_device_id rog_ryujin_table[] =
=3D {
>  	  .driver_data =3D (kernel_ulong_t)&rog_ryujin_iii_info },
>  	{ HID_USB_DEVICE(USB_VENDOR_ID_ASUS_ROG, USB_PRODUCT_ID_RYUJIN_III_EVA),
>  	  .driver_data =3D (kernel_ulong_t)&rog_ryujin_iii_info },
> +	{ HID_USB_DEVICE(USB_VENDOR_ID_ASUS_ROG, USB_PRODUCT_ID_RYUJIN_III_WHIT=
E),
> +	  .driver_data =3D (kernel_ulong_t)&rog_ryujin_iii_info },
>  	{ }
>  };

[Severity: High]
This isn't a bug introduced by this patch, but while reviewing this driver =
I=20
noticed a pre-existing issue with hardware initialization.

In rog_ryujin_probe(), event polling is started before the wait queue
completions are initialized:

    ret =3D hid_hw_start(hdev, HID_CONNECT_HIDRAW);
    ...
    init_completion(&priv->cooler_status_received);

Could this lead to a NULL pointer dereference or list corruption if the
device sends an early report and rog_ryujin_raw_event() calls complete_all()
on the uninitialized completion?

[Severity: High]
This is a pre-existing issue, but does the status_report_request_lock provi=
de
adequate mutual exclusion?

In rog_ryujin_execute_cmd(), the lock is taken when reinitializing completi=
ons:

    spin_lock_bh(&priv->status_report_request_lock);
    reinit_completion(status_completion);
    spin_unlock_bh(&priv->status_report_request_lock);

However, in rog_ryujin_raw_event(), complete_all() is called without
acquiring this lock. Can this lead to race conditions with the completion
state being clobbered, potentially causing sysfs reads to hang and return
-ETIMEDOUT?

[Severity: High]
This isn't a bug introduced by this patch, but is it possible for an
out-of-bounds read to occur when parsing the HID report?

In rog_ryujin_raw_event(), the incoming report is parsed directly:

    if (data[1] =3D=3D RYUJIN_GET_COOLER_STATUS_CMD_RESPONSE) {
        priv->temp_input[0] =3D data[priv->info->temp_offset] * 1000 +

Should the size parameter be validated before accessing data offsets to
prevent exposing stale or uninitialized memory if a truncated packet is
received?

[Severity: High]
This is a pre-existing issue, but does this driver violate the hwmon
subsystem locking guidelines?

The driver updates and reads shared sensor data fields concurrently between
rog_ryujin_raw_event() and sysfs operations:

    priv->temp_input[0] =3D data[priv->info->temp_offset] * 1000 +
        data[priv->info->temp_offset + 1] * 100;

And in rog_ryujin_read():

    *val =3D priv->temp_input[channel];

Are hwmon_lock() and hwmon_unlock() required here to synchronize the
attribute access, as mandated for hardware monitoring drivers?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260807000107.1786=
892-1-renari@arimil.com?part=3D3
