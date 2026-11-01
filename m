Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793530923;
	b=qCFkpjWXURlUxm+MXlFJi7Z1+44+DIutpCA+yxZHq4oQK7Rd547XCjWP+ypr0lmcS0nk
	 kIwMYt0bpPCEEQBmrDbXg0tGzEQotDRuDcf8qTISV/dYyCFoXNN1FJ2T7OdeNNbjC+ZOx
	 6zYCHlu5A75RFOQriNFC6P3kI+SbYeyuTH29dEQ324GkqI4uLeP08mwDE9QeJMVRAC4h9
	 BVFs0S0VRowfrQAYyZUPOIQPn2050VbRGvQi68aPNWCoL6o0KU9/94j4UL796AQVd2ihw
	 YFXNUo8FubZWtJpTANptTyqIA9YKa7Ps4A1n0HSGTtxidNxNozlg2Z5pj76S3mTYT0w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793530923;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=2axgYKRKgazM6I6CTZji0M0gv3hNZLMq8an3f+LVio0=;
	b=F8ct5YwzxiTdDKJrww8vCdQJ+yuNJ0u8yJdIPogaXn8kl7KMGsKBX/G8VisFyNj9KvrM
	 WIeTgHvTNeP050UGFHu2VkipcQsMz57HY8N9btANEZ2HGa9hQxqEVPWU2AeIMDRcPAXwV
	 AmHEEy+2ZlFu2fe4Rf4sAVdHGNFoXOCDkmKhjZwH1aex6dZtT0aAe5qwaYxXQdxxqpDtM
	 zVNZAVstgRCHsJR3cXcqYVOFUjAQlsjVW8iZQmh/jun/kGU7E6oS+q4IVxR98VcUMVA+0
	 CfZ0uyoy56M6LhWRmtLLitBW7Fk7/LtVBK5bQ1TxtPXeT/dT2OWzHBOfKzR4fpNOehA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=K4419+0H;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F910606A324
	for <linux-hwmon@vger.kernel.org>; Sun,  1 Nov 2026 11:02:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=K4419+0H
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 00B481F000C1;
	Sun,  1 Nov 2026 11:02:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793530923;
	bh=2axgYKRKgazM6I6CTZji0M0gv3hNZLMq8an3f+LVio0=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=K4419+0HWUL1+/EIAg9bxYd+n11Tulw9qoLBSe9cpadMbgmKpJ4z3uLIlabfSOF6l
	 WQw10IIiztRu18kcKtwlUAJMBW6pma51j4+332oSttSkwyemnl/PGy6wJsTynWLUMA
	 rdt1RwN0NeYsRD28MqpeO3osdTM3XYr9pux3WJGWTAPgxNXdLH8YMjyr+igJLPr4v+
	 aC/1U2wVpS9IVJgBk7LVwf8S13Xc5Buyp90Sb+cYksSvPuo2wSFYaHZaKz88m/vgtc
	 gpWievdwIvzyBZf/QU67/NMnkz2IgQ4Ps+5ZB1vVjWz9fVrQgkQNbetul+W0fIIA8/
	 71U7wkDsgncew==
Message-ID: <sashiko-outbox-192372@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 4/7] platform/x86: asus-wmi: read the firmware fan floor
 tables
Reply-To: sashiko-reviews@lists.linux.dev
To: "Bartu Alev" <bartualev@gmail.com>
Cc: linux-hwmon@vger.kernel.org
In-Reply-To: <20261101-asus-fan-floors-v4-v1-4-b8d1c31a99a9@gmail.com>
References: <20261101-asus-fan-floors-v4-v1-0-b8d1c31a99a9@gmail.com>
 <20261101-asus-fan-floors-v4-v1-4-b8d1c31a99a9@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 01 Nov 2026 11:02:02 +0000
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
- [Medium] platform/x86: asus-wmi: unhandled DSTS return in fan_curve_load_=
floors()
--

commit 2c4e7fb8cca0f513f1d86b6eff6061e09cba0940
Author: Bartu Alev <bartualev@gmail.com>

platform/x86: asus-wmi: read the firmware fan floor tables

This commit reads the firmware fan floor tables via DSTS methods at probe
and refreshes them when power profiles change or custom fan curves are
reset. The cached floor values are validated and protected by a mutex for
sysfs access.

> diff --git a/drivers/platform/x86/asus-wmi.c b/drivers/platform/x86/asus-=
wmi.c
> index c55f469cb03dc..b6541183d4568 100644
> --- a/drivers/platform/x86/asus-wmi.c
> +++ b/drivers/platform/x86/asus-wmi.c

[ ... ]

> @@ -3651,7 +3664,136 @@ static int fan_curve_get_factory_default(struct a=
sus_wmi *asus, u32 fan_dev)
>  	return 0;
>  }
> =20
> -/* Check if capability exists, and populate defaults */
> +/*
> + * Read the firmware fan floor table. The EC enforces a minimum duty per
> + * curve point on top of the custom curve. Reading is best effort: at
> + * probe time a failed read leaves the table zeroed and invalid, and a
> + * failed refresh keeps the last table that was read.
> + */
> +static int fan_curve_load_floors(struct asus_wmi *asus, u32 fan_dev)
> +{
> +	struct fan_curve_data *curves;
> +	u8 buf[FAN_CURVE_BUF_LEN] =3D {};
> +	size_t len;
> +	int err, fan_idx, i;
> +
> +	switch (fan_dev) {
> +	case ASUS_WMI_DEVID_CPU_FAN_CURVE:
> +		fan_idx =3D FAN_CURVE_DEV_CPU;
> +		fan_dev =3D ASUS_WMI_DEVID_CPU_FAN_FLOOR;
> +		break;
> +	case ASUS_WMI_DEVID_GPU_FAN_CURVE:
> +		fan_idx =3D FAN_CURVE_DEV_GPU;
> +		fan_dev =3D ASUS_WMI_DEVID_GPU_FAN_FLOOR;
> +		break;
> +	case ASUS_WMI_DEVID_MID_FAN_CURVE:
> +		fan_idx =3D FAN_CURVE_DEV_MID;
> +		fan_dev =3D ASUS_WMI_DEVID_MID_FAN_FLOOR;
> +		break;
> +	default:
> +		return -EOPNOTSUPP;
> +	}
> +
> +	curves =3D &asus->custom_fan_curves[fan_idx];
> +	if (curves->floors_unsupported)
> +		return -ENODEV;
> +
> +	err =3D asus_wmi_evaluate_method_buf(asus->dsts_id, fan_dev, 0, buf,
> +					   FAN_CURVE_BUF_LEN, &len);
> +	if (err) {
> +		pr_debug("%s (0x%08x) failed: %d\n", __func__, fan_dev, err);
> +		/* 0xFFFFFFFE means the firmware has no such method */
> +		if (err =3D=3D -ENODEV)
> +			curves->floors_unsupported =3D true;
> +		return err;
> +	}

[ ... ]

> @@ -3668,6 +3810,16 @@ static int fan_curve_check_present(struct asus_wmi=
 *asus, bool *available,
>  	}
> =20
>  	*available =3D true;
> +
> +	err =3D fan_curve_load_floors(asus, fan_dev);
> +	if (err =3D=3D -ENODEV)
> +		dev_dbg(&asus->platform_device->dev,
> +			"fan curve (0x%08x): no floor table\n", fan_dev);
> +	else if (err)
> +		dev_warn(&asus->platform_device->dev,
> +			 "fan curve (0x%08x): unusable floor table (%d)\n",
> +			 fan_dev, err);
> +
>  	return 0;
>  }

[Severity: Medium]
What happens in asus_wmi_evaluate_method_buf() and fan_curve_load_floors()
on laptops with custom fan curves whose firmware does not return
ASUS_WMI_UNSUPPORTED_METHOD (0xFFFFFFFE) for the new floor device IDs?

First, in drivers/platform/x86/asus-wmi.c, asus_wmi_evaluate_method_buf()
does not check whether output.pointer is NULL before dereferencing
obj->type:

drivers/platform/x86/asus-wmi.c:asus_wmi_evaluate_method_buf() {
	...
	status =3D asus_wmi_evaluate_method_locked(method_id, &input, &output);
	if (ACPI_FAILURE(status))
		return -EIO;

	obj =3D (union acpi_object *)output.pointer;

	switch (obj->type) {
	...
}

Unlike asus_wmi_evaluate_method3(), asus_wmi_evaluate_method5(),
show_dsts(), and show_call() in the same file (which all check if (!obj)),
if firmware returns AE_OK with no return object for an unknown method ID
(as noted in asus_wmi_platform_init() for some TUF series laptops), could
calling asus_wmi_evaluate_method_buf() via
asus_wmi_add() -> asus_wmi_custom_fan_curve_init() ->
fan_curve_check_present() -> fan_curve_load_floors() trigger a NULL pointer
dereference?

Second, when DSTS evaluation for an unimplemented floor method returns an
ACPI_TYPE_INTEGER other than 0xFFFFFFFE, asus_wmi_evaluate_method_buf()
only translates ASUS_WMI_UNSUPPORTED_METHOD to -ENODEV:

	case ACPI_TYPE_INTEGER:
		err =3D (u32)obj->integer.value;

		if (err =3D=3D ASUS_WMI_UNSUPPORTED_METHOD)
			err =3D -ENODEV;
		/*
		 * At least one method returns a 0 with no buffer if no arg
		 * is provided, such as ASUS_WMI_DEVID_CPU_FAN_CURVE
		 */
		if (err =3D=3D 0)
			err =3D -ENODATA;
		break;

On firmwares that return 0 (mapped to -ENODATA), 0xFFFFFFFF (which
asus_wmi_get_devstate() and show_dsts() treat as -ENODEV, but here becomes
-1), or ASUS_WMI_DSTS_UNKNOWN_BIT (0x2, returned as +2) for unsupported
DSTS device IDs, fan_curve_load_floors() will not set
curves->floors_unsupported =3D true, and fan_curve_check_present() will log=
 a
false dev_warn() at boot and continue evaluating the unsupported WMI
methods on every fan_curve_refresh_floors() call.

Should asus_wmi_evaluate_method_buf() guard against !obj, and should
integer returns from DSTS in fan_curve_load_floors() also be treated as
unsupported?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261101-asus-fan-f=
loors-v4-v1-0-b8d1c31a99a9@gmail.com?part=3D4
