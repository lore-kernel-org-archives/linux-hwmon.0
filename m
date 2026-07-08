Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF9D4364935
	for <linux-hwmon@vger.kernel.org>; Wed,  8 Jul 2026 03:27:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783481277; cv=none; b=OXa1PDitA9kZ2D+n2aDHGtXtlpo17CDg0JzBaD29/wyOvcFEzzxdf1YAfXbRvQXCifZUWbeZc0oSbEv6Mwma6yFBE7NlFpKlkn7iYsJEGU+7nZ0Jh+9DvQILWXG8GFMhZCVq7o1ZZ2VLV+5g9IUajw8/teJHjuhWXmOPZoCGNtc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783481277; c=relaxed/simple;
	bh=VLZnbWssV+1rx6LT2sRGSC7ZcIftmKtS36L99mW5PB4=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=RuTo0uBZialmb/ggNiorhmAkM6rbkK1fZbhlhUQCN4l0KgGBGPh74qRhZSoCCM6lsJP0m/iNAktpq9cu9sITSClIxLsJZcLjIt4QyeAZqk6ce1grv6SWvqr13/7AEgmDOMqEg2+5Yg012nnOiD69O1l7IzO/y9vdajjMM1ni4ew=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=EjeoOUUu; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="EjeoOUUu"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4E4D91F000E9;
	Wed,  8 Jul 2026 03:27:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783481275;
	bh=qpB3PnbL/iM4qegqvy63t5YiF4SM4KPGp05BfxyvRLM=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=EjeoOUUuRSvkQ7ZmjJJhsbV79J2MTDBcHLW9aXE/2/hRpxq411KGR9L1tAlkXGuVk
	 pSAuD7sujfy2ZIwOK6rMxXt4tD5jVA62AT8ouHE/94s9QjZrq9aJOMKkavhxsqBVTo
	 CRCS/LhxnRojkXVyz6bXDTI7AY8Vg+dD5bZ+qMwjtiQWl4GmuAVbvKwYHCF09S/Gvv
	 7CbvGDuaoqDw9fc0MKCHPLYkYTG3AiD/9CwR6kRlTkJdyoiLu4KXNdMlynKeFRvlFH
	 keYKCOCIpG9N0i7FmaVtmNJIKfUiPuUtni93Pr9URzPk7icRbfsQRqiKfS4u5V23ah
	 xL/L/Sk1P4TDA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 3/4] hwmon: (nzxt-smart2) Stop device IO before
 calling hid_hw_stop
Reply-To: sashiko-reviews@lists.linux.dev
To: "Guenter Roeck" <linux@roeck-us.net>
Cc: linux-hwmon@vger.kernel.org
In-Reply-To: <20260708030507.227193-4-linux@roeck-us.net>
References: <20260708030507.227193-1-linux@roeck-us.net>
 <20260708030507.227193-4-linux@roeck-us.net>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 08 Jul 2026 03:27:54 +0000
Message-Id: <20260708032755.4E4D91F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 5 potential issue(=
s) to consider:

Pre-existing issues:
- [Critical] The patch fixes a UAF vulnerability in `nzxt-smart2.c` by call=
ing `hid_device_io_stop()` on probe failure after `hid_device_io_start()`, =
but fails to apply this same necessary fix to multiple other HID drivers th=
at suffer from the exact same vulnerability.
- [Critical] The output buffer embedded in `struct drvdata` is not cachelin=
e aligned, violating DMA API rules.
- [High] Device unplug causes a deadlock in hwmon_device_unregister() due t=
o sysfs readers stuck in indefinite wait.
- [High] The return value of `init_device()` in `nzxt_smart2_hid_probe()` i=
s completely ignored, which can lead to indefinite hangs during sysfs reads.
- [High] Potential deadlock between process context and hardware interrupt =
context due to incorrect spinlock variants.
--

--- Patch [3]: [PATCH v2 3/4] hwmon: (nzxt-smart2) Stop device IO before ca=
lling hid_hw_stop ---
commit 55b42dfd8c9129546a5b1b9a8576081dafa0c229
Author: Guenter Roeck <linux@roeck-us.net>

hwmon: (nzxt-smart2) Stop device IO before calling hid_hw_stop

This commit addresses a race condition between hid_input_report and the
probe function. It calls hid_device_io_stop before hid_hw_stop in the error
path to prevent a use-after-free vulnerability.

> diff --git a/drivers/hwmon/nzxt-smart2.c b/drivers/hwmon/nzxt-smart2.c
> index 58ef9fa0184be..e2316c46629d6 100644
> --- a/drivers/hwmon/nzxt-smart2.c
> +++ b/drivers/hwmon/nzxt-smart2.c
> @@ -768,7 +768,7 @@ static int nzxt_smart2_hid_probe(struct hid_device *h=
dev,
> =20
>  out_hw_close:
>  	hid_hw_close(hdev);
> -
> +	hid_device_io_stop(hdev);

[Severity: Critical]
This isn't a bug introduced by this patch, but while addressing the
use-after-free vulnerability here, are there other drivers that need this
same fix?=20

For example, in drivers/hwmon/corsair-psu.c:corsairpsu_probe():

    fail_and_close:
        hid_hw_close(hdev);
    fail_and_stop:
        hid_hw_stop(hdev);

And similarly in drivers/hwmon/nzxt-kraken3.c:kraken3_probe(),=20
drivers/hid/hid-nintendo.c:nintendo_hid_probe(), and=20
drivers/hid/hid-mcp2221.c:mcp2221_hid_unregister(). They also appear to omi=
t=20
hid_device_io_stop() in their cleanup paths after hid_device_io_start() has=
=20
been called. Could they be vulnerable to the exact same issue?

>  out_hw_stop:
>  	hid_hw_stop(hdev);
>  	return ret;

[Severity: High]
This is a pre-existing issue, but does ignoring the return value of
init_device() cause sysfs reads to hang indefinitely?

In nzxt_smart2_hid_probe():

    hid_device_io_start(hdev);
    init_device(drvdata, UPDATE_INTERVAL_DEFAULT_MS);
    drvdata->hwmon =3D hwmon_device_register_with_info(...)

If init_device() fails, the device won't send the expected FAN_CONFIG input=
=20
report. When a user process later attempts to read from sysfs, it triggers=
=20
nzxt_smart2_hwmon_read():

    res =3D wait_event_interruptible_locked_irq(drvdata->wq,
                                              drvdata->fan_config_received);

Will this wait loop block forever waiting for a configuration report that
will never arrive?

[Severity: High]
This isn't a bug introduced by this patch, but can the driver deadlock if=20
the device is physically unplugged while a sysfs read is pending?

If a sysfs read is waiting in nzxt_smart2_hwmon_read() as shown above, and=
=20
the device is disconnected, nzxt_smart2_hid_remove() is called:

    static void nzxt_smart2_hid_remove(struct hid_device *hdev)
    {
        struct drvdata *drvdata =3D hid_get_drvdata(hdev);
        hwmon_device_unregister(drvdata->hwmon);

Because the sysfs read is blocked indefinitely waiting for an input report=
=20
from the unplugged device, will hwmon_device_unregister() hang in=20
kernfs_drain() waiting for the active sysfs operation to finish?

[Severity: High]
This is a pre-existing issue, but is there a potential deadlock between=20
process context and hardware interrupt context here?

In set_pwm(), the lock is acquired with softirqs disabled but hardirqs=20
enabled:

    spin_lock_bh(&drvdata->wq.lock);
    drvdata->fan_duty_percent[channel] =3D duty_percent;
    spin_unlock_bh(&drvdata->wq.lock);

If a URB completion hardware interrupt fires on the same CPU while this=20
lock is held, it can call handle_fan_status_report():

    spin_lock(&drvdata->wq.lock);

Will the CPU spin forever attempting to acquire the lock that the=20
interrupted process already holds?

[Severity: Critical]
This isn't a bug introduced by this patch, but does passing an embedded=20
buffer to the HID core violate DMA API rules?

In struct drvdata:

    struct mutex mutex;
    long update_interval;
    u8 output_buffer[OUTPUT_REPORT_SIZE];

In send_output_report():

    ret =3D hid_hw_output_report(drvdata->hid, drvdata->output_buffer,
                               sizeof(drvdata->output_buffer));

Since output_buffer shares a cacheline with the mutex and update_interval,
could the underlying USB DMA mapping operations corrupt these adjacent
variables on systems with non-coherent caches?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260708030507.2271=
93-1-linux@roeck-us.net?part=3D3
