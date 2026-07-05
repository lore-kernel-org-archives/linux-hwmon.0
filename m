Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B73F9433E74
	for <linux-hwmon@vger.kernel.org>; Sun,  5 Jul 2026 11:35:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783251334; cv=none; b=ju/4NnWLJgSE6FmoAxP2zzicSuviM8Fk5dz/CCQ/h2Clx8TRpSaU8lkGqztzP/zAIQ+VQa2/PPwiQZgyhDGny0JQ3EpMARJXvpoE4t3ckajCvUki4Jf6uE7+EA/8deX8QhBgIlN/MwiEUozN+eQnLJunxSaplVlWf0EmDFVqfaA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783251334; c=relaxed/simple;
	bh=tlfx+LxxWE9L3L1Sb5l9nMEgoujDiWrBEDn0dYyJe+M=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=Yyjb4cydpSj50/6Y3NplLcjuvUUnoEvJhTXlH7RBD24+dhxdehWpe3I2p5VeVUlhXo4NB+rwfRaRQd7vUPSfP8/mIly+zPf+qLPc8Kk2lXle4AtRvEmCz2IyCPipmKtg4qqLYaZsd77uZGAlv4hXMg8VXdH3/L5G/hAbVlHNAaw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hFd6+pGj; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hFd6+pGj"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 328D41F000E9;
	Sun,  5 Jul 2026 11:35:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783251333;
	bh=tlfx+LxxWE9L3L1Sb5l9nMEgoujDiWrBEDn0dYyJe+M=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=hFd6+pGjKxPAYTFHU4oaILTwn2M06jGWCpAKSjCuFK0Udt7/Jnt1wwbAyv6f+3pCE
	 nMZi/ZxLSIP/a4GGZBTKdbKNIGto86muMVfMv1NINa2OOL0QPeKN95VUGsnMt5EXSq
	 LTK/U8LU1Ra8QNJodhiVuFhWgv8tfh8VqNfseFm+iUmsBSeileWWQsoce8CsQaxSxj
	 KwnWN04+V2FuIyj5tHgg8xBGDvBsu3WWcBF21/x9FX9wb6HtYD+fblWmcBkj1sbPB3
	 t3wsSdoZ0Wvh9x17/iCJiS/+x0rlHeqi7c/muroONFIKpgvwyrKP2q4gk+E2M9Tmmn
	 g6pr4b+KLlOtg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] hwmon: (asus-ec-sensors) add ROG Maximus Z790 Hero
Reply-To: sashiko-reviews@lists.linux.dev
To: "Eugene Shalygin" <eugene.shalygin@gmail.com>
Cc: linux-hwmon@vger.kernel.org
In-Reply-To: <20260705113125.812045-1-eugene.shalygin@gmail.com>
References: <20260705113125.812045-1-eugene.shalygin@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 05 Jul 2026 11:35:32 +0000
Message-Id: <20260705113533.328D41F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

> From: Florian Schut <mail@florianschut.nl>
>=20
> Add support for ROG Maximus Z790 Hero.
>=20
> Signed-off-by: Florian Schut <mail@florianschut.nl>
> Signed-off-by: Eugene Shalygin <eugene.shalygin@gmail.com>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260705113125.8120=
45-1-eugene.shalygin@gmail.com?part=3D1

