Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0756296BCB
	for <linux-hwmon@vger.kernel.org>; Mon,  8 Jun 2026 13:12:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780924330; cv=none; b=dXC/PKR/WmTxTQ335vWm/xetmjZyYZyLMWRh9mJcU62mNrMlDG9VZkrBKXh7kqvJRMAn3qalqKU5OKPJerkI/p1Szqy3ln8ql+R6SiSqVtV5Imk20KPPJl04a6dHq8K3rLQ0+qmetbmcegnbNU1iGUKVkC2iYvNZ/ikN0oBBpKw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780924330; c=relaxed/simple;
	bh=Fu65gj84FH8cZhcZKEOWR6BExPxB9RqgyxrJRQgt7h8=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=D1fnpnoWdAiVngLhc4plogYNEhz6D44rf926QI336BayRZYSHH+5e3yWNogzh5ijpzt48DCissiD21nzT7n5UFAaJSCvBGrSNS7zf1bXtzYwdeMAVdvCBjZ948UpFSRhDMfXag0a4SnhGZFfy7Ayg7RgdEnl1GOq2eZqgkMnIaI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=QcnwhRH+; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="QcnwhRH+"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1EBD81F00893;
	Mon,  8 Jun 2026 13:12:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780924329;
	bh=TGqX0otNOoxNO2Y3TPWa3cu3TguSF9Tp4cc2t/Zi5+k=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=QcnwhRH+p/9CqmiqhRRirX7QeCxh4Ah0eZ0TVFCGpnAbN+Q/Lr2QierylngvzhjHf
	 EhlgGciWHCCJ51VAGZLjxKQFAdcizL58b4ZK8+QvsNcThu6wWI6HV8YTu+nscJTGSy
	 vHbrFFLS9yl0V+yu2kdttfltTFpK5/vdpFCj5WfFq2ZHAZPc4FVhkdX5hJFQaszCsd
	 YczSNb4+dsteJpWLg7GMqezPXAskfPyqrDj1H5ZIKoCtu6ZPCx1UHVEQmkVaVQaLdS
	 R3XTOn4ZhJ6nI2blMc438lPwTpndVG6ZMxcWo8281xPsvVh5jQ6VaT5RX1vnEGa6Mn
	 mrAG8Bx5aPX9Q==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 1/3] hwmon: ina238: add support for samples and
 update_interval
Reply-To: sashiko-reviews@lists.linux.dev
To: "Ferdinand Schwenk via B4 Relay" <devnull+ferdinand.schwenk.advastore.com@kernel.org>
Cc: linux-hwmon@vger.kernel.org
In-Reply-To: <20260608-hwmon-ina238-update-interval-us-v2-v2-1-2d939fbb2ea1@advastore.com>
References: <20260608-hwmon-ina238-update-interval-us-v2-v2-1-2d939fbb2ea1@advastore.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 08 Jun 2026 13:12:08 +0000
Message-Id: <20260608131209.1EBD81F00893@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] Integer truncation from u64 to u32 in `ina238_interval_us_to_con=
v_time` causes large user inputs to wrap around, resulting in incorrect har=
dware configuration on 64-bit platforms.
--

commit 4bfb82fb9bb164125fe0facd52cce87c1d8b248e
Author: Ferdinand Schwenk <ferdinand.schwenk@advastore.com>

hwmon: ina238: add support for samples and update_interval

This commit exposes the INA238 ADC averaging count and conversion timing
through samples and update_interval hwmon attributes. It caches ADC_CONFIG
to optimize read-modify-write operations. The conversion times are derived
using per-chip lookup tables.

> diff --git a/drivers/hwmon/ina238.c b/drivers/hwmon/ina238.c
> index ff67b03189f73..667f78d43a6a8 100644
> --- a/drivers/hwmon/ina238.c
> +++ b/drivers/hwmon/ina238.c

[ ... ]

> @@ -261,6 +296,97 @@ static int ina228_read_voltage(struct ina238_data *d=
ata, int channel, long *val)

[ ... ]

> +static inline u32 ina238_interval_ms_to_conv_time(long interval, u32 sam=
ples)
> +{
> +	u64 interval_us;
> +
> +	interval =3D clamp_val(interval, 0, LONG_MAX / 1000);
> +	interval_us =3D (u64)interval * 1000;
> +
> +	/*
> +	 * update_interval reports the ADC cycle time including averaging.
> +	 * The target per-field conversion time is interval_us / (samples * 3).
> +	 */
> +	return DIV_ROUND_CLOSEST_ULL(interval_us, samples * 3);
> +}

[Severity: Medium]
Does returning a u32 here cause integer truncation for large user inputs on
64-bit platforms? Since interval is clamped to LONG_MAX / 1000, interval_us
can be extremely large. The DIV_ROUND_CLOSEST_ULL macro evaluates to an
unsigned long long, but returning it as u32 will silently truncate results
exceeding 4294967295.

[ ... ]

> +static int ina238_write_chip(struct device *dev, u32 attr, long val)
> +{
> +	struct ina238_data *data =3D dev_get_drvdata(dev);
> +	u16 adc_config;
> +	int idx, ret;
> +
> +	switch (attr) {

[ ... ]

> +	case hwmon_chip_update_interval:
> +		val =3D ina238_interval_ms_to_conv_time(val, ina238_samples(data));
> +		idx =3D find_closest(val, data->config->conv_time,
> +				   ARRAY_SIZE(ina238_conv_time));

[Severity: Medium]
Could the truncation in the interval helper above cause this find_closest()
lookup to select the wrong hardware configuration? For example, if a user
input results in a target conversion time of 4294967333 us, it wraps to
37 us, which would incorrectly select the minimum conversion time (50 us)
instead of clamping to the maximum supported hardware interval (8230 us).

[ ... ]

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260608-hwmon-ina2=
38-update-interval-us-v2-v2-0-2d939fbb2ea1@advastore.com?part=3D1
