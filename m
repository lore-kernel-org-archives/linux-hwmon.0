Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E46DCA4E
	for <linux-hwmon@vger.kernel.org>; Wed,  8 Jul 2026 02:11:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783476678; cv=none; b=UYbQETMPgVwi6quFfRH52NHnkGJQtvaFYZo38fxQ4GHQZTxX4lPUcU7mAx1uUEbmS/sQ4P8E4FPvn1ALgn1vMkZAguqQ2TL0TrBhVm3iayxkOgGUt7qjgAETJ4FRoy4e3wPyBbXiY3gmPzzNz3rB8BUqa3LF73iHT0Zx3fEjtdM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783476678; c=relaxed/simple;
	bh=TWBTF3qHcg6c18CgR/xUWrxZLJb50caLV49L3+VgZs4=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=nopSpz5C3cG8Of5RohSNkFJ4XXbr9QBxd81MH/FMPLZP71b/DLxAre3PZSwwq9ykF6XkZr2dxp+P8idEIkbrQg4WtkLaxYZgAYuvucqaU+fmLe3QTnz8ftOvwy/Ss64FN8q+Bnc6R6sJAMnW/3kS7CzlTTn0kF3TB2A7+lcB27g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=iRcgcw45; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="iRcgcw45"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0CC251F000E9;
	Wed,  8 Jul 2026 02:11:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783476677;
	bh=Mvfj08BWU/brKsrlJNOwT+Z7ZnfxOFSpHl/wgzmWI4E=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=iRcgcw45JlP9Mwg2NZbU9xNXuGBA6tEYQd26HEMev/F5oTHJwtfnSG2H00dRRTXA9
	 gYE/vHmI6pds03hdqJ22f7Oj6k7k4uP8Eropa3YP+93VNcPSy95DEfUjNARPEb5bUx
	 khS1elHooANRVpPDskZTiXHKcHisIiVooQGmVnuF6CZdMWmYMIYDWeOuMfdQ7s4Qbi
	 Fs3fJ3m0kTMrmBSJ7fmBRwMdUtG1pn3wo193wjygpte2jrRJkXYifw91f19bFhy5Dw
	 zdrhzCJNm6yCXNrEyQmdKk8E+lHmyL9JD+xwNDnXOlAPgi7P6qaETbdZNJZfF6Gh9v
	 N1oKQvSCMFAwA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 3/4] hwmon: (nzxt-smart2) Stop device IO before calling
 hid_hw_stop
Reply-To: sashiko-reviews@lists.linux.dev
To: "Guenter Roeck" <linux@roeck-us.net>
Cc: linux-hwmon@vger.kernel.org
In-Reply-To: <20260708015806.213790-4-linux@roeck-us.net>
References: <20260708015806.213790-1-linux@roeck-us.net>
 <20260708015806.213790-4-linux@roeck-us.net>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 08 Jul 2026 02:11:16 +0000
Message-Id: <20260708021117.0CC251F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 4 potential issue(=
s) to consider:

New issues:
- [Low] Unconditional call to `hid_device_io_stop()` on the error path trig=
gers a spurious kernel warning when `hid_hw_open()` fails.

Pre-existing issues:
- [Critical] The same Use-After-Free (UAF) vulnerability exists in other HI=
D hwmon drivers (nzxt-kraken3.c and corsair-psu.c) and was missed by this p=
atch series.
- [High] Device removal can hang indefinitely if a user process is blocked =
reading sysfs attributes.
- [High] The return value of init_device() is silently ignored during probe=
, leading to permanent hangs on sysfs reads.
--

--- Patch [3]: [PATCH 3/4] hwmon: (nzxt-smart2) Stop device IO before calli=
ng hid_hw_stop ---
commit f577839ac93bb28ac70b3214f4e4ddca1a015f5a
Author: Guenter Roeck <linux@roeck-us.net>

hwmon: (nzxt-smart2) Stop device IO before calling hid_hw_stop

Calling hid_hw_stop() does not stop the device IO, causing a race condition
between hid_input_report() and probe failure. Fix this by calling
hid_device_io_stop() before calling hid_hw_stop().

> diff --git a/drivers/hwmon/nzxt-smart2.c b/drivers/hwmon/nzxt-smart2.c
> index 58ef9fa0184be..286de15cedc7d 100644
> --- a/drivers/hwmon/nzxt-smart2.c
> +++ b/drivers/hwmon/nzxt-smart2.c
> @@ -770,6 +770,7 @@ static int nzxt_smart2_hid_probe(struct hid_device *h=
dev,
>  	hid_hw_close(hdev);
> =20
>  out_hw_stop:
> +	hid_device_io_stop(hdev);

[Severity: Low]
If hid_hw_open() fails earlier in the probe function, we jump to out_hw_stop
and call hid_device_io_stop():

drivers/hwmon/nzxt-smart2.c:nzxt_smart2_hid_probe()
        ret =3D hid_hw_open(hdev);
        if (ret)
                goto out_hw_stop;

Since hid_device_io_start() hasn't been called yet, does this trigger the
dev_warn("io already stopped") in hid_device_io_stop()?

>  	hid_hw_stop(hdev);
>  	return ret;
>  }

[Severity: High]
This is a pre-existing issue, but does ignoring the return value of
init_device() cause sysfs reads to hang?

If init_device() fails to send the 'detect fans' command during
nzxt_smart2_hid_probe(), it appears fan_config_received is never set to tru=
e.
Will subsequent sysfs reads block forever in
wait_event_interruptible_locked_irq() waiting for that condition?


[Severity: High]
This is a pre-existing issue, but does device removal hang if a user
process is currently blocked reading sysfs attributes?

When a process accesses sysfs attributes, nzxt_smart2_hwmon_read() blocks:

drivers/hwmon/nzxt-smart2.c:nzxt_smart2_hwmon_read()
        res =3D wait_event_interruptible_locked_irq(drvdata->wq,
                                                  drvdata->fan_config_recei=
ved);

If the device is unplugged, nzxt_smart2_hid_remove() calls
hwmon_device_unregister(), which waits for active readers to finish:

drivers/hwmon/nzxt-smart2.c:nzxt_smart2_hid_remove()
        hwmon_device_unregister(drvdata->hwmon);

Since the waitqueue is never woken up during remove(), does the reader
process stay blocked indefinitely, causing the unregister to hang?


[Severity: Critical]
This isn't a bug introduced by this patch, but does the same use-after-free
vulnerability exist in the probe error paths of other HID hwmon drivers?

Both nzxt-kraken3.c and corsair-psu.c appear to call hid_device_io_start()
during probe, but omit hid_device_io_stop() in their fail_and_stop error
paths:

drivers/hwmon/nzxt-kraken3.c:kraken3_probe()
fail_and_close:
        hid_hw_close(hdev);
fail_and_stop:
        hid_hw_stop(hdev);

drivers/hwmon/corsair-psu.c:corsairpsu_probe()
fail_and_close:
        hid_hw_close(hdev);
fail_and_stop:
        hid_hw_stop(hdev);

Do these drivers also need to call hid_device_io_stop(hdev) to prevent
hid_input_report() from executing after device structures are freed?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260708015806.2137=
90-1-linux@roeck-us.net?part=3D3
