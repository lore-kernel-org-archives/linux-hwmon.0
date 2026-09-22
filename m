Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4080D4BEE41;
	Tue, 22 Sep 2026 09:43:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790070227; cv=none; b=GCjBX/ib1jXOv18b0UxvlRFHm2JrDfptK8xHD0ogTBNmwZsm6eklRtGqrYlKq7+7JSrjaDUBuzlGjwnx2vNSaZDb3aJXabU8N7N2p/BmKgWM9P/pFdwRdIqDFQ0i6jPuCd/eCHsCei0VTuu23Wh9EhdJ9upSbICSZ+IcVvxaQn0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790070227; c=relaxed/simple;
	bh=H/vzhqXD6UArM3yreFwvNJ/cq5I0xodjrTIu/JPy+EE=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=hG3yz5WHstCa2ZaPQFAzTA4u17x+C2RxPfcE96ouSac25m8VApKe/ss9f3wiCxDQyi9YI8RoYlr0etfdzfg+Asnpiq0VrWJ2gqoQuCC6IJySQyym2+bNY18c75eJWWwtRlxTHqwtEzD1+jNCYVs6XrIM+ibfLYv5a8GCmu7sMXY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=UXjcF6em; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="UXjcF6em"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4AC0E1F0089C;
	Tue, 22 Sep 2026 09:43:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790070224;
	bh=fqhuMQzi9widyoh6tf3trEiul7S2/iHANV8X+8jaHa4=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=UXjcF6em6h/liBQZI8XmH1mBSR7bEhPFaPTbYYdupUbCKKLAA9YHhzEkTf/t0y6Xe
	 GNk4odn6VdHXbj/Eal21mStSubR4TBs0/UDi4HXVvrEZsgBZ9iXGDOoRKcGX2wByjd
	 VLeKTVwyqhVFRBqC+LMLMp3P6rK1l1q40fR0ty6XH3dUvTwaACos3XQDTy20vsu+he
	 WQxPLw3ZWN+sW+FrXoMPlMSeLFINJrWmD6idKmRNRqWu5zHMPAeDObLK0rsaQuN1G6
	 MjHORyKEE6vguu6LUoCd+Z/0Bqbc6Wg6fK0PvjdxSdcXfiMRz5EXsgkgRb9Yxa06oL
	 1ntfkXbgfQpvQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 2/3] platform: arm64: Add a driver for the EC found
 on ASUS Glymur machines
Reply-To: sashiko-reviews@lists.linux.dev
To: "Konrad Dybcio" <konradybcio@kernel.org>
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org, linux-hwmon@vger.kernel.org
In-Reply-To: <20260922-topic-asus_ec-v2-2-0bd923d1b853@oss.qualcomm.com>
References: <20260922-topic-asus_ec-v2-0-0bd923d1b853@oss.qualcomm.com>
 <20260922-topic-asus_ec-v2-2-0bd923d1b853@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 22 Sep 2026 09:43:43 +0000
Message-Id: <20260922094344.4AC0E1F0089C@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [Medium] hwmon: registering hwmon device directly from platform driver vi=
olates layering
- [Low] pm: incorrect wrapper pm_sleep_ptr() used for dev_pm_ops structure =
pointer
--

commit 44a5c0660bb0cff2ea5d3dea9865fa4467ddcef3
Author: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

platform: arm64: Add a driver for the EC found on ASUS Glymur machines

This commit adds a driver for the embedded controller found on ASUS
Zenbook A14 and A16 laptops. It exposes fan monitoring, temperature
sensor readouts, keyboard backlight controls, and event reporting over I2C.

> diff --git a/drivers/platform/arm64/asus-glymur-ec.c b/drivers/platform/a=
rm64/asus-glymur-ec.c
> new file mode 100644
> index 0000000000000..dec9b137b820d
> --- /dev/null
> +++ b/drivers/platform/arm64/asus-glymur-ec.c
[ ... ]
> @@ -546,12 +546,12 @@ static int asus_glymur_ec_probe(struct i2c_client *=
client)
>  	ret =3D devm_request_threaded_irq(dev, client->irq, NULL, asus_ec_irq,
>  					IRQF_ONESHOT, dev_name(dev), ec);
>  	if (ret)
>  		return dev_err_probe(dev, ret, "Failed to request IRQ\n");
> =20
>  	ec->hwmon_dev =3D devm_hwmon_device_register_with_info(dev,
>  							     "asus_glymur_ec",
>  							     ec,
>  							     &asus_ec_hwmon_chip_info,
>  							     NULL);

[Severity: Medium]
Does registering the hwmon device directly from this platform driver violate
the hwmon subsystem layering rules? The hardware monitoring subsystem guide=
lines
state that if the main functionality of a chip is not hardware monitoring, =
its
hardware monitoring functionality should be implemented as an auxiliary dev=
ice
driver, and the hardware monitoring driver should reside in drivers/hwmon/.

>  	if (IS_ERR(ec->hwmon_dev))
>  		return dev_err_probe(dev, PTR_ERR(ec->hwmon_dev),
>  				     "Failed to register hwmon\n");
> =20
>  	return 0;
>  }
[ ... ]
> @@ -578,11 +578,11 @@ static const struct i2c_device_id asus_glymur_ec_id=
[] =3D {
>  	{ "asus-glymur-ec" },
>  	{}
>  };
>  MODULE_DEVICE_TABLE(i2c, asus_glymur_ec_id);
> =20
>  static struct i2c_driver asus_glymur_ec_driver =3D {
>  	.driver =3D {
>  		.name		=3D "asus-glymur-ec",
>  		.of_match_table	=3D asus_glymur_ec_of_match,
>  		.pm		=3D pm_sleep_ptr(&asus_glymur_ec_pm_ops),

[Severity: Low]
Is pm_sleep_ptr() the correct wrapper for the dev_pm_ops structure pointer?
The PM subsystem guide indicates that pm_ptr() should be used for wrapping
dev_pm_ops structure pointers, while pm_sleep_ptr() is meant for wrapping
individual sleep callbacks. This may result in dead code or warnings when PM
support configurations vary.

>  	},
>  	.probe		=3D asus_glymur_ec_probe,
>  	.id_table	=3D asus_glymur_ec_id,
>  };

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260922-topic-asus=
_ec-v2-0-0bd923d1b853@oss.qualcomm.com?part=3D2
