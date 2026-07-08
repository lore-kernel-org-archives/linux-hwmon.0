Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E1F93271FD
	for <linux-hwmon@vger.kernel.org>; Wed,  8 Jul 2026 03:19:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783480798; cv=none; b=DpT+iIeNoe4a2FJM49Sxv161Xro/vCJJOLP1mWDdbSQVVl1RJ8ugbTPYDFIJVtDpe4TXDAt6tQcHXGWIO3AgjVARE/Mxq3RFi0kYu9xS8OvyrtL1kptYZ5RZmX0+shD1gpcVVIQK31Aakdt0vdayjvP8mIXVL8X3hQEStqwrbdE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783480798; c=relaxed/simple;
	bh=Dcu6a3oiHqVqcZGHeeReqCO6p1jvydPKr2FpbA/Lov8=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=c4JmBfWeky+NUnGcFhyzYJwk8i0yBsbGVg3dTIFvn8MuuxAxI9GKdiJTbaa17EtoON1ewn1V62wWN/GyxGAXT2feGIeM7Gzznna/s77M5emmcnpkSpUG9X47KfGQUwwAGmd0+jhB+01U61P+IYnUkD1S5Cg6rFQgoQnWmdf78QE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ejfQrW3j; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ejfQrW3j"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C30331F000E9;
	Wed,  8 Jul 2026 03:19:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783480796;
	bh=ca3nm4pRvYpxJ5t5bAd5yeypCMhZigTEqsuiP404p+g=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=ejfQrW3jRPGvX2d4c8mFAqERPASogGN9C9FauQ/w8F5jSw1oS2Z+W/SxxzO281CtE
	 BbF0ABKfo8IrsAElB6GT3bmt9hs4kxK32cVQQF5e3MAprKX/he/LJy1u73Vr77WP0y
	 lzsOQI/DDo86WOrlZTjfaQy8jeB/YowaVMdpiOd1oOlJI9xuCBOGDpYf+qCdiKNieb
	 cTVtTjt6mq9nPrLpbE7tkUDnivK5etF1DuqaaCWOiI9R8sRXCGf0lRUQK+7bAr1ncN
	 QDKoy45/VQu/ZTCbrfF68ZdHypWxK8s7X2TaYRWczHBjCfCuTO0ozWLwPapnJmE6AF
	 cOiYa3yeO6VvA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 2/4] hwmon: (gigabyte_waterforce) Stop device IO
 before calling hid_hw_stop
Reply-To: sashiko-reviews@lists.linux.dev
To: "Guenter Roeck" <linux@roeck-us.net>
Cc: linux-hwmon@vger.kernel.org
In-Reply-To: <20260708030507.227193-3-linux@roeck-us.net>
References: <20260708030507.227193-1-linux@roeck-us.net>
 <20260708030507.227193-3-linux@roeck-us.net>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 08 Jul 2026 03:19:55 +0000
Message-Id: <20260708031956.C30331F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:

Pre-existing issues:
- [Critical] Systemic Preexisting UAF in other hwmon HID drivers.
- [High] Architecture Violation and Data Race in hwmon sensor reading.
- [High] Potential Deadlock between process and hardirq context.
--

--- Patch [2]: [PATCH v2 2/4] hwmon: (gigabyte_waterforce) Stop device IO b=
efore calling hid_hw_stop ---
commit 1ac1936efdffad20d37444790d9aa7b430d348cd
Author: Guenter Roeck <linux@roeck-us.net>

hwmon: (gigabyte_waterforce) Stop device IO before calling hid_hw_stop

Calling hid_hw_stop() does not stop the device IO. This results in a race
condition between hid_input_report() and the point immediately following the
execution of hid_device_io_start() within the driver probe function. Fix the
problem by calling hid_device_io_stop() before calling hid_hw_stop().

> diff --git a/drivers/hwmon/gigabyte_waterforce.c b/drivers/hwmon/gigabyte=
_waterforce.c
> index 27487e215bddf..4eea05f8b569c 100644
> --- a/drivers/hwmon/gigabyte_waterforce.c
> +++ b/drivers/hwmon/gigabyte_waterforce.c
> @@ -371,13 +371,15 @@ static int waterforce_probe(struct hid_device *hdev=
, const struct hid_device_id
>  	if (IS_ERR(priv->hwmon_dev)) {
>  		ret =3D PTR_ERR(priv->hwmon_dev);
>  		hid_err(hdev, "hwmon registration failed with %d\n", ret);
> -		goto fail_and_close;
> +		goto fail_and_io_stop;
>  	}
> =20
>  	waterforce_debugfs_init(priv);
> =20
>  	return 0;
> =20
> +fail_and_io_stop:
> +	hid_device_io_stop(hdev);
>  fail_and_close:
>  	hid_hw_close(hdev);
>  fail_and_stop:

[Severity: Critical]
This isn't a bug introduced by this patch, but does this same UAF
vulnerability exist in other hwmon HID drivers?

Looking at corsairpsu_probe() in drivers/hwmon/corsair-psu.c, kraken3_probe=
()
in drivers/hwmon/nzxt-kraken3.c, and nzxt_smart2_hid_probe() in
drivers/hwmon/nzxt-smart2.c, the error paths jump directly to hid_hw_close()
and hid_hw_stop() without calling hid_device_io_stop(). For example, in
corsairpsu_probe:

fail_and_close:
	hid_hw_close(hdev);
fail_and_stop:
	hid_hw_stop(hdev);
	return ret;

Since hid_device_io_start() unlocked the driver input lock, asynchronous HID
events could continue firing and triggering the raw_event handler while the
driver state is freed. Should these other drivers be fixed as well?

[Severity: High]
This is a pre-existing issue, but does the lack of locking when reading sen=
sor
state cause torn reads?

In drivers/hwmon/gigabyte_waterforce.c, waterforce_read() reads the
priv->temp_input[channel] array directly from process context:

    *val =3D priv->temp_input[channel];

Concurrently, waterforce_raw_event() runs in the HID input/interrupt context
and modifies these identical arrays:

    priv->temp_input[0] =3D data[WATERFORCE_TEMP_SENSOR] * 1000;
    priv->speed_input[0] =3D get_unaligned_le16(data + WATERFORCE_FAN_SPEED=
);

According to the subsystem guidelines in subsystem/hwmon.md, drivers must
implement locking required for interrupt handling (e.g., using hwmon_lock()
and hwmon_unlock()). Could the lack of synchronization here allow the
interrupt handler to tear the data being read by sysfs?

[Severity: High]
This isn't a bug introduced by this patch, but could the lock usage around
priv->status_report_request_lock lead to a deadlock?

In drivers/hwmon/gigabyte_waterforce.c, waterforce_get_status() acquires the
lock using spin_lock_bh(), which disables softirqs but leaves hardirqs
enabled:

    spin_lock_bh(&priv->status_report_request_lock);
    reinit_completion(&priv->status_report_received);
    spin_unlock_bh(&priv->status_report_request_lock);

If a USB URB completion fires in hardirq context while this lock is held, it
will call waterforce_raw_event(), which attempts to acquire the same lock
using plain spin_lock():

    spin_lock(&priv->status_report_request_lock);
    if (!completion_done(&priv->status_report_received))
        complete_all(&priv->status_report_received);
    spin_unlock(&priv->status_report_request_lock);

Could this cause a recursive spinlock deadlock? Would it be safer to use
spin_lock_irqsave() and spin_lock_irqrestore() in both paths to properly
synchronize between process context and the HID raw event handler?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260708030507.2271=
93-1-linux@roeck-us.net?part=3D2
