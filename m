Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794219732;
	b=2A1JOt0472abvJ65IFfZkvjW0/NvCIC/cP1yPy7A74YcuiHbwulZriA4YBnl22bDSjfT
	 EC/FtHE13yP7qYY4GIZ0oGEGtzvEPtZqdVEJDU1OLd9kGpS90ibZSlwvc34BW3v06+msS
	 /jlXcEe9cN8GYPSv0hSOd/qNsoLQlZbxBA4B6f2ad3PbHfxF22Lae7Rqu+1RVfDGMPLZv
	 hJh8YPXin/DD3M0VhmMdaoiceWM8kJkt8IpS1qiNN4lOxZtihh9Zk0a1sgWHiT7ktrdu9
	 hApndpGh1Z3U5obJM4cF4g5yn8cfo9zSB9gQQQpmKtQlpIEEQS026edamRtWUEMtEFA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794219732;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=74ByTQ9fKsmG+aSenK/xIxGfThMQbSFAgzgBhI+E8z4=;
	b=Echw5rn37AhGMN4yvQS5ZxBvvjvKu+gA8y+TSqFMngoV9+BJ9QUfZJozlzzhM7BA6LLq
	 vwUHWbb2gcx6UKg0UUDcTg1MRIrVYRS8wgpc3MKb1T7WMsZWYpvs4Gz4klxpL5eFPyRpj
	 tQvH+4ZtIF4GzEb4G3bXYy9IT5FtP3DXktFqd5VV6HN1eF4FLT5OziZnm1Td7MjgdWbft
	 As7mMjgGUi/uIuoyPd1Tr5yWJDH2aMSz5mFtAC9T2m84h24O9MFq3fZh0IoZ0vN8JcgHr
	 r8GxCwTHBJQo3R2+P97m5MxYdp0K+AYXuiM7nZko5/D+w9Ct7dnVcsggjveeaviGtfA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Fr+XdPRx;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F92D606A321
	for <linux-hwmon@vger.kernel.org>; Mon,  9 Nov 2026 10:22:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Fr+XdPRx
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E00B11F0089F;
	Mon,  9 Nov 2026 10:22:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794219732;
	bh=74ByTQ9fKsmG+aSenK/xIxGfThMQbSFAgzgBhI+E8z4=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Fr+XdPRxfo6bhgMMlADDDmGCCNErW1SlsZjrQcWuaoX94Dl9LGISKLyS+q6qWeRoU
	 MZ/v2viftLEaUrtF+YAjreLuBr4TiJk5fm3ZB49afvB1jkiXN/hzgg3FN8bWKcl0DR
	 RAQTf8Kx/+E8MJFGohth/qvq+gZm+py06fCz5aiZFo4FOu4jqdraT6Ft9q4mgczxnW
	 2OHEJcjn4+0yKFzMp4jU9+otRQLMKOxNVzPyZWZMJAe6Srbnv8HhoG6QDCTVcotady
	 GN09KW8xhfQ/UevyiBft2K8N0/oxovmI8AqJnwZXItJBN3Eg/7z599WhAeEvCH5V+p
	 92+sOTxmk71YQ==
Message-ID: <sashiko-outbox-204806@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] hwmon: (w83781d) Clamp voltage limits before rounding
Reply-To: sashiko-reviews@lists.linux.dev
To: "Zhu Jun" <zhujun2@cmss.chinamobile.com>
Cc: linux-hwmon@vger.kernel.org
In-Reply-To: <20261109101839.17181-1-zhujun2@cmss.chinamobile.com>
References: <20261109101839.17181-1-zhujun2@cmss.chinamobile.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 09 Nov 2026 10:22:11 +0000
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Post: <mailto:linux-hwmon@vger.kernel.org>
List-Help: <mailto:linux-hwmon+help@vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-hwmon+owner@vger.kernel.org>
Precedence: list

> IN_TO_REG() adds 8 to an unsigned long before clamping. Writing
> ULONG_MAX to a voltage limit therefore wraps and programs register zero
> instead of 255.
>=20
> Bound the input to the 0..4080 mV register range before adding the
> rounding adjustment.
>=20
> Fixes: 1da177e4c3f4 ("Linux-2.6.12-rc2")

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261109101839.1718=
1-1-zhujun2@cmss.chinamobile.com?part=3D1

