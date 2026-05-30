Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CEB1A2367DF
	for <linux-hwmon@vger.kernel.org>; Sat, 30 May 2026 22:35:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780180504; cv=none; b=rSS7FCEn9+klsbRxUND2EfHx8TnGPNJpHx5sUegYg8hyiJCMiyCPIkrGPKRdwc1iS8G5CXJULHYN7y7WuWMMG9bKs7QKRVM37rHB+yMmvzDy8yfLjv6yb4fniLnYFQAWycF5qgOvPOcwlE3nLA+IVjJqwY6DQrRFlxM/hL009Go=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780180504; c=relaxed/simple;
	bh=+B57iqK6IleO0VNfb9vlzw/r57vHN5kC/ZkCwzSIYW4=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=E1empdjlz/s7B2K6OktH0axw7sr/zuAFnpIF5rvNgmImNn2yrPXVIqMkrBBQ+c4bO7+138vUfeoYMm/Std8OXeEIO5+fw4uHgBgJcWYj5eWbVxXoFB/Iff9dEv0w9vijp9bAR1N52TniDtBaMDQPJDe82ix8gldnhJnPHdJUQ9c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YOI5aBhA; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YOI5aBhA"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 795391F00893;
	Sat, 30 May 2026 22:35:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780180503;
	bh=+B57iqK6IleO0VNfb9vlzw/r57vHN5kC/ZkCwzSIYW4=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=YOI5aBhA9Q67DhxV6k3W6pOoNUVJZUBj4s1s60tCzR0Dhaz9KrU9l+/igsstYweMj
	 vE8dUv+K9ea9bR3+TnQ9gIlmXDvtAmrM0Apd2x9g8qVktn6DRdDfkxevaO+iOR3Tx1
	 WRcdo2z5S86jwaqIlgB98OZv8PevRXYiW9ckZx9XoexIwy28ZJosXJjZ5DskWn5aIw
	 AdQ6jCA7RearmhKMY4s3j8i0uJ4a6lXpnehvRhK6j4iUubdO9QORqNrrssmeZAZY73
	 jTX4iZZLxwkxysPIrcY9ZV6T2EDfM1sMsvG6LomllT7NGCEj0otN2gVgixCHV74pPb
	 ef/1jQi6X2ynw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 4/7] hwmon: nct6683: Use zero-initialization instead of
 memset()
Reply-To: sashiko-reviews@lists.linux.dev
To: "Manish Baing" <manishbaing2789@gmail.com>
Cc: linux-hwmon@vger.kernel.org
In-Reply-To: <20260530221353.159461-5-manishbaing2789@gmail.com>
References: <20260530221353.159461-5-manishbaing2789@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 30 May 2026 22:35:03 +0000
Message-Id: <20260530223503.795391F00893@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

> Reduce the scope of 'struct resource res' by moving it inside the for-loop
> and using empty brace initialization (=3D {}). This ensures the structure=
 is
> safely zero-initialized on every iteration, allowing for the safe removal
> of explicit memset() call.
>=20
> No functional change.
>=20
> Signed-off-by: Manish Baing <manishbaing2789@gmail.com>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260530221353.1594=
61-1-manishbaing2789@gmail.com?part=3D4

