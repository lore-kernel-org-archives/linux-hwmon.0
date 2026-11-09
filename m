Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794263878;
	b=aqtW5s8PrgKYUjkOCGMX8esFJygSwKm+ihkxApA/8BMxtMj666yZfhy/qTXxqhX5o/MR
	 7knMGKJ1IFaIO3P15gssIOSAX+PClEbTc0mtAyigXKTYqnzrpO3HvMPJtB5pBQlPl8P2U
	 9foUKz8/UdpB7uzSOceZ5lEzj474JEIL5fQiatD9Nytsm7phtE+wrhVOHyG1sTLcrt8Mm
	 qz9l/ryI6OEFGS10FKCeQok2eXVQO0z4WSqCVavLqxc2hSLDLh90o6+jrmmocf/zVjjMi
	 uD6Bo42V/A1pwrkl2hv2CgARH8nqCK1PoO3iAoLz26v8btFqGWcj+r8buae//BWm2sA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794263878;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=KH6NklVU2CeFN6j0vUuDgcYoAUK62RZRabMJ1FKsb1c=;
	b=krU1XRgFFha6AXZrIC1oqc+GX1x4X6FOhHT2ZskRLUY2Aw1WFRigFGO5H0HqWFskksqM
	 XF/Iyn/Bb4pBVezcP0IGmx5Hok8J6PpyrlY5ZzpLVV3TiEKkSsfNPDCELt/+DfA0B9Ipg
	 d0QmFfloQ28Ou5G/aUiIRaDAVM3O6Rg7up7s4CBF/gDtu/UIfyjt/b3R+SInbRCsiurdz
	 E+O63Uea9GHTxfrErsXH5Xd8atNNG0m0+A2M3AIqrQIPfDTxtZjomFYvgoywNhQ7s9cJN
	 ZXxDr0H1H1Y0bLm0p3UFlU2E6NGW726NIwTBn1Izfudf16n1vbUuvTiGfJ4E1oO8qWw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=CbNCM5Jc;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56914606A31C
	for <linux-hwmon@vger.kernel.org>; Mon,  9 Nov 2026 22:37:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=CbNCM5Jc
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 00F2E1F0089F;
	Mon,  9 Nov 2026 22:37:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794263878;
	bh=KH6NklVU2CeFN6j0vUuDgcYoAUK62RZRabMJ1FKsb1c=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=CbNCM5JceqDR9NlU6HhwAgRhXhWdtcsVRqJ43/sQekzW8aIC8qKilekf7MWcaQa+q
	 6OHorTgnl998xpcGmDJEaixRZG3VAFv/WJXdzXNnQiRg5TsjPprwSo+GXZEyLEViv3
	 x/UoFOnPzkT3q3ySZa66gTpa9QCUhfaCxt/q4xibKq4QpVeJCc0OYKUhcLwktpaaco
	 YZ+0PG7j7XOvYTJQ+pRh1WDgFNckEyLZHgTZUoQpWu3II8wO08+AvTtx/Yncr1PX8J
	 x4jjHpRW4wmj5MTLI+lFzXSBqkgCTvXjhIP5y7ks/zEfevpTwXccqks/kLEoX6OSsw
	 wOq9cN3qmgMXA==
Message-ID: <sashiko-outbox-205757@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 1/2] hwmon: (nct6683) Factor out the NCT6687D-R fan
 configuration transaction
Reply-To: sashiko-reviews@lists.linux.dev
To: "Tomasz Bojanowski" <tomasz@bojanowski.me>
Cc: linux-hwmon@vger.kernel.org
In-Reply-To: <20261109223442.509238-2-tomasz@bojanowski.me>
References: <20261109223442.509238-1-tomasz@bojanowski.me>
 <20261109223442.509238-2-tomasz@bojanowski.me>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 09 Nov 2026 22:37:57 +0000
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Post: <mailto:linux-hwmon@vger.kernel.org>
List-Help: <mailto:linux-hwmon+help@vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-hwmon+owner@vger.kernel.org>
Precedence: list

> Move the configuration phase and its retries out of
> nct6683_fan_ctrl_update() into a helper which calls back for the
> register writes, so that the next patch can use it for writing the fan
> curves.
>=20
> No functional change: the EC accesses and the returned errors are the
> same.
>=20
> Signed-off-by: Tomasz Bojanowski <tomasz@bojanowski.me>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261109223442.5092=
38-1-tomasz@bojanowski.me?part=3D1

