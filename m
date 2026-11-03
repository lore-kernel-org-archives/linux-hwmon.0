Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793716946;
	b=GuG2DIF7YUyV6Oq9MWgiPmez1jtYT1b7ddpc4h4e3zsY7eD4W+voIE8j8P6lcRpSRpbm
	 0/ez8firoEZz3efv2xLdV47eFSW+bjfj+a1vtpBOHMZmc9Av1EAFPG4DaELz4sS0yx4xp
	 GWjZWLgQpewF0J7pf0sFCFjQjtlHHdGqoOHE3Ex7Dse4ubU/VjGjELApq2VmrIqpaoO59
	 NFRcBPTW6Vnr+mqce8S0X2l2aQ6NdKy1/hknfbkc4+dlRlUTvjMZ0O9eTWbdWOv7k6xqV
	 3VmOyw4nnz0vB2vTIDT4f6YkQmgRehSKZyfpJMqTOOmQViRjXm2tmQ8uTUzxNEB6lgg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793716946;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=+HGZpVoMnzEe4qFf2oX8biobstmSNvXbaMLg0v7W/3Y=;
	b=hyJ/sL1oTKPu7v5Qh7WwuFtZ5PyHyOvxBGpVy+R1whVUCtrTH9NTzmbh5Ib7s9J/LSwa
	 swVPLs5/CFGaX8RC421/6dncmGGe6NSkHFONd6dqvE9BU60o5WLb4pz/7oyiunPb/nxxh
	 qhqm727kmAqOtDYVhTFfIX/NCwJKG0JsF64V8QPkak3skTdWKX9OlyLcyR9xjyfJzKXJu
	 q0GVncH1fxGrve7Ml+mmdxj9v0Tpwy6xG36KKLc7ksb6qqekDaJDhdN5nMsihRX151P//
	 sJ8UGGeWXmsAdZ3Tt6nKg9EW9nLtJlC2/ya7UdBVZOyEtEj2KICzKAVwGSJD5gpUbWA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=hA8cZWJG;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 926FA606EE82;
	Tue,  3 Nov 2026 14:42:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=hA8cZWJG
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9963E1F00919;
	Tue,  3 Nov 2026 14:42:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793716946;
	bh=+HGZpVoMnzEe4qFf2oX8biobstmSNvXbaMLg0v7W/3Y=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=hA8cZWJGi9ubgrr5CPa0Nuhhj0/+xgQ7XUGJ7EAlpTBGJdhPU8WPyVTKvTAFVhytf
	 urXvANYv3JHoMNvjeYz83kc0JHnVwRGlNjT+XSBL/pajgo8dr6C1KvHSS2GAp/3kp2
	 J+/psJEngo3VWRq93T7a9K58cM6ggrSTe0juDImMw8BA6a6gbpHs+Xnwd6Q6sAA9DS
	 xzs7eDVV2Rc6WWCofNy+lws5WHdXbGD36Pja1fgYKegKgdO6Lo4cqTslN2R7DBoNCX
	 NsIaF3PA2i0dqOWfC9s5dgmNbfdBgEMTl3Lm2wM4q8P94T2FF9nsVAMgTP3FXiTW0W
	 1/B9fYPwtGuOQ==
Message-ID: <sashiko-outbox-195469@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v5 3/5] iio: core: add iio_fill_val_int_64() helper
Reply-To: sashiko-reviews@lists.linux.dev
To: "Ariana Lazar" <ariana.lazar@microchip.com>
Cc: devicetree@vger.kernel.org, linux-hwmon@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261103-pac1711-v5-3-71c20101a52e@microchip.com>
References: <20261103-pac1711-v5-0-71c20101a52e@microchip.com>
 <20261103-pac1711-v5-3-71c20101a52e@microchip.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 03 Nov 2026 14:42:25 +0000
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Post: <mailto:linux-hwmon@vger.kernel.org>
List-Help: <mailto:linux-hwmon+help@vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-hwmon+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] iio: core: iio_fill_val_int_64() duplicates iio_val_s64_decompose()
--

commit 9e24103c43e24f77958f3d94346bd3b90fbffa99
Author: Ariana Lazar <ariana.lazar@microchip.com>

iio: core: add iio_fill_val_int_64() helper

This commit adds the iio_fill_val_int_64() inline helper to
include/linux/iio/iio.h to split a 64-bit integer into lower and upper 32-b=
it
output parameters for IIO_VAL_INT_64.

> diff --git a/include/linux/iio/iio.h b/include/linux/iio/iio.h
> index 711c00f673713..d8fd300a125d6 100644
> --- a/include/linux/iio/iio.h
> +++ b/include/linux/iio/iio.h
> @@ -1099,6 +1099,21 @@ ssize_t iio_format_value(char *buf, unsigned int t=
ype, int size, int *vals);
>  int iio_str_to_fixpoint(const char *str, int fract_mult, int *integer,
>  	int *fract);
> =20
> +/**
> + * iio_fill_val_int_64() - Fill the value fields used to represent a 64-=
bit integer
> + * @value: The 64-bit value to be represented
> + * @val: the lower 32 bits of @value
> + * @val2: the upper 32 bits of @value
> + *
> + * Populate @val and @val2 with the lower and upper halves of @value, as
> + * expected by IIO_VAL_INT_64.
> + */
> +static inline void iio_fill_val_int_64(s64 value, int *val, int *val2)
> +{
> +	*val =3D lower_32_bits(value);
> +	*val2 =3D upper_32_bits(value);
> +}

[Severity: Low]
Does iio_fill_val_int_64() in include/linux/iio/iio.h duplicate the existing
iio_val_s64_decompose() helper in include/linux/iio/types.h?

include/linux/iio/types.h (which is already included by
include/linux/iio/iio.h) defines:

static inline void iio_val_s64_decompose(s64 dec64, s32 *val0, s32 *val1)
{
	*val0 =3D lower_32_bits(dec64);
	*val1 =3D upper_32_bits(dec64);
}

iio_val_s64_decompose() is already used for IIO_VAL_INT_64 in the IIO core
(drivers/iio/industrialio-core.c), KUnit format tests
(iio_test_iio_format_value_integer_64() in drivers/iio/test/iio-test-format=
.c),
and existing IIO drivers (such as drivers/iio/flow/slf3s.c,
drivers/iio/frequency/adf41513.c, and drivers/iio/adc/ti-ads112c14.c) to
populate the read_raw int *val and int *val2 output parameters.

Could callers such as pac1711 use iio_val_s64_decompose() directly instead =
of
introducing a second helper for the same operation?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261103-pac1711-v5=
-0-71c20101a52e@microchip.com?part=3D3
