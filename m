Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4047242B324
	for <linux-hwmon@vger.kernel.org>; Sun, 27 Sep 2026 19:21:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790536897; cv=none; b=mPLhfRO7OZsQb/lV2bS65DmCfpuZ3CwiVechbIFiFxLQjMVPabC0tgEghJqIbDuEzTx8gha/CSYydN9glH+JcXCmSp0Ay534PdLdEqisvIjg7tu8qxNuI5C+46+8Jz6Rt7dfivP54hlynpX8570LkGH6rRFNM0DCwIAFxcrYfD8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790536897; c=relaxed/simple;
	bh=qzwcXTBdUMJuv0UA4Ai7IvjwveiELFrbZSJuqHfEtQs=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=m6J4Y+Bn5GW7ocTgijR2Way0R1gC0ZeqW2/U4TLU2ptqlmQa9gQi47QAMKyL25E5P3sAugWrdRO4Ol1EBOnkkFI672MIcG6vvNBNK1BI19N6stYwSuUHFY+NsDSXnujzd63ZBnvK3GgS3YqCXFU/AJ586ujxU4dt0pHv0btu9YA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=XYcu47RH; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="XYcu47RH"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B54081F000FF;
	Sun, 27 Sep 2026 19:21:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790536895;
	bh=qzwcXTBdUMJuv0UA4Ai7IvjwveiELFrbZSJuqHfEtQs=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=XYcu47RHeOziXt7Zsxlf4VxzMa584eNRIa/VYEwgkFigdInH15PDML8kIPmbAjlVx
	 0fgHQSY3YEu+eWrzcqgEvpXcwGcPS0trHiB7eopohHRltm9msvcKBrkekOsAmrSrA7
	 9BSpWdDUeNGORf5PwRPyJ/KqVP0SytJtkn3eAY+wBWJCjQqvpUFQtokgWMunAZo+Qt
	 fUA97isclz6QzIXnd0xcZF88f4cgAKWNxxqZ0MrXgTBZ1ZGufdVr4cY3oF3Zolukwp
	 W4ZrE67aaqNR56zlhyHBN8Xj8VJutFZpaVppZGRHOOXmXfyqa6ay1AHWHfTgJ1TCly
	 vqS8fvsAn+FIw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v5 1/5] hwmon: (aquacomputer_d5next) Avoid truncating
 scaled sensor readings
Reply-To: sashiko-reviews@lists.linux.dev
To: "Vas Zayarskiy" <contact@vasily.cc>
Cc: linux-hwmon@vger.kernel.org
In-Reply-To: <20260927191316.4137752-2-contact@vasily.cc>
References: <20260927191316.4137752-1-contact@vasily.cc>
 <20260927191316.4137752-2-contact@vasily.cc>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 27 Sep 2026 19:21:35 +0000
Message-Id: <20260927192135.B54081F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

> High Flow Next power is reported in watts. Multiplying the 16-bit value
> by one million can overflow both the signed intermediate and the u32
> cache. Store power in long, perform the conversion in u64, and clamp to
> LONG_MAX. The other existing power conversions fit in a signed 32-bit
> value. Return -ENODATA for unavailable power instead of exposing the
> stored error as a reading.
>=20
> The power cache is updated by HID reports without the hwmon read mutex.
> Read it once with READ_ONCE() and use that snapshot for both the
> availability check and the returned value. Mark the corresponding
> updates with WRITE_ONCE() so that the shared accesses are explicit.
>=20
> Widen the shared current cache to u32. The Aquastream XT conversion to
> milliamperes can exceed 65535 mA; clamp its negative conversion results
> to zero before assigning to the unsigned cache. This also permits devices
> with scaled aggregate currents to store milliamperes directly.
>=20
> Assisted-by: LLM sparse
> Signed-off-by: Vas Zayarskiy <contact@vasily.cc>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260927191316.4137=
752-1-contact@vasily.cc?part=3D1

