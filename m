Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794884730;
	b=IBTsr8afF6/+Znxs2R3K9rqvOi2OH95wQEXRr1YqK6v2FOwG7sbcnLvXIm/Y/EoSERV/
	 9hLS8yeaoUeLnVFpbqJB3N6RBlbjLUbJuNQlpJq6ofMdl9I2B6L9mWOC5Xd7SK3OTVy3k
	 DkuLYtUopUrL5kpea8XG5yClJCPGEmkMYlnipZQe0x5bO6+ieJDYqgQJyZ6oTkuOlvGLY
	 jcF8j+DeshrOQCtH2JDYDwpji2lkQuTCsrPdqkW0XQXkfM3IRfWgiv3NO2ENHwYiHaPT3
	 WYU+lh2t155kKJ4aw8YK5AnuXqg/zsi2nGenV62IS5Om1o2nLNQKK+vBL0kCK+LjPqg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794884730;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=RpWUS9MyPr/jE2nDmRv244naDxFt/7Z6rFP/SF7vISc=;
	b=hAebAJ9/VADgMnAei4foHTe++rNrighI/dXC9baRIyHK4bx3HKSKsPy1FM9+rhzFEhLX
	 kWkzQt/1sZYtCxygeKqIYuxLaKKRGNL5Z8CFD1MZUKxYjQH9ERAS0U2t7BdveFpsB+suX
	 6jnrHnSHai06igVVfSwiWn7cgGZveTeY4Up8G5OLqMct3Ohw6VbxKVQmTqOGgdCONRAG8
	 XRcr/ZE420Nd5IxeYr4UkfjKtr5RIhTbUItSIf0f8zyrwu7l/eaWfN6MwGX007KHKfD5U
	 OYC0JHDwR51fHdRidtvbW6r/ebYk8AXRRY1GwaP+UyedAe/cfX7zGiwAfsukcExazsA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=A89Dyepk;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A02D9606A323
	for <linux-hwmon@vger.kernel.org>; Tue, 17 Nov 2026 03:05:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=A89Dyepk
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 14E8B1F000C4;
	Tue, 17 Nov 2026 03:05:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794884730;
	bh=RpWUS9MyPr/jE2nDmRv244naDxFt/7Z6rFP/SF7vISc=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=A89DyepkzlHHIbyp0cK8Q3cdbO3dT4n2Mm9HYjBA9yfa5/21kVOIVhj1XnDL2LMfZ
	 IDmoBObloxACLW3g3iyNGONJAsKs9VfGMq6rlAICwP0kA9a0LyVNHn28/BRNo162tY
	 NSZjvaCHoDop3dPo9rP6Qxlxej3/XlL364+sNp6qSuHk8iM3S44E5HGxb9L2eJDm7a
	 xB3FtSa7ywrCVTKCs5fNBwcMESsSwijFWdxThdfjEkhw5AhddfLycD7RqXijewkeCH
	 ElwLtbdn/veB2KBa1P98/ZxGgCiWxp7RpeSIu9sAO4C1M7LJiDCMl/mutLIEw6FpiX
	 fSjXRDfTjWe5A==
Message-ID: <sashiko-outbox-218121@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 4/7] alpha: marvel: notify environmental events
Reply-To: sashiko-reviews@lists.linux.dev
To: "Matt Turner" <mattst88@gmail.com>
Cc: linux-hwmon@vger.kernel.org
In-Reply-To: <20261116-marvel-env-v2-4-ef614eb2e7f1@gmail.com>
References: <20261116-marvel-env-v2-0-ef614eb2e7f1@gmail.com>
 <20261116-marvel-env-v2-4-ef614eb2e7f1@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 17 Nov 2026 03:05:29 +0000
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Post: <mailto:linux-hwmon@vger.kernel.org>
List-Help: <mailto:linux-hwmon+help@vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-hwmon+owner@vger.kernel.org>
Precedence: list

> A change in the state of a sensor arrives as a system event logout
> frame. Call an atomic notifier chain on each one, so that a sensor
> driver can reread its sensors and tell userspace without polling.
>=20
> Signed-off-by: Matt Turner <mattst88@gmail.com>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261116-marvel-env=
-v2-0-ef614eb2e7f1@gmail.com?part=3D4

