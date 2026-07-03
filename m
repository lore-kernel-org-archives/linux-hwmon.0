Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C6B330B53F
	for <linux-hwmon@vger.kernel.org>; Fri,  3 Jul 2026 08:19:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783066767; cv=none; b=i6JVXf7zqpZRVBmvcFux8N/i0VEp1NejsDKYX1nKWYwsWVc4zJgLqUBYfwag5VzkVeSsJXSvd1kXYd+1GhTDVqjtXCirWvaVzrZDyCaTsrXDzeQvAy4VzvRRGdMo6gHlCzua7EW1TVnWtVlRzvzRo6boK/OhqGW4/8bOLq2ZxuE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783066767; c=relaxed/simple;
	bh=UVRCarSU4jOzQeTsl4IC6q5LtCG23uFcwFiEO3C7T58=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=rwD1lECD8U9yBz7vswoqQjTeo4MtZwUptszvkhdcBNxqeSjMlbDrEPr4EhZg54UIX07GT0R844S/PwUm5dRu3TccpBjAbtnHJsaHMFGGLcSDZT8+WPG1bHpg7JZGf7vYFqmupseOtgf23JDbS9So8z8pMejanWSpzOs6odyuKRA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ADoeez5j; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ADoeez5j"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C9CAB1F000E9;
	Fri,  3 Jul 2026 08:19:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783066766;
	bh=Z09mUaHt6iibKrjc6dmcggyJ+CrUu0/Hj8QAeQcPvLo=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=ADoeez5jHy7FRTlnvJUzf9T76KzTAljNgjHpwJZuvbWBF8gymqFKspdISbxt8c2Lt
	 Q3q3pB4VNGjndqGkoQeRX2EexwHfhkt5okfPH55TX/VBFDdK0RHZ/vI8o1Tpe37Jb1
	 qTEcnXIXZnNhCv5+j5FfGoawprPc+syA0uYMRpbfxHNNl4Y2AAZcDvCVAyTprvxXHL
	 iJXTNmBo9WGlL7mG+AYv4w+XA011aCP6ryv/yxNvxHQdSKrty8sEam+rJDyHbA21eW
	 M1V0pCZ+fV9xJWP+hTTTnuBwP9VTyqmLV3nqb+piBwWzUazTXeVKJ+OizuocPMAoRF
	 cD/d4YSPz3z2g==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 1/2] firmware: stratix10-svc: add async HWMON read
 commands and register socfpga-hwmon device
Reply-To: sashiko-reviews@lists.linux.dev
To: tze.yee.ng@altera.com
Cc: linux-hwmon@vger.kernel.org
In-Reply-To: <af1e81827ba72ea901686619bd66dd810f3c8b02.1783062999.git.tze.yee.ng@altera.com>
References: <cover.1783062999.git.tze.yee.ng@altera.com>
 <af1e81827ba72ea901686619bd66dd810f3c8b02.1783062999.git.tze.yee.ng@altera.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 03 Jul 2026 08:19:25 +0000
Message-Id: <20260703081925.C9CAB1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:

Pre-existing issues:
- [High] The async service layer is torn down before the child platform dev=
ices (HWMON and RSU) are unregistered, leading to a Use-After-Free and NULL=
 pointer dereference if a concurrent async call is made.
--

commit 2c6317a7aef89428e616ea8354fab157b27ff35f
Author: Tze Yee Ng <tze.yee.ng@altera.com>

firmware: stratix10-svc: add async HWMON read commands and register socfpga=
-hwmon device

Add asynchronous Stratix 10 service layer support for hardware monitor
temperature and voltage read commands. Register a socfpga-hwmon platform
device when hardware monitor support is enabled.

> diff --git a/drivers/firmware/stratix10-svc.c b/drivers/firmware/stratix1=
0-svc.c
> index c24ca5823078f..716b58f5a6170 100644
> --- a/drivers/firmware/stratix10-svc.c
> +++ b/drivers/firmware/stratix10-svc.c

[ ... ]

> @@ -2050,6 +2087,9 @@ static void stratix10_svc_drv_remove(struct platfor=
m_device *pdev)
> =20
>  	of_platform_depopulate(ctrl->dev);
> =20
> +	if (svc->stratix10_svc_hwmon)
> +		platform_device_unregister(svc->stratix10_svc_hwmon);
> +

[Severity: High]
This is a pre-existing issue, but does unregistering the child devices here
introduce a race condition with module removal?

In stratix10_svc_drv_remove(), we tear down the async service layer before
the child devices are unregistered:

	stratix10_svc_async_exit(ctrl);
	of_platform_depopulate(ctrl->dev);
	if (svc->stratix10_svc_hwmon)
		platform_device_unregister(svc->stratix10_svc_hwmon);

If a sysfs read for the hwmon device (e.g., temp1_input) races with module
unload, could it proceed to stratix10_svc_async_send() because the device
is not yet unregistered?

If so, it looks like stratix10_svc_async_send() will dereference the achan
structure that was already freed:

	ret =3D ida_alloc_max(&achan->job_id_pool, MAX_SDM_JOB_IDS,
			    GFP_KERNEL);

And later attempt a NULL pointer dereference, as actrl->invoke_fn was set
to NULL by stratix10_svc_async_exit():

	actrl->invoke_fn(actrl, &args, &res);

Should the child platform devices be unregistered before
stratix10_svc_async_exit() is called?

>  	platform_device_unregister(svc->stratix10_svc_rsu);
> =20
>  	for (i =3D 0; i < SVC_NUM_CHANNEL; i++) {

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/cover.1783062999.gi=
t.tze.yee.ng@altera.com?part=3D1
