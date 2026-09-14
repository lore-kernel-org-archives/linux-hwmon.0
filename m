Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EAF5549DBB9
	for <linux-hwmon@vger.kernel.org>; Mon, 14 Sep 2026 20:08:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789416516; cv=none; b=Djg1BEnRkJ9rJHoewM6kdGz0FZ6QowQZyzpOkjDBm3Ub2FsCa0oY+5m2jpSTlgiwoXRigVQLBH9PjkYzsqzUo9B6yUCAH/X2M2/ZAdLXfbIELlrqWJ4sc5DHkPQ8c3wCPnizo50yjy06v7nCTabS41eliN8QU7h9Ts9PMuzdWTc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789416516; c=relaxed/simple;
	bh=0qWASQxNX7me/zJovLeUVn1vHfqtPSMVYdfjNgn54UA=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=BLkvEBzRN7HW2wbR1zDRp7/MLfOmeATlBeLkMapI9f53qhEebMftHid/Y2t3GgOniq8ZRp3B64+texozyqfAlieRWXw3GXkr998flyaemT9DHlLrpEJVgOmIMjmuw9iCLu1mHtZMJUHOy3kAkXE6L594Hd21+aHfqJSLUdjAdAg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ON1tINMe; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ON1tINMe"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5642E1F000FF;
	Mon, 14 Sep 2026 20:08:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789416511;
	bh=rnuQSxJZUX/OWlVExrPUbwpChQ7gIoIJaYxt+X3CzHw=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=ON1tINMeAGJxBWewTSBwHlSRw09vimRvkRYa0uXFIibbRaXTihA9tIe++oKbD8/te
	 REyxYYsV+X9IEck/lszLq9krYDL2Tub54B1m7Vu6B6mwO9Zw3faf4RFT7hyiONM0yV
	 8afM2gPBHEfwuY9Peukg000MRuX+OhuEdQMe1gLzSUx44dCAKCpFaSW1RtMiJOxIZ8
	 wfzJjF4mXsY4n6dhyyxQzcdto1syH+BdHTRrh8BkFoUb2hZZloEjpQKleVQrq2cbJ2
	 KycBrIW9utW242aX8BhUCYsNzaaSQf9rFYXZpky/cgxausWEmzrL23nLblzYG0/Wn1
	 vr516Cgue0/Cw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] hwmon: (aquacomputer_d5next) Add AMPINEL support
Reply-To: sashiko-reviews@lists.linux.dev
To: "Vas Zayarskiy" <contact@vasily.cc>
Cc: linux-hwmon@vger.kernel.org
In-Reply-To: <20260914195759.171524-1-contact@vasily.cc>
References: <20260914195759.171524-1-contact@vasily.cc>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 14 Sep 2026 20:08:30 +0000
Message-Id: <20260914200831.5642E1F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Critical] The driver unconditionally casts the device parent to a `usb_i=
nterface` without verifying that the device is actually bound to a USB tran=
sport, which can lead to an invalid cast and kernel crash.
--

commit ab9f1cda999fbdfa626d75acef47522f86ec7022
Author: Vas Zayarskiy <contact@vasily.cc>

hwmon: (aquacomputer_d5next) Add AMPINEL support

This commit adds read-only hardware monitoring support for the Aquacomputer
AMPINEL power monitor. It decodes the USB HID input reports to expose total
power, voltage, current, and temperature telemetry through standard hwmon
interfaces.

> diff --git a/drivers/hwmon/aquacomputer_d5next.c b/drivers/hwmon/aquacomp=
uter_d5next.c
> index 1ca70e7262988..b33d0ccc02183 100644
> --- a/drivers/hwmon/aquacomputer_d5next.c
> +++ b/drivers/hwmon/aquacomputer_d5next.c
[ ... ]
> @@ -1533,6 +1626,27 @@ static int aqc_probe(struct hid_device *hdev, cons=
t struct hid_device_id *id)
>  	if (ret)
>  		return ret;
> =20
> +	if (hdev->product =3D=3D USB_PRODUCT_ID_AMPINEL) {
> +		intf =3D to_usb_interface(hdev->dev.parent);

[Severity: Critical]
Is it safe to cast the parent device to a usb_interface here without first
verifying that this is a USB device?

If a non-USB HID device matching this vendor (0x0c70) and product (0xf015) =
ID
is registered (for example, spoofed over Bluetooth or by a local attacker
using /dev/uhid), to_usb_interface() will perform an invalid cast.=20

The subsequent dereference of intf->cur_altsetting could then cause an OOPS
or memory corruption due to type confusion.

Would it be better to add a hid_is_usb(hdev) check before attempting this
cast?

> +		/*
> +		 * hid-generic yields every interface matching our product ID.
> +		 * Preserve input and hidraw on the separate keyboard interface.
> +		 */
> +		if (intf->cur_altsetting->desc.bInterfaceNumber !=3D AMPINEL_DATA_INTE=
RFACE) {
> +			hdev->quirks |=3D HID_QUIRK_INPUT_PER_APP;
> +			return hid_hw_start(hdev, HID_CONNECT_DEFAULT);
> +		}

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260914195759.1715=
24-1-contact@vasily.cc?part=3D1
