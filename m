Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4ECAF4EFFCC;
	Thu, 15 Oct 2026 09:16:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792055773; cv=none; b=tE/yiCyMGmlNuHDG89PzGenBgdDznhwRYoQWvQzzK4bLKhSQFYRGRskzF898Ns8uemjycTq2Qb+w9V5CE7cgfiJmJ8D3Rp8lJGaq6QdKBKZK20mwokdjhRtz+qeVzq7f/lPHvAYrI7LBQuH+YKmBwV6BBBuTh/9QQBIBYvMLZxM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792055773; c=relaxed/simple;
	bh=wVW2O4aPJUT7VwnUuNjtOOHx0CWmUoottGKdGSSyo0g=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date; b=JGujKRnur8sQZcFbzszrBKY3wmgEw1/fjPI4PqjxwT0nY+hlWXXT9csevlt7qACMVg3bMJjZ+rj1Lqtca4HibcKP1D6nHqD9egkTiyVnLSDNkHf2qNib2+Smyqi66pSiCljN0Y8h4oV9fINQPJRTYuhi1dMN75QRDkdVCK9yf1k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=m3AmY5px; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="m3AmY5px"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 10A701F000C4;
	Thu, 15 Oct 2026 09:16:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792055768;
	bh=xZ4Hg6r+QglckZPpVIuq48St3sDdd75rksi5q8AXnBo=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=m3AmY5pxnhuSQCC5TAUP/zLh7rmZUObzlxkR+5pSmxaZiMRLMcha9tdv3i91jHD1w
	 DRO/fBup0U8lG7DOsJcB4l6QFC4mS9BwYcXaadl7G0qHqqrcdck87YDUjp6YXzGPm+
	 z+tJzjA+0RQ0oKb+4kPcF1t1SK5wHVR5SDya0qr98Gi6n5WRkqI4LEa3aU6PbrIO60
	 C1g1qhCv2fjclbB6hw7AMFH+wGYKWaplPrhXuFKYa3iecnxSs7kshfUj1vtRiBzVZS
	 wXJ9iVq3YKC81PoUrk8aszLGG+AC8mReGYarXmXdK9vUNUTwhC+0tRbXhPBvHxWA/E
	 0f5jlJkeYF01A==
Message-ID: <sashiko-outbox-172554@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 2/4] platform: arm64: Add a driver for the EC found
 on ASUS Glymur machines
Reply-To: sashiko-reviews@lists.linux.dev
To: "Konrad Dybcio" <konradybcio@kernel.org>
Cc: devicetree@vger.kernel.org, linux-hwmon@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261015-topic-asus_ec-v4-2-af6305ffcb10@oss.qualcomm.com>
References: <20261015-topic-asus_ec-v4-0-af6305ffcb10@oss.qualcomm.com>
 <20261015-topic-asus_ec-v4-2-af6305ffcb10@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 15 Oct 2026 09:16:07 +0000
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 4 potential issue(=
s) to consider:
- [Medium] hwmon: Subsystem layering violation by directly registering hwmo=
n device from platform driver
- [Low] i2c: Missing named initializer in struct i2c_device_id array
- [Low] leds: Hardcoded LED name bypasses Device Tree color/function proper=
ties
- [Low] kconfig: Unnecessary INPUT dependency in Kconfig
--

commit 084ff1f8f9529e75d60a737e61f5d594cff0bfe1
Author: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

platform: arm64: Add a driver for the EC found on ASUS Glymur machines
   =20
Some Qualcomm Snapdragon X2 Elite (Extreme)-based ASUS laptops (at
least the Zenbook A14 and A16) expose a custom, somewhat
Qualcomm reference-derived EC interface. Introduce a driver to
communicate with said EC, allowing for fan speed reporting, keyboard
backlight setting and receiving of a number of miscellaneous sideband
events.

> diff --git a/drivers/platform/arm64/Kconfig b/drivers/platform/arm64/Kcon=
fig
> index e32e01b2a9bdd..84c475c62990b 100644
> --- a/drivers/platform/arm64/Kconfig
> +++ b/drivers/platform/arm64/Kconfig
> @@ -33,6 +33,22 @@ config EC_ACER_ASPIRE1
>  	  laptop where this information is not properly exposed via the
>  	  standard ACPI devices.
> =20
> +config EC_ASUS_GLYMUR
> +	tristate "ASUS Zenbook A16 (Qualcomm) Embedded Controller driver"
> +	depends on ARCH_QCOM || COMPILE_TEST
> +	depends on I2C
> +	depends on HWMON
> +	depends on INPUT
                   ^^^^^

[Severity: Low]
Does this driver actually need to depend on INPUT?

The driver does not appear to include <linux/input.h> or use any input
subsystem APIs (the hotkey event is only logged via dev_dbg_ratelimited).
Could this dependency be dropped to avoid restricting the driver from being
built on systems without input support unnecessarily?

> +	depends on PM
> +	depends on THERMAL || THERMAL=3Dn
> +	select NEW_LEDS
> +	select LEDS_CLASS

[ ... ]

> diff --git a/drivers/platform/arm64/asus-glymur-ec.c b/drivers/platform/a=
rm64/asus-glymur-ec.c
> new file mode 100644
> index 0000000000000..532610592d1fd
> --- /dev/null
> +++ b/drivers/platform/arm64/asus-glymur-ec.c

[ ... ]

> +static int asus_glymur_ec_probe(struct i2c_client *client)
> +{

[ ... ]

> +	dev_dbg(dev, "ASUS Zenbook EC version %u.%u.%u\n", major, minor, patch);
> +
> +	ec->kbd_led.name =3D "asus::kbd_backlight";
        ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

[Severity: Low]
Could this LED name be defined via Device Tree color and function properties
instead?

The LED subsystem guidelines prefer using DT `color` and `function` propert=
ies
to define LEDs, rather than deprecated fixed labels, to enable standard sys=
tem
layouts like `<color>:<function>`. Hardcoding the name here embeds the nami=
ng
scheme into the driver and prevents standard property extraction from the
device tree.

> +	ec->kbd_led.max_brightness =3D ASUS_EC_KBD_MAX_BRIGHTNESS;
> +	ec->kbd_led.brightness_set_blocking =3D asus_ec_kbd_led_set;
> +	ec->kbd_led.flags =3D LED_CORE_SUSPENDRESUME;
> +
> +	ret =3D devm_led_classdev_register(dev, &ec->kbd_led);
> +	if (ret)
> +		return dev_err_probe(dev, ret, "Failed to register keyboard LED\n");
> +
> +	ret =3D devm_request_threaded_irq(dev, client->irq, NULL, asus_ec_irq,
> +					IRQF_ONESHOT, dev_name(dev), ec);
> +	if (ret)
> +		return dev_err_probe(dev, ret, "Failed to request IRQ\n");
> +
> +	ec->hwmon_dev =3D devm_hwmon_device_register_with_info(dev,
> +							     "asus_glymur_ec",
> +							     ec,
> +							     &asus_ec_hwmon_chip_info,
> +							     NULL);
        ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^=
^^

[Severity: Medium]
Should this hwmon functionality be implemented as an auxiliary device driver
residing in drivers/hwmon/ instead?

The HWMON subsystem guidelines state that if the main functionality of a ch=
ip
is not hardware monitoring (such as an Embedded Controller), its hardware
monitoring functionality must be implemented as an auxiliary device driver
residing in drivers/hwmon/.

Directly calling devm_hwmon_device_register_with_info() from a platform dri=
ver
like this is a structural layering violation that bypasses HWMON maintainer
review.

> +	if (IS_ERR(ec->hwmon_dev)) {
> +		return dev_err_probe(dev, PTR_ERR(ec->hwmon_dev),
> +				     "Failed to register hwmon\n");
> +	}
> +
> +	return 0;
> +}

[ ... ]

> +static const struct of_device_id asus_glymur_ec_of_match[] =3D {
> +	{ .compatible =3D "asus,zenbook-a14-ux3407na-ec" },
> +	{ .compatible =3D "asus,zenbook-a16-ux3607oa-ec" },
> +	{}
> +};
> +MODULE_DEVICE_TABLE(of, asus_glymur_ec_of_match);
> +
> +static const struct i2c_device_id asus_glymur_ec_id[] =3D {
> +	{ "asus-glymur-ec" },
          ^^^^^^^^^^^^^^^^

[Severity: Low]
Is this missing a named initializer for the i2c_device_id?

The I2C subsystem guidelines require that initialized arrays of type
struct i2c_device_id use named initializers, such as:
	{ .name =3D "asus-glymur-ec" },

> +	{}
> +};
> +MODULE_DEVICE_TABLE(i2c, asus_glymur_ec_id);

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261015-topic-asus=
_ec-v4-0-af6305ffcb10@oss.qualcomm.com?part=3D2
