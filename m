Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 581AFCA4E
	for <linux-hwmon@vger.kernel.org>; Wed,  8 Jul 2026 02:09:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783476588; cv=none; b=kJYMijdNL9/j8l9zSzMnaEmugLHKFQ5MBO9NXqkPBrrIucsFgmc0zx2VogZiLojSyM0gmuf8aD3wnHQ5Jpj1k+EpOP7PuAuMeTI0yTAr1XgDrbBQB+IbURF754s2/RySN044SX8BywKPJP9LzBOXV4Ec7iwcYPAz30yXewVEJIM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783476588; c=relaxed/simple;
	bh=ojwGtf5CEPU+gNL2JxQ5rY0iXP+sbwgJxeDjf5+bTXk=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=ZZ6fg6GDkNfJtI1p19aUbKAQ4zn1OhL6by0VEpgZqQcsF0+5A2gIRl9FH6rudZchZ/ludEpZSJpvTE2bHm8TLGryATUVdq2uU5HN0opYyVtnliISS98vTtVMTZ2iejEr4V4WstPV6FCfMJDzdvmNljzNeDelt0OZBystsAG4NxU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Duvty5UA; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Duvty5UA"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1A4F71F000E9;
	Wed,  8 Jul 2026 02:09:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783476587;
	bh=Eix/omIoLVg4j8J6X50HEu1ZhAfhiboNOeMULXeVtFs=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Duvty5UAMHj8ubU7wpHETGl8xAI2/I9Bgl8gQrV3yNK6j0Lrf8GwRNZuRoQKDfjAn
	 UHiy4FMnfcopPRL8jS1KHeWAPh/MFF1MIddNkPVF13j6HUd6NH1g6fSpjcCTAcgW3j
	 u2PIukVUS4LZAzajquhxbrjtHNafkG+7atOg/jnqxbz9y01UhSC1g2JjSICgmJWFxb
	 yPQtck21Q8s6vleIrUqgwbrarHw8Y6uxBwcxOM56qkagsCUX8xKdW31xtx0te1zRUZ
	 Hnxs2Atm7uxt2fNQ6BMm48EsMfC47H6/SCyhK+DhYBdUlHL3oF45ZITZ5VjYHUIds9
	 3bG//nD/cDxhA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 1/4] hwmon: (corsair-cpro) Stop device IO before calling
 hid_hw_stop
Reply-To: sashiko-reviews@lists.linux.dev
To: "Guenter Roeck" <linux@roeck-us.net>
Cc: linux-hwmon@vger.kernel.org
In-Reply-To: <20260708015806.213790-2-linux@roeck-us.net>
References: <20260708015806.213790-1-linux@roeck-us.net>
 <20260708015806.213790-2-linux@roeck-us.net>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 08 Jul 2026 02:09:46 +0000
Message-Id: <20260708020947.1A4F71F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:

New issues:
- [Low] The patch introduces a spurious kernel warning in the probe error p=
ath when `hid_hw_open()` fails by unconditionally calling `hid_device_io_st=
op()`.

Pre-existing issues:
- [High] The driver leaks a debugfs directory on probe failure, creating a =
Use-After-Free vulnerability.
- [High] A timeout during a USB command causes the driver to consume stale =
delayed responses for subsequent commands, permanently desynchronizing the =
protocol.
--

--- Patch [1]: [PATCH 1/4] hwmon: (corsair-cpro) Stop device IO before call=
ing hid_hw_stop ---
commit 0cdcb75d39b8efee212d1a27b0eb0c56aaafb5e9
Author: Guenter Roeck <linux@roeck-us.net>

hwmon: (corsair-cpro) Stop device IO before calling hid_hw_stop

Calling hid_hw_stop() does not stop the device IO. This results in a race
condition between hid_input_report() and driver probe failure. This commit
calls hid_device_io_stop() before hid_hw_stop() to fix the issue.

> diff --git a/drivers/hwmon/corsair-cpro.c b/drivers/hwmon/corsair-cpro.c
> --- a/drivers/hwmon/corsair-cpro.c
> +++ b/drivers/hwmon/corsair-cpro.c
[ ... ]
> @@ -646,6 +646,7 @@ static int ccp_probe(struct hid_device *hdev, const s=
truct hid_device_id *id)
>  out_hw_close:
>  	hid_hw_close(hdev);
>  out_hw_stop:
> +	hid_device_io_stop(hdev);

[Severity: Low]
Will this cause a spurious kernel warning if hid_hw_open() fails?=20

If hid_hw_open() fails earlier in ccp_probe(), the code jumps directly to=20
the out_hw_stop label:

ccp_probe() {
    ...
    ret =3D hid_hw_open(hdev);
    if (ret)
        goto out_hw_stop;
    ...
    hid_device_io_start(hdev);
    ...
}

Since hid_device_io_start() hasn't been called yet, hdev->io_started will=20
be false. Calling hid_device_io_stop() here will trigger the dev_warn()=20
"io already stopped" from the HID core. Could we conditionally check if IO=
=20
was started, or introduce a new error label to avoid this?

>  	hid_hw_stop(hdev);
>  	return ret;
>  }

[Severity: High]
This isn't a bug introduced by this patch, but does the driver leak a=20
debugfs directory if hwmon registration fails?

If hwmon_device_register_with_info() fails in ccp_probe(), the code jumps=20
to out_hw_close:

ccp_probe() {
    ...
    ccp_debugfs_init(ccp);

    ccp->hwmon_dev =3D hwmon_device_register_with_info(&hdev->dev, ...);
    if (IS_ERR(ccp->hwmon_dev)) {
        ret =3D PTR_ERR(ccp->hwmon_dev);
        goto out_hw_close;
    }
    ...
}

Because ccp is allocated with devm_kzalloc(), devres will free it when the=
=20
probe fails. However, without a call to debugfs_remove_recursive(), the=20
debugfs files remain. If userspace later reads a leaked file like=20
firmware_version, firmware_show() will dereference the freed ccp pointer.

[Severity: High]
This is also a pre-existing issue, but does a timeout in send_usb_cmd()=20
cause permanent protocol desynchronization?

If wait_for_completion_timeout() times out, send_usb_cmd() returns=20
-ETIMEDOUT without marking the completion as done:

send_usb_cmd() {
    ...
    t =3D wait_for_completion_timeout(&ccp->wait_input_report, ...);
    if (!t)
        return -ETIMEDOUT;
    ...
}

If the delayed hardware response arrives later, after a subsequent command=
=20
has called reinit_completion(), the interrupt handler will accept the stale=
=20
response:

ccp_raw_event() {
    ...
    if (!completion_done(&ccp->wait_input_report)) {
        memcpy(ccp->buffer, data, min(IN_BUFFER_SIZE, size));
        ...
        complete_all(&ccp->wait_input_report);
    }
    ...
}

This causes the new command to consume the stale response, leaving its own=
=20
response pending for the next command, permanently shifting the responses.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260708015806.2137=
90-1-linux@roeck-us.net?part=3D1
