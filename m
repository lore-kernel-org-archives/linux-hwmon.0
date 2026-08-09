Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F12538C438
	for <linux-hwmon@vger.kernel.org>; Sun,  9 Aug 2026 21:30:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786311005; cv=none; b=Akt7ijshj72UwBv962XPN7j9qSXSCctBzfu46nf3R5TxRNhgBFsXCR6zlVTWrDBUkDlgV3ii3fnwelDQ4Jnj14buTXo6/M3jUDg5G2sv4LiQP/+ba93gH3G/PjP4unIatuXFQvtx8GgtDv8X8YAMqrwc5AKo5o1CRq072IgB0m0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786311005; c=relaxed/simple;
	bh=71vtzuDBXIICYmm+YvbwQr3b1TRtcVaru74AzEmQ3Ls=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=a+fhWAyFzHR1CpXQPSISGHcSAP3E+GWPquujjtXAF43aVyiC5sE1GwdIFMlzINPti/FR5040SHcq9JAVCF0te09oagiwII/0Jg1xPkFgeE1dJHi69vRcmV2n5WbsGOGR9lyXGXbuaWI3v80z+OvwsMlN2aePsHsWNw+Iq7Or8CA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nILqooDk; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nILqooDk"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A4D171F000E9;
	Sun,  9 Aug 2026 21:30:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786311003;
	bh=71vtzuDBXIICYmm+YvbwQr3b1TRtcVaru74AzEmQ3Ls=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=nILqooDkrC30gIs5vENqy28EMFQVOTjqD85YiGAyWLYlWt5aLDESBVekTA8WwCBe7
	 eE78NXwn72VYO8G0vd4C8CHL2Xl6+c+wbhEc1BvQ7uKxxL9eKvL18Xy0CZuf8GOIu7
	 PSNrP/KGdOuvDAIBF2eq+cR9AcQ0jDPmNigZBXKe2l4EVN4REH3gU92BZHSXBZRsXs
	 CQBfAu6EQ/NU6688YDDeowG3zPqUu+rG9yz470N+1DhoIZespBhsF2XhalA8ZsfVeP
	 tHiN3WvX/FHZGX9MxkDsCIMUlLRiypXs4vRy6ZoUavawYNpA999hM/kS7wSDKC0pdO
	 SZjMtvV7BXxSQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] hwmon: (asus-ec-sensors) add ROG STRIX Z390-E GAMING
Reply-To: sashiko-reviews@lists.linux.dev
To: "Eugene Shalygin" <eugene.shalygin@gmail.com>
Cc: linux-hwmon@vger.kernel.org
In-Reply-To: <20260809212705.1501382-1-eugene.shalygin@gmail.com>
References: <20260809212705.1501382-1-eugene.shalygin@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 09 Aug 2026 21:30:02 +0000
Message-Id: <20260809213003.A4D171F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

> From: Rodrigo Araujo <araujo.rm@gmail.com>
>=20
> The ROG STRIX Z390-E GAMING and Z390-F GAMING are essentially the
> same board apart from the E's onboard WiFi, so they share the same
> EC sensor layout.
>=20
> Signed-off-by: Rodrigo Araujo <araujo.rm@gmail.com>
> Signed-off-by: Eugene Shalygin <eugene.shalygin@gmail.com>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260809212705.1501=
382-1-eugene.shalygin@gmail.com?part=3D1

