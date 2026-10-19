Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792454015;
	b=wQ5vF0qEqfA4/0q2qewAwpnDJo5voTJmJNdOjcmw1H2/KX2TlVgG5+xd8TBVzonPKg2x
	 YOWB4Ho1Hm2X9lRNBLA5fwenJOtVFogmG7vtQ7KlcLar4u6pgxT8v9K2HSsXjkvWI8tSO
	 qSSK/Nix8RY5HCQb4k7ZuEH4Qeifoa9+KeA24MRLFS9ri+LRmqxbkg4VZs3B5Of20bW2v
	 zLELK1OruQ5l7aCMpmJmxvn2j/yu6VeNqwQQJoUrN56otOCTkNUyzYII/TgHomZjPr7ap
	 ND/eMAK0QS283EeoC5VJg32hkOHFf2oHJU82OR9GUh2GNB/wRCKlp/RCjcb1B10Pp5g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792454015;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=TozqVuhaDunIb8pWE01RsIHhk1lmt4vZyaG+rmzfi30=;
	b=5a6rRQsn6DP39SB73fiAkIAcNdv7ELNspgUZGN2b9iRCwj1bq9fY1n1R35yDY1nRt4Sq
	 ScMoyI1lpx6DsH1Gy8wpFcf/Zd1UNyebR8zz/Aq+IthThePkWMKJW13EARo2+3SRTsdkr
	 jHUExzzABeh5y1Z9AMLlAeaSFv71Gq0TmHuWtqQgd1fQQrTgUV4kl6ZNRzHdjezAHcXW/
	 xGfWUt4uBvJYQ7EVYoljI8aXejB1qzWDVwjKEubw2uBuz5JdwZyTtitz8zvap3pm+AFcr
	 p/eETmrQQixUF4Kh/y0tKco1x5UG7//TCh5kDS7A6LSZCBMrh4Ggpz9xvnDx/vRZUbw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=LOJ34Hd6;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C65A0606A319
	for <linux-hwmon@vger.kernel.org>; Mon, 19 Oct 2026 23:53:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=LOJ34Hd6
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 424B91F000C4;
	Mon, 19 Oct 2026 23:53:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792454014;
	bh=TozqVuhaDunIb8pWE01RsIHhk1lmt4vZyaG+rmzfi30=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=LOJ34Hd6oEqHP1avu+X2nfA//K41yiklg/zqKk8UFDVHkQNjflKRe6wepuarcUoe/
	 /FspRHtH0LOdu4qy1tRZuCcbVtm7rniJweBML2E9+MaSKsjDUkzTdZmpPP25OA7ZIc
	 KLtcKf0p7RcSzPmVKf+62AY5tXtKGFPdtVRodFxvPucwGSjbggUOHrq+3UAxjSKiXc
	 CSpbXtaCBFyxbVATEd2Oi7as4qh822HOyMP9EDB8xI2MlqhROPF8vDGAn46A8aNWMu
	 WT7cbSs8HX9LWXFtVDtfDo4cdqykWD2rX151GKNbvPreLqycTMSKyRXkuxf43ILUBf
	 oSsA9m5uQ3FiQ==
Message-ID: <sashiko-outbox-178366@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2] hwmon: (sht15) Stop deferred work before releasing
 its resources
Reply-To: sashiko-reviews@lists.linux.dev
To: "Myeonghun Pak" <mhun512@gmail.com>
Cc: linux-hwmon@vger.kernel.org
In-Reply-To: <20261019234402.805759-1-mhun512@gmail.com>
References: <20261019234402.805759-1-mhun512@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 19 Oct 2026 23:53:33 +0000
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Post: <mailto:linux-hwmon@vger.kernel.org>
List-Help: <mailto:linux-hwmon+help@vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-hwmon+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] hwmon: (sht15) IRQF_NO_AUTOEN in sht15_probe() breaks gpiod_direct=
ion_output()
--

commit 0765de729006e4101f713c8613f8a3c9ed6e7d2e
Author: Myeonghun Pak <mhun512@gmail.com>

hwmon: (sht15) Stop deferred work before releasing its resources

This commit switches the SHT15 driver from devm_request_irq() to
request_irq() and free_irq(), adds IRQF_NO_AUTOEN, and drains
read_work and update_supply_work during probe failure and device removal.

> diff --git a/drivers/hwmon/sht15.c b/drivers/hwmon/sht15.c
> index 7bb2105d1ae22..c95acec7ae2f8 100644
> --- a/drivers/hwmon/sht15.c
> +++ b/drivers/hwmon/sht15.c
[ ... ]
> @@ -976,25 +979,31 @@ static int sht15_probe(struct platform_device *pdev)
>  		goto err_release_reg;
>  	}
> =20
> -	ret =3D devm_request_irq(&pdev->dev, gpiod_to_irq(data->data),
> -			       sht15_interrupt_fired,
> -			       IRQF_TRIGGER_FALLING,
> -			       "sht15 data",
> -			       data);
> -	if (ret)
> +	data->irq =3D gpiod_to_irq(data->data);
> +	if (data->irq < 0) {
> +		ret =3D data->irq;
> +		goto err_release_reg;
> +	}
> +
> +	ret =3D request_irq(data->irq, sht15_interrupt_fired,
> +			  IRQF_TRIGGER_FALLING | IRQF_NO_AUTOEN,
> +			  "sht15 data", data);
> +	if (ret) {
> +		dev_err(&pdev->dev, "failed to get irq for data line\n");
>  		goto err_release_reg;
> -	disable_irq_nosync(gpiod_to_irq(data->data));
> +	}
> +	/* IRQ remains disabled until a measurement starts. */
>  	ret =3D sht15_connection_reset(data);
>  	if (ret)
> -		goto err_release_reg;
> +		goto err_free_irq;

[Severity: High]
Does replacing disable_irq_nosync() with IRQF_NO_AUTOEN cause
sht15_connection_reset() to fail with -EIO on probe?

During request_irq(), __setup_irq() activates the IRQ and invokes
gpiochip_lock_as_irq() in drivers/gpio/gpiolib.c, which unconditionally sets
both GPIOD_FLAG_USED_AS_IRQ and GPIOD_FLAG_IRQ_IS_ENABLED on data->data:

drivers/gpio/gpiolib.c:gpiochip_lock_as_irq() {
	...
	set_bit(GPIOD_FLAG_USED_AS_IRQ, &desc->flags);
	set_bit(GPIOD_FLAG_IRQ_IS_ENABLED, &desc->flags);
	...
}

When IRQF_NO_AUTOEN is passed, __setup_irq() in kernel/irq/manage.c skips
irq_startup() and only sets desc->depth =3D 1 without calling irq_disable()=
 or
gpiochip_disable_irq():

kernel/irq/manage.c:__setup_irq() {
	...
	if (!(new->flags & IRQF_NO_AUTOEN) &&
	    irq_settings_can_autoenable(desc)) {
		irq_startup(desc, IRQ_RESEND, IRQ_START_COND);
	} else if (!per_cpu_devid) {
		WARN_ON_ONCE(new->flags & IRQF_SHARED);
		/* Undo nested disables: */
		desc->depth =3D 1;
	}
	...
}

Previously, calling disable_irq_nosync() after requesting the IRQ invoked
irq_disable() -> gpiochip_disable_irq(), which cleared
GPIOD_FLAG_IRQ_IS_ENABLED. With IRQF_NO_AUTOEN, GPIOD_FLAG_IRQ_IS_ENABLED
remains set when sht15_connection_reset() calls
gpiod_direction_output(data->data, 1):

drivers/gpio/gpiolib.c:gpiod_direction_output_nonotify() {
	...
	/* GPIOs used for enabled IRQs shall not be set as output */
	if (test_bit(GPIOD_FLAG_USED_AS_IRQ, &flags) &&
	    test_bit(GPIOD_FLAG_IRQ_IS_ENABLED, &flags)) {
		gpiod_err(desc,
			  "%s: tried to set a GPIO tied to an IRQ as output\n",
			  __func__);
		return -EIO;
	}
	...
}

Will this cause gpiod_direction_output() in sht15_connection_reset() (and in
sht15_transmission_start() before the first enable_irq()) to return -EIO
whenever data->data is backed by a gpiolib irqchip?

[ ... ]

=E0=A6=93=E0=A7=9F=E0=A6=BE=E0=A6=9F

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261019234402.8057=
59-1-mhun512@gmail.com?part=3D1
