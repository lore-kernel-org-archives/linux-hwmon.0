Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794213349;
	b=zPHwTy4q6C/gnCzTCqJCgmavP7UQe8IXWuyTvQqPU3+hxUq7kTMOM46DQvy6VOi9YFyw
	 Tr/lr/cWJwmluhfZhHc/5f/YJA/eT6pVMwND2OAfkDiZpVIiy+mYgOyOiEW+u53SQsGoc
	 L7xSrDV2GKyEnpOaFSFIe+Xr9BmCXVNjVV95luUvaWkacgrWX/7EJORD9p+GNpUj9XRiP
	 UOH1MGTG0hoxhZrqYDT5gjtBRENE+9/qd7cvU25vj3M3ih03tlu3g6y/x0NyVmk1q/Tb3
	 zKEdcK6m6liYC+ZlRLBxdPy6JafTn0gKhdROydmcIRS5jOqgFS4K4KhFJ5ZlQY/3MPw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794213349;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=rjfTukUCdNJ/wIqLP7UtwoS9/Od0vsIs5L3bPqcMZIQ=;
	b=cOhgMLJlsk2KVNYGonZvG5ZN27nUBD0xGKhE1+pjYbxgzNuKkdjDw+rH9Lg3x9dnROr/
	 4FPwVnTP22nWBhEX/kuFPtNPRf+UafuGYBf7tC2o54d+tC7bTUUGOKf87t4TUmmtUiHoX
	 mbw7oXHWS8f0abdWgw771cqCWYh+TZo2nMDIDqdWY+pB3hdFVOPx6ivP69nB2lzj21E19
	 QKxNeABuFH339HgXmmtmhB/A6ZBeyl1mSNafLq9aRxAKIemcgaffY2DSknGq9uohR9w/O
	 wCRq6Mu28L/dBFCd1noKJYervDMu0YKPI3RI4Kxji0zqnkZEx85SukovZiiJ6HXrSgA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=JxVJzlZ3;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58D4C606A31C
	for <linux-hwmon@vger.kernel.org>; Mon,  9 Nov 2026 08:35:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=JxVJzlZ3
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B9F401F0089F;
	Mon,  9 Nov 2026 08:35:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794213348;
	bh=rjfTukUCdNJ/wIqLP7UtwoS9/Od0vsIs5L3bPqcMZIQ=;
	h=From:Subject:Reply-To:To:In-Reply-To:References:Date;
	b=JxVJzlZ3dXiszlilYjESATsTuWOe7SERx34KZdZQ3B9RUETclNxzAVI43G/1npWFs
	 gMeQVsXEbGrDCzVc+J+Y7RqziMHU7s1z9hQ89mWHG7WzTXQmpbhsSoYKieNOn6svuT
	 0dnqeZXTbB/WKSVDUIHgvZqzA3q606tnU5voTdHPcstNylKFmIy3BfEiB2P+Uto62M
	 0Wux7F2BCb0QtaG/Pf9IGUvts3+I7qr2jtmFhV0WJzkC3Fy+kFCzN0j6VOvpa6cDnP
	 HdRSet7H6a3LGJlk/R6nVXzpK3aGNL73vUoxCKWVgo96rFgi95t6YzHleDvgvFaqKo
	 lu4z3Df/wM70g==
Message-ID: <sashiko-outbox-204592@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 3/3] hwmon: (nct6775) Add support for NCT5525
Reply-To: sashiko-reviews@lists.linux.dev
To: "Anton Lundin" <glance@ac2.se>, linux-hwmon@vger.kernel.org
In-Reply-To: <20261109082511.851377-4-glance@ac2.se>
References: <20261109082511.851377-1-glance@ac2.se>
 <20261109082511.851377-4-glance@ac2.se>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 09 Nov 2026 08:35:48 +0000
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Post: <mailto:linux-hwmon@vger.kernel.org>
List-Help: <mailto:linux-hwmon+help@vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-hwmon+owner@vger.kernel.org>
Precedence: list

> Extend nct6775 driver to support NCT5525.
>=20
> Signed-off-by: Anton Lundin <glance@ac2.se>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261109082511.8513=
77-1-glance@ac2.se?part=3D3

