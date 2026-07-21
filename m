Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6407A3F8EB5
	for <linux-hwmon@vger.kernel.org>; Tue, 21 Jul 2026 02:30:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784601011; cv=none; b=Z8FgYlj/8hw5+OdoOOfNSH5Lncrl5Xt2sTav5aMwEfe6htR0VeoKPuQPiDvagG2VHX8W+cPUG+k9iBHdwUYwvKNmSLsd8RW6MrdCP1M145Oj1zDWbZZGTGUs5dgTrIgDed4Dm3CIJzP7FUW1JlybXnCUlzn63MQADwq0bvwe5GU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784601011; c=relaxed/simple;
	bh=hGj1LgjiRJLkhobA+ssYui/xr/qG1MNrpNVlyEipDn8=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=e0/npbPRHFr/o2fgwFn48iNERUd3trP4fmSYMnHtz231F7K/bHi0n7n6HGg5awbd1td2HtMQxoQqxhXZsesub8MMwyHfk9dGqJiOgLqma8Xstubss2V5nAVHlKeuamlz7rwMi89CA78KXQUks6hRiyJs1ay1bIhf4CoxGGx9VLs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=oZH7cLyw; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="oZH7cLyw"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BD2FC1F000E9;
	Tue, 21 Jul 2026 02:30:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784601009;
	bh=uqPjRLoi1tbtYibCt/AHapUlf+wtTVJdWXyk43x68NI=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=oZH7cLywM8Dl+7tGc1wdyvVJP60s315NHT8CssBRc8tnuJ1bbJSi3kqe6O4GBk67V
	 s6+anvQh3ABL+ZY8jKx3iGlHEFN0P3cunXO9eyr2Q0OjBec2BrXYeVLJTVtD+SvIrG
	 hANhRUF7ur6oqnVSZSuE2esiy37+7LMf3Tee4KGI021iTSiQb179rQoyD0lYNNbMpR
	 xTFq41tr4YCwDKzow4//0N46hqMzEbH3i5rGnGKFuH9zZT3oR+7kEGRufISZt9PLe7
	 FECQI9uPd04m4zbpdNh9K/JWHtw0VzcRIH9FdKAh8DAFpYyyjxtNzj5J7gTdbDO5RB
	 dPaF3g3t81mzg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v7 1/2] firmware: stratix10-svc: add async HWMON read
 commands and register socfpga-hwmon device
Reply-To: sashiko-reviews@lists.linux.dev
To: tze.yee.ng@altera.com
Cc: linux-hwmon@vger.kernel.org
In-Reply-To: <a79aee37be7067691fd02a3a9cfd134c995e5a95.1784599864.git.tze.yee.ng@altera.com>
References: <cover.1784599864.git.tze.yee.ng@altera.com>
 <a79aee37be7067691fd02a3a9cfd134c995e5a95.1784599864.git.tze.yee.ng@altera.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 21 Jul 2026 02:30:09 +0000
Message-Id: <20260721023009.BD2FC1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:

New issues:
- [Medium] The firmware driver registers a platform device for hardware mon=
itoring instead of using the required auxiliary device framework.

Pre-existing issues:
- [High] The device node `fw_np` is used after its reference is automatical=
ly dropped by `of_find_matching_node()`, causing a Use-After-Free.
- [High] The async subsystem is destroyed before unregistering the RSU clie=
nt and DT children, creating a race condition that leads to a Use-After-Fre=
e (UAF).
--

--- Patch [1]: [PATCH v7 1/2] firmware: stratix10-svc: add async HWMON read=
 commands and register socfpga-hwmon device ---
commit 2168de7740e163afb68a564f62edd7410c642631
Author: Tze Yee Ng <tze.yee.ng@altera.com>

firmware: stratix10-svc: add async HWMON read commands and register socfpga=
-hwmon device

Add asynchronous Stratix 10 service layer support for hardware monitor
temperature and voltage read commands. Register a socfpga-hwmon platform
device from the service layer driver when hardware monitor support is enabl=
ed.

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

[Severity: Medium]
Does this code register a platform device for hardware monitoring instead
of using the required auxiliary device framework?

According to the hardware monitoring subsystem guidelines, secondary
hardware monitoring functionality in multi-function devices should be
implemented as an auxiliary device on the auxiliary bus, rather than a
standalone platform device.

> +		if (!svc->stratix10_svc_hwmon) {
> +			dev_err(dev, "failed to allocate %s device\n",
> +				SOCFPGA_HWMON);
> +		} else {
> +			svc->stratix10_svc_hwmon->dev.parent =3D dev;
> +
> +			ret =3D platform_device_add(svc->stratix10_svc_hwmon);
> +			if (ret) {
> +				dev_err(dev, "failed to add %s device: %d\n",
> +					SOCFPGA_HWMON, ret);
> +				platform_device_put(svc->stratix10_svc_hwmon);
> +				svc->stratix10_svc_hwmon =3D NULL;
> +			}
> +		}
> +	}
> +
>  	ret =3D of_platform_default_populate(dev_of_node(dev), NULL, dev);
>  	if (ret)
> -		goto err_unregister_rsu_dev;
> +		goto err_unregister_clients;
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
This is a pre-existing issue, but does this teardown order destroy the
async infrastructure before safely unregistering the dependent child
devices?

In stratix10_svc_drv_remove(), stratix10_svc_async_exit() is executed before
platform_device_unregister() for the RSU child device. This frees the achan
structures.

If a concurrent sysfs access on the still-registered child device calls
stratix10_svc_async_send() and is preempted right after checking
actrl->initialized:

    if (!actrl->initialized) {
        ...

And the removal thread proceeds to free achan, wouldn't the sysfs thread
then resume and dereference the freed achan:

    ret =3D ida_alloc_max(&achan->job_id_pool, MAX_SDM_JOB_IDS,
                        GFP_KERNEL);

leading to a use-after-free?

[ ... ]

[Severity: High]
This is a pre-existing issue, but does of_find_matching_node() drop the
reference to fw_np before it is used again in stratix10_svc_init()?

Looking at stratix10_svc_init():

    np =3D of_find_matching_node(fw_np, stratix10_svc_drv_match);
    if (!np)
        return -ENODEV;
   =20
    of_node_put(np);
    ret =3D of_platform_populate(fw_np, stratix10_svc_drv_match, NULL, NULL=
);

Since of_find_matching_node() automatically drops the reference on the from
node (fw_np) before advancing, doesn't passing fw_np to of_platform_populat=
e()
immediately after result in a use-after-free?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/cover.1784599864.gi=
t.tze.yee.ng@altera.com?part=3D1
