Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DECB382F17
	for <linux-hwmon@vger.kernel.org>; Fri, 19 Jun 2026 12:41:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781872884; cv=none; b=UJc1pPPTnHRKLW6yEPQSCgON2PwAptTyn7NQpDiGRf+I9++yTG4/N8xw2CsDyrzCZrXAhK7Do/K9TPVJJa5jAcC2nL4Egj4KzR95UgLQIrSe8TqJxJ2cqLEgbMmkS7KvbPspW19rU8HWpfQlrnDTOIPYUrFlv5qsSHiPwm2yyKY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781872884; c=relaxed/simple;
	bh=aF0wq+fUTKFPQBXttYk4zOVS7sr4UaGa2rZ0xrP9plQ=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=BgIoKoVscUqOPLmAtgPdqdzw9jJjQ+9LS8f9fu77Aj6rcQqLckDA2rE7ASNBijwZ/2bi14cL1WR5tgMBIDPKlb6SDf/BP1LVTRNUcAP4olo+Mat/U4Tpjmtao3zWSp/PmoS+Ye/4UdzLzmAzbos6eVvRnByZG4/2E9wbKBp6IrQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JGvsRgYi; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JGvsRgYi"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0711F1F000E9;
	Fri, 19 Jun 2026 12:41:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781872883;
	bh=rZPDaXKo5vQeC/FRmWs+d5sIVdsZc9lENNspddX4/lc=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=JGvsRgYioKHMn57mNWmY1VHtFqACQx9zSqMaOJB+JM6zThT+7Kkocbg2MCj6jqiyn
	 4JFt1CJvzJGBeXhHeLwAaoCV97SUZuvZux1s+p0CcifVxLTZNvj15x0+vr3N+3nAdF
	 u8BMHUBXZ6EdchXN0G/SejqhmrKEjnRPuEmENodDsdM03UpE6qLo7+vwQ3xnsFakIB
	 boXq4qV6/8k5srszAPtQk2GLcutciCHw8PirSDZNEPQJPgtvRsZastV7WGQFWktY8O
	 G0TNEBr3VYkYHCww0qJJKOZg4vaOVzWTc+RRRUBb+fOF4y+nf6OqN4j8dspNDcuCwH
	 hv1QMkdlYgNYg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] hwmon: (asus_atk0110) Check package count before
 accessing element
Reply-To: sashiko-reviews@lists.linux.dev
To: "HyeongJun An" <sammiee5311@gmail.com>
Cc: linux-hwmon@vger.kernel.org
In-Reply-To: <20260619122746.721981-1-sammiee5311@gmail.com>
References: <20260619122746.721981-1-sammiee5311@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 19 Jun 2026 12:41:22 +0000
Message-Id: <20260619124123.0711F1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:

Pre-existing issues:
- [High] The logic to restore the ACPI Embedded Controller (EC) state on dr=
iver teardown is inverted, causing the EC to be left in the wrong state.
- [High] Missing sysfs cache synchronization in `atk_read_value()` violatin=
g hwmon subsystem rules and leading to data races.
--

commit 5431f3f8e381507b8a466013109b4060a3814b41
Author: HyeongJun An <sammiee5311@gmail.com>

hwmon: (asus_atk0110) Check package count before accessing element

atk_ec_present() walks the management group package returned by the GGRP
ACPI method and, for each sub-package, reads its first element without
checking that the sub-package is non-empty. This patch adds a package.count
check to prevent out-of-bounds reads on malformed firmware packages.

> diff --git a/drivers/hwmon/asus_atk0110.c b/drivers/hwmon/asus_atk0110.c
> index 109318b0434d9..92afb64c09df8 100644
> --- a/drivers/hwmon/asus_atk0110.c
> +++ b/drivers/hwmon/asus_atk0110.c
> @@ -1037,6 +1037,9 @@ static int atk_ec_present(struct atk_data *data)
>  		if (obj->type !=3D ACPI_TYPE_PACKAGE)
>  			continue;
> =20
> +		if (!obj->package.count)
> +			continue;
> +
>  		id =3D &obj->package.elements[0];
>  		if (id->type !=3D ACPI_TYPE_INTEGER)
>  			continue;

[Severity: High]
This is a pre-existing issue, but the logic to restore the ACPI Embedded
Controller (EC) state on driver teardown appears inverted.

In drivers/hwmon/asus_atk0110.c:atk_enumerate_new_hwmon(), the disable flag
is set like this:

	err =3D atk_ec_enabled(data);
	if (err < 0)
		return err;
	/* If the EC was disabled we will disable it again on unload */
	data->disable_ec =3D err;

If the EC was already enabled, atk_ec_enabled() returns 1, setting
data->disable_ec to 1. During module unload in atk_remove():

	if (data->disable_ec) {
		if (atk_ec_ctl(data, 0))
			dev_err(&pdev->dev, "Failed to disable EC\n");
	}

Does this mean we end up disabling the EC on unload if it was already enabl=
ed
prior to driver load, and leaving it enabled if it was disabled?

Could this asymmetric lifecycle handling break critical ACPI thermal and
power management functions on the motherboard by turning off the EC when it
should remain active?

[Severity: High]
This is also a pre-existing issue, but it looks like atk_read_value() misses
sysfs cache synchronization.

In drivers/hwmon/asus_atk0110.c:atk_read_value(), we see unprotected cache
updates:

	if (!sensor->is_valid ||
	    time_after(jiffies, sensor->last_updated + CACHE_TIME)) {
		// ... acpi evaluation ...
		sensor->is_valid =3D true;
		sensor->last_updated =3D jiffies;
		sensor->cached_value =3D *value;
	} else {
		*value =3D sensor->cached_value;
	}

Since hwmon subsystem guidelines explicitly require drivers to implement
locking for attributes registered manually, and these attributes are exposed
via hwmon_device_register_with_groups(), can concurrent sysfs reads execute
the underlying ACPI methods simultaneously?

Furthermore, could updating and reading the 64-bit sensor->cached_value
without locks on 32-bit systems result in torn reads, exposing absurdly high
or low sensor values to userspace?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260619122746.7219=
81-1-sammiee5311@gmail.com?part=3D1
