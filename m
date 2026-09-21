Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B93903382FC
	for <linux-hwmon@vger.kernel.org>; Mon, 21 Sep 2026 21:15:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790025353; cv=none; b=YP+HZGMDZi1wIhSjLGPV6bTVhyfWWi3vgAPlUFzVARM2yNMxS1gXTlY6RVPB/rprOqL1AvGMi2ompOa4HhxqWxo4dfBVVG46pOJjgvua2wPdk8bRQJWfyXuhhk6GjvvCJZgB2UZiyLKtyUU1MDwWIuqq7/N1keUa0ke5MENz7qQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790025353; c=relaxed/simple;
	bh=bwBCP5Bm4ajeAKQP8qt3qpttHFoej3qgnWWyX+ML8DQ=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=C7R/txLwTLvx0l3yFlFxr/+4gekl2jvOr1ZbC3pA3MQTdmwFmli8mX8PlbsL+F1gr8/K5ONTbvXVFtM2QzVPrx5c+Z9u+wt31ghpnWKo3gnRGsQQfepnMxgCHl3gitWZYRgX7m/4+M9ucv1kj32wsBX8i/uurDwbBRbUpaabNtA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KBgY2Fpl; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KBgY2Fpl"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1DF1A1F0089B;
	Mon, 21 Sep 2026 21:15:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790025352;
	bh=bwBCP5Bm4ajeAKQP8qt3qpttHFoej3qgnWWyX+ML8DQ=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=KBgY2FplF+ymRdvSR8s65pQi6promIdOtpXltX+e6DUe5GXrAGGHK3FoTd4pC1w/3
	 SYTYzDg5R6IRCzEtotDEqF6QPMhw8WIUEpf9gkCNPFX/JCIeVhB2vip/+jwd7P042o
	 uKXjCUjVCEEfdjI4UNr7mUjsgXDEJUKkJ67G595URtCTXgrJP5MOd/htypCl4HKv5S
	 ac9l9R51w+bqGvS35RZU66L1BSFhwFzqC0zWZXtjYdew++TtiKYGMA7lDTNmSc1ale
	 NvYiFeSp22msS4cz6JUdXh3Ob5TlOo2cMF7VE+ASdHUVVEOXem5qDkGFFU7hhehGjn
	 LX1pNmfMqgvew==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] hwmon: (nct6683) Add MSI B850M to list of tested boards
Reply-To: sashiko-reviews@lists.linux.dev
To: "Tomasz Bojanowski" <tomasz@bojanowski.me>
Cc: linux-hwmon@vger.kernel.org
In-Reply-To: <20260921211304.74729-1-tomasz@bojanowski.me>
References: <20260921211304.74729-1-tomasz@bojanowski.me>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 21 Sep 2026 21:15:51 +0000
Message-Id: <20260921211552.1DF1A1F0089B@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

> Tested on MSI MAG B850M MORTAR WIFI with NCT6687D EC firmware version
> 0.0 build 03/10/25. The driver loads without force=3D1 and reports
> voltages, fan speeds and temperatures.
>=20
> Signed-off-by: Tomasz Bojanowski <tomasz@bojanowski.me>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260921211304.7472=
9-1-tomasz@bojanowski.me?part=3D1

