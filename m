Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794305650;
	b=qyUvFS8p14SKe8HlI8rrMJp2i4xOtIHFQ0e/tsse69lUZZ3P3pvnve5f/0svb5wbjatM
	 JMaGNJJCQmXf58qlQR6ff6+n1vVf4VFBRR1veDHotESo6RPJ+cIEG46Ul+bzlvyPbxP7j
	 qAX1Onepqxly+Q3RQeXeyOk1lID8VR6cPXh0sjbT2Aoe43qnrm+QCkzCw+dJ9aE3R219T
	 cW+/QNkUHi/hCeWVfGlJhwI7TjgScaCVIw1AFcKyVTs6O1M+UUZXls+EKf+YFdJFv54a9
	 RUvU1rPRYynQwYA3eOiEX2aXo82B1viSB+8Jd2DqGnn7pILBNkyfDrIxQWMCcplmfsw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794305650;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=6l+atXBbJYfs3G2btNLb/KhHkHPaLHs2gjBX3lvPjOs=;
	b=Yunjo7vhZq31jFDvKr5EA5BM/TIgADLkHcZtr1gt5TNKcsz44wQHpirMgfQvG+x22itK
	 g6jShHxTczru6Ec7Hw4/rWEUjsIFQ9FPlqTrXRHZZA60pB6cUUerp4eHGHtSJ8CbF35AS
	 HFg15uqKE2R47RUw4w/h9YVa8IVHJK3bKI0q+rwwzwPmv1P06zHFCNY0c8bPTNPxePKLO
	 hZDu/x+me2wR1nXeYBD4h2YSwOKmRDy/jVR91houh+q5tUy9g72ZbaCQLYYG9shIB9ryn
	 obrZE7yOKmGzIkLj2DzKlz4SH5r60/hseo9tkJWMwlYuBzaUuqB0vD0WPS2pj0t6LWg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=E3EYfZbg;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 192C9606AA58;
	Tue, 10 Nov 2026 10:14:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=E3EYfZbg
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 478281F0089F;
	Tue, 10 Nov 2026 10:14:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794305649;
	bh=6l+atXBbJYfs3G2btNLb/KhHkHPaLHs2gjBX3lvPjOs=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=E3EYfZbgMfVJ2eTF+od5VnGDKwvGe9zK8FKCn0HuDe6pa7235m+ORP3YMrpC0MAok
	 Ftdw0AjB3CbGkXl0YPEd/DTTKheW8meoTWJYj0EkZ17Pm9X8wW06aN8LCJCHLoULib
	 36OHsI4u+50iowru7/P6Yrr2Cq4vATwOtGKiTmOdCVDVjnATZQMKTXmAo1TIF89O+/
	 gsW5wHOKLZE8+B0i5HN/o8bwl9ntS9CI+8sfBgtPw8ZwYxa77Y1nzfwCd52nDs6ZGk
	 7b4478fgkpSQUC0cVaRPG905F65EMoe/OGfPxMvKKGmVPZPdMXbxBqVJGQiPpEn9oB
	 sc9QmmHDFmndg==
Message-ID: <sashiko-outbox-206843@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 2/4] hwmon: (pmbus/ltc2978) Add support for LT7175
 and LT7176P
Reply-To: sashiko-reviews@lists.linux.dev
To: "Christopher de Guzman" <christopher.deguzman@analog.com>
Cc: linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261110-upstream-lt7175-lt7176p-v2-2-dd60d28383bf@analog.com>
References: <20261110-upstream-lt7175-lt7176p-v2-0-dd60d28383bf@analog.com>
 <20261110-upstream-lt7175-lt7176p-v2-2-dd60d28383bf@analog.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 10 Nov 2026 10:14:08 +0000
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Post: <mailto:linux-hwmon@vger.kernel.org>
List-Help: <mailto:linux-hwmon+help@vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-hwmon+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 1 potential
issue to consider:
- [Medium] hwmon: (pmbus/ltc2978) IEEE-754 peaks compared as LINEAR11 in
  ltc_get_max()
--

commit 201c09e7f06ead2d62e423cba00a536dde067159
Author: Christopher de Guzman <christopher.deguzman@analog.com>

hwmon: (pmbus/ltc2978) Add support for LT7175 and LT7176P

This commit adds support for the LT7175 and LT7176P PMBus buck regulators
and matches PMBUS_IC_DEVICE_ID strings against ltc2978_id[] for the LT7170
family.

> diff --git a/drivers/hwmon/pmbus/ltc2978.c b/drivers/hwmon/pmbus/ltc2978.c
> index aea7b6c93e74b..888db3213a01e 100644
> --- a/drivers/hwmon/pmbus/ltc2978.c
> +++ b/drivers/hwmon/pmbus/ltc2978.c
[ ... ]
> @@ -762,6 +763,8 @@ static int ltc2978_probe(struct i2c_client *client)
>  	switch (data->id) {
>  	case lt7170:
>  	case lt7171:
> +	case lt7175:
> +	case lt7176p:
>  		data->features |=3D FEAT_CLEAR_PEAKS | FEAT_NEEDS_POLLING;
>  		info->read_word_data =3D ltc3883_read_word_data;
>  		info->pages =3D LTC3883_NUM_PAGES;

[Severity: Medium]
Does routing lt7175 and lt7176p (along with lt7170 and lt7171) through
ltc3883_read_word_data() corrupt peak readings when the data format is
ieee754?

ltc3883_read_word_data() -> ltc3880_read_word_data() ->
ltc2978_read_word_data_common() reads PMBUS_VIRT_READ_IOUT_MAX,
PMBUS_VIRT_READ_VIN_MAX, and PMBUS_VIRT_READ_TEMP_MAX via ltc_get_max():

drivers/hwmon/pmbus/ltc2978.c:ltc_get_max() {
    ...
	ret =3D ltc_read_word_data(client, page, 0xff, reg);
	if (ret >=3D 0) {
		if (lin11_to_val(ret) > lin11_to_val(*pmax))
			*pmax =3D ret;
		ret =3D *pmax;
	}
    ...
}

lin11_to_val() treats bit 10 as the two's-complement mantissa sign bit.
In IEEE-754 binary16, bit 10 is the least-significant bit of the biased
exponent, so positive values with an odd biased exponent (such as
temperatures in [64, 128) C or voltages in [16, 32) V) decode as negative
and are discarded in favor of smaller readings with an even biased
exponent.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261110-upstream-l=
t7175-lt7176p-v2-0-dd60d28383bf@analog.com?part=3D2
