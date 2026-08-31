Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8FE2437455
	for <linux-hwmon@vger.kernel.org>; Mon, 31 Aug 2026 16:21:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788193262; cv=none; b=Gd1mYeS3oQEDm4RqawcaaLyOWFIUBI9HBIDuqsLkuUUbbMHgkPTiQVgbr43BdXxSUCv0TBuMt7CU72ACpWt1Vw7krdSQwMyW7M2Ei5ujZU2KcFl0ePQJ4arMnf38RBg07rPfxPUxY1T+Y5QPisLrXBMy9eMKyLzGl+mjarCWpeU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788193262; c=relaxed/simple;
	bh=cQDgV1ZaZwq1UQtB0zTuSV8nq71yH1FvF+wY1g3kuwc=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=kBsMbraKAfd/SO5vBWZXWWng5ZAkcXJvg7Ed3mpfqasi+hRvTkDQ1X/R0cM0EcDjc454+tVbR/sCeSYfxW2lt73lH6aLC6rcUcgLC51qBNw1TGM0HH0ZMzwuS7WoDh6ps6/JIvnnszC+DKvLfucc8JwSYb+TRD/93thkvrndzpI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nPN2Dbhx; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nPN2Dbhx"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 610EF1F000E9;
	Mon, 31 Aug 2026 16:21:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788193260;
	bh=cQDgV1ZaZwq1UQtB0zTuSV8nq71yH1FvF+wY1g3kuwc=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=nPN2DbhxbUiZigbMRx42L9nD6KWAA4HyhgNCuYGEHonCQUioN+XRoVjGL4R9HzPqc
	 Xp72Q2rP/L569QBbp3YanCfCoW5sL1FO4XXJBXEBB++1vlwFvTpmW+X6tBhkWgnpnz
	 UuGuR92DIoloFiDRdQfOUozybIZv5VMpILFEgw3bcKYESy+wHyi9uDy7EWzIqa1oUM
	 ub5neJxI9qi4k6t460Y8G/vquu0ykOymHfshCncSJ6gGktZi2KesbS98ViEcuSbtsy
	 kpaHsP7tGcmg55J9EcYYY6qlU8vA0llv8F0w+MMApjDN4ZwZPjyXsHArpWfnqge7v5
	 cpxMAN8zCAn1w==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH AUTOSEL 6.18-5.10] hwmon: (adt7462) Add of_match_table
 to support devicetree
Reply-To: sashiko-reviews@lists.linux.dev
To: "Sasha Levin" <sashal@kernel.org>
Cc: linux-hwmon@vger.kernel.org
In-Reply-To: <20260831133314.4125787-451-sashal@kernel.org>
References: <20260831133314.4125787-1-sashal@kernel.org>
 <20260831133314.4125787-451-sashal@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 31 Aug 2026 16:21:00 +0000
Message-Id: <20260831162100.610EF1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

> From: Kory Maincent <kory.maincent@bootlin.com>
>=20
> [ Upstream commit cd1b42617aafe01810ab7d3b9948d2f5fa9fb8af ]
>=20
> Add of_match_table to add support of devicetree probing.
>=20
> Signed-off-by: Kory Maincent <kory.maincent@bootlin.com>
> [rgantois: Removed of_match_ptr().]
> Signed-off-by: Romain Gantois <romain.gantois@bootlin.com>
> Link: https://lore.kernel.org/r/20260608-adt7462-bindings-v2-1-272982c403=
25@bootlin.com
> Signed-off-by: Guenter Roeck <linux@roeck-us.net>
> Signed-off-by: Sasha Levin <sashal@kernel.org>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260831133314.4125=
787-451-sashal@kernel.org?part=3D1

