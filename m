Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C71D83A7186;
	Fri, 22 May 2026 08:38:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779439130; cv=none; b=kuXdrwf7GpkfABrmuY0NhyOBtAZrnFB2ad/mY658VSUnBcehhyEiTYCbGhtJwFpllPomMhjWCim4UiB8mVN7Ju2ZNSOTxStD5oD5WGmgvDoXzzse4nGwROQFchM+k5mOfOEtW7qP0toGI2x0w7uk1JYTzTB5peWvj7N9NRK3l2I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779439130; c=relaxed/simple;
	bh=XnWNgmi7maEXf+j/TNInFu2XBItyEipPbhzMrP0+8iw=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=Y6IekBHs8rdLHwYD+addo+ZdMwMZ2EiFUQ+c885fONPwkFh2grP6xYiWMnxomKwPYGTjq6zl1vCzoU8mz7ZyCyB77eki4IFcaoB4IJAiNHqxtPOKUVYeUQf1CfWSuUBCryenf7txUoUUoVLP5M3aGzOl+ykQPckJtPWgVegaPOM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ELn1DzmY; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ELn1DzmY"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3C5FA1F000E9;
	Fri, 22 May 2026 08:38:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779439129;
	bh=UTmSa28L7E6pMGZtAanzgPR72sTpW/QKlOwgSH+OaOQ=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=ELn1DzmYKiLkYE50ToV1IDBDYnSTHwzn1aWIFcipbNrDroxwewZ+i2FredKiOkv7A
	 6VXVVLgS4pdaYNhYHxkgxR6kQWoFAtBqys/aFnEgWT30+SsOrnUlx0hMZzn4V0nVrc
	 khDdbJumze2+t4edGP144rw5YHEcocNDAiMnEYNVFfoGYNwUwCdmN8FfmztlakVM6B
	 PynMalQlUes553dXgbYSNTWmQqgSNt1mDD9cT8CndaxIKERicnunTzQ3Ws//hA/tXN
	 8hVBjC+U7mhlThD+p4xhyq+mnqAp0GFu6+xZm5Cqe8dcTVNTWzLm6yLE77hM1gtTqm
	 B8lpKmmmu7Xdw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 1/4] hwmon: (pmbus) Add and export direct conversion
 calculation helpers
Reply-To: sashiko-reviews@lists.linux.dev
To: "Stoyan Bogdanov" <sbogdanov@baylibre.com>
Cc: conor+dt@kernel.org, linux-hwmon@vger.kernel.org, robh@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260522082349.2749970-2-sbogdanov@baylibre.com>
References: <20260522082349.2749970-2-sbogdanov@baylibre.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 22 May 2026 08:38:48 +0000
Message-Id: <20260522083849.3C5FA1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:

Pre-existing issues:
- [High] Unchecked arithmetic operations in the exported helpers can silent=
ly overflow, violating the hardware monitoring subsystem guidelines.
--

commit 4b7c4efa13e04ccc1fad0afa9ecc064091eda152
Author: Stoyan Bogdanov <sbogdanov@baylibre.com>

hwmon: (pmbus) Add and export direct conversion calculation helpers

This commit splits the math-only parts of pmbus_reg2data_direct() and
pmbus_data2reg_direct() into separate helper functions. It exports these
helpers so they can be reused by upcoming drivers.

> diff --git a/drivers/hwmon/pmbus/pmbus_core.c b/drivers/hwmon/pmbus/pmbus=
_core.c
> index e8fdd799c71c0..2eaac337eeaba 100644
> --- a/drivers/hwmon/pmbus/pmbus_core.c
> +++ b/drivers/hwmon/pmbus/pmbus_core.c

[ ... ]

> @@ -1057,6 +1063,23 @@ static u16 pmbus_data2reg_linear(struct pmbus_data=
 *data,
>  	return (mantissa & 0x7ff) | ((exponent << 11) & 0xf800);
>  }
> =20
> +u16 pmbus_data2reg_direct_calc(s64 val, s64 b, s32 m, s32 R)
> +{
> +	val =3D val * m + b;

[Severity: High]
This is a pre-existing issue, but does this calculation need overflow checks
to conform with the hardware monitoring subsystem guidelines?

Since sysfs handlers can parse arbitrary 64-bit values from user space with=
out
prior bounds checking, writing a very large positive value could overflow s=
64
during multiplication.

If an overflow wraps the value to a negative number, it would bypass the
intended clamping logic later in this function and result in writing S16_MIN
instead of S16_MAX to the hardware limit register.

For power management controllers, this unintended minimum limit could
immediately trip hardware protection and shut down the system.

> +
> +	while (R > 0) {
> +		val *=3D 10;
> +		R--;
> +	}
> +	while (R < 0) {
> +		val =3D div_s64(val + 5LL, 10L);  /* round closest */
> +		R++;
> +	}
> +
> +	return (u16)clamp_val(val, S16_MIN, S16_MAX);
> +}

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260522082349.2749=
970-1-sbogdanov@baylibre.com?part=3D1
