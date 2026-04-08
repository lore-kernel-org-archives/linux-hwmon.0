Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF80935DA52
	for <linux-hwmon@vger.kernel.org>; Wed,  8 Apr 2026 17:08:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775668131; cv=none; b=JQeC6NOcMWXYwbeUgk7HtV1fu7mXsX3jkoxRtBIpzdK7tXH3TpE6meI8yIaZteQR2OqTLrCoKE7P7sAdMGWCTL2bnn1mWuq+rNAdViqWKk0GUZMauLiJIu0nqDeIhN7B8hvJ2vv7T10VDS3/Bq4PjTlG5L5tEpFL4EezWgyJ9wA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775668131; c=relaxed/simple;
	bh=CMgYZLVh7/Ip3RyWBaEDEByIRlTHg4sTUidkSg+x9RA=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=A2hUlERg+fe8w+W/h4dr7frW2OhzdyGHKBiBfuxDmGnyWS5oRRp7ii0OiewH7yhs/jliZi8FmIPePJAiJBCnRY6x9Fpuux569SIV/xBYMWxWfEYMz96ByL/vx8hgspk3/GBfJuZIz9qz2FjsSWFVJMCW+k5AfQA5c9be+3cqVLs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hq4qkV2y; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hq4qkV2y"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 86E78C19421;
	Wed,  8 Apr 2026 17:08:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775668131;
	bh=CMgYZLVh7/Ip3RyWBaEDEByIRlTHg4sTUidkSg+x9RA=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date:From;
	b=hq4qkV2yGwme1qyj/C8TrGtnTR5f0AycSPNgfKhAGgEoA69TMR/1RqS1EoKwaLpPo
	 4KiBDShZ2gRkAEhZMJhSOaxgIaigu4ZvdSaY4z2z8I9CTCGfDLWoIjyU4X3JHlagEt
	 EMkY0y8UwRV8abI0xhCC/siqFi8zT9mORtSIFDa491GCmO+TVGqHvmh9euFggbXd97
	 40I5iR688s5m2LTddSVkCYvmmT9ln97ANCuRLyZfTdDSYtxuX0uY40L/WsMKWSsawU
	 PSVRwK4LHOUEDVfmTTXP/SKc/APXZFvI2qz9KnTBYvKs1nXMk9ihwDfJ/k6RsbUJFk
	 3R16ZasEqufQA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 1/3] hwmon: (pt5161l) Fix bugs in
 pt5161l_read_block_data()
Reply-To: sashiko@lists.linux.dev
To: =?utf-8?b?UHJhZGhhbiwgU2FubWFu?= <sanman.pradhan@hpe.com>
Cc: linux-hwmon@vger.kernel.org
In-Reply-To: <20260408163029.353777-2-sanman.pradhan@hpe.com>
References: <20260408163029.353777-2-sanman.pradhan@hpe.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 08 Apr 2026 17:08:50 +0000
Message-Id: <20260408170851.86E78C19421@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

Sashiko AI review found 1 potential issue(s):
- [High] The driver incorrectly defines and uses a custom mutex instead of =
the required hwmon locking API.
--

commit 9e1f24f685e2634190aef8a25e65494baf85ed6c
Author: Sanman Pradhan <psanman@juniper.net>

    hwmon: (pt5161l) Fix bugs in pt5161l_read_block_data()
   =20
    This patch fixes a buffer overrun by resizing the local read buffer to
    I2C_SMBUS_BLOCK_MAX. It also ensures the function returns -EIO when
    all retries are exhausted with an unexpected length instead of returning
    a positive byte count.

> diff --git a/drivers/hwmon/pt5161l.c b/drivers/hwmon/pt5161l.c
> index 20e3cfa625f17..89d4da8aa4c09 100644
> --- a/drivers/hwmon/pt5161l.c
> +++ b/drivers/hwmon/pt5161l.c
> @@ -121,7 +121,7 @@ static int pt5161l_read_block_data(struct pt5161l_dat=
a *data, u32 address,
>  	int ret, tries;
>  	u8 remain_len =3D len;
>  	u8 curr_len;
> -	u8 wbuf[16], rbuf[24];
> +	u8 wbuf[16], rbuf[I2C_SMBUS_BLOCK_MAX];

[ ... ]

This isn't a bug introduced by this patch, but looking at the pt5161l driver
as a whole, it appears to define and use a custom mutex instead of the requ=
ired
hwmon locking API.

The subsystem guidelines mandate that drivers must use hwmon_lock() and
hwmon_unlock() to implement locking for attributes registered by means other
than devm_hwmon_device_register_with_info() (such as debugfs attributes).

Instead, this driver implements its own custom struct mutex lock inside
struct pt5161l_data and uses mutex_lock(&data->lock) to protect I2C operati=
ons
for debugfs attributes like fw_ver.

To comply with the architectural rules of the subsystem, should the driver =
save
the hwmon_dev pointer and utilize the standard hwmon_lock() and hwmon_unloc=
k()
functions?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260408163029.3537=
77-1-sanman.pradhan@hpe.com?part=3D1
