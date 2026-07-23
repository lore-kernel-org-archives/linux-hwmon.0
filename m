Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4B85326D55
	for <linux-hwmon@vger.kernel.org>; Thu, 23 Jul 2026 06:14:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784787260; cv=none; b=X6BjPyWmsbszGfh+F6Ss7UGxZfX8EdccpM5g/U5RwukmfKDTSiwf9EAfUvVAOLwkndv/eNtR3GE+PtEGdmvf4+mfMkeS5S/gIhHPnWt+c0z6dw8SvTVGb+3KfKPuA/ENJY0HROUKmNPz7CCewm8nMnFTs8rlC6o33EGVGif5Tok=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784787260; c=relaxed/simple;
	bh=6LgWMrJ9E9TzFPz0vfuUK+jyUQt1hsYPwk0smdTGaz0=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=pXVoMS+oStrvJL4bMxIjZ+AbUI0r3KYIlXol1HEWBzzYHWShRNYmTeDrXulPOgKNpeqh4Ceis7MJBo6kh25iK9z7auDUvx0QUD9V2wT0NwNd1JRN5D0O7GVNPWV/iwMfj73EWrGw0HlCXFJZFRRnIzD4s05hlceqUjqZgP9BFNA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=BeoSIx8x; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="BeoSIx8x"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 423A81F000E9;
	Thu, 23 Jul 2026 06:14:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784787258;
	bh=9rPPyYfcNqSAL6P+PXoKpBQ5FQ63HSB1sjNYs35hmMQ=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=BeoSIx8xjyMWWnZNqMEeprBuXHpm5dYbH5hdqOeSnsKPDGPawFZLu5yAUK4D1pXnT
	 pn3Ooy8vO9IMoKDQZHXePWd+X+EFdbXXGxZCp8jhELbzQq6YPJWUyV8xqAkQPUeRWb
	 TbxMoNW3jTZCbEE7eG7gYh4qE1BaiPa6DNECvKk+CtOX9XSSjspdJXnDT16m6McSDP
	 1SrMXKz9ukSaFp+odT2envElDtvgmd96WNbBBSq98fe9/bTzBUH4FAkKuymj+Kc9hy
	 QR6IKznW758IV1Qe5bvxEs7Ut77WYbz4bL6Gbu96gUHFwBP7ueguPx5aWgmePSyiRC
	 qkzw4ADVmXMkw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v8 1/2] firmware: stratix10-svc: add async HWMON read
 commands and register socfpga-hwmon device
Reply-To: sashiko-reviews@lists.linux.dev
To: tze.yee.ng@altera.com
Cc: linux-hwmon@vger.kernel.org
In-Reply-To: <a79aee37be7067691fd02a3a9cfd134c995e5a95.1784785709.git.tze.yee.ng@altera.com>
References: <cover.1784785709.git.tze.yee.ng@altera.com>
 <a79aee37be7067691fd02a3a9cfd134c995e5a95.1784785709.git.tze.yee.ng@altera.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 23 Jul 2026 06:14:17 +0000
Message-Id: <20260723061418.423A81F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:

New issues:
- [Medium] Hardware monitoring functionality is improperly registered as a =
platform device instead of an auxiliary device.

Pre-existing issues:
- [High] Pre-existing Use-After-Free race condition during module removal d=
ue to improper teardown ordering of child devices.
--

--- Patch [1]: [PATCH v8 1/2] firmware: stratix10-svc: add async HWMON read=
 commands and register socfpga-hwmon device ---
commit 5ba2e4fb155f074de568280aeede81883f87924e
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
According to the hardware monitoring subsystem guidelines, if the main
functionality of a chip is not hardware monitoring, its secondary hardware
monitoring functionality should be implemented as an auxiliary device drive=
r.

Since the primary purpose of this module is the firmware service layer,
does registering the hardware monitoring functionality as a platform device
violate the subsystem API layering? Could this be implemented via the
auxiliary bus instead of using platform_device_alloc()?

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
This is a pre-existing issue, but does this teardown order create a
use-after-free race condition during module removal?

The stratix10_svc_drv_remove() function calls stratix10_svc_async_exit()
before unregistering the remaining OF child devices and the RSU child devic=
e.
The async exit function destroys the async structures and frees the
asynchronous channels and handlers.

If userspace concurrently accesses sysfs attributes for the child devices
while the module unloads, could it invoke stratix10_svc_async_send()
or stratix10_svc_async_poll() after the async channels have been freed?

For example, stratix10_svc_async_send() performs lockless reads of achan:

stratix10_svc_async_send() {
	...
	achan =3D chan->async_chan;
	ctrl =3D chan->ctrl;
	actrl =3D &ctrl->actrl;

	if (!actrl->initialized) {
	...
}

Would this lead to memory corruption if the structures are already dealloca=
ted?
Should the child devices be fully unregistered before calling
stratix10_svc_async_exit() to ensure no concurrent accesses are possible?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/cover.1784785709.gi=
t.tze.yee.ng@altera.com?part=3D1
