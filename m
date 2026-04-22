Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EEC253F075A
	for <linux-hwmon@vger.kernel.org>; Wed, 22 Apr 2026 19:25:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776885914; cv=none; b=Omdcn5NlUpuehkrVzEvrvTzFsoCSd7AwL4DVevx2I3ZeUwTESmIPO7/l2fsWdqz5uKaT/qOKUZ2MNrWD9+kWKVhmUpChgZBOdaXt/pP/N8XM64R3w5q60zFTly/aXejUZJEM9pWwCKtZkLi+vHj3MNnHGPXi17STPfgFUyLA17w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776885914; c=relaxed/simple;
	bh=3Fj/d3xKuzMpcPj+pc/EMVD52hGfQHHxFEfr+emMN1Y=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=eRmIVxLC+e6e3/sNzTeDX1/ctuithQ2wnBJau/Xcff70GpKU/XCx3GWguQuf/7qH55MmMwHvpaavllLvy+KxGz1nR4tFX3ccQ32aV2Kc5tH7tVr21nf6Bc7BkA5N5z3chaoVwjz1Z3seSOFRsQKHoXP9IshViHn5xCoiux4Bgds=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=p5hevye9; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="p5hevye9"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EEF0DC19425;
	Wed, 22 Apr 2026 19:25:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776885913;
	bh=3Fj/d3xKuzMpcPj+pc/EMVD52hGfQHHxFEfr+emMN1Y=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date:From;
	b=p5hevye9gqUoO9nn5iObMb5+84R6t8L1ZlEVJ+xP6y2LkHivjKK9Vt/Tgqv8TUi9l
	 1qSHXw29xx37EBCTdcCrmiTB57lsjKwPFp4gzviTQaWPxIWaRN1Wrctkbxc4vCpzHt
	 T1Xg3nWMYVQEctU87MaFAboPZqGgXmx4Vj7mOYIQozvDYxowLevHlA2FlT3NHSjXTn
	 BcEsGLSWKBLsetiudaM+Qs/0iZczx0mcJgF20t/3SDBbZIyZRzZ+nzVmPNYjdT0pOq
	 sH/B+DMY4UasAQWIFAcIHWS9VGG9S2VKxg8PbA/YBrd0UNuEkeJQST49LSugHGDex5
	 H12z+ll/WxXyA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 2/2] hwmon: (pmbus/lx1308) Add support for LX1308
Reply-To: sashiko@lists.linux.dev
To: "Brian Chiang" <chiang.brian@inventec.com>
Cc: linux-hwmon@vger.kernel.org
In-Reply-To: <20260422-add-support-lx1308-v1-2-9b8322f45aae@inventec.com>
References: <20260422-add-support-lx1308-v1-2-9b8322f45aae@inventec.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 22 Apr 2026 19:25:12 +0000
Message-Id: <20260422192512.EEF0DC19425@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

Sashiko AI review found 2 potential issue(s):
- [High] Left shifting a negative mantissa in `linear11_to_int()` invokes u=
ndefined behavior in C.
- [Low] Alphabetical sorting violation in Kconfig and Makefile.
--

commit 1f51fd323179e1fa2a4bde6554dcffd04d32b646
Author: Brian Chiang <chiang.brian@inventec.com>

hwmon: (pmbus/lx1308) Add support for LX1308
   =20
Add support for the Luxshare LX1308, a high-efficiency 12V 860W
DC/DC power module. The module operates from 40-60V input voltage.

> diff --git a/drivers/hwmon/pmbus/Kconfig b/drivers/hwmon/pmbus/Kconfig
> --- a/drivers/hwmon/pmbus/Kconfig
> +++ b/drivers/hwmon/pmbus/Kconfig
> @@ -221,6 +221,16 @@ config SENSORS_ISL68137
>  	  This driver can also be built as a module. If so, the module will
>  	  be called isl68137.
> =20
> +config SENSORS_LX1308
> +	tristate "Luxshare LX1308 DC/DC Power Module"

This isn't a bug, but should this be placed further down? SENSORS_LX1308 is
inserted between SENSORS_ISL68137 and SENSORS_LM25066, which breaks
alphabetical ordering.

[ ... ]

> diff --git a/drivers/hwmon/pmbus/Makefile b/drivers/hwmon/pmbus/Makefile
> --- a/drivers/hwmon/pmbus/Makefile
> +++ b/drivers/hwmon/pmbus/Makefile
> @@ -23,6 +23,7 @@ obj-$(CONFIG_SENSORS_IR36021)	+=3D ir36021.o
>  obj-$(CONFIG_SENSORS_IR38064)	+=3D ir38064.o
>  obj-$(CONFIG_SENSORS_IRPS5401)	+=3D irps5401.o
>  obj-$(CONFIG_SENSORS_ISL68137)	+=3D isl68137.o
> +obj-$(CONFIG_SENSORS_LX1308)	+=3D lx1308.o
>  obj-$(CONFIG_SENSORS_LM25066)	+=3D lm25066.o

This isn't a bug, but should this also be placed further down to maintain
alphabetical ordering?

[ ... ]

> diff --git a/drivers/hwmon/pmbus/lx1308.c b/drivers/hwmon/pmbus/lx1308.c
> --- /dev/null
> +++ b/drivers/hwmon/pmbus/lx1308.c
[ ... ]
> +/*
> + * Decode a Linear11-encoded word to an integer value.
> + * Linear11 format: bits[15:11] =3D signed 5-bit exponent,
> + * bits[10:0] =3D signed 11-bit mantissa. Result =3D mant * 2^exp.
> + */
> +static inline int linear11_to_int(u16 word)
> +{
> +	s16 exp =3D ((s16)word) >> 11;
> +	s16 mant =3D ((s16)((word & 0x7ff) << 5)) >> 5;
> +
> +	return (exp >=3D 0) ? (mant << exp) : (mant / (1 << (-exp)));

When a user writes a negative threshold value to a writable sysfs limit
attribute, the PMBus core encodes it into a Linear11 word with a negative
mantissa.

If exp >=3D 0, this evaluates (mant << exp).

In C, left-shifting a negative signed integer invokes undefined behavior and
can trigger a UBSAN shift-out-of-bounds splat.

Could this invoke undefined behavior when mant is negative?

> +}

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260422-add-suppor=
t-lx1308-v1-0-9b8322f45aae@inventec.com?part=3D2
