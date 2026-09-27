Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F005A20D4FC
	for <linux-hwmon@vger.kernel.org>; Sun, 27 Sep 2026 08:57:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790499446; cv=none; b=Z9BSEp+61ofyqFt3BkFwh0OxS80a8JK7UMseFC0SjlVSAwcJIFiYGwGP7/H+9Ri2oYq/cIMU0TAoqs+p/j8mzm1/8GEe0k9i2jlaU4TGu1/g8G9wb2iJr6IgZrQhW7cQmkSstJf7vKGWB36fmwIhZLdfKi85LonIHGME25m7RGA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790499446; c=relaxed/simple;
	bh=gLm0QaOa8eqD16OZEwsNErP/wVlNCzTU7MKTYJRGzvY=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=ZFNDEec5HIfEYl+bAcwZmnk5X3rNvoFDgcQYDN7F81IFZ6tDVLhZjQ3YT6bFBd6yDoTAWogauw6KCEGDbrwDvQrhCo6B720SxQ4Slz4YHkDfITIn4/N0LnMT2n2eXcoO23ecmAfIADSGMxmNd7UIKmCvcUluY6ECGNO3Edsocx8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jiRiuyED; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jiRiuyED"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3EED71F000FF;
	Sun, 27 Sep 2026 08:57:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790499444;
	bh=gLm0QaOa8eqD16OZEwsNErP/wVlNCzTU7MKTYJRGzvY=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=jiRiuyEDggQjCGnY0Qel8shJSKwKSE+3j82H1S6zAe5edrbuq9ofHPtMKYadaTnmf
	 /zdWWt34Xti54XVpcI8bIxFJc+3mzyVU4LHKw2bi5KZNL606LWjk7VR0j3cuCcjDN5
	 ybFb6wZh2PqNqtUW/KGP5bOrm62LyP/zJRe8Mln7dHR/uQbwCC+6Bo+b6B4fDDcJ9h
	 /6remq0YR/yoiTMp1SYfPz2MjwIjAqqc3nNCRXQvlAnNB5SE82KvWkBm+LzzWa0UzL
	 vF5rKtiLB23FTR71XosyT4utI7Mitiv/rp5dxAKC0sD95BSlWQmhj+IIgT4imlOD4P
	 MkyN/X/C2+QMg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2] hwmon: (gigabyte_waterforce) reject short input
 reports
Reply-To: sashiko-reviews@lists.linux.dev
To: "Jiale Yao" <yaojiale02@163.com>
Cc: linux-hwmon@vger.kernel.org
In-Reply-To: <20260927084959.893708-1-yaojiale02@163.com>
References: <20260927084959.893708-1-yaojiale02@163.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 27 Sep 2026 08:57:23 +0000
Message-Id: <20260927085724.3EED71F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

> The HID raw_event callback runs before HID core validates the received
> report length. waterforce_raw_event() reads command bytes and then access=
es
> fixed offsets for firmware or status data without any length checks. A
> truncated report can therefore cause out-of-bounds reads and update hwmon
> state with unrelated data.
>=20
> Require every report to contain the firmware response fields, which also
> covers both command bytes. After identifying a status response, require
> the byte at the highest status offset before accessing its payload.
>=20
> Fixes: 42ac68e3d4ba ("hwmon: Add driver for Gigabyte AORUS Waterforce AIO=
 coolers")
> Cc: stable@vger.kernel.org
> Signed-off-by: Jiale Yao <yaojiale02@163.com>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260927084959.8937=
08-1-yaojiale02@163.com?part=3D1

