Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CFC7837BE95
	for <linux-hwmon@vger.kernel.org>; Mon, 27 Jul 2026 18:47:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785178025; cv=none; b=puZiPyaMthap1pkbHR0pKhlaSj/h+FRkNBAo7EXGxp+8FHNA/EmyqqPK7GgY8G7rrW70AYqSaYzaXm9i5HHp/mJZeAEaEF6jlE6CeS95RQSRU4wpnbBDh3ZwUHdFVRzTUnp02AA/uxMfSrWNGvFjzvPBLxsilBeASRjOrMFC2BA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785178025; c=relaxed/simple;
	bh=BgialWtUiPk2ndzeB1RtRVVlvyLma9/0W7I6go27Wds=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=Fx9m+/Ixhxha3Qmjw0osjDWv+x2XwoYDYCmvVZyHnvvinmF7+tdLMu2C+usnGUsTox5xHFwXr5C7Gt7Er4qbusUi3AIvlxMcuMVj6pXI0REXQnAHoN7dOt8wW7cDvjG4ltWmIN27ftdJYRnEe7c6Hm1UMRk+jT2HHMcU93o3baE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=i+I/sCIB; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="i+I/sCIB"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 36A021F000E9;
	Mon, 27 Jul 2026 18:47:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785178023;
	bh=6tHGEgR3SGVVpqPzVLYGiHprILXbo9NC8TA1emd6Jmo=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=i+I/sCIBQWuEM3GXwGfWv3GRIudtcUg5xqmMj4NnjXOJkLCjqPEBWrId8PMBNzZgN
	 fZHMgFCeYg1iHHOfxcHDaFA7COIcGB0wdUu7P8kpltEcRxqRaw8SBq1Dfzp8x3Trqj
	 iSwZgw7rARSeoIPDC+myGiZd2EQP14MtMRF4e/owso5ycboKfxpQLGrD2I6XZb9EHt
	 DbIRm8aSTF8EEFzIyJcc16btSAMcA0ulEhxZX+NhnZX/Z88I7wKgHQr12m6SiPZG0U
	 g23DZ4Eda+S37pGk+URngsJftH9jns8fEUruaP6a5lS4UjTuMaFXsBJKyBDeMtIuGi
	 2VPwprmgIDqTQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] hwmon: (nzxt-smart2) DMA-align output buffer
Reply-To: sashiko-reviews@lists.linux.dev
To: "Guenter Roeck" <linux@roeck-us.net>
Cc: linux-hwmon@vger.kernel.org
In-Reply-To: <20260727183309.3681243-1-linux@roeck-us.net>
References: <20260727183309.3681243-1-linux@roeck-us.net>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 27 Jul 2026 18:47:02 +0000
Message-Id: <20260727184703.36A021F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:

Pre-existing issues:
- [High] Sysfs read paths wait indefinitely for device reports, causing a d=
eadlock during device removal when kernfs_drain waits for sysfs operations =
to complete.
- [High] Unprotected access to output_buffer and update_interval in the res=
et_resume path leads to corrupted USB reports.
--

--- Patch [1]: [PATCH] hwmon: (nzxt-smart2) DMA-align output buffer ---
commit 4207ab1b1718833d04744a9d89312688c2cf5221
Author: Guenter Roeck <linux@roeck-us.net>

hwmon: (nzxt-smart2) DMA-align output buffer

When send_output_report() calls hid_hw_output_report(), the underlying USB
HID core calls usb_interrupt_msg() which maps this buffer directly for DMA.
Align the output buffer to ARCH_DMA_MINALIGN to fix the problem on
non-coherent architectures.

> diff --git a/drivers/hwmon/nzxt-smart2.c b/drivers/hwmon/nzxt-smart2.c
> index e2316c46629d6..ff0c0bee0e839 100644
> --- a/drivers/hwmon/nzxt-smart2.c
> +++ b/drivers/hwmon/nzxt-smart2.c
> @@ -203,7 +203,7 @@ struct drvdata {
>  	 */
>  	struct mutex mutex;
>  	long update_interval;
> -	u8 output_buffer[OUTPUT_REPORT_SIZE];
> +	u8 output_buffer[OUTPUT_REPORT_SIZE] __aligned(ARCH_DMA_MINALIGN);

[Severity: High]
This is a pre-existing issue, but could this output buffer be corrupted
during a USB device reset?

If a userspace process triggers a USBDEVFS_RESET ioctl, the USB core logic
calls nzxt_smart2_hid_reset_resume(), which calls init_device() without
holding drvdata->mutex:

nzxt_smart2_hid_reset_resume()
    return init_device(drvdata, drvdata->update_interval);
   =20
init_device()
    ret =3D send_output_report(drvdata, detect_fans_report, ...);
   =20
send_output_report()
    memcpy(drvdata->output_buffer, data, data_size);

Because userspace sysfs access is not frozen during USBDEVFS_RESET, another
thread could concurrently write to a hwmon sysfs attribute, acquire the
mutex, and call send_output_report().=20

Both threads would then concurrently modify the shared output_buffer via
memcpy() and attempt to submit it, potentially corrupting the USB report and
causing concurrent DMA mapping of the same buffer.

Does init_device() need to acquire the mutex when called from the
reset_resume path?


[Severity: High]
This is another pre-existing issue, but is there a risk of deadlocking
during device removal if a sysfs read is blocked?

In nzxt_smart2_hwmon_read(), the read path blocks waiting for a report:

nzxt_smart2_hwmon_read()
    res =3D wait_event_interruptible_locked_irq(drvdata->wq,
                                              drvdata->fan_config_received);

If the device is disconnected before the report arrives, the read might
block indefinitely.

When the USB disconnect triggers nzxt_smart2_hid_remove(), it calls
hwmon_device_unregister():

nzxt_smart2_hid_remove()
    hwmon_device_unregister(drvdata->hwmon);
   =20
This in turn invokes kernfs_drain to wait for all sysfs operations to
complete.

Since the sysfs read is waiting indefinitely and the remove function does
not wake it up, could kernfs_drain block forever and deadlock the removal?

>  };
> =20
>  static long scale_pwm_value(long val, long orig_max, long new_max)

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260727183309.3681=
243-1-linux@roeck-us.net?part=3D1
