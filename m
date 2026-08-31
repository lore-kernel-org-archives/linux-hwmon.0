Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9865F48988A
	for <linux-hwmon@vger.kernel.org>; Mon, 31 Aug 2026 16:14:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788192875; cv=none; b=tgoYMerUz5HaOT9ASBJrQd4Elz1N0brUkjFGionVAy+wvf5MQr/RtRuRL6KepQOYvW7WyM0y/tNefJI6sHG31uWcp5h/20S8qJcXCFTh8d5vTrL/FvvC5PJI126cPDYmQ5gpKQ/OIqvsTYnhjalp9XYnNyevwG/Er2Vpag3fhsU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788192875; c=relaxed/simple;
	bh=zcfkN9KtTp9lUjQZyHrCqngDOnFXKedupHn4hTQHP48=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=Loahjiq+90VBc8JPccXkBZdmvQSVndrv6bvJaBA0WoSfKGn2Ib2xWuNMok7h0n9zmRUxtHsS+NET+7cnl8kBQSkKLikCn2TAoVLsUORJw+Rm5FStVORYfPYMy3In+GvjO8AmIgUv+Js5HUa/xiN+zs9Sd/QVwa0Zj0JHcpKar/I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mqAv4XNT; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mqAv4XNT"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EF9451F0155D;
	Mon, 31 Aug 2026 16:14:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788192874;
	bh=6ld54/uFsi0OP1J3hdXFTKWxt7MDEaTc9G7/q5Ob5pA=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=mqAv4XNTUNIOChJiiZJ1ijCpCtQ6yiYqWsxc39Yk8brHuH488GsiFK+mbu9zHm6GJ
	 Q1lpyPn5+fyeLHlzRfx9/mJKf7a+fkLJJ0codMlLdG1JAKf2+ZcPdWP2aMDJ/TsfGn
	 oLqI1kLqgG3OvI+r7Oy6vv5CrtcFptPDdPM4U3bo0T2ymIHqs6mNCHWB605CE0Kt9w
	 bUq6QicPbkX/eqgM4NEPqa4baz1a8X6LTNmrA4VN30NER+r5uXFcYbWoy2Zj6Txhez
	 9/fEBeIOqD+pKoJ3PMurTq5Cq5UldZI0BRWtoAV6U+UR8KeLvmoEQxgkK8NJnSheml
	 HRiDWc0Ko15Hw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH AUTOSEL 6.18] hwmon: (asus-ec-sensors) add ROG MAXIMUS
 Z790 EXTREME
Reply-To: sashiko-reviews@lists.linux.dev
To: "Sasha Levin" <sashal@kernel.org>
Cc: linux-hwmon@vger.kernel.org
In-Reply-To: <20260831133314.4125787-412-sashal@kernel.org>
References: <20260831133314.4125787-1-sashal@kernel.org>
 <20260831133314.4125787-412-sashal@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 31 Aug 2026 16:14:33 +0000
Message-Id: <20260831161433.EF9451F0155D@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:

Pre-existing issues:
- [High] Spurious EC register reads due to incorrect bank check condition i=
n asus_ec_block_read().
- [High] The return value of asus_ec_hwmon_add_chan_info() is ignored, lead=
ing to a NULL pointer dereference in the hwmon core if allocation fails.
--

commit 751ec7ce900f71bbf414765f09e4deeff7e667fe
Author: Brian Downey <bdowne01@gmail.com>

hwmon: (asus-ec-sensors) add ROG MAXIMUS Z790 EXTREME

Add support for ROG MAXIMUS Z790 EXTREME.

Link: https://lore.kernel.org/r/20260608060855.40469-1-eugene.shalygin@gmai=
l.com

> diff --git a/drivers/hwmon/asus-ec-sensors.c b/drivers/hwmon/asus-ec-sens=
ors.c
> index 34a8f6b834c97..bd89ffbe25897 100644
> --- a/drivers/hwmon/asus-ec-sensors.c
> +++ b/drivers/hwmon/asus-ec-sensors.c

[ ... ]

> @@ -470,6 +476,13 @@ static const struct ec_board_info board_info_maximus=
_z690_formula =3D {
>  	.family =3D family_intel_600_series,
>  };
> =20
> +static const struct ec_board_info board_info_maximus_z790_extreme =3D {
> +	.sensors =3D SENSOR_TEMP_T_SENSOR | SENSOR_TEMP_VRM |
> +		SENSOR_SET_TEMP_WATER | SENSOR_FAN_WATER_FLOW,
> +	.mutex_path =3D ASUS_HW_ACCESS_MUTEX_RMTW_ASMX,
> +	.family =3D family_intel_700_series,
> +};
> +

[Severity: High]
This isn't a bug introduced by this patch, but while reviewing the new board
support, I noticed a pre-existing issue in asus_ec_block_read() that could
affect hardware interaction on boards with sensors spanning multiple banks.

Could this condition cause spurious reads on unintended EC registers?

drivers/hwmon/asus-ec-sensors.c:asus_ec_block_read() {
		for (ireg =3D 0; ireg < ec->nr_registers; ireg++) {
			reg_bank =3D register_bank(ec->registers[ireg]);
			if (reg_bank < bank) {
				continue;
			}
			ec_read(register_index(ec->registers[ireg]),
				ec->read_buffer + ireg);
		}
}

The loop uses if (reg_bank < bank) to skip registers from previously
processed banks, but it appears to not skip registers from future banks whe=
re
reg_bank > bank.

Since the read uses the current hardware bank, could this result in uninten=
ded
reads that might trigger unexpected hardware side-effects?


[Severity: High]
This is a pre-existing issue, but I also noticed a potential missing error
handling path in the driver's probe function.

Does this loop in asus_ec_probe() silently discard the error return value f=
rom
asus_ec_hwmon_add_chan_info()?

drivers/hwmon/asus-ec-sensors.c:asus_ec_probe() {
	for (type =3D 0; type < hwmon_max; ++type) {
		if (!nr_count[type])
			continue;

		asus_ec_hwmon_add_chan_info(asus_ec_hwmon_chan, dev,
					     nr_count[type], type,
					     hwmon_attributes[type]);
		*ptr_asus_ec_ci++ =3D asus_ec_hwmon_chan++;
	}
}

Because asus_ec_hwmon_add_chan_info() can return -ENOMEM if its memory
allocation fails, ignoring its return value could leave the config pointer =
in
asus_ec_hwmon_chan as NULL.

When this partially initialized structure is subsequently passed to
devm_hwmon_device_register_with_info(), the hwmon core will iterate over the
channel configuration in hwmon_num_channel_attrs().

Could this cause a NULL pointer dereference when the core iterates using
for (i =3D n =3D 0; info->config[i]; i++)?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260831133314.4125=
787-412-sashal@kernel.org?part=3D1
