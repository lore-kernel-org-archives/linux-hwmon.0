Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F15E4399F1
	for <linux-hwmon@vger.kernel.org>; Tue, 11 Aug 2026 23:51:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786492288; cv=none; b=ANGcxKoD3F9r9vFR1IOws4+02TlSPMAAx9/ZCwCOK7kghAIyY0VwM+31+D5ruq6r9ZCT4oKt5f4REZ+WH9EAr0pZq85AvyKLb5O+GfG4F7feksTLP5NfUJMZhWtGjh5oTbz2yVp9sLWh6Asuxb+BD3rzRqsblJeUAatjvnRoGVA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786492288; c=relaxed/simple;
	bh=lG3FNZljZeeYidnvKYRJ4tl2xavf17JiD/GBKra09oM=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=RxST5s6DfYfuJw65lav8iKp77yYfFXxl+W3osQmRmUaPDvwk3RRI6zNlYiCYuJisW31cHFtsNZhVluyoG9YT2u9xdg0aWBCeTAZiq2gVnpao80rJdHyxCpypUkoCkZFEPnhBjYyqqyQlN9zvombc8YVBQxSxdZJhE9ZmpiCLWpA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lQFxTbk4; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lQFxTbk4"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3A56C1F000E9;
	Tue, 11 Aug 2026 23:51:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786492287;
	bh=Ms0liTs8zeFAP9dFwrouGMsAGOlTHuVxxL/9Sdbchv4=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=lQFxTbk4sl0wbrloAYKi0eQujfxWb8iY1d7YS6RnPb0NgAmf5KiGe+neq9I3/09II
	 pci/JszCirdOGJc3twaewfSxAo0M/TkZa/xWYxAoE8N3vSgY1F92/K9KjQsPEIK1y8
	 iP9CooYW1y6cjubyilPztDC20ZKmdu9VWkflMQFIi3xQhM96Htn+iDRC+79a0aG5Mi
	 22iKZRp24P2Gt5CDq1D9yk9zwvvSeXXwhgRgbD5LmxkCq8xAGqw3iG4wonI0jVtYkt
	 SAHBmsWKY4hkayoFN7JrBkzr9JAqNIQVY/x4xmFEwoteyHbIJxD+Jgfa2LomtueLsb
	 zLvMko3m7E9Fg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 3/4] hwmon: (asus_rog_ryujin) Add ROG Ryujin III
 White Edition
Reply-To: sashiko-reviews@lists.linux.dev
To: "Arie Miller" <renari@arimil.com>
Cc: linux-hwmon@vger.kernel.org
In-Reply-To: <20260811233943.319729-4-renari@arimil.com>
References: <20260811233943.319729-1-renari@arimil.com>
 <20260811233943.319729-4-renari@arimil.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 11 Aug 2026 23:51:26 +0000
Message-Id: <20260811235127.3A56C1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:

Pre-existing issues:
- [High] Missing bounds check on incoming HID report size in `rog_ryujin_ra=
w_event` leading to an out-of-bounds heap read.
--

--- Patch [3]: [PATCH v2 3/4] hwmon: (asus_rog_ryujin) Add ROG Ryujin III W=
hite Edition ---
commit b585240116bcd8eafe7d693a9003f8ad82dee763
Author: Will Smith <github@notthatwillsmith.com>

hwmon: (asus_rog_ryujin) Add ROG Ryujin III White Edition

The ROG Ryujin III White Edition uses the same report layout as the
other supported Ryujin III variants. Add its USB device ID and list it
in the driver documentation.

Link: https://github.com/aleksamagicka/asus_rog_ryujin-hwmon/pull/10

> diff --git a/drivers/hwmon/asus_rog_ryujin.c b/drivers/hwmon/asus_rog_ryu=
jin.c
> index 5bc60c6036de3..9b34c6e06bf78 100644
> --- a/drivers/hwmon/asus_rog_ryujin.c
> +++ b/drivers/hwmon/asus_rog_ryujin.c

[ ... ]

> @@ -587,6 +588,8 @@ static const struct hid_device_id rog_ryujin_table[] =
=3D {
>  	  .driver_data =3D (kernel_ulong_t)&rog_ryujin_iii_info },
>  	{ HID_USB_DEVICE(USB_VENDOR_ID_ASUS_ROG, USB_PRODUCT_ID_RYUJIN_III_EVA),
>  	  .driver_data =3D (kernel_ulong_t)&rog_ryujin_iii_info },
> +	{ HID_USB_DEVICE(USB_VENDOR_ID_ASUS_ROG, USB_PRODUCT_ID_RYUJIN_III_WHIT=
E),
> +	  .driver_data =3D (kernel_ulong_t)&rog_ryujin_iii_info },

[Severity: High]
This is a pre-existing issue, but adding this device ID exposes the new
hardware to a missing bounds check in rog_ryujin_raw_event().

When the driver receives raw HID reports, it fails to validate the incoming
size parameter against the offsets it accesses:

drivers/hwmon/asus_rog_ryujin.c:rog_ryujin_raw_event() {
	...
	if (data[0] !=3D RYUJIN_CMD_PREFIX)
		return 0;

	if (data[1] =3D=3D RYUJIN_GET_COOLER_STATUS_CMD_RESPONSE) {
		/* Received coolant temp and speeds of pump and internal fan */
		priv->temp_input[0] =3D data[priv->info->temp_offset] * 1000 +
			data[priv->info->temp_offset + 1] * 100;
	...
}

If a malicious USB device presents a HID descriptor declaring a very small
report size (e.g., 1 byte) and sends a 1-byte report, the driver
unconditionally accesses fixed offsets such as data[1] and, depending on the
device info, up to data[12].

Could this allow an out-of-bounds heap read where leaked kernel memory is
stored in variables like priv->temp_input and priv->speed_input, and then
exposed to userspace via the hwmon sysfs interface?

>  	{ }
>  };
>

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260811233943.3197=
29-1-renari@arimil.com?part=3D3
