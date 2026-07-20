Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 051C8397B17
	for <linux-hwmon@vger.kernel.org>; Mon, 20 Jul 2026 03:37:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784518640; cv=none; b=VHvhbM/Tl2+7DYsYZ1kvlp09btby8+8HyAs1rp0EOx9xw2KT+YES2Q9tmavFzs1bUiU/0NqfIw4IuI8ZOF5bdjnkNPDaJqxAnfh1pE+36EHZhFWpW1Wde+vyawc3+8Cq+owMP8fsUVyq7JWuiVQtLsNM5ffYgnytWvuuJEoS/MY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784518640; c=relaxed/simple;
	bh=ycqKrlmlYFas/HWzoxOpQ0dzSyziciMPHqCMbxP6YG0=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=k+QcA3MQarU+z2He5gSmFxiD4vdDvcQJGzOOgBnPiPqYYrBhZLhLa7gapTzXniuJpbPgsMP7Ux6G8rVLg439hjntPlmegBMiYsp4pFMWk8RcKV2ROhSSUEqniYiaexY+L8/aw0G1W8OqBnu7bly+ozeqn+x9UzIbSo7VCEk5X+4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Kn1oSpbp; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Kn1oSpbp"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 783F01F000E9;
	Mon, 20 Jul 2026 03:37:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784518638;
	bh=6ETWewR1vtQRVMs7UBmCaThiZGUOJ1oROOdWS1JzUKQ=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Kn1oSpbpHOp2Xpvmm9piku45V++5tFls0RcbKcnLVKsD14rdj1R7sQAI6am6vOk3F
	 xqwJjBIPrAt8AhJjjKHsm9UUhzWjec5EkjXbaFtsoUOjY9HRXTXpsTeKcZ8PPZy+HU
	 eJjOoCxEXMqm1wNG6SGaYd1C0CF5UlXu6vtkYrCgbOlmF4J43QYkR9onNBLU7kIRA7
	 fSishRdypb0VkRImvULcMg/YammfhItsElT9Xh2Xt3TgcknGFIP9+eX1sRju5yHT5+
	 gO9wg3IalRQ/LxYA1TvjHoUpjyGRG2cM0VK9C194K3PwXjwde435CKjyUEKrhFihxU
	 7hoIW35ovWrQA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v6 1/2] firmware: stratix10-svc: add async HWMON read
 commands and register socfpga-hwmon device
Reply-To: sashiko-reviews@lists.linux.dev
To: tze.yee.ng@altera.com
Cc: linux-hwmon@vger.kernel.org
In-Reply-To: <a79aee37be7067691fd02a3a9cfd134c995e5a95.1784516953.git.tze.yee.ng@altera.com>
References: <cover.1784516953.git.tze.yee.ng@altera.com>
 <a79aee37be7067691fd02a3a9cfd134c995e5a95.1784516953.git.tze.yee.ng@altera.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 20 Jul 2026 03:37:18 +0000
Message-Id: <20260720033718.783F01F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:

New issues:
- [Medium] Hardware monitoring functionality is registered as a platform de=
vice rather than an auxiliary device, violating hwmon subsystem layering ru=
les.

Pre-existing issues:
- [High] Asynchronous service layer APIs and resources are destroyed before=
 client devices are unregistered, leading to a Use-After-Free and NULL poin=
ter dereference race condition.
--

--- Patch [1]: [PATCH v6 1/2] firmware: stratix10-svc: add async HWMON read=
 commands and register socfpga-hwmon device ---
commit 552947f984c2b5770daa9717c679362b5561cfa3
Author: Tze Yee Ng <tze.yee.ng@altera.com>

firmware: stratix10-svc: add async HWMON read commands and register socfpga=
-hwmon device

Add asynchronous Stratix 10 service layer support for hardware monitor
temperature and voltage read commands in stratix10_svc_async_send() and
stratix10_svc_async_prepare_response().

Register a socfpga-hwmon platform device from the service layer driver
when hardware monitor support is enabled, similar to the RSU device.

> diff --git a/drivers/firmware/stratix10-svc.c b/drivers/firmware/stratix1=
0-svc.c
> index c24ca5823078f..fc38afed5b7fe 100644
> --- a/drivers/firmware/stratix10-svc.c
> +++ b/drivers/firmware/stratix10-svc.c
[ ... ]
> @@ -2013,16 +2028,38 @@ static int stratix10_svc_drv_probe(struct platfor=
m_device *pdev)
>  	if (ret)
>  		goto err_put_device;
> =20
> +	if (IS_ENABLED(CONFIG_SENSORS_ALTERA_SOCFPGA_HWMON)) {
> +		svc->stratix10_svc_hwmon =3D
> +			platform_device_alloc(SOCFPGA_HWMON, 0);
> +		if (!svc->stratix10_svc_hwmon) {
> +			dev_err(dev, "failed to allocate %s device\n",
> +				SOCFPGA_HWMON);
> +		} else {
> +			svc->stratix10_svc_hwmon->dev.parent =3D dev;
> +
> +			ret =3D platform_device_add(svc->stratix10_svc_hwmon);

[Severity: Medium]
Should the hardware monitoring functionality be implemented as an auxiliary
device driver instead of a platform device?

The hardware monitoring subsystem guidelines state that when hardware
monitoring is a secondary function of a chip, it should be implemented as an
auxiliary device and reside in drivers/hwmon/.

Does registering socfpga-hwmon directly as a platform device from this
firmware service driver bypass the architectural layering rules for hwmon?

[ ... ]
> @@ -2046,6 +2083,9 @@ static void stratix10_svc_drv_remove(struct platfor=
m_device *pdev)
>  	struct stratix10_svc_controller *ctrl =3D platform_get_drvdata(pdev);
>  	struct stratix10_svc *svc =3D ctrl->svc;
> =20
> +	if (svc->stratix10_svc_hwmon)
> +		platform_device_unregister(svc->stratix10_svc_hwmon);
> +
>  	stratix10_svc_async_exit(ctrl);
> =20
>  	of_platform_depopulate(ctrl->dev);

[Severity: High]
This is a pre-existing issue, but can the destruction order in
stratix10_svc_drv_remove() lead to a NULL pointer dereference or a
use-after-free race condition?

When stratix10_svc_async_exit() is called, it destroys the async ID pool
and sets actrl->invoke_fn to NULL:

drivers/firmware/stratix10-svc.c:stratix10_svc_async_exit() {
    ...
    ida_destroy(&actrl->async_id_pool);
    actrl->invoke_fn =3D NULL;
    ...
}

However, the RSU client device is unregistered after this destruction step
via platform_device_unregister(svc->stratix10_svc_rsu).

If a user interacts with a client device's sysfs attribute while the module
is being unloaded, could the still-active client device invoke
stratix10_svc_async_send()?

If so, it would concurrently access freed asynchronous channels or attempt
to execute actrl->invoke_fn(actrl, &args, &res) after it has been locklessly
cleared, resulting in a kernel crash.

Would it be safer to unregister all child and client devices before the
resources they depend on are torn down?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/cover.1784516953.gi=
t.tze.yee.ng@altera.com?part=3D1
