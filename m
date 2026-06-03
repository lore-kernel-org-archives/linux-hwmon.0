Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20A7137FF41
	for <linux-hwmon@vger.kernel.org>; Wed,  3 Jun 2026 09:11:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780477915; cv=none; b=WT0dY5tNyUOz/QIDBXncnEU5IS+0YwOPrM8cVyGcQMP7inEepIru9W/BUZatgpCMYQbGheZl99TydubriFn9ZZjGO2M4wEOcE+OXubiPCfluPgygA7QvrEzOIvUGmnZic4IKngd774Xs/IhjYhRZDNrtUTnwQsJfX73ZScOy5gA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780477915; c=relaxed/simple;
	bh=BCtto/ARFqBCM4wQYTN1ORz/k3Mj82MM6yOKf63M3JQ=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=fhsqsAdakJEkwP+7Wad7k7VZnSuTgBdDicZN6UWRAa/1AQC0dVDzSMW7bHAdHzIqA8DKOwz7yl9jsEyMHbgi8/xXRg4ThN7GNpfD4CH2kmq9Xey0hAzy1MXSmi4IyXwM1KtljPx+pMjYPFEagSKzBqE29XCHkPHiksBz33wK/2A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Xw5/kZqo; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Xw5/kZqo"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 92A321F00898;
	Wed,  3 Jun 2026 09:11:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780477913;
	bh=BCtto/ARFqBCM4wQYTN1ORz/k3Mj82MM6yOKf63M3JQ=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Xw5/kZqoMq1K+ebTK3zra5OSWxFKWD+1ZgAGYT+52vDVsqJUw/FWhNT6GShSNUllJ
	 1O9bWvAAuRQmNReCbkGdfX+7XksipOuhOn1NIgED/Ar6NDXbz0x4nbkIDiGJ8RxiO4
	 H3EoRI1MkBYeAG4b5+S3lmGjgHdzJqavjSWdP4+9TDO0SXwxZFpMuuH/DY1WuNsUXo
	 xtPgd3ZPM2TMCGkQr8dpq71lrD+8PtAh7EDefKVjLZxUJt/CQMv/1nmDpeuWPNX8iv
	 XRq4f1iWhazf2otJK5CrER+FiJi5xb0FZwCNoWm/ekrqiEPQ3xGwh83/84neJ+7DU/
	 bXyQKZ0kOnMUg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 1/1] hwmon: (pmbus) Add support for Flex BMR316, BMR321,
 BMR350 and BMR351
Reply-To: sashiko-reviews@lists.linux.dev
To: "Daniel Nilsson" <linux@erq.se>
Cc: linux-hwmon@vger.kernel.org
In-Reply-To: <20260603085712.659432-2-linux@erq.se>
References: <20260603085712.659432-2-linux@erq.se>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 03 Jun 2026 09:11:52 +0000
Message-Id: <20260603091153.92A321F00898@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

> Add support for BMR316, BMR321, BMR350 and BMR351 DC/DC converter
> modules from Flex to the pmbus driver.
>=20
> Signed-off-by: Daniel Nilsson <linux@erq.se>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260603085712.6594=
32-1-linux@erq.se?part=3D1

