Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795417294;
	b=14jRN7djnL1zJk0EQdVgHiZLH7R4fFvY2vkSwC0Y2NZnMtomNqc1DUEq0hSPb4WlAlNO
	 liH74ef9dP+gKQvt3Yu98Mb4sop8VIjUufhg01KTLnUjhKBvLJ1OMoqvIFIXAvD6rCJtv
	 E7koimiIKLNWv1fJ0O+GGhWwGkoJlS0y5Qpdu0nbcV7lKINlWrCKx+KG+FlsvYgCXxXrt
	 bxi01zIjozhvCRPlN7shK+0n1SA4ZyNc2WF1W//nhHXQydyDLEWB72+mTF63rrTIsXlsJ
	 MsY9rmpSgGosnWgEBJNsW7h7y7WKT70ZpIZRVSEVD04fFui5jEPJI3ZczXByGHDxQ0Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795417294;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=AwvX8i/oXxHRWLEI0asGYCcy6jyy79Q3YMV7kYDdnEg=;
	b=afTGwuVyHdg4Qvk1RcZCxMiJKDH9SWzt0tCrbedtdms0HSk8cJDR4g4WpxVcGtskAMzF
	 eQxxSa/PWNP9aiLfBVD4B8SAqySOSGBvLr8iZ0979kpj7UdfJXpZ2YQzpwx1kpEnzl5Kn
	 dOjrXNvlILyp9LrTXaZbREs05dpTtnd8nFXOG1G1aZ9/oFFGl7gl8qLLIWbBRR5j1zIUH
	 0XXdCJY3P97d6RaAbeIKO56yqOZ9fReRyIhuTXrI7Y0z0ByAR+Lyujhfvi60dFJKactbr
	 6iE4aV8qM+JzHMsAPMVcnGV7ULtWMVY4hbDfLw7ZKeQpo8TzRXHIcdYcOLuG6P7PK+A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=gEh24umi;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8AF4606A32A
	for <linux-hwmon@vger.kernel.org>; Mon, 23 Nov 2026 07:01:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=gEh24umi
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D486C1F000EE;
	Mon, 23 Nov 2026 07:01:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795417294;
	bh=AwvX8i/oXxHRWLEI0asGYCcy6jyy79Q3YMV7kYDdnEg=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=gEh24umidR83Lc+6V3i9diD8Mx08c8fzCryeUHziUHIbqxKya11dVZ9aDsJuZoX6t
	 qi1z4+E5ejtVF5t1aGlBNoUuZ9zL5gY7apI+f9hTejeJhOqyb7NkakJZODU/4s8TCd
	 tcA466loV0Tdv9LvJk7JguzvdWd4nvFkIKBLaBv8/Sw7c4eI/gqU/DC+gTndJUAbqR
	 9EYevXaZnugb2FOciMxXz5HnYln+dzau1vmTIOSZgroF3pasoIBO2C57pK73iK91B9
	 E6PdIFKbzhBPRPrNGQK7lxauPhTfJzUF7zGceNI2fUHJ7Rw2bwYTOcctqR+yPIWDzK
	 nCCZ2UvyJtKmg==
Message-ID: <sashiko-outbox-228790@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] hwmon: (pmbus/ltc2978) Fix peak comparison for IEEE-754
 chips
Reply-To: sashiko-reviews@lists.linux.dev
To: "Christopher de Guzman" <christopher.deguzman@analog.com>
Cc: linux-hwmon@vger.kernel.org
In-Reply-To: <20261123-ltc2978-ieee754-peak-fix-v1-1-96cbe686ab67@analog.com>
References: <20261123-ltc2978-ieee754-peak-fix-v1-1-96cbe686ab67@analog.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 23 Nov 2026 07:01:33 +0000
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Post: <mailto:linux-hwmon@vger.kernel.org>
List-Help: <mailto:linux-hwmon+help@vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-hwmon+owner@vger.kernel.org>
Precedence: list

> The LT7170, LT7171, LT7175 and LT7176P report their sensor values in
> IEEE-754 half-precision format, but ltc_get_max() and ltc_get_min()
> compare peak values with lin11_to_val(), which decodes LINEAR11. Bit 10
> is the lowest exponent bit in binary16, while LINEAR11 treats it as the
> mantissa sign bit. Positive values with an odd biased exponent, such as
> temperatures from 16 to 31 C or input voltages from 4 to 8 V, are
> therefore decoded as negative, and the reported peak stops following
> the real one.
>=20
> The peak start values have the same problem: 0x7c00 is the lowest
> LINEAR11 value, but it is +infinity in binary16.
>=20
> Add a FEAT_IEEE754 flag for these chips. Compare binary16 values as
> sign-magnitude integers, and start peak maximums at -infinity (0xfc00)
> and peak minimums at +infinity (0x7c00). The min attributes are not
> exposed for these chips, but the min path is fixed as well for
> consistency.
>=20
> Tested on an LT7171-1: after stepping VIN from 3.3 V to 5 V and back,
> in1_highest now reports 4992 mV instead of staying at 3294 mV.
>=20
> Fixes: c1d6afdbb8ed ("hwmon: (pmbus/ltc2978) add support for lt717x")
> Reported-by: sashiko-bot <sashiko-bot@kernel.org>
> Closes: https://lore.kernel.org/all/sashiko-outbox-206843@kernel.org/
> Signed-off-by: Christopher de Guzman <christopher.deguzman@analog.com>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261123-ltc2978-ie=
ee754-peak-fix-v1-1-96cbe686ab67@analog.com?part=3D1
