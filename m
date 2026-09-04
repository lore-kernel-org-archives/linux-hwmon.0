Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CFE0E2192F9
	for <linux-hwmon@vger.kernel.org>; Fri,  4 Sep 2026 01:10:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788484218; cv=none; b=WfLGdWn+KyBmYU8tirOMU5XQ4rCOTJ5wDAaOY/dnu8BeDevhz0oOVG2rnY501O63NhQ1uUoRTqwleQLZPar+npAb16Su2BV6jrVsIqhWG/X5/HV+nhze5f59VDfYuQ0WsSWWHEODxhW1AQNFeLc28aUslOSjy/WOqeJ8vFKQwWc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788484218; c=relaxed/simple;
	bh=2fLjt+eDUh9+OD6hptJNK0YLgkAKYRTr1zVxbjUAQqE=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=GAua0pdNdQo9TOKk/nSjtxqMeEGcH3o17n1ChFthS1ZE/9xDpwut/tgVpiWOf76WGOQ884jQ8a2MeJd1HkAl8y9oWpRandWeRfRn7clMzogVv43rIWj0h2xrWCYoS+KaX/q9jDvHHgWnEfYNYbRwH0hiXsHeoulpRT8AZIRpn1A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=AU+FAjA7; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="AU+FAjA7"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8BA331F000E9;
	Fri,  4 Sep 2026 01:10:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788484216;
	bh=BXVUNkXalCqGBrmdCo92lpeS4pKUmPYzIN9qyxGa0TE=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=AU+FAjA7GuuILxhL7bRoazcof6rWfthLqjGN5rBsezwsK7FQ+mMuyalwJA2JmexFB
	 e+qNuk5rxKL4Mz0S5CqPyaJwLXpyQvU2mLzGrBSX/p42jcoPlCWrEjpO6Qt64loEt5
	 GEPfsgRZGnIQdFBTam8bbt3/2iq9hogyPY78miFM2+0K2kZ6ZkH60aDAto8TrbNh6a
	 8GSnXz9PxICbjVTNYkIZd6yasniDZ33tgHXPzHwEYX3Io2Uqa68HOn8wwXQw8gPuPl
	 22cV9ZNb37nQNyG2CAspvCG4Hl9dgyTyDImoDI05adh4S5t/fGQl5pA7pEk15RKk8z
	 Snfp1Fpo1rYQQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v0 2/2] hwmon: pmbus: Add tps546e25 to generic pmbus
Reply-To: sashiko-reviews@lists.linux.dev
To: "Aryan Srivastava" <aryan.srivastava@alliedtelesis.co.nz>
Cc: linux-hwmon@vger.kernel.org
In-Reply-To: <20260904005351.2136374-3-aryan.srivastava@alliedtelesis.co.nz>
References: <20260904005351.2136374-1-aryan.srivastava@alliedtelesis.co.nz>
 <20260904005351.2136374-3-aryan.srivastava@alliedtelesis.co.nz>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 04 Sep 2026 01:10:16 +0000
Message-Id: <20260904011016.8BA331F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 4 potential issue(=
s) to consider:

New issues:
- [Medium] The new `tps546e25` device entry incorrectly uses `pmbus_info_ze=
ro` instead of `pmbus_info_one`, which forces unnecessary dynamic page prob=
ing.
- [Low] The new compatible string is not documented in the device tree bind=
ings.
- [Low] The new device is missing from the generic PMBus driver documentati=
on.

Pre-existing issues:
- [High] Potential NULL pointer dereference of `device_info` in `pmbus_prob=
e()`.
--

commit fc4eef8dbc6c89c58d89c8feeedc224bbb325745
Author: Aryan Srivastava <aryan.srivastava@alliedtelesis.co.nz>
Subject: hwmon: pmbus: Add tps546e25 to generic pmbus

This commit adds support for the tps546e25 device to the generic PMBus driv=
er.
It operates over SMBus and is similar to other TI DCDC devices.

> diff --git a/drivers/hwmon/pmbus/pmbus.c b/drivers/hwmon/pmbus/pmbus.c
> index b629acbffbfb6..96a72950e7d36 100644
> --- a/drivers/hwmon/pmbus/pmbus.c
> +++ b/drivers/hwmon/pmbus/pmbus.c
> @@ -245,6 +245,7 @@ static const struct i2c_device_id pmbus_id[] =3D {
>  	{ .name =3D "tps544b25", .driver_data =3D (kernel_ulong_t)&pmbus_info_o=
ne },
>  	{ .name =3D "tps544c20", .driver_data =3D (kernel_ulong_t)&pmbus_info_o=
ne },
>  	{ .name =3D "tps544c25", .driver_data =3D (kernel_ulong_t)&pmbus_info_o=
ne },
> +	{ .name =3D "tps546e25", .driver_data =3D (kernel_ulong_t)&pmbus_info_z=
ero },

[Severity: Medium]
Since this is similar to other TI DCDC devices, should this use pmbus_info_=
one
instead of pmbus_info_zero?

Using pmbus_info_zero forces dynamic page probing, which causes unnecessary
I2C/SMBus traffic. If the device ignores the data but ACKs out-of-range page
writes, it could expose 32 identical phantom pages in sysfs.

>  	{ .name =3D "udt020", .driver_data =3D (kernel_ulong_t)&pmbus_info_one =
},
>  	{ }
>  };


[Severity: Low]
Is it intentional that the new device is omitted from the device tree bindi=
ngs?

Adding ti,tps546e25 to Documentation/devicetree/bindings/trivial-devices.ya=
ml
would prevent dtbs_check warnings when this compatible string is used.


[Severity: Low]
Could we also update the supported hardware documentation in
Documentation/hwmon/pmbus.rst?

Adding the TPS546E25 to the list of Texas Instruments devices and its prefix
'tps546e25' would ensure users know it is supported by this driver.


[Severity: High]
This is a pre-existing issue, but I noticed a potential NULL pointer derefe=
rence
in pmbus_probe().

drivers/hwmon/pmbus/pmbus.c:pmbus_probe() {
    ...
	device_info =3D (struct pmbus_device_info *)i2c_get_match_data(client);
	if (device_info->flags) {
    ...
}

If the driver is bound manually via sysfs (e.g., using driver_override)
without an I2C ID that matches the driver's id_table, i2c_get_match_data()
will return NULL. The code immediately dereferences device_info->flags,
which will cause a kernel crash.

Does this need to be checked before dereferencing?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260904005351.2136=
374-1-aryan.srivastava@alliedtelesis.co.nz?part=3D2
