Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795118730;
	b=qOuFi7DcjytWQ/ClgXiFGi4/+4pkZy2PS+kqMSob5qb6ijzJSehueB6olf3z8SFsPB62
	 ciNvypqLNvHj37HY4n/9wwTPfnHQpMphvCY6jEUymJ3heFai53kjt0GDN7qok4yiD3wXd
	 A7FPeEbMecKH9MIu+ItTjIOyo/XTO9OjodeeFhDPz7icpGhorAP+VIf+TtkzXwvDagpuY
	 m5zNctAzy18dFMBKECqH1XEOYC9rjxHdD6iGzWP/gjPajigmQYFGIe3HkZVlj3TRInCbH
	 tHaX2XrlL/5eUCnroQMtJw5bOKbJS9dBYAZxdNIurc0aKyDhcId7+41MrnE3lbypBDA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795118730;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=oZ5BAWrkjow8B/Aj9dXvPTRvQF/IQs5eXztwH70lT+Y=;
	b=3yCafOGdNf7Td+6nbcXRnvGFu0rnTHtEcEpYGuDceQ+03aVpAJfajm8YvWxvgX/Qw+kF
	 CH7PlK187W7otxGDXkq/B4SaQx+R6oAguiPhnafZ3OWTPwyy3OVVz9tokoBkQUkNR3O99
	 uxnNp7DEZyyN8/HUTTcf1T5oFgiEVQFzGi7rVhG0Ib9QKatdm+CVpSR1VfM955F7zWN3k
	 Itlr2luEMaMmthEGLPsC0gEd+3lO8MumcJoWQ/En2q31h12OSdqfWRD6bZuHTXL1GGCGb
	 yQ0H0KeZZa4QU4o9FfaHy+JE4zM1dpiXmLi1JsjWvUNRVUxYyS1rwVdHqiP/wKcA+HQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=g4LgQ2eO;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10281606A326
	for <linux-hwmon@vger.kernel.org>; Thu, 19 Nov 2026 20:05:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=g4LgQ2eO
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 83BA01F000C5;
	Thu, 19 Nov 2026 20:05:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795118729;
	bh=oZ5BAWrkjow8B/Aj9dXvPTRvQF/IQs5eXztwH70lT+Y=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=g4LgQ2eO+GM8xQk1HS1mOUaaXalUNIFVSdHW4kYT061dsvWnSUO9I6Orx/2tKsma5
	 JszjrBM7U6M4wddK+Xgd2cDuZZnv8mgHgxabt/aTBwO4PTqzY/c7kCFQ7LtPKL/PYS
	 BCO6B/EHu2H9p0uqkw6ioc+G/sN1Z60aVh1YiAvvLXwkOcs9bFluQi6XpQC+M1oXwi
	 oUWKEW7iyIJJ9dWWprgXYedJqVw253jOT6vZjdf11E3OD/nqfR40Em2cz67cV6uPrj
	 4GbxCr76adsJG5zZ9cUwR8TUW13ErQq0Tal+9Goc+GdwIm7GVzUbQf2sw27HONO2lt
	 ZpUVVRCou2t2A==
Message-ID: <sashiko-outbox-224006@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 2/2] firmware: raspberrypi: Register PMIC hwmon
 driver on Pi 5
Reply-To: sashiko-reviews@lists.linux.dev
To: "Sander Speetjens" <sander.speetjens@gmail.com>
Cc: linux-hwmon@vger.kernel.org
In-Reply-To: <20261119-hwmon-da9091-v4-2-0d6e345c3666@gmail.com>
References: <20261119-hwmon-da9091-v4-0-0d6e345c3666@gmail.com>
 <20261119-hwmon-da9091-v4-2-0d6e345c3666@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 19 Nov 2026 20:05:29 +0000
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Post: <mailto:linux-hwmon@vger.kernel.org>
List-Help: <mailto:linux-hwmon+help@vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-hwmon+owner@vger.kernel.org>
Precedence: list

> Register the raspberrypi-pmic-hwmon platform device
> on BCM2712-based Raspberry Pi 5 systems,
> including the BCM2712 D0 revision.
>=20
> Store the registered device in the firmware state
> and unregister it during driver removal
> to ensure proper resource cleanup.
>=20
> Signed-off-by: Sander Speetjens <sander.speetjens@gmail.com>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261119-hwmon-da90=
91-v4-0-0d6e345c3666@gmail.com?part=3D2

