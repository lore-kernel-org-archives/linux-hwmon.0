Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 784C4883F
	for <linux-hwmon@vger.kernel.org>; Wed, 13 May 2026 00:10:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778631001; cv=none; b=MzGLv5F/E+rhRtH4Hfu5OnP4h3+dFMqaYXZRdtl6uiuYijYOatFRVfBcu9bXPjCvNhu5mUg1UZQzK5AweM9B/BEnMh7+DX/a+6gh8g9dFnRKTHIOfP1ZAFu07Ft9z9w8C5+1TYZ7PiidN56Gc/6e/ThDP13vYMz2cAufbV3qSNU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778631001; c=relaxed/simple;
	bh=p7VZPZPDImfQMSzAHpf5FRol1QR5Zt1GmHF8OE2f1fk=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=m+Cdt+s0oGB4djntLfZuyvDyKJ64Ec7WStf4lYFXphxUbYzra60Dwtsac2jB5FJa120w6uXDQdBLZCg80GSRSv2HEGMk5SDpM7VK63NsuXLwNd1o82ZCct7+rZiMXfwifjOseZiESddB9pWiW5P60DyJK5pXEx5C9G5QNNxe4VY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=H40wUX/3; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="H40wUX/3"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F0800C2BCB0;
	Wed, 13 May 2026 00:10:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778631001;
	bh=p7VZPZPDImfQMSzAHpf5FRol1QR5Zt1GmHF8OE2f1fk=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date:From;
	b=H40wUX/3s+bTD9OVvdI0mllsVLbGfwhTt5PxeDT1ONqbD10mNJMBxSZXaaByLOW1X
	 8EyNNbe0OtllhJZaw73MZpdj1QDiI7MbCH5xUqEXnhpIEOTLaAnLh3GXNalUpikHTc
	 0PdTK8hPacm6ne5lBwSr7klKnBUTRiKrDcz68Z3Hs1ZRRN6ZeO2OhZlb5bVAIN6uCj
	 PBreMUjwZC4xcWtJDCpETcREInLkGQgAFPecVuPR4wKTDZ8EgwkAKy2Aku5yeSXIje
	 eqZ38LWJL86NGfoYm9o/cncovNEKwiSmRiPcEBEm6WJ8dH2fv7XCZo1qQSoM9hy56o
	 alOk0Gfl6OkTg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v1] hwmon: (acpi_power_meter) Check ACPI_COMPANION()
 against NULL
Reply-To: sashiko-reviews@lists.linux.dev
To: "Rafael J. Wysocki" <rafael@kernel.org>
Cc: linux-hwmon@vger.kernel.org
In-Reply-To: <5068745.GXAFRqVoOG@rafael.j.wysocki>
References: <5068745.GXAFRqVoOG@rafael.j.wysocki>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 13 May 2026 00:10:00 +0000
Message-Id: <20260513001000.F0800C2BCB0@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:
- [High] Subsystem Guideline Violation / Data Race: Missing and incorrect l=
ocking for extra attributes.
- [High] Subsystem Guideline Violation: Integer overflow in DIV_ROUND_CLOSE=
ST bypasses boundary checks.
- [High] Subsystem Guideline Violation: Integer truncation during 64-bit po=
wer calculations.
--

commit 20d683b13caf3ad1f2da04d46b6d0bb7dff30a02
Author: Rafael J. Wysocki <rafael.j.wysocki@intel.com>

hwmon: (acpi_power_meter) Check ACPI_COMPANION() against NULL

Every platform driver can be forced to match a device that doesn't match
its list of device IDs because of device_match_driver_override(), so
platform drivers that rely on the existence of a device's ACPI companion
object need to verify its presence.

> diff --git a/drivers/hwmon/acpi_power_meter.c b/drivers/hwmon/acpi_power_=
meter.c
> index be7f702dcde9c..0c9b9f4180fb7 100644
> --- a/drivers/hwmon/acpi_power_meter.c
> +++ b/drivers/hwmon/acpi_power_meter.c
> @@ -884,10 +884,14 @@ static void acpi_power_meter_notify(acpi_handle han=
dle, u32 event, void *data)
> =20
>  static int acpi_power_meter_probe(struct platform_device *pdev)
>  {
> -	struct acpi_device *device =3D ACPI_COMPANION(&pdev->dev);
>  	struct acpi_power_meter_resource *resource;
> +	struct acpi_device *device;
>  	int res;
> =20
> +	device =3D ACPI_COMPANION(&pdev->dev);
> +	if (!device)
> +		return -ENODEV;
> +
>  	resource =3D kzalloc_obj(*resource);
>  	if (!resource)
>  		return -ENOMEM;

These might not be regressions introduced by the new code, but the hwmon
subsystem guidelines explicitly mandate that drivers must implement locking
required for attributes registered by any other means, and should use
hwmon_lock() and hwmon_unlock() for this purpose.

Does this sysfs show function read the 64-bit res->trip array without
acquiring any locks?

drivers/hwmon/acpi_power_meter.c:power1_average_min_show() {
    ...
    if (res->trip[POWER_METER_TRIP_AVERAGE_MIN_IDX] < 0)
        return sysfs_emit(buf, "unknown\n");

    return sysfs_emit(buf, "%lld\n",
              res->trip[POWER_METER_TRIP_AVERAGE_MIN_IDX] * 1000);
}

On 32-bit architectures, can this lead to torn reads and expose corrupted
states to userspace if updated concurrently via store operations?

Also, is it incorrect to use the driver's own mutex_lock(&res->lock) instead
of the required hwmon_lock() API?

drivers/hwmon/acpi_power_meter.c:power1_average_min_store() {
    ...
    mutex_lock(&res->lock);
    ret =3D set_trip(res, POWER_METER_TRIP_AVERAGE_MIN_IDX, trip);
    mutex_unlock(&res->lock);
    ...
}

Can these DIV_ROUND_CLOSEST macros overflow the integer width and wrap arou=
nd
to a very small number if a mistakenly large value is provided?

drivers/hwmon/acpi_power_meter.c:set_trip() {
    ...
    trip =3D DIV_ROUND_CLOSEST(trip, 1000);
    ...
}

drivers/hwmon/acpi_power_meter.c:set_cap() {
    ...
    cap =3D DIV_ROUND_CLOSEST(cap, 1000);
    ...
}

Since the macro evaluates using the expression x + 500, does this silently
bypass boundary checks like min_cap and incorrectly program the underlying
ACPI hardware limits?

Finally, could the multiplication of the 64-bit attribute res->power
(measured in milliwatts) by 1000 severely overflow the 32-bit bound on 32-b=
it
architectures?

drivers/hwmon/acpi_power_meter.c:power_meter_read() {
    ...
    case hwmon_power_average:
        ...
        *val =3D res->power * 1000;
        break;
    ...
}

Since *val is a long capable of representing up to ~2.14 billion on 32-bit
systems, can a power consumption of 3000 Watts result in returning
fundamentally incorrect, negative numbers to userspace due to the lack of
overflow clamping or checks?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/5068745.GXAFRqVoOG@=
rafael.j.wysocki?part=3D1
