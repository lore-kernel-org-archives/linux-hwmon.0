Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 888DD274B2A
	for <linux-hwmon@vger.kernel.org>; Sat,  2 May 2026 10:43:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777718591; cv=none; b=YYAO7UwhQ57QDIyBQ29goWQKPM5lsM+2SA3vEtuZGwYgQcD9xJZPZ1NrCSmE1fq09z3C9vRXEvFKNl8q6S7jcn07JIiGy8UHXQMSd+AFuTtFTVHxRub7K94uttz54VrG3ixZkF4WGHprzv0l4tNmxhyJ4ao64odUh8Wd6nSNVi4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777718591; c=relaxed/simple;
	bh=mnBYXW6xgFokjG5vqgI0JKKVb8Je9WviullbW/8E5Zo=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=C+CbA5ZOti476t0TI88+XTIlJONa5CJh3WfiAP1NgipHmH25N1sLTDAw+IFg0YhHxTybiiv9mHuXTgUFOAsV/RhJyOEqpxJPt3Sn9CI1y9yX/nAtw3Kw4bDq0t1Mmq6PurOB+K67G9WapuGTcoI9zaeSsIrKCJeL/lT62K4CLis=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cOkavNC2; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="cOkavNC2"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0D48EC19425;
	Sat,  2 May 2026 10:43:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777718591;
	bh=mnBYXW6xgFokjG5vqgI0JKKVb8Je9WviullbW/8E5Zo=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date:From;
	b=cOkavNC2H/eng0VR63b9Ar9d/0iK2T7kWFdwlL8MmiRB/GsagBku6nbbmPIcZo7bs
	 dl0fZyfGtjmSdF/nKluuGyvZmGQOg0sc880tHHMSPhOCM0hiOxObkcQ6ADXbSRje86
	 lqq0lSv68koh3AXktWFqjz/4G9lAuy/uT+giJ0vWGHAT32TL6QCa2oqzZhWqA+8N7d
	 SxTyQMEoWR/fiY8zDSsp5cJ/jaC39OIzpVBW81w9oeZYH5PdCgSSp2d8cD0SyV0yoR
	 TPtgpMTQFcUxTasiS7P0lcCW8bWg7SxasfFAULx/vi1ctGHsP9Hm+uEyl4y3wCQXeF
	 2HuWDVsd9/kOw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v13 2/3] hwmon: ltc4283: Add support for the LTC4283
 Swap Controller
Reply-To: sashiko@lists.linux.dev
To: =?utf-8?b?TnVubyBTw6EgdmlhIEI0IFJlbGF5?= <devnull+nuno.sa.analog.com@kernel.org>
Cc: linux-hwmon@vger.kernel.org
In-Reply-To: <20260502-ltc4283-support-v13-2-1c206542e652@analog.com>
References: <20260502-ltc4283-support-v13-2-1c206542e652@analog.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 02 May 2026 10:43:10 +0000
Message-Id: <20260502104311.0D48EC19425@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] Read-modify-write operations on hardware alarm and fault log reg=
isters will cause concurrent events to be lost.
--

commit 768d24f774b79f50e1444b93b756d7bda5873159
Author: Nuno S=C3=A1 <nuno.sa@analog.com>

hwmon: ltc4283: Add support for the LTC4283 Swap Controller

This commit introduces driver support for the Analog Devices LTC4283
Negative Voltage Hot Swap Controller. It adds functionality to monitor
voltage, current, power, and various hardware faults via an I2C interface.

> diff --git a/drivers/hwmon/ltc4283.c b/drivers/hwmon/ltc4283.c
> new file mode 100644
> index 000000000000..d8931c9a4685
> --- /dev/null
> +++ b/drivers/hwmon/ltc4283.c

[ ... ]

> +static int ltc4283_read_alarm(struct ltc4283_hwmon *st, u32 reg,
> +			      u32 mask, long *val)
> +{
> +	u32 alarm;
> +	int ret;
> +
> +	ret =3D regmap_read(st->map, reg, &alarm);
> +	if (ret)
> +		return ret;
> +
> +	*val =3D !!(alarm & mask);
> +
> +	/* If not status/fault logs, clear the alarm after reading it. */
> +	if (reg !=3D LTC4283_FAULT_STATUS && reg !=3D LTC4283_FAULT_LOG)
> +		return regmap_write(st->map, reg, alarm & ~mask);

Could this read-modify-write sequence cause concurrent hardware events to be
lost?

If these alarm registers use write-0-to-clear semantics, writing back
alarm & ~mask will inadvertently write a 0 to any new alarm bits that were
asserted by the hardware between the regmap_read() and regmap_write() calls.
Usually, a direct atomic write of ~mask without reading first is preferred
to avoid clearing unrelated active alarms.

[ ... ]

> +static int ltc4283_reset_power_hist(struct ltc4283_hwmon *st)
> +{

[ ... ]

> +	/* Clear possible power faults. */
> +	return regmap_clear_bits(st->map, LTC4283_FAULT_LOG,
> +				 LTC4283_PWR_FAIL_FAULT_MASK | LTC4283_PGI_FAULT_MASK);
> +}

Will using regmap_clear_bits() here and in other history reset functions
also risk losing concurrent fault logs?

Since regmap_clear_bits() performs a read-modify-write under the hood, any
new faults asserting between the read and write phases might be cleared
silently. Direct writes using regmap_write() might be safer if the register
behaves as write-0-to-clear.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260502-ltc4283-su=
pport-v13-0-1c206542e652@analog.com?part=3D2
