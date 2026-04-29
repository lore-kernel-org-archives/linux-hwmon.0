Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9141E37267A
	for <linux-hwmon@vger.kernel.org>; Wed, 29 Apr 2026 07:48:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777448935; cv=none; b=q9RNbRCKUtfZAXH5IlHL75ppajvS31Bw9dgedRoNenwPUYM093yg+fupy5Y7tSCtPH9mbowRZg0dXUJdVfzLgMZ04iNX42/wUkBasu3Q/L4JoXlA+LF7HTLV0cK0MmnUePR/Bge2sRbGhDG75veJtUvDMD3m0LT3HCstyZ8GZfo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777448935; c=relaxed/simple;
	bh=EyKMixn0bDZ5PAsJr727T9kE5N3wgUVh46MqtYcuxmQ=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=AtvXXfdBtZv9TbuCYMVJApCVpxjMQwhP/IO59CxGceOs4UoV3RiffPfrr3nWBiZ/uo7ZZIqTAl4wQc4qc3W8rgcxU/Il83v6YtmeXBDl+hhkZ5qLNjh76GguxUUx0trBspyWmCZxisRC/+aVwRVnke5hme6vmPK0B5Lq+3tObZc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mkWR8FkH; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mkWR8FkH"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0E24DC19425;
	Wed, 29 Apr 2026 07:48:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777448935;
	bh=EyKMixn0bDZ5PAsJr727T9kE5N3wgUVh46MqtYcuxmQ=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date:From;
	b=mkWR8FkHBsp4NZHfEiEYN9/4lu9X+G2Lfw3Mae0SThtvGabPMJJP43QwhKuV+EbTi
	 rD1g9lFubr02upbpCjwlDyUGGotgvADTufy7gsmLKtGXCq5ZpTboOEPdr8vmlVVc/E
	 8BuHnyASCfiDKEQsDZ0uGGviKgKIqAsUhCzVThZb3hddoVaYjXO+uA4ojRjLPAoBaM
	 tqalVdFSgZv50s1u01vnjBZ8WJ7JzKOcb8Nq/CpHEnf60FnIboLTUFvDD2zHO4UnZK
	 Utuy7B2ASEr5dp2AQju3fJdPOcXfctUDfGgsu/vHTJorJa8WhvNdnDQH0kSGmfkk5o
	 kq7qqNO+dsK9A==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v7 1/3] hwmon: emc2305: Fix fan channel index handling
Reply-To: sashiko@lists.linux.dev
To: florin.leotescu@oss.nxp.com
Cc: linux-hwmon@vger.kernel.org
In-Reply-To: <20260429065955.2113012-2-florin.leotescu@oss.nxp.com>
References: <20260429065955.2113012-2-florin.leotescu@oss.nxp.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 29 Apr 2026 07:48:54 +0000
Message-Id: <20260429074855.0E24DC19425@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:
- [High] Missing hwmon locking serialization between sysfs operations and t=
hermal cooling callbacks.
- [High] Incomplete channel separation causing independent thermal updates =
to silently alias to channel 0.
- [High] Division by zero in `emc2305_show_fan()` when hardware returns a s=
mall tachometer value.
--

commit 3aaf7523e2096af769a25d6788cd08adc306d559
Author: Florin Leotescu <florin.leotescu@nxp.com>

hwmon: emc2305: Fix fan channel index handling

The commit fixes the fan channel index used for accessing per-channel data
structures. It validates the index against the available channels and uses
the DT reg property for thermal registration.

> diff --git a/drivers/hwmon/emc2305.c b/drivers/hwmon/emc2305.c
> index 64b213e1451e..f71a0e265924 100644
> --- a/drivers/hwmon/emc2305.c
> +++ b/drivers/hwmon/emc2305.c

[ ... ]

> @@ -680,12 +687,18 @@ static int emc2305_probe(struct i2c_client *client)
>  	if (IS_REACHABLE(CONFIG_THERMAL)) {
>  		/* Parse and check for the available PWM child nodes */
>  		if (pwm_childs > 0) {
> -			i =3D 0;
>  			for_each_child_of_node_scoped(dev->of_node, child) {
> -				ret =3D emc2305_set_single_tz(dev, child, i);
> +				ret =3D of_property_read_u32(child, "reg", &ch);
> +				if (ret || ch >=3D data->pwm_num)
> +					continue;
> +
> +				/*
> +				 * emc2305_set_single_tz() uses 0 for the common cooling
> +				 * device and 1..pwm_num for individual fan channels.
> +				 */
> +				ret =3D emc2305_set_single_tz(dev, child, ch + 1);

Since data->pwm_separate is hardcoded to false for all DT configurations,
doesn't emc2305_get_cdev_idx() unconditionally return 0 at runtime for all
registered cooling devices?

If the thermal subsystem independently updates a specific fan channel, does
this cause the driver to overwrite channel 0's internal state and broadcast
the PWM change to all hardware channels instead of separating them?

>  				if (ret !=3D 0)
>  					return ret;
> -				i++;
>  			}
>  		} else {
>  			ret =3D emc2305_set_tz(dev);

I also noticed a few other issues in this file that are not introduced by
this patch, but might be worth addressing.

Is there missing locking between hwmon sysfs operations and thermal cooling
callbacks? Both emc2305_write() and emc2305_set_cur_state() can concurrently
modify shared state and issue I2C writes:

drivers/hwmon/emc2305.c:__emc2305_set_cur_state() {
    ...
	data->cdev_data[cdev_idx].cur_state =3D state;
	if (data->pwm_separate) {
		ret =3D i2c_smbus_write_byte_data(client, EMC2305_REG_FAN_DRIVE(cdev_idx)=
, val);
    ...
}

Does the absence of a mutex here create a data race that can corrupt the
driver's internal state?

Additionally, is there a potential division by zero in emc2305_show_fan()?

drivers/hwmon/emc2305.c:emc2305_show_fan() {
    ...
	ret =3D i2c_smbus_read_word_swapped(client, EMC2305_REG_FAN_TACH(channel));
	if (ret <=3D 0)
		return ret;

	ret =3D ret >> EMC2305_TACH_REGS_UNUSE_BITS;
	ret =3D EMC2305_RPM_FACTOR / ret;
    ...
}

If the hardware returns a value between 1 and 7, shifting right by 3 makes
ret =3D 0. Doesn't the next line then divide by zero and trigger a panic?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260429065955.2113=
012-1-florin.leotescu@oss.nxp.com?part=3D1
