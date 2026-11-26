Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795682081;
	b=A3Me/xjrHVp160tmt7Y33wSGD3IWhj1wDgFGaOj4O9LVO1zhv1O5bdHvmQJPWQtX1ygC
	 tEwzJHlzAid3ipNmUKhYeCFtY+mIbwRWImzOxdS21/cwrqxPDx9twiXLUyGBvIwDQdQ7p
	 47gNmQnrGMo9IGbRXksXZVcVM8Nb7O0+XIJtMv/CEl99DPM4IU6a6/7ERwgsUPGMcZFJa
	 mN9kwOIIOuTQYvYYTFnSnl1fKzLJcKUP/2GRlsijvuOPAAxzb2/LEE+Yjl2EUfsHkRmO9
	 xSm7+wM3FRIDlKomstzaaRld/Q/tCV8maFVoYPvMaJ7PfDqb++wy2+/5dr61pBcFGhQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795682081;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=paio2TSL/SXvUQvPyPz49zFx7/hrzFYPuUZy2gPn2qc=;
	b=dCgOZ9RxcKD6Jl87l06o3adDR8U1tCRIEcqOZyIu1klJ7LiwHuNSt8hmW8gT1AMDLDrT
	 /F+kLLtzogWI0w9l2yEjXBYPDIiYLCCU0UyTTNrcQ/I+GiVGbg2OVKciVEB3VMfDqyk5D
	 ZW6xOVmxiZ9orjsv2O29MLNzNTKyr5wXk0RmDC6iu/GRfi5RKfHbAukwlu8jLuZ6Pb8tv
	 2AUDZu2EOBte/BoLFnsY1WqfcJM0ikG2AsTybQ00xT7QWC8sQoK1z234F5p2lD+5PbJ/2
	 paRB7+wuFRm1xa+fPwjeiGhszMTi0N+yQ12f5OQ8i75Hc474qjUhzvCKWe2UHpHNKfg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=EbLysRcJ;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C99A606A31C
	for <linux-hwmon@vger.kernel.org>; Thu, 26 Nov 2026 08:34:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=EbLysRcJ
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BCBCD1F000C6;
	Thu, 26 Nov 2026 08:34:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795682080;
	bh=paio2TSL/SXvUQvPyPz49zFx7/hrzFYPuUZy2gPn2qc=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=EbLysRcJC0Jnrk2jpuzEqQTM+fWfxts0twu/bF94PAyu3G76jUw5yLT4dkBKf469D
	 GNzHedxh3HHY2Om3JXk7bOhtK3y6YCT0mrZ/H7AxoYmZK9GgorFyvhMO2TQdvZ2+MZ
	 Ak65/j25x8avxR0Ab0LPaCSm0/GjFiqwe7B4ZG3RJOUuLMxWhJ8sNI5WfSg/T0FUUh
	 c91lqAjP4+KcuM01NVocsquS/cHuiwokzaAC7OkyiF4AEOrQ4PyZTmFDo4Czy55T2p
	 pDtm1kLmZWB3aI4E3/nwAXnw2qwP28E2TGbydvkqKmad6uNVZX1lB51PhjGfGGnBU4
	 tuYXxTqvmj02w==
Message-ID: <sashiko-outbox-235031@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 2/2] platform/x86: Add Emdoor Intel EWMI platform
 driver
Reply-To: sashiko-reviews@lists.linux.dev
To: "Ziqiang Xia" <xiazq123666@gmail.com>
Cc: linux-hwmon@vger.kernel.org
In-Reply-To: <20261126-emdoor-intel-wmi-rfc-v3-2-7dfbb70f04a9@gmail.com>
References: <20261126-emdoor-intel-wmi-rfc-v3-0-7dfbb70f04a9@gmail.com>
 <20261126-emdoor-intel-wmi-rfc-v3-2-7dfbb70f04a9@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 26 Nov 2026 08:34:40 +0000
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Post: <mailto:linux-hwmon@vger.kernel.org>
List-Help: <mailto:linux-hwmon+help@vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-hwmon+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 1 potential
issue to consider:
- [Medium] platform/x86: devres ordering UAF on priv->profile in
  ewmi_method_probe()
--

commit bb36b820143c26587e8a321ea23c0c4bd48c65cd
Author: Ziqiang Xia <xiazq123666@gmail.com>

platform/x86: Add Emdoor Intel EWMI platform driver

This commit adds a WMI platform driver for Emdoor Intel EWMI laptops,
exposing hwmon fan tachometers, platform_profile, touchpad state, and
WMI hotkey events.

> diff --git a/drivers/platform/x86/emdoor-intel-wmi.c b/drivers/platform/x=
86/emdoor-intel-wmi.c
> new file mode 100644
> index 0000000000000..f530462e2c400
> --- /dev/null
> +++ b/drivers/platform/x86/emdoor-intel-wmi.c
[ ... ]
> +static void ewmi_profile_work(struct work_struct *work)
> +{
> +	struct ewmi_method *priv =3D container_of(work, struct ewmi_method,
> +						profile_work);
> +
> +	platform_profile_notify(priv->profile);
> +}
> +
> +static int ewmi_method_event(struct notifier_block *nb, unsigned long co=
de,
> +			     void *data)
> +{
> +	struct ewmi_method *priv =3D container_of(nb, struct ewmi_method,
> +						event_nb);
> +	struct wmi_device *event_wdev =3D data;
> +
> +	if (event_wdev->dev.parent !=3D priv->wdev->dev.parent)
> +		return NOTIFY_DONE;
> +	if (code =3D=3D EWMI_EVENT_PROFILE_NOTIFY ||
> +	    code =3D=3D EWMI_EVENT_PROFILE_BALANCED ||
> +	    code =3D=3D EWMI_EVENT_PROFILE_PERFORMANCE)
> +		schedule_work(&priv->profile_work);
> +
> +	return NOTIFY_OK;
> +}
> +
> +static void ewmi_method_stop(void *data)
> +{
> +	struct ewmi_method *priv =3D data;
> +
> +	blocking_notifier_chain_unregister(&ewmi_event_chain, &priv->event_nb);
> +}
> +
> +static int ewmi_method_probe(struct wmi_device *wdev, const void *contex=
t)
> +{
> +	static const u8 expected_version[] =3D { 1, 0, 1, 0 };
> +	struct ewmi_method *priv;
> +	struct device *hwmon;
> +	u8 version[4];
> +	int ret;
> +
> +	priv =3D devm_kzalloc(&wdev->dev, sizeof(*priv), GFP_KERNEL);
> +	if (!priv)
> +		return -ENOMEM;
> +	priv->wdev =3D wdev;
> +
> +	ret =3D devm_mutex_init(&wdev->dev, &priv->lock);
> +	if (ret)
> +		return ret;
> +
> +	ret =3D devm_work_autocancel(&wdev->dev, &priv->profile_work,
> +				   ewmi_profile_work);
> +	if (ret)
> +		return ret;
> +
> +	dev_set_drvdata(&wdev->dev, priv);
> +
> +	scoped_guard(mutex, &priv->lock) {
> +		ret =3D ewmi_call(priv, EWMI_GRP_SYSTEM, EWMI_CMD_GET_VERSION, 0,
> +				version, sizeof(version));
> +		if (ret) {
> +			return dev_err_probe(&wdev->dev, ret,
> +					     "Cannot query protocol version\n");
> +		}
> +	}
> +	if (memcmp(version, expected_version, sizeof(version))) {
> +		return dev_err_probe(&wdev->dev, -ENODEV,
> +				     "Unsupported protocol version\n");
> +	}
> +
> +	priv->profile =3D devm_platform_profile_register(&wdev->dev,
> +						       "emdoor-intel-wmi",
> +						       priv, &ewmi_profile_ops);
> +	if (IS_ERR(priv->profile)) {
> +		return dev_err_probe(&wdev->dev, PTR_ERR(priv->profile),
> +				     "Cannot register platform profile\n");
> +	}
> +
> +	priv->event_nb.notifier_call =3D ewmi_method_event;
> +	ret =3D blocking_notifier_chain_register(&ewmi_event_chain,
> +					       &priv->event_nb);
> +	if (ret)
> +		return ret;
> +	ret =3D devm_add_action_or_reset(&wdev->dev, ewmi_method_stop, priv);
> +	if (ret)
> +		return ret;

[Severity: Medium]
Can ewmi_profile_work() cause a use-after-free on priv->profile during
device teardown?

Because devm_work_autocancel() is registered before
devm_platform_profile_register(), devres teardown runs them in reverse
order:

CPU0                              CPU1
ewmi_event_notify()
  ...
    ewmi_method_event()
      schedule_work(&priv->profile_work)
device_release_driver()
  ewmi_method_stop()
  devm_platform_profile_release()
    platform_profile_remove(priv->profile)
                                  ewmi_profile_work()
                                    platform_profile_notify(priv->profile)
                                      <-- use-after-free
  devm_work_drop()
    cancel_work_sync(&priv->profile_work)

Registering devm_work_autocancel() after devm_platform_profile_register()
(or canceling priv->profile_work in ewmi_method_stop()) ensures the work
is canceled before priv->profile is removed.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261126-emdoor-int=
el-wmi-rfc-v3-0-7dfbb70f04a9@gmail.com?part=3D2
