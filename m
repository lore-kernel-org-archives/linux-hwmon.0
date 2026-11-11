Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794380496;
	b=eFTqyag0sHK7DAF4JjAkKgtM6azFQLmEqpVdif9wCLJQ1jgQxuUTcUGDk3unK923HPI/
	 sU5+YquJYrva16+tVrSepzialWd6c9Vs6/tpMBVdYSdZTz250+4+CERhGt67TlHTtYx4R
	 gSMvLzD+6DZZ7O285uyfskL4TeT7wQ8+UrNePd/DwOQl8Jx1ShTXeCOjKMVMQBkucvoyO
	 w9Yicjzpj9hHjlqdOC3L2AEewZbfrJCNkfB8y5NZ6lmDyBlbmk3xYE5weaH5/boy1Ztxa
	 1P982EKSS1C2rGjxXHHu2WA0zv8aBJgabXK1Xr2sK4vnNLFXsuNLDe8ff+ELN9P05hA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794380496;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=IKVQ2C/XdQUMsNG+CCaGZFxqXPWQMfivYrP17bjDqmQ=;
	b=T3j5bu2K67De3kvR60KpO27s3Zj5X1PQYR8GTethyibRll/MGzUYMYiRm2xb7y0MZyR4
	 AEKYqdPxkIu4Rtu6wtAA0VeKJY53iOrKwz7+DhbgSDXuuWNiyWokIhdhp+wjJ3PN5hO7p
	 Qzrm6zT+QW5rb9irzwhbWTY6i5s5vtSzQ+FFO7h5+ihI6U7GRU+KeqO2Vg/iRB1a1a1p3
	 Hqg4kC8itYHolXqz51ypHb4LDh+xRIIDhgnXOKqxNe+fDTBJQxqZpwU1od0vU1BLRsXNx
	 /bHctz2I7oBpSTz241Z05xCO7UzFEYlg85jlABWRcQOrWbwqzrNFSHDpqNVKncCpIoA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=XPSuuAeB;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52FA8606A31C
	for <linux-hwmon@vger.kernel.org>; Wed, 11 Nov 2026 07:01:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=XPSuuAeB
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 020D31F00A05;
	Wed, 11 Nov 2026 07:01:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794380496;
	bh=IKVQ2C/XdQUMsNG+CCaGZFxqXPWQMfivYrP17bjDqmQ=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=XPSuuAeBROzfPEJQlRUSf4KrTfbGRWd1J1i1YkV610tZPB1ueWFrg8kvD3bDOIOJv
	 s6OiG88ph5pkHeXDCfj/d6pdVoZhJ45og5igG3pfd6yjU3FdQRgUICmZqQZMCvTRe7
	 mDw3q7M8mBM1FA1z7HSa6jdutJuMw8IWExWYDBTtmZWC8G5TFlAdgrof6mfJnRbPU2
	 s3mtzPjwB79NOv+Z06OXyZ5pmWyxhJCRXWNefl3zJ8Tq9uTewB9QN5DPAP/gy32Bo/
	 A7tU2pAe2KAMTxgOKB5OSh+PCsQJCO6ldpbvX9OzPA7d7vNCPT6gRBlLczHg7D6nOw
	 0Ks567M+O4Gzw==
Message-ID: <sashiko-outbox-208483@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] hwmon: (lm80) Clamp voltage limits before rounding
Reply-To: sashiko-reviews@lists.linux.dev
To: "Zhu Jun" <zhujun2@cmss.chinamobile.com>
Cc: linux-hwmon@vger.kernel.org
In-Reply-To: <20261111065302.17721-1-zhujun2@cmss.chinamobile.com>
References: <20261111065302.17721-1-zhujun2@cmss.chinamobile.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 11 Nov 2026 07:01:35 +0000
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Post: <mailto:linux-hwmon@vger.kernel.org>
List-Help: <mailto:linux-hwmon+help@vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-hwmon+owner@vger.kernel.org>
Precedence: list

> IN_TO_REG() adds 5 to the signed sysfs value before clamping the
> register result. A voltage limit close to LONG_MAX can overflow and be
> programmed as zero instead of the maximum.
>=20
> Clamp to the 0..2550 mV register range before rounding to 10 mV units.
>=20
> Fixes: 1da177e4c3f41 ("Linux-2.6.12-rc2")
> Signed-off-by: Zhu Jun <zhujun2@cmss.chinamobile.com>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261111065302.1772=
1-1-zhujun2@cmss.chinamobile.com?part=3D1

