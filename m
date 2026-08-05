Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0CF883AC0C3;
	Wed,  5 Aug 2026 01:54:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785894886; cv=none; b=X9o0xy6Q3gJO9bNjCLlIJFxIZQHZb83IYUt7GUW3N0occeCPY76Sn+gAkwtR4TxvRVFWhxqM95gpXi7onxLDNtp5u3mW+CIWKwRZA2A6d4RpDD4lCB212gtTIiKHr+n/CMzlRoPv0e+zTvHiMPcOKzD8Aw1inOFbJ8uAEfbw8rc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785894886; c=relaxed/simple;
	bh=RH/0HXmrddyruFd6Vy0PnXTnrHiaivftlKKQ9qaO0fo=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=QIfsyAB4pmEUr73eD4UtgfIPIoMDhOOMOgkM6z0CNW6A13LuVLiz6dx2415y3NjwkxSEZW/Tp+5onvzcmL7GAz5r8U9yszZ9U1Ot/3ncpckv4ayZ9NL2nDOwpwruIiKjYv+/3ZhyevYJV/+UHzHqkgPFELW1fMoiIhI8eYN0+b4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=BuMAYWNw; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="BuMAYWNw"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8B1D11F000E9;
	Wed,  5 Aug 2026 01:54:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785894876;
	bh=O+wTl6oKFQKzUCUyig9liyowzaff9AYxPzClAQLelh8=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=BuMAYWNwbDPUtUnYZXn2fFb28ZT4niTlec0Yf3T0MRVKaK2dz9aOq0dL67doxsgXt
	 wDtSG1aSGeRv1Fx+RmUdbiv9OC5W4rnzBhAaf7QpAZloJgDDyaMnThZNewBVr//v6L
	 0aEzsE/Sa/fUl50AOw+KTyf632PbClBra5yJu5ULGxd8HOIC3d66srZqgERg0aQe5f
	 Jd+6xe6PSajW7p5V3Y9Eev+Ymob41Ib+OVVdPG/WXrlF1pbPVuqvf+fqqCYykYGlA7
	 MkaDPzT9LdDNsLHq0/VXEi97p8WNsefDRXxQPyGfOpVlocfk/nm//mWhxG3q6w5vRN
	 /reH7FTdaR4tQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] mfd: wm8350: propagate ADC read timeout instead of
 returning 0
Reply-To: sashiko-reviews@lists.linux.dev
To: "Ivy Lopez" <skunkolee@gmail.com>
Cc: mfd@lists.linux.dev, lee@kernel.org, linux-hwmon@vger.kernel.org
In-Reply-To: <20260805014221.16412-1-skunkolee@gmail.com>
References: <20260805014221.16412-1-skunkolee@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 05 Aug 2026 01:54:35 +0000
Message-Id: <20260805015436.8B1D11F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 4 potential issue(=
s) to consider:

New issues:
- [High] power_supply get_property callbacks return a positive voltage inst=
ead of 0 on success.
- [Low] The commit message description starts with a lowercase letter, viol=
ating MFD subsystem guidelines.

Pre-existing issues:
- [High] wm8350_reg_read() returns uninitialized stack memory on I/O error.
- [Medium] The MFD probe function fails to unwind registered devices or ret=
urn an error if child registration fails.
--

--- Patch [1]: [PATCH] mfd: wm8350: propagate ADC read timeout instead of r=
eturning 0 ---
commit 85cc18ec8aa2aed410635585d8d7ebb26d16479c
Author: Ivy Lopez <skunkolee@gmail.com>

mfd: wm8350: propagate ADC read timeout instead of returning 0
   =20
This commit updates wm8350_read_auxadc() to return -ETIMEDOUT when the AUX
ADC read times out, instead of returning a masked value of 0. It also
modifies the hwmon and power_supply drivers to propagate this error.

> mfd: wm8350: propagate ADC read timeout instead of returning 0

[Severity: Low]
This isn't a bug, but the commit message description starts with a lowercase
letter. Should this be capitalized according to MFD subsystem guidelines?

> diff --git a/drivers/mfd/wm8350-core.c b/drivers/mfd/wm8350-core.c
> index fbc77b218215c..3120c6b8fa3fb 100644
> --- a/drivers/mfd/wm8350-core.c
> +++ b/drivers/mfd/wm8350-core.c

[ ... ]

> @@ -221,19 +222,24 @@ int wm8350_read_auxadc(struct wm8350 *wm8350, int c=
hannel, int scale, int vref)
>  	wait_for_completion_timeout(&wm8350->auxadc_done, msecs_to_jiffies(5));
> =20
>  	reg =3D wm8350_reg_read(wm8350, WM8350_DIGITISER_CONTROL_1);

[Severity: High]
This is a pre-existing issue, but does wm8350_reg_read() return uninitializ=
ed
stack memory on I/O errors?

Looking at wm8350_reg_read():

u16 wm8350_reg_read(struct wm8350 *wm8350, int reg)
{
    unsigned int data;
    int err;

    err =3D regmap_read(wm8350->regmap, reg, &data);
    if (err)
        dev_err(wm8350->dev, "read from reg R%d failed\n", reg);

    return data;
}

If regmap_read() fails, the uninitialized data variable is returned. Callers
then blindly use this garbage value to write back to critical hardware
registers, which can cause power domains to randomly turn on or off.

> -	if (reg & WM8350_AUXADC_POLL)
> +	if (reg & WM8350_AUXADC_POLL) {
>  		dev_err(wm8350->dev, "adc chn %d read timeout\n", channel);
> -	else
> +		ret =3D -ETIMEDOUT;
> +	} else {
>  		result =3D wm8350_reg_read(wm8350,
> -					 WM8350_AUX1_READBACK + channel);
> +					WM8350_AUX1_READBACK + channel);
> +	}
> =20
>  	/* Turn off the ADC */
>  	reg =3D wm8350_reg_read(wm8350, WM8350_POWER_MGMT_5);
>  	wm8350_reg_write(wm8350, WM8350_POWER_MGMT_5,
> -			 reg & ~WM8350_AUXADC_ENA);
> +			reg & ~WM8350_AUXADC_ENA);
> =20
>  	mutex_unlock(&wm8350->auxadc_mutex);
> =20
> +	if (ret)
> +		return ret;
> +
>  	return result & WM8350_AUXADC_DATA1_MASK;
>  }
>  EXPORT_SYMBOL_GPL(wm8350_read_auxadc);

[Severity: Medium]
This is a pre-existing issue, but does the MFD probe function fail to unwind
registered devices if a child registration fails?

Looking at wm8350_client_dev_register():

ret =3D platform_device_add(*pdev);
if (ret !=3D 0) {
    dev_err(wm8350->dev, "Failed to register %s: %d\n", name, ret);
    platform_device_put(*pdev);
    *pdev =3D NULL;
}

This custom helper drops the error, causing wm8350_device_init() to proceed
without unwinding previously registered children. This violates the MFD
subsystem guideline that requires unwinding if a child device fails to
register.

> diff --git a/drivers/power/supply/wm8350_power.c b/drivers/power/supply/w=
m8350_power.c
> index b0eb6e0ce8bcf..1113730279053 100644
> --- a/drivers/power/supply/wm8350_power.c
> +++ b/drivers/power/supply/wm8350_power.c

[ ... ]

> @@ -257,7 +269,10 @@ static int wm8350_ac_get_prop(struct power_supply *p=
sy,
>  				 WM8350_LINE_SUPPLY);
>  		break;
>  	case POWER_SUPPLY_PROP_VOLTAGE_NOW:
> -		val->intval =3D wm8350_read_line_uvolts(wm8350);
> +		ret =3D wm8350_read_line_uvolts(wm8350);
> +		if (ret < 0)
> +			return ret;
> +		val->intval =3D ret;
>  		break;
>  	default:
>  		ret =3D -EINVAL;

[Severity: High]
Does this inadvertently return the positive voltage value on success?

By assigning the result of wm8350_read_line_uvolts() to ret in
wm8350_ac_get_prop(), the power_supply_get_property API will now return a
large positive voltage (e.g., 5000000) instead of 0 on success.

Many callers within the kernel check if (power_supply_get_property(...))
and will incorrectly treat the positive return value as a failure, leading
to broken functionality.

[ ... ]

> @@ -287,7 +302,10 @@ static int wm8350_usb_get_prop(struct power_supply *=
psy,
>  				 WM8350_USB_SUPPLY);
>  		break;
>  	case POWER_SUPPLY_PROP_VOLTAGE_NOW:
> -		val->intval =3D wm8350_read_usb_uvolts(wm8350);
> +		ret =3D wm8350_read_usb_uvolts(wm8350);
> +		if (ret < 0)
> +			return ret;
> +		val->intval =3D ret;
>  		break;

[Severity: High]
Could this also leak the positive voltage into the return value of
wm8350_usb_get_prop() instead of returning 0 on success?

[ ... ]

> @@ -356,7 +378,10 @@ static int wm8350_bat_get_property(struct power_supp=
ly *psy,
>  				 WM8350_BATT_SUPPLY);
>  		break;
>  	case POWER_SUPPLY_PROP_VOLTAGE_NOW:
> -		val->intval =3D wm8350_read_battery_uvolts(wm8350);
> +		ret =3D wm8350_read_battery_uvolts(wm8350);
> +		if (ret < 0)
> +			return ret;
> +		val->intval =3D ret;
>  		break;

[Severity: High]
Is the same regression present here in wm8350_bat_get_property(), where the
function will return the positive battery voltage rather than 0 on success?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260805014221.1641=
2-1-skunkolee@gmail.com?part=3D1
