Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F7FA342CB2;
	Wed, 12 Aug 2026 19:21:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786562469; cv=none; b=OO1cQ/OqvYYgN112x8scVofCAqAfAgV4KClVS5sNWRZvBIXaXWFs1U1x2VRrcvRvzYat+a8hP9+RJgkT7Mwo3PCp9LS6kZyWKatTjsfzNg3azR5fBZGhWb0GcgK0Ft1ONyRnWmfd2fowa+uLvssIzUk/JVPSGjtTklzQNQPCizo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786562469; c=relaxed/simple;
	bh=G9PuuoMJHCc5QkIe668HfdciHGtOq7cDHpL9EkaR4OM=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=tvLlX+jSGbGFp6cQRkuQrJpcmDHtLUwD9MTl1qhDn/yBofpkuTJ5sgwzPPfG6WVm7lz4Jrek/7hEr7Y+458iMaom6raBzdDsMMLdCDscWHtP6P+0Yls4D/SjyoM7ts9BiqjViwSzRNskurGGqRFmZoVZZ13nzYQ9nepTlX2sGQQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WIVQizG7; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="WIVQizG7"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 96E8E1F000E9;
	Wed, 12 Aug 2026 19:21:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786562467;
	bh=G9PuuoMJHCc5QkIe668HfdciHGtOq7cDHpL9EkaR4OM=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=WIVQizG7ICq3p3JPzRCU/Qgl3Uk47ytMW8XJRSDXBTrMpd8PRbVjhaFliOFEvTIvZ
	 ely7v/9QeGDDWSY4XKBJIrZOgfI7jcnD40eenatcLF2R1SoHD2LMuVNiwJWPDnykJk
	 beSVc27EqKWA+HlV8S8ba9iNvtX3as9owBj+9FOuPRzvELll0p1iZFsSXexXJtIL21
	 ysCK86S2VWNSNBgq8VRurEatGlnJX8V7PxPKRA0jLbYWsJZqV0Y92AImyiBcrseqU0
	 d6t9XTKAGt5ucXj1mNAsbjiLH5hNOPzOpXPB9j+0T3kgUH6/FfBLzBlgnrA4UqE7kN
	 B4qKZV/wAE0iA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 2/2] hwmon: (tmp102) Add TMP110 device ID
Reply-To: sashiko-reviews@lists.linux.dev
To: "Marek Vasut" <marex@nabladev.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, linux-hwmon@vger.kernel.org, conor+dt@kernel.org
In-Reply-To: <20260812191021.65304-2-marex@nabladev.com>
References: <20260812191021.65304-1-marex@nabladev.com>
 <20260812191021.65304-2-marex@nabladev.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 12 Aug 2026 19:21:07 +0000
Message-Id: <20260812192107.96E8E1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

> The TMP110 is register compatible with TMP102, add non-DT I2C device ID.
>=20
> Signed-off-by: Marek Vasut <marex@nabladev.com>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260812191021.6530=
4-1-marex@nabladev.com?part=3D2

