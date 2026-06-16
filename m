Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F5AA3101CE;
	Tue, 16 Jun 2026 06:53:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781592820; cv=none; b=oRR2LTsSRzndXKiNXwxNZ5oHNPQ44SCtGhoI5/QmsTr1MbcZCIKQJIS+hNfnKWfnO40xxYyLPsN5JRkB+mF3yo6dWHUNP0z6F6HZ4sGgMiof3B/ScUb+70gb+pIxq6RKYfy4Ilu9Gwz9moMx1oo6ZHCIJUgJ362adoi9aLBU2aE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781592820; c=relaxed/simple;
	bh=kv35WW7ZKJUy77kcHNbk/VR6AP7yfamINcJOhv3inuY=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=Rhm0AQC3V7w5R6QUs9Quy3VjYVMxiw3J7U4Zo+d6C3TqkeKX02D7NXJPwnIHhTe4epbWmPQAY80sz5ISgyfYRXD0csMbmWbNXJSENWz5DSSu7BGs4mXMmERWlkMHW52XpNyiOmh3rs86S8vw09e2AMsuqGRVGF0R7r57jNJt29s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kZ8wUTQy; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kZ8wUTQy"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 52FF01F00A3E;
	Tue, 16 Jun 2026 06:53:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781592818;
	bh=kv35WW7ZKJUy77kcHNbk/VR6AP7yfamINcJOhv3inuY=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=kZ8wUTQy+SXvn09cq2FLVhuSaKl0bzW6zPUcxHFD+qwvYsYiAYSCygEoZrDeg2VRT
	 fInn97rDSs6vpzLdXhNfR9CB8kvnR6XeXuppam4qARxwYCdN/Gk5oogPhHABLeEZJl
	 F46Uoy1YxBCTrjTiIYT1sKKa/WjYH2g+Q3NUftiQoEPP52lZCdEz5R9DQzApzF7vno
	 8Y9jOP6/pDxveANEEF/Egmcxgku2Qkt03Jp4/RMn2nwOzeC74pFhY35ucYVt66NO2k
	 nuwVQMsVkYgahj0HGNGi6yn2IaQIqNZ9KqH6IQJbhb3B7TcS3d9rWEYTtt3574JXmM
	 LO/RzTNbZNMYQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 4/7] dt-bindings: adm1275: ROHM BD12790 hot-swap
 controller
Reply-To: sashiko-reviews@lists.linux.dev
To: "Matti Vaittinen" <matti.vaittinen@linux.dev>
Cc: robh@kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org, linux-hwmon@vger.kernel.org
In-Reply-To: <ae80a037fa3b03ef5cfb446bf3e9c44efd4f04ec.1781591132.git.mazziesaccount@gmail.com>
References: <ae80a037fa3b03ef5cfb446bf3e9c44efd4f04ec.1781591132.git.mazziesaccount@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 16 Jun 2026 06:53:37 +0000
Message-Id: <20260616065338.52FF01F00A3E@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

> From: Matti Vaittinen <mazziesaccount@gmail.com>
>=20
> Support ROHM BD12790 hot-swap controller which is largely compatible
> with the Analog Devices adm1272.
>=20
> Signed-off-by: Matti Vaittinen <mazziesaccount@gmail.com>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/cover.1781591132.gi=
t.mazziesaccount@gmail.com?part=3D4

