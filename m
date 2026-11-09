Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794212935;
	b=XeyJ91FrxzMc6u+qcfs+PhCkzK1XjXO8wLnQj1Kx2QewfhsM+QWMs2G3qqQPB6hD/aD6
	 7ElhbEK7VMfGjke3RkejxLqKQJktY6SbNt239zewA+eQBqLjcN/CBb5bMZFuLfKUStnui
	 67+NAd7gl/lp8B+9jkPE83xaluHrz7d5K8z/dDjsczrU+3z0BubVaA/W1QWO+w6iu2oF1
	 PJNt+QFyIqZjOnf+p+Z3vg8mtBwtK7I1OGxsYlhhw//iDigggRGhkq+f3/cADW8IABED7
	 QhckE9HRLyPxtAirWP1IcLxkTRQyQaRxDftMHDyk+0w28+xV+K6IHR0h9CyxohbUeQQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794212935;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=OxkAhuw5TBZOiZtyGz6eEPQ+XenQQkLlXc5VYK/5AaU=;
	b=0TI/2dm5kjGsYVkPf5pyTcaofTY50L3LINV+a8P2+K2Wr4qFle4vWK34G0tcpTPxHW+J
	 Jb5C0RzzFiUJt0QU4gh5OwrC5FHBz0vU8cR4d4udKIHPvUR5MEN4QX8d0v840e0e5CY3v
	 zAh1eYGPZxl0R2LC0ip0y3C+3QA1eF26nzyUsgy0SmLQUe0W0aUq4JDzLoJCFLM2WKbXm
	 fYlmfT+gj/0Uu+SwfTC2al1fDj65ZvxH4gdnuQzXVGc5H03KuS5g68BbvNijMywI7/w2P
	 WwR2MzPbhr5nhO4idXCjS1YDomZDWcxLDtCnQMsCCve9vNrp0cw0xn0n2b840amjA7A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=YFSLxX3n;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01FB5606A321
	for <linux-hwmon@vger.kernel.org>; Mon,  9 Nov 2026 08:28:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=YFSLxX3n
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6DD921F008A1;
	Mon,  9 Nov 2026 08:28:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794212934;
	bh=OxkAhuw5TBZOiZtyGz6eEPQ+XenQQkLlXc5VYK/5AaU=;
	h=From:Subject:Reply-To:To:In-Reply-To:References:Date;
	b=YFSLxX3ng0zmtqEcWcnoRuORXehVHHlAzFXmVCuITN4mhAfpvDcaCBX5V6UZQUEDj
	 ai3C/UmYxYk7WLJLof+0ax9pq82KpGo9VtQQUihzHgCCSRpA5ToX8+gm6rFHqLX4RT
	 9BRVYxmda8w/cZZ313wdqSJd3uLze0bBJe5x4+fyWAioqJ7ICLq5T7B/G0VXVg4MgK
	 dh3GdzBFjgJi1sa1DCzhtdRlASzTgCGcnkQfr7rY6J4WkgwjMb1s9a4qToZQipPp59
	 jQHqFrpbrbUfrsu1d/8n3/YxHnT9tQsBK4sSgMjoS9pKldYzMx4xjBCzLjB77oOzb/
	 qfgtweexgxYTQ==
Message-ID: <sashiko-outbox-204588@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 2/3] hwmon: (nct6775) Avoid reading nonexistent
 PWM-mode registers
Reply-To: sashiko-reviews@lists.linux.dev
To: "Anton Lundin" <glance@ac2.se>, linux-hwmon@vger.kernel.org
In-Reply-To: <20261109082511.851377-3-glance@ac2.se>
References: <20261109082511.851377-1-glance@ac2.se>
 <20261109082511.851377-3-glance@ac2.se>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 09 Nov 2026 08:28:54 +0000
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Post: <mailto:linux-hwmon@vger.kernel.org>
List-Help: <mailto:linux-hwmon+help@vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-hwmon+owner@vger.kernel.org>
Precedence: list

> A register value of 0 is used to say that this pwm doesn't have modes.
>=20
> There were already a guard for this in store_pwm_mode() but
> nct6775_update_pwm() didn't have one, and read register 0 and then
> didn't use the value.
>=20
> This introduces a guard so we won't read a configuration register we're
> not interested in.
>=20
> Signed-off-by: Anton Lundin <glance@ac2.se>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261109082511.8513=
77-1-glance@ac2.se?part=3D2

