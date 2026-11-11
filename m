Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794395170;
	b=cwuyhpWUtkgUEZfQ4CF+dyJogVvwuQ4Mvk6ATa655UIyD/A1JDE5h27FSqy0s/StoM9B
	 smIpXwhIDeWjk1ct8oHAb/VorHT1/wwIF7QfcN/65mmRcEn4vibFIyL531+2CextcSXy0
	 QHBiQTn75UJS/x/AVgm6bXi+ZzqS0zG32wdmTO9sSvZCrdXUCfywTviwxKE2i3cI4Qh7+
	 +YaSKufBArJLgLFvfv6r+cXNv+m56gfAw6JDJPY0AW+x04UOlhFJXI3bbdTI/CWKLzUUw
	 d2yABcBBoemkeabcHvENxk/P5tB6GUEqhUi8P1PA5kFFRO+6j1KPnJSrJroku0rCsGw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794395170;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=blX8qn8W+FO1H/CsSCSgEKBIkAS6RcLBPe8FUf6xReQ=;
	b=Xet4uRCEOG244dJCbFdU+o3xZrw4xmolksDpTS9qulE2Jtg41N3iRuVnhNsxhIsTPfeJ
	 aEaUWdUDgEFqBoN+usSGVnzVHKNnPvVJwhH/j6MJcjoLFp3e0Fr5xef+SXiy06lJyjZmK
	 jlGubKRWhL1NBGR0JD4RP4JfUuI97aliiARy9bnk2N6S5MSOfZ8g3klZ6GGQ1DrJ3sov3
	 gql4OAn412sN+bEeuwE67O6SfLSYjlrRWkQoKEaQqvwS0yT7+TzlwKCKxEOjsayo+dGEs
	 ns38SCIzo12VFaCrYlzNcdWP56icbljSEZkRD6f2Dyc/Mordp7+SMiOPYDkpqJFFouA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=KBuxtrIC;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B4CB606A31C;
	Wed, 11 Nov 2026 11:06:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=KBuxtrIC
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9ED3C1F00A05;
	Wed, 11 Nov 2026 11:06:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794395169;
	bh=blX8qn8W+FO1H/CsSCSgEKBIkAS6RcLBPe8FUf6xReQ=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=KBuxtrICE2cg5FXF6HjJ3eG5WdF5Kr9OnAGuV754sIrjhZWZvFLkNst2MKmU1Qcmz
	 hhoT3wGQl8vJgozEmSHgGuLFrZvl11FRR81zTtKPSBQILJPqvSGeRtb6ntKbHyzv7x
	 ifeM/eFUDSwIFeOikbPi/Re7gqC8xQSxsxq+yHylQY8MUxRsTaFR0k4vp7DOXpz778
	 GyTf0uXPxCn2jeCY3N//93N9hVl+ZkkPRnp9MHYhucH3mUToTER+CHkH2OhiOwU3Jk
	 2YtWgjyufXvxdXrAG1E9AxaSy6m6Gth6MsnfMHMHCLLtPDiHWPZrwHDjeQ67xhKgKc
	 /3G1KhfJfgyQA==
Message-ID: <sashiko-outbox-208846@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 2/7] dt-bindings: mfd: Describe the BCM6846 PMC
 complex
Reply-To: sashiko-reviews@lists.linux.dev
To: "Linus Walleij" <linusw@kernel.org>
Cc: mfd@lists.linux.dev, linux-hwmon@vger.kernel.org, lee@kernel.org
In-Reply-To: <20261111-xg6846b-bcmbca-xrdp-reset-v4-2-17035a5e8ad2@kernel.org>
References: <20261111-xg6846b-bcmbca-xrdp-reset-v4-0-17035a5e8ad2@kernel.org>
 <20261111-xg6846b-bcmbca-xrdp-reset-v4-2-17035a5e8ad2@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 11 Nov 2026 11:06:09 +0000
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Post: <mailto:linux-hwmon@vger.kernel.org>
List-Help: <mailto:linux-hwmon+help@vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-hwmon+owner@vger.kernel.org>
Precedence: list

> The third generation Power Management Controller (PMC3) has
> different subdevices.
>=20
> Identify the parent with the BCM6846-specific "brcm,bcm6846-pmc"
> compatible.
>=20
> Describe the complex as a simple-mfd with a PMB bus child owning its
> register resource. Include the PMB power, clock and reset controllers and
> PVTMON, with its acquisition clock and reset resources.
>=20
> Signed-off-by: Linus Walleij <linusw@kernel.org>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261111-xg6846b-bc=
mbca-xrdp-reset-v4-0-17035a5e8ad2@kernel.org?part=3D2

