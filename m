Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 372F94756B1;
	Thu, 23 Jul 2026 17:00:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784826033; cv=none; b=J7u1j2MCgHAnl24omm7yi5cwLhd91EFJeMpsTnTXYpFsbYtk5qd2Li1eAmLiXQczmgRsMN4iBtRG23cc1TS/LBHpJsjaDh52cgfmtXCvGsOnNG7wXzHs7fk9UV+8kgvXU4lCeG/oX4/KWuwBKmsSloAJGMIZHw0L+z9aVak7W/o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784826033; c=relaxed/simple;
	bh=Y1ouL6t529fVsy4gEr1brpcsj87V/Ykoh5VKxWfbbRw=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=JP47d/J/zrFC6REgglhoM3dSWjpBv0JBT16CjdiJYBo3vTMYO1dAOepV+J1GOtadn/BCAvEd5/CJ7ICTJAK95CRVA1JDOUPg9TuHGqWVnWUJYmwJdtiM+lytJNjPko/tORwaPtL787lvqxDM857KHKNSqqY01S/uzPZcc94woYE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=MZ1/T3BX; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="MZ1/T3BX"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6C04A1F000E9;
	Thu, 23 Jul 2026 17:00:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784826031;
	bh=Owyi3B294Ip6NKbVOZnhuvkaveXqUnNY/13Q3ZtbquM=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=MZ1/T3BXr2vjqaoudTA4EAw4dAV0kX4kONqyi6pr6zT5YsVbnSTNe7imWciA57KbU
	 qEzlDXbvXYzbJ5pm3TqW79O1AMI8m1Y/XWWiKtw9KlQlzhLfzYnIQ6C8sp399hfOhb
	 wzw2eJOJm+Rd5ghLfrumKUafazabLpmx2UL9lGYbappKv57/2wT81sMym2dT+rnhbf
	 HgSG/zUqQF6kcMyj9GqgThX0rHCLefMrpf4oMP9Urr6OlIIqt3YX6RCKSZowIX9irs
	 c5jVBoY6FtCLMhsXh9XMDF6EWd+d4WzAkpC0wNnhxAcbucVtc72X4lyjHHC8kahvbN
	 JB0wgAVmia0pg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 2/2] hwmon: (pmbus/vt7505) Add driver for Analog
 Devices MAX16545/MAX16550 and Volterra VT7505
Reply-To: sashiko-reviews@lists.linux.dev
To: =?utf-8?b?UHJhZGhhbiwgU2FubWFu?= <sanman.pradhan@hpe.com>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org, linux-hwmon@vger.kernel.org
In-Reply-To: <20260723164249.199442-3-sanman.pradhan@hpe.com>
References: <20260723164249.199442-1-sanman.pradhan@hpe.com>
 <20260723164249.199442-3-sanman.pradhan@hpe.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 23 Jul 2026 17:00:21 +0000
Message-Id: <20260723170031.6C04A1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] The `i2c_device_id` array does not use named (designated) initializ=
ers, violating I2C subsystem guidelines.
--

--- Patch [2]: [PATCH v2 2/2] hwmon: (pmbus/vt7505) Add driver for Analog D=
evices MAX16545/MAX16550 and Volterra VT7505 ---
commit 909ee10f8fd3e9cdfd9644221cb8eccdd4ef2cb0
Author: Georgi Vlaev <gvlaev@juniper.net>

hwmon: (pmbus/vt7505) Add driver for Analog Devices MAX16545/MAX16550 and V=
olterra VT7505

This commit adds a PMBus hardware monitoring driver for the Analog Devices
MAX16545, MAX16550, and Volterra VT7505 controllers. It supports reporting
and clearing peak values for voltage, current, power, and temperature.

> diff --git a/drivers/hwmon/pmbus/vt7505.c b/drivers/hwmon/pmbus/vt7505.c
> new file mode 100644
> index 0000000000000..a96abf75b1aad
> --- /dev/null
> +++ b/drivers/hwmon/pmbus/vt7505.c
[ ... ]
> +static const struct i2c_device_id vt7505_id[] =3D {
> +	{ "max16545", vt7505 },
> +	{ "max16550", max16550 },
> +	{ "vt7505", vt7505 },
> +	{ }
> +};

[Severity: Low]
Could these array entries be updated to use named (designated) initializers?
The I2C subsystem guidelines recommend using named initializers for arrays =
of
type struct i2c_device_id to maintain uniformity and prevent field
misalignment.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260723164249.1994=
42-1-sanman.pradhan@hpe.com?part=3D2
