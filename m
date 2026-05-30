Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3EBD4175A89
	for <linux-hwmon@vger.kernel.org>; Sat, 30 May 2026 22:37:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780180646; cv=none; b=JaJmd7zqwFG43lMfJGgu1OrW88GbmEJatiSp1pmYpxWEZn5dpPjFmR5g0/4RCjMkxJLHE7JSzP4GL2nOc2oGuSNeUzDIcU3x+ZA8Ney9kPwpOyRthLJndqzaRizp7kL0m7FNQR2kFaQDZeQiiIx0x2xIpqn06Bl7nN0BYv8iFH4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780180646; c=relaxed/simple;
	bh=+A4spK3cBmovAmEV/W7Hh0GhNPZSPCvmR/SwP14QGLI=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=Dy3zw2AGZht+l2lUfC8nWE3N1aL0+LBlbIlcILKeCcSmJNdkuP12sAKQBANn0l2tkox+i08RmAYvAktFJBDwaTBqyMt1cK1rBY3rItlMDcAsIUpe309R3T5NdjXT6SiDbYxCViv9oaoJTRjPT9haaI+ElXoDmrCR3p0OS/OlA/w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZT3yIyXS; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZT3yIyXS"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5933D1F00893;
	Sat, 30 May 2026 22:37:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780180644;
	bh=+A4spK3cBmovAmEV/W7Hh0GhNPZSPCvmR/SwP14QGLI=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=ZT3yIyXSbZh5GMCJzNFRupJuDD3rAMLhjEnBUiKDMMjfdpWQZcnTZaAptjwN/d5Pt
	 nspLwA7Jgm+TPtFUoz4Yp5DSjyHMH1xS5ZMV+09PrZro6Bi5u8pRWMCEKDtAdld9lf
	 TAbahale2OO5aWHK2FowFxRXDmjIUulmH6OPu7ypXBHPmyKugHY3UL6rbPSH8vAYMn
	 Rx+I5r2FMdBb8Jk84yl134lvQZGuvCVBw+LVQPx/cSSJqyAdCD/edwXsnsb5DBkWTm
	 ex6y/3SaT6XAFYCC5xhB8S3e8sBNPhDv1o14au02W1cWWQhFtM7El6PI/Ma7bB2bLg
	 MVpujR9zZPRiA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 5/7] hwmon: nct6775-platform: Use zero-initialization
 instead of memset()
Reply-To: sashiko-reviews@lists.linux.dev
To: "Manish Baing" <manishbaing2789@gmail.com>
Cc: linux-hwmon@vger.kernel.org
In-Reply-To: <20260530221353.159461-6-manishbaing2789@gmail.com>
References: <20260530221353.159461-6-manishbaing2789@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 30 May 2026 22:37:23 +0000
Message-Id: <20260530223724.5933D1F00893@smtp.kernel.org>
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
61-1-manishbaing2789@gmail.com?part=3D5

