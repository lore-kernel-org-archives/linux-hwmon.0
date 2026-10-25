Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792901853;
	b=dFVvOQi+tEl+MLrB326BECS8mGFn/NEZMYALRJfr6Jci8b4HICj8A1UjDfuirpA6SJ5H
	 +c76RiSPQ86fRs/QTae9A29yOGpfN6lpzsL1PFELFWn2cWlHWRz0/fo3kYe1hqO2G5MRW
	 9vGjwey2zia+Qx6UqHJ3VDiYy82aWebrhCjGT0bd1EJt8iOLUfz0gJBPlBZnq3Srz1C7G
	 /sD+3D1yMj97bflmqqrwpHd4z7vXEgQvnGyMWcMXyU5KzdtFEUBh8gJVah1maQhdzLD9c
	 yL5d6q0WJDxlAbQ6Wspzowy1hRP97M31Eq5hoqVhv3IZuQvYj/aeMC5znwI+0CO7P1A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792901853;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=97x2N8FicIavlfANhiQZRJvtUbFz8OJsMIfXYRo0dXU=;
	b=e+Wb1wMf3xwQyjB02Rc1qrsU3XW9uBZqCVKCnVX/W6o1cCgswxksIUaFEtbn09vArR7n
	 cn4Yx9fNpk2deP6hP/gA/Qn+7JJDRVicFt7zmbCMkSgmdB4aXNSipDIfKqju0ll0Qztve
	 uVY9thMPCfmxYjnbORugxH0KhvwxHbT0LnAKWuqroNxY+8sjwTrPfVssQzckjD+LkwARu
	 SRag60pVPk1t2gcS70nKZWb9IJb5hwBfPPK4WXnkbXIbuC/P1De+m7BZLAhDzDat0qvGE
	 Z1HtI+BRpUk6HDn08xi4Kip+KvsGUxAYYALA2UNQPHDdNHmxR2P9ML+PtqrtiaY32wA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Xaj60aQs;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 189E5606A31A
	for <linux-hwmon@vger.kernel.org>; Sun, 25 Oct 2026 04:17:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Xaj60aQs
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C0E7C1F01825;
	Sun, 25 Oct 2026 04:17:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792901852;
	bh=97x2N8FicIavlfANhiQZRJvtUbFz8OJsMIfXYRo0dXU=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Xaj60aQsw4Pay/pGMtrR6VevAef3rTyx8NtHUMVY+lKu/aO2Xa2K4fi/9OdfFOXCC
	 gevBSpSVzLQt8zxPyg1KmG5dXXAL/xF+mon8MRoUAtRC71LASrbxD9n5znGNdoQtgH
	 HLklt6FYgKpRSlfz5WyU7/p6TGx9f4yhNRxGAnCk9+Rx2+vzAmRQtL+fqHIbsJtjFI
	 dURtj7xGlzWy9wJa5YhiEfjLAsjizcz/y9jLBn6hzlsBC46fKOFb9omjBpMK2yq6bC
	 J2EqdvYJ1+PRSlP5wKeoYGSIQNIHaubRjrlbr+b9w4AuHJhcy5mQdxzsHNAjof6p5l
	 OHppuhP+jzk2Q==
Message-ID: <sashiko-outbox-184049@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 01/31] hwmon: (lineage-pem) use 4-argument
 i2c_smbus_read_block_data()
Reply-To: sashiko-reviews@lists.linux.dev
To: "Dmitry Torokhov" <dmitry.torokhov@gmail.com>
Cc: linux-hwmon@vger.kernel.org
In-Reply-To: <20261024-hwmon-i2c-smbus-read-block-data-v1-1-e81941ad0cd3@gmail.com>
References: <20261024-hwmon-i2c-smbus-read-block-data-v1-0-e81941ad0cd3@gmail.com>
 <20261024-hwmon-i2c-smbus-read-block-data-v1-1-e81941ad0cd3@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 25 Oct 2026 04:17:32 +0000
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Post: <mailto:linux-hwmon@vger.kernel.org>
List-Help: <mailto:linux-hwmon+help@vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-hwmon+owner@vger.kernel.org>
Precedence: list

> Pass the expected data length and destination buffer directly to
> i2c_smbus_read_block_data() instead of copying through an intermediate
> buffer.
>=20
> Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261024-hwmon-i2c-=
smbus-read-block-data-v1-0-e81941ad0cd3@gmail.com?part=3D1

