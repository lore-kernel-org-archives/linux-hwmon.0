Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3982378D9E
	for <linux-hwmon@vger.kernel.org>; Thu, 16 Apr 2026 10:56:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776336989; cv=none; b=EtDGcVjkNZD9H2SFLDyAVuDn+zKocLVG8Z7CPq9FnMKxK1wEO1VsAbqbiQTY6+rfTihM5kleMZsnhv7oGdAvekYxox9eWZ5BsjvlWSJMcrehNsXHUdSQZFdqUirYGHZteDLSn7qYtO5amFDued7sTlIYdQQLxkuM5OWB4Ai5TYM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776336989; c=relaxed/simple;
	bh=FW6j9CYLWTfNfSAecoUlKzIdpv85RDKiTX89WGpQG9A=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=aM1CeV3pCwGsiF/JbW3DheWOqVDbQwLAeJgN3GQy0eDH6GikQVOVZ6Rc9dzIPOkvts5yjSlcGbToPC80+NKCu9BSP/mCFSiKlpLq4lkqh3D5lKEkR3p6eusDOufqMDShpO7AWi3uUhBvPgEsqJW0RVj5pr8hBPt852K63oy8Kbw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=oVA34VbE; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="oVA34VbE"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7E8EAC2BCAF;
	Thu, 16 Apr 2026 10:56:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776336988;
	bh=FW6j9CYLWTfNfSAecoUlKzIdpv85RDKiTX89WGpQG9A=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date:From;
	b=oVA34VbEMunLZKq/3EeVHRggpGx6xSK2UPYeh5MOo+cksg2FlUVQ/kc8RbZ7MoYAt
	 9/9URjyl+C6XaHADptUZMLOzH5OCg1d0RRMp1+YhDu0o0lIzBfjh/P+24nG/DL0zDL
	 Cmh0QjASfmaOHEwr63d+yZ+LPHSMBzW0sONM/Sp/fylILo7n3zo1/Z8mYv7YrWD89h
	 7J4hEVgZVeN3ZTSJJntPT5JERjJ6IUXIk88dnCVBbNLzXtZBc5Y9MNJvoYlkJC+K2s
	 m9J+GcnhzVWQJAubwU7j3KZlwcih3a3WgiDAypeL+bKWwhue0t84O5hm267nTgiKHu
	 OLoNsjZ1b16cg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 2/2] hwmon: (pmbus/max20830) add driver for max20830
Reply-To: sashiko@lists.linux.dev
To: "Alexis Czezar Torreno" <alexisczezar.torreno@analog.com>
Cc: linux-hwmon@vger.kernel.org
In-Reply-To: <20260416-dev_max20830-v2-2-2c7d676dc0bd@analog.com>
References: <20260416-dev_max20830-v2-2-2c7d676dc0bd@analog.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 16 Apr 2026 10:56:27 +0000
Message-Id: <20260416105628.7E8EAC2BCAF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

Sashiko AI review found 2 potential issue(s):
- [High] Missing validation for short reads from `i2c_smbus_read_i2c_block_=
data()` can lead to uninitialized stack memory access and information leak.
- [Low] Off-by-one error when null-terminating the device ID string truncat=
es the last character of the payload.
--

commit 479738352902d3197058c3172cee31960249a6a5
Author: Alexis Czezar Torreno <alexisczezar.torreno@analog.com>

hwmon: (pmbus/max20830) add driver for max20830

This adds support for the MAX20830 step-down DC-DC switching regulator with
a PMBus interface, allowing monitoring of input/output voltages, output
current, and temperature.

> diff --git a/drivers/hwmon/pmbus/max20830.c b/drivers/hwmon/pmbus/max2083=
0.c
> new file mode 100644
> index 0000000000000..21ea8b59150cb
> --- /dev/null
> +++ b/drivers/hwmon/pmbus/max20830.c

[ ... ]

> +	ret =3D i2c_smbus_read_i2c_block_data(client, PMBUS_IC_DEVICE_ID,
> +					    I2C_SMBUS_BLOCK_MAX, buf);
> +	if (ret < 0)
> +		return dev_err_probe(&client->dev, ret,
> +				     "Failed to read IC_DEVICE_ID\n");

i2c_smbus_read_i2c_block_data() returns the number of bytes read on success.
If the I2C controller performs a short read, returning fewer bytes than
expected, buf will contain uninitialized stack memory for the remaining
bytes.

If buf[0] coincidentally contains 9, the len !=3D 9 check below will pass. =
Could
this lead to uninitialized stack memory being accessed and printed by
dev_err_probe() on a mismatch? Should we verify the number of bytes read
(e.g., ret >=3D 10) instead of just ret < 0?

> +
> +	/* First byte is the block length. */
> +	len =3D buf[0];
> +	if (len !=3D 9)
> +		return dev_err_probe(&client->dev, -ENODEV,
> +				     "Unexpected IC_DEVICE_ID response\n");
> +
> +	buf[len] =3D '\0';

Since the payload of length len occupies buf[1] through buf[len], doesn't
setting buf[len] to '\0' overwrite the final byte of the device ID payload?

While this 9th byte is ignored by the 8-byte strncmp() call below, it will
cause the dev_err_probe() error log to print a truncated string. Should the
null terminator be placed at buf[len + 1] instead?

> +	if (strncmp(buf + 1, "MAX20830", 8))
> +		return dev_err_probe(&client->dev, -ENODEV,
> +				     "Unsupported device: '%s'\n", buf + 1);

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260416-dev_max208=
30-v2-0-2c7d676dc0bd@analog.com?part=3D2
