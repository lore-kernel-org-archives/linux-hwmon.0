Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A8212C11F3
	for <linux-hwmon@vger.kernel.org>; Sat, 29 Aug 2026 22:11:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788041510; cv=none; b=RIrpao3LB/Q3nlNRM8Rkz1KnGWkP7IeJ+KTYY7xMlxHrcNMGDdzdZYiWV2rxMWsx4oBdBwr+Z2AEAw4QlhphAdHlh/ewD/rHWI5SQjQW7pU1jzekP6D+OvLm5Q3jU5m42wZLUk8+7JB00r1k8IsBTzHb/3uDQ4VscRCTqQAe/Hc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788041510; c=relaxed/simple;
	bh=fNiuKii1D6jmwKY1Urxe5Cb3x+DrcqB6QTMZmScKjZY=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=iLHGQU5zl0LspEkfq7fE6ogovB6XWtVKHPpQ+Ojm3KDTioHnVuL+vuTBYmIhPPQMLRnfdeKTMnxYxIobpEZxqKNT2X/tY1/NhZfSlT3CdSqHuB3u31bjm5AAWLUkQ/k1c94pEjXYLnKrAuVhl9f/EcKnIb3lNuH+0lEi1P2Zt/4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=H2k7JmqT; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="H2k7JmqT"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 048A11F000E9;
	Sat, 29 Aug 2026 22:11:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788041509;
	bh=fNiuKii1D6jmwKY1Urxe5Cb3x+DrcqB6QTMZmScKjZY=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=H2k7JmqTGFHpe17qXaSdiXsdVOuBGKxTlivlRWkqzjqKNP0tLtpwcijxIrvGwcnrA
	 MboDe9+UlpvQEgw0m3jqCcQ8/2UcDyPyqCGNBjDt9CPxoSWGbm8LSCFEnA597KrwVq
	 Pa1G4B5hbQykGSkp3YoJfTsWguQ/9NSPb1JxNFaN60FJeMsfLMf79dmF0Q1XeZkxrQ
	 HNl/IndYZRc4u0Vb32U2hlZhqsWy70iqxbpbOHs8ftiKIMaf/abDTYOC/Rr3AySDXK
	 +BvGk22P/VSYO4Q91SqqkbWpQHSZNv5yMouwl3BSJITtvU9fGhcGXG7/kIFLRIfdyr
	 8EVhbyDw2gdUg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v7 3/3] hwmon: it87: add IT8613E support
Reply-To: sashiko-reviews@lists.linux.dev
To: "Jerome Tollet" <jerome.tollet@gmail.com>
Cc: linux-hwmon@vger.kernel.org
In-Reply-To: <5afd336442307450f77467b2a749d405970a2099.1788040385.git.jerome.tollet@gmail.com>
References: <cover.1788040385.git.jerome.tollet@gmail.com>
 <5afd336442307450f77467b2a749d405970a2099.1788040385.git.jerome.tollet@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 29 Aug 2026 22:11:48 +0000
Message-Id: <20260829221149.048A11F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

> From: "benoit.masson" <yahoo@perenite.com>
>=20
> Teach the Super I/O probe path to recognize IT8613E and add its
> hardware monitoring configuration.
>=20
> Add feature flags, 11 mV ADC scaling, the IT8665-style PWM register map,
> six PWM temperature mapping sources, and GPIO pin-mux checks.
>=20
> Only three temperature inputs are currently known, so retain the existing
> three temperature limit and offset resources. Document the chip in the
> hwmon guide.
>=20
> Signed-off-by: benoit.masson <yahoo@perenite.com>
> Signed-off-by: Jerome Tollet <jerome.tollet@gmail.com>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/cover.1788040385.gi=
t.jerome.tollet@gmail.com?part=3D3

