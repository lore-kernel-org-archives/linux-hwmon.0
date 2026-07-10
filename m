Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C55FB416D09
	for <linux-hwmon@vger.kernel.org>; Fri, 10 Jul 2026 11:30:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783683030; cv=none; b=ETh7aV5FkQlj9lnuiSYM6q6P26PpDmze8qckhoG95e18PR6HKivmXffZkXTeBPewd8nAYslQoUdXEz2ouUGqxdTbA9e9aZ3UnOjrZLHa1uud4hNv4Lc3+HnLecZ5SdZ2Vsxav8c7rQfYlWglp4+djDrUBexWxg9qI6haqSw6Qdo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783683030; c=relaxed/simple;
	bh=dbjCGfAo7Zbtvd4dYIboxKQ5PdmWMSgnyZe9917QrLQ=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=mospK1B3xveJmpV3JlzYc1wInlM9gOqF0ViIJIkC8A0mLkk9IppQDso7D1YTUV/+oQMr99ebQPLsDp7bCZHOmnsk3cVOU0LX0MzgdC0ESE57UTMSaorYxSu849cmhQy/jNY72C0q2jgdD9cpLGPmUtUIFtAbcGwLWf8jliBRJ10=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=TBSC5hUF; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="TBSC5hUF"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 398531F000E9;
	Fri, 10 Jul 2026 11:30:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783683012;
	bh=Uj73jPRd7eYNazSBtr2jltdCp/PYV/fazjMecupJIPI=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=TBSC5hUFQ9D61xjPp8afhoDvWMIBmQ1iuxbfBK4idUfqZ5kNH5ZZ52eq48G+MjGbf
	 AWBLIRtl5wHlSqVebAyrRa566NCSgWfAUIkl064iiUXvTQ1vI+4gTIsDBrUUZPT5SQ
	 TKN8QLgXXoFjqEy9dvfMJhNIlSvPRbiqWpCdX7IeggS5qVx/g0bFnNarfrUgyKpyUg
	 AXumKaGY3pSUwW5wvxKka+hYnE2+YV7hvVtlxlU12gtBKpauzLaSc/nG4UExuQSB2W
	 0PdNql2cqyvis04Wvy65ykTlkwzdhhA3BeFaJVpMU5S63OlnlDVzudpysaH5LaE0G9
	 kMEUky9BCSEfw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 2/8] hwmon: sbtsi_temp: Refactor temperature register
 access into helpers
Reply-To: sashiko-reviews@lists.linux.dev
To: "Akshay Gupta" <Akshay.Gupta@amd.com>
Cc: linux-hwmon@vger.kernel.org
In-Reply-To: <20260710111642.850022-3-Akshay.Gupta@amd.com>
References: <20260710111642.850022-1-Akshay.Gupta@amd.com>
 <20260710111642.850022-3-Akshay.Gupta@amd.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 10 Jul 2026 11:30:11 +0000
Message-Id: <20260710113012.398531F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:

Pre-existing issues:
- [High] Setting an extremely high temperature limit in extended range mode=
 causes a signed integer overflow, resulting in the limit being incorrectly=
 clamped to the minimum temperature.
--

--- Patch [2]: [PATCH v4 2/8] hwmon: sbtsi_temp: Refactor temperature regis=
ter access into helpers ---
commit 64811eaa450f0343a3d3098341243ec7d1df489c
Author: Prathima <Prathima.Lk@amd.com>

hwmon: sbtsi_temp: Refactor temperature register access into helpers

This commit extracts the paired integer and decimal register reads and writ=
es
from the hwmon callbacks into helper functions. It consolidates error
handling and respects the ReadOrder bit to ensure atomic latching.

> diff --git a/drivers/hwmon/sbtsi_temp.c b/drivers/hwmon/sbtsi_temp.c
> index 28258bf499223..078f4ab25bde5 100644
> --- a/drivers/hwmon/sbtsi_temp.c
> +++ b/drivers/hwmon/sbtsi_temp.c

[ ... ]

> @@ -127,11 +169,7 @@ static int sbtsi_write(struct device *dev, enum hwmo=
n_sensor_types type,
>  	val =3D clamp_val(val, SBTSI_TEMP_MIN, SBTSI_TEMP_MAX);
>  	sbtsi_mc_to_reg(val, &temp_int, &temp_dec);
> =20
> -	err =3D i2c_smbus_write_byte_data(data->client, reg_int, temp_int);
> -	if (err)
> -		return err;
> -
> -	return i2c_smbus_write_byte_data(data->client, reg_dec, temp_dec);
> +	return sbtsi_temp_write(data, reg_int, reg_dec, temp_int, temp_dec);
>  }

[Severity: High]
This isn't a bug introduced by this patch, but can val overflow right before
the clamping happens in sbtsi_write()?

Looking at drivers/hwmon/sbtsi_temp.c around line 168, just above this
diff context:

	if (data->ext_range_mode)
		val +=3D SBTSI_TEMP_EXT_RANGE_ADJ;
	val =3D clamp_val(val, SBTSI_TEMP_MIN, SBTSI_TEMP_MAX);

If a privileged user writes an extremely high value to the sysfs temperature
limit file (for example, a value near LONG_MAX), adding
SBTSI_TEMP_EXT_RANGE_ADJ to val could cause a signed integer overflow.

This would wrap to a negative value, causing clamp_val() to incorrectly
evaluate it as being below the lower bound and clamp it to SBTSI_TEMP_MIN
instead of SBTSI_TEMP_MAX.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260710111642.8500=
22-1-Akshay.Gupta@amd.com?part=3D2
