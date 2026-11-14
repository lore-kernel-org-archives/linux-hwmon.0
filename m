Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794678226;
	b=YDMJ2f8mGpcaObOWlcG04v88svs8y/lf7QeEcNunLUOwDeDmOUWHbvBtKkPCHpnE4JR0
	 U6zrrgkNV0Zs95E7rdMHDW3U9mfy9eryjgTfDxNvKoDeXMtKqsHhZz1b5hH6S0WZizYQp
	 xeKCtu7Tb1PaiN933qhH2Daa+73nfAIYU7uTYY2om8ru8SkleFx5gIQPirFX4JUHVAkW6
	 jYZPhiB/9mgTOW9mGfjnNleewTOo+yyBEbjigzONBHR3z6M/WoWeNQoaVrf9YSyJSg5tf
	 Bv4Al6AEFKHE9iEu2wY+8O8M2rzEtvWX7OjfIRyn9pBy3Xj2Bxh9mwfXApUZ8yCLN1A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794678226;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=GoS5YymNNTsgXPBtE08/MQVVGQJrzrv8JtCOq27lGjs=;
	b=WkGRhe+Lnxh0nTY0T7s2xuWBftKzFnwE4t4CRGGvlVCWO0z2wOiqysmkck7Rh/0z8GMs
	 sG3jXOalqrQCbO5YJ/Es/kgkt0DBNUk8mgnhRPXyPXayHpzS6/Qd8cCntjemqYtiwTokG
	 AWpBfPCnG8YlVO9djArXbdc6tlC/UhDxQZXXloLHQ3DF/sWBeJ/yYSt5n1+Sz390asNON
	 LAuwzjetN24ckqUrPw+8tet+D0boSpeuQ6PhLmM8RkoVVn4TrUEjwYcE0tMvG4NDU1dV3
	 STHxwW5frmz3LNQKvHvBMK1OW9LUaMDVabYXnzyU2iRHRtTUthHtmNr/EMRhe99LdKg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=HUGdsNKp;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A793C606A329
	for <linux-hwmon@vger.kernel.org>; Sat, 14 Nov 2026 17:43:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=HUGdsNKp
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 05FC21F000C4;
	Sat, 14 Nov 2026 17:43:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794678226;
	bh=GoS5YymNNTsgXPBtE08/MQVVGQJrzrv8JtCOq27lGjs=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=HUGdsNKp1/I4gs+/JaBMg4R0aKN053ju7nSZed6EQC1buROa0amaTQH4LcoyDdsBA
	 /QWhsMazHfVQp00WlAclXDBzdJw/BF4fga8D8PT5s/QqVEJLoTF+hzHyjdCV8vlhe3
	 ohzXag4gWJfRkxDYT8JQRIbnS36Xh6zelqkgLXemfxCIqCJUxy6ygZBaG/cqeHYKch
	 7VdMb3oAAlEFh86P5mL4weg3654h6Vf1mbCmx138q2qq7Yy8i8fktrueBDyP0ymjs8
	 fRK+VN+wRcDLyczNjmvSjmf8aRCW/R5rbcUE82ERF/2wbSlZ3PmWp3jErscFwuIJWP
	 +UeMjyjN6dk7g==
Message-ID: <sashiko-outbox-214850@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 1/7] alpha: marvel: report environmental events without
 VERBOSE_MCHECK
Reply-To: sashiko-reviews@lists.linux.dev
To: "Matt Turner" <mattst88@gmail.com>
Cc: linux-hwmon@vger.kernel.org
In-Reply-To: <20261114-marvel-env-v1-1-890328e4b7e5@gmail.com>
References: <20261114-marvel-env-v1-0-890328e4b7e5@gmail.com>
 <20261114-marvel-env-v1-1-890328e4b7e5@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 14 Nov 2026 17:43:45 +0000
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Post: <mailto:linux-hwmon@vger.kernel.org>
List-Help: <mailto:linux-hwmon+help@vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-hwmon+owner@vger.kernel.org>
Precedence: list

> The service processors report temperature, fan, voltage and power supply
> alarms as system event (0x680) logout frames. The frame is already
> classified as reportable, but without CONFIG_VERBOSE_MCHECK only the
> header line reaches the log, which does not say which sensor or what
> happened. Print the subpackets unconditionally.
>=20
> Assisted-by: Claude:claude-opus-5-5
> Signed-off-by: Matt Turner <mattst88@gmail.com>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261114-marvel-env=
-v1-0-890328e4b7e5@gmail.com?part=3D1

