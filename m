Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E032710F1
	for <linux-hwmon@vger.kernel.org>; Thu, 10 Sep 2026 08:32:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789029133; cv=none; b=lHnjTWwzHqaj/EEnKCdavLm7pg/flKlsOccvYP4bSEQGazw8W2+WveSqGLZ7kFFmanhCQd1Cf1F+PojV14AXuXnyyrCLbAolvwc3MDXdHI1HAC86pp95j2SyQ50FdREKdvIjoStoDggN5nAhTn925U+Vtj4aVH8y165A+ri8lMQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789029133; c=relaxed/simple;
	bh=YnrjkRYVxoBY3F4yZbSMRDflP5x66YSZiVgGPkwzRLE=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=Nh3J+g5bu5HYeJibUOpppumNjKQVo8ax6Oop0+Bfv97hRqZLNt8YsNU+cSmqBpGiSN/Sw6/imTyGPVNA/gleBLnpdGdO1PdKcmOjbI/ws4l1CX0pERYutyITc6KiJ9z68KDGpQJvMKpOTkD5yQ1g27JqMRr1yLHetxRxrN1nAIY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=MBSo+yY0; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="MBSo+yY0"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 60E611F000FF;
	Thu, 10 Sep 2026 08:32:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789029131;
	bh=YnrjkRYVxoBY3F4yZbSMRDflP5x66YSZiVgGPkwzRLE=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=MBSo+yY06pLuHRvHiOIn0ecndIbQUSFdr+/msHdF6fVhxWoc9COkyAV21b7dkGybV
	 9JvAyCv2TJhwwmaB808w73tY1css+tk12U1IJEQ5XFICqkCCMp/g+M+6XtFB6tlgme
	 hPrmbYGnxBkM2yW5glZZv9YoaHO8lKF0Ydu4LvbHwSBk2fxorBNHMBWpSLXDTzdg42
	 xP1ztGdIYFk+0FyIGZXmmFeEW6RXTvvfNoT1Fb3PDEPU/C7h3JEsLYtQT1vkJ4AIf1
	 wIFGghkliMCxtTGmKgHSKpd2LfqhH6EEKT3De/1a5LSAcOf3pIR9Nl3I2w5U1MECi5
	 ZWwz8P8jTA+Pw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v5 2/8] x86/hygon: Map CPU NodeIds to DF nodes
Reply-To: sashiko-reviews@lists.linux.dev
To: "Lin Wang" <wanglin@open-hieco.net>
Cc: linux-hwmon@vger.kernel.org
In-Reply-To: <20260910082734.3771675-3-wanglin@open-hieco.net>
References: <20260910082734.3771675-1-wanglin@open-hieco.net>
 <20260910082734.3771675-3-wanglin@open-hieco.net>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 10 Sep 2026 08:32:10 +0000
Message-Id: <20260910083211.60E611F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

> On bare-metal Hygon systems, CPUID 0x8000001E ECX[7:0] encodes a
> CPU's socket and local CDD ordinal. The value is sparse across sockets
> and cannot be used as an index into the dense DF node cache.
>=20
> Translate the CPUID value through the CDDs sorted by socket and DFID.
> The NodeId reported by CPUID in a guest may not describe the physical
> DF topology. Return -ENODEV in guests or when the NodeId does not
> identify an enumerated CDD.
>=20
> Signed-off-by: Lin Wang <wanglin@open-hieco.net>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260910082734.3771=
675-1-wanglin@open-hieco.net?part=3D2

