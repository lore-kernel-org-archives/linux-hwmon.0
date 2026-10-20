Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792535644;
	b=4vQWOy9kHJkYxRTpRbqhhh+S0aqcfuoJf8MdpAYZ0iS5ktVpTfsfbrfNo7Rz0qhYn7LA
	 btTgiKK0Yg7orkHsmoUac54wXqqNpmfX8tVeKZ0foGmR7acd53Xq7kaC+MRNyIw73bLpL
	 rTrvFeLUH/u1V4t1AlXKCLmSzDSkHbmpxXrXwCFmbu2iwWmaw8vRXbIMXvXdnmOJ2xMV1
	 5hpWfk3ZuJsUkq9lCp8xTtpOJ3dAGh+bhObLdF933xpB0znMYDfxEty1pABtMHiS88vR/
	 F0bk7MLqV+r2wTMpGrAYTCX2W1JoIZZJX9PkcoqcLL/kPy3Jr6JIQnjKDwhyMux4JmQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792535644;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=MaHIrj7agzGTP2ftCncQSXBLAdqFJTN3QTUhvRDhMeM=;
	b=z3WleFUOaB4OqGHOklM91OdMUxiIDd0oDke6bsdKv4btRjPbheCai73fO7FglH9M9ZJQ
	 bv/euJ7Rdd7SvQ2sdDhIE1W5q2F/8m7Mtflb+V76Eo+YOAriR3oT84zlFO1mg2eQo8j04
	 FpzDSvOy6WXjrfqwzPZzYZv5SAkwgLpMh2VubcexGU6IfaXRX/GtvPSFgkeqsp7YPlloy
	 rvWV1Y+8kJyBB/HdHUF6MH9Bi7EuJ/8WYFsLSDLq0DScln7bG4tOlkIb5ZqFV5ej3sFpj
	 oUWMNT0vPNDfC2bxR1GX/c+Rp8SPs1cxcsMGSOjx725NufE5F4NExD+kpT5+2GCXfrQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=AXIafIcI;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E84C606A31D
	for <linux-hwmon@vger.kernel.org>; Tue, 20 Oct 2026 22:34:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=AXIafIcI
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EBD071F000C9;
	Tue, 20 Oct 2026 22:34:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792535644;
	bh=MaHIrj7agzGTP2ftCncQSXBLAdqFJTN3QTUhvRDhMeM=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=AXIafIcI3Npa8Ue+85e2ToJF4rLPyB5lex7N+o/Ly+Cm9btV13epYufjUvogw95tU
	 Ll39IO5BFcsJhkcUAzUYaT5kYV9WWI60RRRmVAvnePB+Bw8c2ChA2ebQmi3JDLT77G
	 jYGvjOX+a/iQa4wHuZEafwxwNWozkszcPwoG7nq5dv9EQZk9qBU/cYogG0jORfHQJY
	 yPDahFs+gmWGyjBr9O6jbvNqe8SlJaTA/Otwy435yXllOGqaw0crfygDnNjVXYHRiX
	 EuKdlu8ftS7CVU7pF/7JLmoxt0a2Vif5EhmYzZ6TsaaurmO5BNj7zp1BdUIERW2d+A
	 z0xN0s8BFugDg==
Message-ID: <sashiko-outbox-179535@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 2/4] dt-bindings: trivial-devices: Add TDK FS1412 and
 FS1525
Reply-To: sashiko-reviews@lists.linux.dev
To: "Abdurrahman Hussain" <abdurrahman@nexthop.ai>
Cc: linux-hwmon@vger.kernel.org
In-Reply-To: <20261020-hwmon-pmbus-fs1412-v3-2-51df629e13d7@nexthop.ai>
References: <20261020-hwmon-pmbus-fs1412-v3-0-51df629e13d7@nexthop.ai>
 <20261020-hwmon-pmbus-fs1412-v3-2-51df629e13d7@nexthop.ai>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 20 Oct 2026 22:34:03 +0000
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Post: <mailto:linux-hwmon@vger.kernel.org>
List-Help: <mailto:linux-hwmon+help@vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-hwmon+owner@vger.kernel.org>
Precedence: list

> The TDK FS1412 and FS1525 are 12A and 25A uPOL regulators with a PMBus
> interface. They need only a reg property, so document them as trivial
> devices.
>=20
> Signed-off-by: Abdurrahman Hussain <abdurrahman@nexthop.ai>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261020-hwmon-pmbu=
s-fs1412-v3-0-51df629e13d7@nexthop.ai?part=3D2

