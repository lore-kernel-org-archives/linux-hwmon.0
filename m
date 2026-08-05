Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DCDA1684BE
	for <linux-hwmon@vger.kernel.org>; Wed,  5 Aug 2026 01:08:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785892119; cv=none; b=g2JL/BQqsAiW+vpMETD8rdEv7XMqq02kz7WRfb/9YUQv/6+ypkRGb+wyPeN+0u43urfWBo7FhmUuJE2gqSVYIHHwYjld6gylrF1T6u7fm5WYFCZ2MH1gfApJ+iQofEqzC9PjE27NYGmx4fsAAQqYqIYirdTkUBEj4rArftMbKNs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785892119; c=relaxed/simple;
	bh=jld2MG86mbK6EsFc+TutpprcD8UtT4puw2D6q5kmGIY=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=onlreRPxRU6VlYyrq/IoM5YUmuVWPyn0TI7VRg+rrDqo1y9NFjAnc3P3eiPMenbHlNdh/Xyx8+UZhtCHLywRx526XBqnYop0PYMzhXj8xMSV0g0K4lk8fnmDkJlj8yxgoG7D1gQsn4wWsrF/FN+PotWYfGHBUlrSENzfVoWjqYE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=oPL7/Q8V; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="oPL7/Q8V"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4934C1F000E9;
	Wed,  5 Aug 2026 01:08:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785892118;
	bh=1ZMfKBdpdaCagYRYVVRByOfS4HrMbmKMslIQK1LuLfg=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=oPL7/Q8VmZ5MrktoI5y7pqGG03neQcQoGj98+kxBcsS67lPPV2f6ltbYbOlUA6RHX
	 Z1cajoNOE5LirySdBPZgdJcps28oaTf1MBn7+i3LTzlbgB6BWsu7bJMZczf187/bwt
	 P4Sili6dHknJFvuGCWT2QqLXPvRAngZtWLgaf1Pg6VDpg7CBJqQWXSedewb5diP2aS
	 T58EUfz6TjvMcjVQ9VofMXajDOQ3Py+XLlVMvYEyALxNWJwoDonJJf6bBj3Yu0+PQP
	 +tYKjOdgIo7XUmosOzaIDnyLik16ZBBVrB8FE39RGvfdBnJfIjt7UHPIB3hbg3qqjI
	 htI0GOT6pzj+A==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 3/3] hwmon: (ltc4282) Fix parsing
 adi,current-limit-sense-microvolt
Reply-To: sashiko-reviews@lists.linux.dev
To: "Guenter Roeck" <linux@roeck-us.net>
Cc: linux-hwmon@vger.kernel.org
In-Reply-To: <20260805005721.1566034-4-linux@roeck-us.net>
References: <20260805005721.1566034-1-linux@roeck-us.net>
 <20260805005721.1566034-4-linux@roeck-us.net>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 05 Aug 2026 01:08:37 +0000
Message-Id: <20260805010838.4934C1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:

Pre-existing issues:
- [High] The `in_min_raw` cache for the inactive voltage monitoring channel=
 is not initialized from the hardware EEPROM at boot, leading to the hardwa=
re undervoltage limit being clobbered with 0 when the channel is enabled.
- [High] Uninitialized stack variable `struct clk_init_data init` is passed=
 to the Common Clock Framework, leading to undefined behavior and potential=
 panics.
--

--- Patch [3]: [PATCH 3/3] hwmon: (ltc4282) Fix parsing adi,current-limit-s=
ense-microvolt ---
commit b52e0acebe8052dfb365a719ef77509a10b27e3a
Author: Guenter Roeck <linux@roeck-us.net>

hwmon: (ltc4282) Fix parsing adi,current-limit-sense-microvolt

ltc4282_parse_dt() evaluates the wrong variable when parsing the current
limit.

> diff --git a/drivers/hwmon/ltc4282.c b/drivers/hwmon/ltc4282.c
> index bb1bcb3690163..b1675dc5b3c7f 100644
> --- a/drivers/hwmon/ltc4282.c
> +++ b/drivers/hwmon/ltc4282.c
> @@ -1394,7 +1394,7 @@ static int ltc4282_setup(struct ltc4282_state *st, =
struct device *dev)
>  	if (!ret) {
>  		int reg_val;
> =20
> -		switch (val) {
> +		switch (st->vsense_max) {
>  		case 12500:
>  			reg_val =3D 0;
>  			break;

[Severity: High]
This isn't a bug introduced by this patch, but the in_min_raw cache for the
inactive voltage monitoring channel does not appear to be initialized from
hardware defaults during boot:

drivers/hwmon/ltc4282.c:ltc4282_get_defaults() {
...
	if (!st->in0_1_cache[LTC4282_CHAN_VSOURCE].en) {
		st->in0_1_cache[LTC4282_CHAN_VDD].en =3D true;
		return regmap_read(st->map, LTC4282_VSOURCE_MAX,
				   &st->in0_1_cache[LTC4282_CHAN_VSOURCE].in_max_raw);
	}

	return regmap_read(st->map, LTC4282_VSOURCE_MAX,
			   &st->in0_1_cache[LTC4282_CHAN_VDD].in_max_raw);
}

If a user later enables this inactive channel via sysfs, ltc4282_cache_sync=
()
writes the uninitialized in_min_raw (0) back to the hardware register:

drivers/hwmon/ltc4282.c:ltc4282_cache_sync() {
...
	ret =3D regmap_write(st->map, LTC4282_VSOURCE_MIN,
			   st->in0_1_cache[channel].in_min_raw);
...
}

Does this silently clobber and disable the hardware undervoltage limit?


[Severity: High]
This is a pre-existing issue, but I also noticed a potential problem with
uninitialized stack variables passed to the common clock framework:

drivers/hwmon/ltc4282.c:ltc428_clk_provider_setup() {
	struct clk_init_data init;
	int ret;

	if (!IS_ENABLED(CONFIG_COMMON_CLK))
		return 0;

	init.name =3D  devm_kasprintf(dev, GFP_KERNEL, "%s-clk",
				    fwnode_get_name(dev_fwnode(dev)));
...
	init.ops =3D &ltc4282_ops;
...
}

Since init is not zero-initialized, fields like init.num_parents and
init.parent_names will contain stack garbage. When devm_clk_hw_register()
evaluates init.num_parents, could it attempt to dereference the uninitializ=
ed
init.parent_names pointer and cause a panic during driver probe?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260805005721.1566=
034-1-linux@roeck-us.net?part=3D3
