Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4317143553C;
	Thu, 30 Jul 2026 13:29:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785418165; cv=none; b=Tq3iseAe1Ofx1eLCzaWBL/rAVjIxSXPsN9hoO/L367EtawgCgy8jokovC0K9VFDnNgWGGltOJRKM2OOfzys5xT8vpaIZMTuSdr1jjfGZ9qoutMfPAWzeffBfpwMIhQ9WE9hAzCz1iI2Su/lLI/0mQjVTgkAY/lbrXgZJ/J+X7dU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785418165; c=relaxed/simple;
	bh=MASmoo3pKF3zzv1JCPcmtqHIX55Uv9lO5FuGniOCAGU=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=ADv/Kmwr93OcSz9XSfQn068dOMbwuc9Eq1ytYH/xqMcrP50cABmhZ04UHd5Yi8HZ2cVLRoJghTXytakzmQgcwL5Z7PhX/OwYlGKnDXzTbZ66LqKipcHS1viJdrH6pdFDNjfOBCrD7IhVCysjqFBwluK0nmD9bv0bnuQVc8s2N48=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dC148Uy0; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dC148Uy0"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A6B781F000E9;
	Thu, 30 Jul 2026 13:29:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785418164;
	bh=Wpr0fLi6Jv5h/57QpMvy/3UfAa7FBg/jbKaTtXFF5tg=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=dC148Uy0xza2EwRmXIH7ZdcgI3aqmQ4MX+h2n672ZarWk8EBMERgkQw82tk+n8Zyo
	 yX9eYiVaQGK+sm+RZne0GI+DWG7GXybPpsmDHNDVjkx6gp66wTOBE5JT9NhYJrrM8v
	 A0FA3B+98D+tnMGGGVnBecOKybE8HxrN/m9gG0DXq9iO9YCF3IPN2OtWU0isHDclxt
	 x5yQUZceQ98mDiC2HwFZqbWBhCsH6lW9O5TLCEeSfLmtC7sHB1CL0OP1Z8a/Btb66B
	 di0hOnPwkuN5eA5kkfzziEzw0ssTAXq6bJo6yWkJ9jp3iBK//dQiTNx1pGiH+Km9fZ
	 MS4Cn9sRo0bTA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v6 2/2] iio: adc: add MAX40080 current-sense amplifier
 driver
Reply-To: sashiko-reviews@lists.linux.dev
To: "Stefan Popa" <stefan.popa@analog.com>
Cc: linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20260730131738.822405-3-stefan.popa@analog.com>
References: <20260730131738.822405-1-stefan.popa@analog.com>
 <20260730131738.822405-3-stefan.popa@analog.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 30 Jul 2026 13:29:23 +0000
Message-Id: <20260730132923.A6B781F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [High] Stale measurements: each raw sysfs read returns the previous conve=
rsion's data due to an un-flushed FIFO.
- [Medium] Missing READ_ONCE() for `st->range` in `max40080_read_raw()` can=
 lead to data races and torn scale values.
--

--- Patch [2]: [PATCH v6 2/2] iio: adc: add MAX40080 current-sense amplifie=
r driver ---
commit 557f2827eeb4edfa93bf2f63edf6a0664453dad6
Author: Stefan Popa <stefan.popa@analog.com>

iio: adc: add MAX40080 current-sense amplifier driver

The patch adds a direct-mode IIO driver for the MAX40080 current-sense
amplifier, exposing current and voltage channels with configurable
oversampling.

> diff --git a/drivers/iio/adc/max40080.c b/drivers/iio/adc/max40080.c
> new file mode 100644
> index 0000000000000..82572536b704d
> --- /dev/null
> +++ b/drivers/iio/adc/max40080.c

[ ... ]

> +static int max40080_read_iv(struct max40080_state *st, u32 *iv)
> +{
> +	u32 tmp =3D 0;
> +	int ret, io_ret;
> +
> +	guard(mutex)(&st->lock);
> +
> +	ret =3D max40080_trigger_measurement(st);
> +	if (ret < 0)
> +		return ret;
> +
> +	/*
> +	 * Wait for the conversion to complete by polling the FIFO valid bit
> +	 * (or bail out on an I2C error). Polling the device's own status makes
> +	 * this independent of the actual conversion time, which varies with the
> +	 * oversampling ratio and the bus speed. The timeout is only a safety
> +	 * ceiling: the worst case is the maximum 128x averaging on both the
> +	 * current and voltage channels at the slowest 15 ksps base rate plus t=
he
> +	 * inter-channel switching time, i.e. roughly 20 ms; 50 ms leaves ample
> +	 * margin.
> +	 */
> +	ret =3D read_poll_timeout(max40080_read_iv_once, io_ret,
> +				io_ret || (tmp & MAX40080_IV_VALID_MSK),
> +				500, 50000, false, st, &tmp);

[Severity: High]
Does this polling loop read a stale sample?

Writing the SINGLE mode configuration in max40080_init() triggers an initial
conversion, leaving a sample in the FIFO. Because the FIFO already contains
this unread sample, the read_poll_timeout() loop here might instantly succe=
ed
and pop the stale sample before the newly triggered measurement has a chance
to complete.

This would cause each sysfs read to return the previous conversion's data.

> +	/*
> +	 * Propagate the last-read value even on timeout so the caller can
> +	 * inspect it for debugging.
> +	 */
> +	*iv =3D tmp;
> +	if (ret)
> +		return ret;
> +
> +	return io_ret;
> +}

[ ... ]

> +static int max40080_read_raw(struct iio_dev *indio_dev,
> +			     struct iio_chan_spec const *chan,
> +			     int *val, int *val2, long mask)
> +{
> +	struct max40080_state *st =3D iio_priv(indio_dev);
> +	unsigned int range;
> +	int ret;
> +
> +	switch (mask) {

[ ... ]

> +	case IIO_CHAN_INFO_SCALE:
> +		if (chan->type =3D=3D IIO_CURRENT) {
> +			/*
> +			 * The selectable current-sense range is exposed through
> +			 * scale: each RANGE setting has its own precomputed
> +			 * mA-per-code value. Userspace picks the range by writing
> +			 * the matching scale.
> +			 *
> +			 * Take a local copy of range to ensure val and val2 come
> +			 * from the same setting even if a concurrent write changes
> +			 * st->range between the two accesses.
> +			 */
> +			range =3D st->range;
> +			*val =3D st->current_scale[range][0];
> +			*val2 =3D st->current_scale[range][1];

[Severity: Medium]
Could this result in a torn read if st->range is modified concurrently?

Without a READ_ONCE() for st->range, the compiler might optimize away the l=
ocal
variable and reload st->range directly from memory between reading
st->current_scale[range][0] and st->current_scale[range][1].

If max40080_write_raw() modifies st->range concurrently, this could return =
an
invalid combination of integer and fractional components.

> +			return IIO_VAL_INT_PLUS_NANO;
> +		}

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260730131738.8224=
05-1-stefan.popa@analog.com?part=3D2
