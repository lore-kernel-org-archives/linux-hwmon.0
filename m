Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 521AB4BEE49
	for <linux-hwmon@vger.kernel.org>; Thu, 24 Sep 2026 20:59:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790283577; cv=none; b=Z/fSSjwZmupBDHsgezinIpY30PKIM7ZaNhD5utwtWWg8p576NQPBgFhsYwJ76AckBV6oL5aGA6TR/HQZwd2XXZ13ybJ23bsl4kFMEdOLy3x9u1ftYJNZrmJE8jU02uDF+UjmCFYQ9PdzbfuAkhsAPtbcOPycSIllMBT/ELwFrn8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790283577; c=relaxed/simple;
	bh=tMTk/kqHaPb//jQa6BkEOje2UWH6tpYAF4lmH+yTngc=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=h8Oql6Ju4JxMR+LUV4+W616uJs16Fl1uITJegeXPrWy6Q+Hy51jb3Qq/DEX67yc0554sPR4pxzouzai3EOoLyPJzJszImL0bgJic0tWxGkKuoeCq5M+l0WyDCnzzS+sOYKSMQHNluO3vwgyJrN9PCl5PWa1N2axdExK1NxyJxMM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=AGborGze; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="AGborGze"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CD33D1F000FF;
	Thu, 24 Sep 2026 20:59:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790283576;
	bh=tMTk/kqHaPb//jQa6BkEOje2UWH6tpYAF4lmH+yTngc=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=AGborGzedtkFKdxUx98u3Tqe/D4NqkTK2IOxUW4t4YP1+iAZCdL9E32cIwoCXH2y0
	 YTPt7MoihyZQxCpTTIqCKSj8QJAdCt00rdrqfcPnBENDeTs6ZF9oS/bOWdP+0AlO4c
	 VN78vEiCdZeMirt96a6zWw0akN5pZDMMd0Ll89tH8EfyiPYNV6sAfNXlX/hloZrYBz
	 3d3p/155QTdA7avgnSL2Qt5E6za+OVxgy/mf347XS8oOMz+hvgXX0MxCPmRXaBH9Js
	 +WNItKRgEpB1GUHqu1CfxIqA58Ju9YXQE7ltMV31ht7Klb6p4qdOkFV2+2Mwkq4qon
	 VNRL4JsWc3LBw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] hwmon: (lm70) Fix rounding of negative temperatures
Reply-To: sashiko-reviews@lists.linux.dev
To: "Ridham Khurana" <khurana.ridham222@gmail.com>
Cc: linux-hwmon@vger.kernel.org
In-Reply-To: <20260924205326.1739229-1-khurana.ridham222@gmail.com>
References: <20260924205326.1739229-1-khurana.ridham222@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 24 Sep 2026 20:59:35 +0000
Message-Id: <20260924205935.CD33D1F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

> temp1_input_show() drops the low bits of the temperature register by
> dividing the raw value (raw / 32 on the LM70). These bits are not part
> of the temperature: the LM70, LM71, LM74 and TMP122/TMP124 always
> return some of them as 1, and the TMP125 fills them with copies of the
> temperature LSB. Division rounds toward zero, so a negative temperature
> with any of these bits set is reported one LSB too high.
>=20
> For example, the TMP122 returns 0xffff for -0.0625 degrees C, which the
> driver reports as 0. The LM70 returns 0xf39f for -25 degrees C, which
> the driver reports as -24750.
>=20
> Use an arithmetic right shift instead, which drops the low bits and
> rounds down. tmp421 had a similar problem with negative values, fixed
> by commit 724e8af85854 ("hwmon: (tmp421) fix rounding for negative
> values").
>=20
> Fixes: e1a8e913f97e ("[PATCH] lm70: New hardware monitoring driver")
> Fixes: a86e94dc946d ("hwmon: (lm70) Add support for LM71 and LM74")
> Fixes: cd929672a9ef ("hwmon: (lm70) Add ti,tmp125 support")
> Signed-off-by: Ridham Khurana <khurana.ridham222@gmail.com>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260924205326.1739=
229-1-khurana.ridham222@gmail.com?part=3D1

