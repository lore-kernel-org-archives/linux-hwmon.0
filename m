Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9B5D33BBB1
	for <linux-hwmon@vger.kernel.org>; Thu,  7 May 2026 21:11:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778188269; cv=none; b=Tqq690rh+2ewJVQnxfyNBBLUggXpMxWrcew6wqdvTb7xzciM9dDZYl2up6rvJPJQclolqQyVycQU+QTzb6wWX97ulDsHsX+vjovb2LBDaHYIJOCJNZdCZdBPKXR7aS88yHHptrIt99dP4CvT07Lparp5dq4ImwR6fq9wLm2DLuA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778188269; c=relaxed/simple;
	bh=s3EBoimWRZr71X8J3FasJRDEeCVcKeBPp7lJ0Gbo9RM=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=b0XtGdtp8cEHcffClK2wFnvmNo1JbmYLTSYkFACQFsmD0pP3VTX0B805qhR3BN+v1F66njXE4ICQxmlXBizfxd+owzP69RJ61vdEOibqHpmE35YOuhGTDvMYYl/xXDerlWsQVSmbDmk/WWVl070LO6VU7mBki+XHLNGNPHmin4A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Ki8LlY6y; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Ki8LlY6y"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 62D73C2BCB2;
	Thu,  7 May 2026 21:11:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778188268;
	bh=s3EBoimWRZr71X8J3FasJRDEeCVcKeBPp7lJ0Gbo9RM=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date:From;
	b=Ki8LlY6yhnf1++enprZJZgj52E8WccGBng4gApM7QV9nUdLes8SzKORoorMANHj76
	 xj+v+oA5C4YUV0b8DRXBJ+gtZa/WJIrgCFDmnlFraoHwzMJA8rXma32bCO9xwxwlXO
	 jgSb1WIVcFDPN8ZxPMtF5xcS/jUrJAYkvWEbtFDftPXKK1DL8FH/LcnMAdz10J63PB
	 uML5U5oIfEWfwm6wcGDnWLSY7KhAF711hefJ/i8c+ZU5pToO77qNyJcE4CtZydX5NL
	 pOjFpnfBvXHS+AUZQ8Or13A0jjwCA3NMmgLV8mT2si8bsdouQAGZlmv4MCb+kuaddO
	 NZmj6qvvO1U1A==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 2/3] hwmon: lm93: Change unsigned to unsigned int for
 clarity
Reply-To: sashiko@lists.linux.dev
To: "Ninad Naik" <ninadnaik07@gmail.com>
Cc: linux-hwmon@vger.kernel.org
In-Reply-To: <20260507101143.559475-3-ninadnaik07@gmail.com>
References: <20260507101143.559475-3-ninadnaik07@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 07 May 2026 21:11:07 +0000
Message-Id: <20260507211108.62D73C2BCB2@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] Broken arithmetic and unsigned underflow in `LM93_IN_REL_TO_REG` c=
ompletely breaks relative voltage limit configuration.
--

commit d027c76dfc6bdf77f6a91f44199f1d10dda57fdd
Author: Ninad Naik <ninadnaik07@gmail.com>

hwmon: lm93: Change unsigned to unsigned int for clarity

This commit fixes checkpatch.pl warnings by changing unsigned to unsigned i=
nt
for clarity and to follow the latest kernel code style.

> diff --git a/drivers/hwmon/lm93.c b/drivers/hwmon/lm93.c
> index c15e2a02dd86a..1a3b5da924b2e 100644
> --- a/drivers/hwmon/lm93.c
> +++ b/drivers/hwmon/lm93.c

[ ... ]

> @@ -396,7 +396,7 @@ static unsigned LM93_IN_REL_FROM_REG(u8 reg, int uppe=
r, int vid)
>   * upper also determines which nibble of the register is returned
>   * (the other nibble will be 0x0)
>   */
> -static u8 LM93_IN_REL_TO_REG(unsigned val, int upper, int vid)
> +static u8 LM93_IN_REL_TO_REG(unsigned int val, int upper, int vid)
>  {
>  	long uv_offset =3D vid * 1000 - val * 10000;

This isn't a regression introduced by this patch, but does this calculation
cause an unsigned underflow?

Because val is an unsigned int, the operation vid * 1000 - val * 10000 is
evaluated as unsigned. For an upper limit, the limit (val * 10000) is
typically greater than the voltage (vid * 1000), causing the subtraction to
wrap around to a large positive value.

On 64-bit systems, assigning this to long uv_offset zero-extends it. The
function then executes clamp_val(uv_offset, 12500, 200000). Because the
underflowed value is massive, it is clamped to the maximum bound (200000).
On 32-bit systems, the huge unsigned value is reinterpreted as negative and
clamped to the minimum bound (12500). For lower limits, the inverted
subtraction yields a positive value, which is then clamped against a
negative range (-400000 to -25000), forcing it to -25000.

Also, does the formula subtract in the wrong order? To correctly invert the
logic of LM93_IN_REL_FROM_REG (which computes
val =3D (vid * 1000 + uv_offset + 5000) / 10000), should the offset be
calculated as uv_offset =3D val * 10000 - vid * 1000?

Lastly, since the unbounded user input val is multiplied by 10000 prior to
any bounds checking, can large inputs silently overflow the 32-bit unsigned
integer?

Could these arithmetic regressions cause writes to the in_min or in_max
sysfs attributes for channels 6 and 7 to misconfigure the hardware
monitoring bounds, potentially masking important voltage alarms?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260507101143.5594=
75-1-ninadnaik07@gmail.com?part=3D2
