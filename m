Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792435632;
	b=C+Yx91RSpfhEZeKbFzEFHP9dQVVpsdpIEmwBfSyXtY6F8yTScQzxGHi5CdYV55OGAE/d
	 cjyth/LGHW+s/mEehMoNczE6aRhLpKuFYfmNqLsrJRv0wx6+ESqVv7HF7bOmeZeCMRwAA
	 WzZmk1glCobykjevMUIOzUbwkiW+8nT4LOrIzRszmn+lhhtdeJgZwhPOOrbeYsog/O26k
	 J7JyPRd1TbE6iP0k5UnylGUFG/v1BECwVLGEMA+JzGwsJk62d+lcxLP3oVHymJQ2myaSV
	 Wf612bZOKj0QXPdpkVIF0NWXtINb0U/AXny518hLZq4UR3WmhOelOYE7vJMiKpmJC8A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792435632;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=3I6LR1Yp/nHSjGsbfSyRHPgXkvqZZvzAaxk17gZ4H7Q=;
	b=TwkjwbkB0l89QY+s+Y3eeYDV/9DT4RXemLcGETT6dfxHpvzTCJF0+lu4FaOTXGOR0rW+
	 s7ojLTv0VT2T86o4AgfZQH4VEChEo1r6pRttJbNTl/pWunMbUYBDy5arZDFOy8jWRA4w0
	 lHqiCspB/H8rEQFwe07uawMhEhAthep2lga7iLiHD4K1vu0mqfZcVIiE5fKfUY2UeZ6s0
	 nnCAvt2Xgx9ds5wXGeCn8NIH6ZAuJhLPw0ne89rXo0t5DwaGHQ1UfXAjz4fmdfI4P4sdT
	 Ygr82SXoyeMYspV/TBz0oGF/E7y5GvF1ulN/4JkmCBPIOeDLELH1GgqpufuOB28+BLg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=aq5+88dM;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F12B9606A31D
	for <linux-hwmon@vger.kernel.org>; Mon, 19 Oct 2026 18:47:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=aq5+88dM
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7360E1F000C4;
	Mon, 19 Oct 2026 18:47:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792435631;
	bh=3I6LR1Yp/nHSjGsbfSyRHPgXkvqZZvzAaxk17gZ4H7Q=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=aq5+88dMxaKK+YH84Pgpg0f1i5DTIgXidW05Cr0pjHEJYKhe82IYvyx4NNA1wVj53
	 +VvRG/gEXHs/qeu0RErY77vb3VUEEYA+JEULpGoBQz56nnvxD8LfVlecvGYUfHTb35
	 hUpBKQATPmY29KN2ZIOZmjJEBS0xmE9E/qaj+Ie2Y1k+ErTltsr4EzaEgyQBbQowtZ
	 7Zy3Mooz8gDarLpRyZ5z5NSeaEPziZrOwvVBPb6pkdhs0C2fTKlLUZ3bPl0UZstnFx
	 LL2vcwjP3Mb+wtEW9U3wo3OCBloMa8FGp8ngwQP7DIeFeFeZmJN/uP4mlbfejvDy0m
	 SvfZ6xijFx5hQ==
Message-ID: <sashiko-outbox-178106@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 2/3] dt-bindings: trivial-devices: Add TDK FS160x and
 FS1006
Reply-To: sashiko-reviews@lists.linux.dev
To: "Kevin Jia" <kjia@nexthop.ai>
Cc: linux-hwmon@vger.kernel.org
In-Reply-To: <20261019-fs1603-v1-2-8adf972386c1@nexthop.ai>
References: <20261019-fs1603-v1-0-8adf972386c1@nexthop.ai>
 <20261019-fs1603-v1-2-8adf972386c1@nexthop.ai>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 19 Oct 2026 18:47:11 +0000
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Post: <mailto:linux-hwmon@vger.kernel.org>
List-Help: <mailto:linux-hwmon+help@vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-hwmon+owner@vger.kernel.org>
Precedence: list

> Add the TDK FS1603, FS1604, FS1606 and FS1006 uPOL converters. The
> FS1606-0600 and FS1606-2500 presets scale telemetry differently, so they
> get their own compatibles.
>=20
> Signed-off-by: Kevin Jia <kjia@nexthop.ai>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261019-fs1603-v1-=
0-8adf972386c1@nexthop.ai?part=3D2

