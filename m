Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97D5723BD03
	for <linux-hwmon@vger.kernel.org>; Sat, 12 Sep 2026 15:07:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789225668; cv=none; b=YBJ9rQwAeMxbTGtJC5iZ9vA1QMol2f88RzR2ZKscqJmsyV9EbRR6KCN+9lsVycyE5MWg+rpkenA4/Ku1lZmfSEd3u9epPro0XhCXXwG6/5ybuPI6iXyW5RP1gilVoaKg9oN3tJXNpjW96aHfqVn1qd9Zf4fUPjyg4mtgYwVuoGE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789225668; c=relaxed/simple;
	bh=x39kCwhvlxQSSUgSkhWD6m72J86qO1FSKp7LxAQv9qo=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=WDOCQZanuJQ/IW0WN9V+eGdcWIGflIM8yDxac53REHjXkJcOlpbzlGQwXqVzAQbYcFQ7Dq8C/ejt5UTaUSl3j6YMb9QUc8fSJ/S/5NnjHAgDjbwXUFUwLhvz3QBMC2dyzS+cFR5eP1KTJWzfBR5FejjaqRed6uvlxGG0L5wkaG0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cBh9ZRMJ; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="cBh9ZRMJ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1FFC91F000FF;
	Sat, 12 Sep 2026 15:07:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789225667;
	bh=/FnuiyeEBd+o5KasH972JPohJRVUHxu+cBUYUZWqpjc=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=cBh9ZRMJSoJQwER0MHenUok/Kxto1e26PIi0u27m2BrlWmHiM2mFzgauBS+rxaSFA
	 Mu/5+80yeD+D//Tx9K06nPnku/QmQHtU9wohNqJGo49Eyqp2fpg/XrpkwIslNWwmuj
	 op40euJ55w/sVv/FP0cTqAGolPSKMvH/f2vNgWffSBvsX7I8SFaUEwXVLO66fwLgHJ
	 DqvthI2a9wn4zsdsiSpSkuTAXbq1qOkyfRPOFEjiWihOX8BX8P4hkIOdzh2/YApIDZ
	 /stgOF5AHA+H6q3/hfdNCS3f5Z+q9xWY4HdpbPk5f1u52fiVYqEjIXDyAhUXxmyxWb
	 /qLqGSt8bSi9w==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] hwmon: (pmbus) Validate number of phases per page
Reply-To: sashiko-reviews@lists.linux.dev
To: "Guenter Roeck" <linux@roeck-us.net>
Cc: linux-hwmon@vger.kernel.org
In-Reply-To: <20260912145038.2411447-1-linux@roeck-us.net>
References: <20260912145038.2411447-1-linux@roeck-us.net>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 12 Sep 2026 15:07:46 +0000
Message-Id: <20260912150747.1FFC91F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 4 potential issue(=
s) to consider:

New issues:
- [High] The newly added strict bounds check on `info->phases[page]` causes=
 a functional regression for legitimate devices (e.g., mp2975, mp2856) that=
 require more than 10 phases.

Pre-existing issues:
- [High] Preexisting out-of-bounds write in `mp2856_identify_multiphase_rai=
l1` when probing the `mp2857` chip due to hardcoded bounds mismatch.
- [High] The bounds check for `info->pages` is performed after `pmbus_clear=
_faults()`, leading to out-of-bounds reads if a driver configures a pages c=
ount exceeding `PMBUS_PAGES`.
- [High] IEEE754 conversion functions use 32-bit 'long' types, causing inte=
ger overflow and truncation for power sensors on 32-bit architectures.
--

commit 039f346ee509dcc9fb57df126053cfcdf1e45d57
Author: Guenter Roeck <linux@roeck-us.net>

hwmon: (pmbus) Validate number of phases per page

This commit adds a bounds check to the PMBus core API to ensure that
the number of phases configured by a driver does not exceed the
PMBUS_PHASES limit. This prevents potential out-of-bounds reads.

> diff --git a/drivers/hwmon/pmbus/pmbus_core.c b/drivers/hwmon/pmbus/pmbus=
_core.c
> index 5f69c1420b4e1..c7b7bb7f175b2 100644
> --- a/drivers/hwmon/pmbus/pmbus_core.c
> +++ b/drivers/hwmon/pmbus/pmbus_core.c
> @@ -2962,6 +2962,11 @@ static int pmbus_init_common(struct i2c_client *cl=
ient, struct pmbus_data *data,
>  	}
> =20
>  	for (page =3D 0; page < info->pages; page++) {
> +		if (info->phases[page] > PMBUS_PHASES) {
> +			dev_err(dev, "Bad number of PMBus phases for page %d: %d\n",
> +				page, info->phases[page]);
> +			return -ENODEV;
> +		}

[Severity: High]
Does this bounds check introduce a functional regression for devices that
legitimately require more than 10 phases?

Devices like the mp2975 configure up to 14 phases, and the mp2856 uses
up to 12 phases. If PMBUS_PHASES is currently 10, won't this check
unconditionally abort initialization and return -ENODEV for these valid
devices instead of properly increasing the PMBUS_PHASES limit?

>  		ret =3D pmbus_identify_common(client, data, page);
>  		if (ret < 0) {
>  			dev_err(dev, "Failed to identify chip capabilities\n");

[ ... ]

[Severity: High]
This is a pre-existing issue, but does mp2856_identify_multiphase_rail1()
cause an out-of-bounds write when probing the mp2857 chip?

drivers/hwmon/pmbus/mp2856.c:mp2856_identify_multiphase_rail1() {
	...
	for (i =3D 0 ; i < data->info.phases[0]; i++)
		data->info.pfunc[i] |=3D PMBUS_HAVE_IOUT;
	...
}

When probing the mp2857 chip (which has 12 phases), info->phases[0] is set
to 12. Since the pfunc array in struct pmbus_driver_info is bounded by
PMBUS_PHASES (10), won't writing up to index 11 corrupt memory, such as
the read_byte_data and read_word_data function pointers?

[Severity: High]
This is a pre-existing issue, but does pmbus_init_common() perform an
out-of-bounds read if a driver configures a pages count exceeding
PMBUS_PAGES?

drivers/hwmon/pmbus/pmbus_core.c:pmbus_init_common() {
	...
	if (data->info->pages)
		pmbus_clear_faults(client);
	...
	if (info->pages <=3D 0 || info->pages > PMBUS_PAGES) {
	...
}

Since pmbus_clear_faults() iterates up to info->pages and calls
pmbus_set_page(), which accesses the func and phases arrays:

drivers/hwmon/pmbus/pmbus_core.c:pmbus_set_page() {
	...
	if (data->info->phases[page] && data->currphase !=3D phase &&
	    !(data->info->func[page] & PMBUS_PHASE_VIRTUAL)) {
	...
}

Won't the unchecked page index cause an out-of-bounds read on the func and
phases arrays before the pages count is validated?

[Severity: High]
This is a pre-existing issue, but do the IEEE754 conversion functions
truncate power sensors on 32-bit architectures?

drivers/hwmon/pmbus/pmbus_core.c:
static long pmbus_reg2data_ieee754(struct pmbus_data *data,
				   struct pmbus_sensor *sensor)
{
	int exponent;
	bool sign;
	long val;
	...
}

static u16 pmbus_data2reg_ieee754(struct pmbus_data *data,
				  struct pmbus_sensor *sensor, long val)
{
	...
}

Because the val parameter and variable are 32-bit long instead of s64 on
32-bit architectures, won't passing high user-space sysfs power limits
(e.g., 3000 W as 3,000,000,000 uW) immediately wrap to a negative number?

This truncation from 64-bit to 32-bit signed long could cause the driver
to configure inverted or zero limits in the hardware.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260912145038.2411=
447-1-linux@roeck-us.net?part=3D1
