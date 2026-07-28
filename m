Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 533163CCFB0;
	Tue, 28 Jul 2026 07:18:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785223133; cv=none; b=T9W/VyvW0pMsqRqZc4EmZT6i1DYOsAgUnUrEG9ukNruqbYYtxEU5nfzrKVyaK8wYhJsgvib6RBNolsMuz6VzVmMiikaoOdrSDR2nkJtkhNnDW2sq3Pey5CUmTLvsUVDDhAm8e10Jxw+r0dpTXxDlILTm25vwjNTg3+lXr1TEVwE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785223133; c=relaxed/simple;
	bh=hX3FoODlklE4gbrjQhyVvWLr79cPx/v4Rq01LdYF73g=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=qWymmko/900SL6fIz7NOj7D6OhbYvZVKpWkGAyeNyHvhCoK+BR3tN0OAzd1jmGYtLtunxPqgDw9zv6JhaQnU2Q4l1F1ZuGrIHa7ihDDJ2sz+ZVitdDDQSoDtnDNikkSKOW82JtlHLzHMm1rjNvXQb6223qCgj6s/3xBrCRy1gQM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ltgW2sxL; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ltgW2sxL"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 805601F000E9;
	Tue, 28 Jul 2026 07:18:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785223131;
	bh=hX3FoODlklE4gbrjQhyVvWLr79cPx/v4Rq01LdYF73g=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=ltgW2sxLrLNjdRtAjedyhPa0Ll7yx4n8as8esqyC1/EPuMfwwy5yDksIXdNddgQhg
	 /KR/rsLdvG8sedhrmOdZ5HwsHKNKY6s/3rqQgS9UCAnLg/OlFAQYPikYluOwIyNgNz
	 4st0Le9/M6Ri7JVq7jx64asiJxIvjnLAwO1wambmqj4MMkd4BITr2hAnC9BQxvXVZN
	 8IihwVZpEMOqgUDfMOz194TX8qE8SAoj6JDD4BSjArKT6b9Uelcv1aq1ubdptpg3t6
	 Zh3tOeOoOTht89s32dFCdewh7uofEDi2tP/kaU57DQkDwdbqAiTwy5sTRiC5gho8RH
	 ZBjbkDU9oJUQA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v7 10/12] hwmon: spd5118: Remove 16-bit addressing
Reply-To: sashiko-reviews@lists.linux.dev
To: "Akhil R" <akhilrajeev@nvidia.com>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org, linux-hwmon@vger.kernel.org, linux-i3c@lists.infradead.org, "Alexandre
 Belloni" <alexandre.belloni@bootlin.com>, Frank.Li@kernel.org
In-Reply-To: <20260728065955.809445-11-akhilrajeev@nvidia.com>
References: <20260728065955.809445-1-akhilrajeev@nvidia.com>
 <20260728065955.809445-11-akhilrajeev@nvidia.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 28 Jul 2026 07:18:51 +0000
Message-Id: <20260728071851.805601F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

> The intent of introducing 16-bit addressing was to support I3C, but it
> turns out that I3C does not require reading the Legacy Mode register,
> nor any specific encoding for page translation. The testing of 16-bit
> code was limited and there are no known users for this feature. Remove
> the sections that support 16-bit addressing and prepare the driver to
> support I3C appropriately.
>=20
> Suggested-by: Guenter Roeck <linux@roeck-us.net>
> Acked-by: Guenter Roeck <linux@roeck-us.net>
> Signed-off-by: Akhil R <akhilrajeev@nvidia.com>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260728065955.8094=
45-1-akhilrajeev@nvidia.com?part=3D10

