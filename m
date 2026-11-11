Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794380401;
	b=lMVVYzlZQMMXYvNLCThUQwmDI9NLwC4VvnaArrMWlwABdxQaQbxLG3Z2TvwKRCUTSgcy
	 EOMfogX/LmVreG8ZSyQ/qwzHmEPmeUnrui6BtY5PPggkMG5tQdm6yGRhZi/hPs5yRC12B
	 +cepldkMzPkHbYjcdBLiQBJbEViTj4fMqdu+B9APt81CJzP9BllYfNhpqYnjAiakslEyN
	 ztzHKJyG6GSRDXcnk6kKeJS7/EtPhrmoqtP9SlXMbPh+0Yl/bjVbKyYLqmRBFTHsRtZIw
	 ZMtwVGF39zluu1PrQA7M7Fp872vlsZax85Th2ly9LhsgsHq/JHuN05YXUz27Ro2aWGw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794380401;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=hG60dKFbWbP+22K73ZiYHmVY3Fznw+CCvkPRtcNi7Os=;
	b=fmREd8WWlogZeKBHNYMWRhEywDo/lYnpgDsGvYH7Y6qPQC07hKBnhLxzz0RvYg/m9VT7
	 qWTEQq1KG+qzaqCdkbjrUrqugySZ1gR2Qjci+s1PXBqlGPTHqdS72E5Gh8j81YsFq36hT
	 demrjCm8y2jrlDUjnF+ZLK4BCvjjwVBsMGXv7kFn7UqRloK/u3uXU5xxLqGjjFH3dFz8f
	 gPx+wat1RdQBvxtfIShrCEjTUZVTT5ehBoh8scmyTikGVfb+QhhQb+7Lf2DYJzoKD8TN5
	 qkERX4uOXGzBpxKIDEDlMMdVzGHE2dPx988wNXtkYCzlm2Iodvr62EkhJxpn110dfcA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=oSB0OBuI;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8392B606A9B8
	for <linux-hwmon@vger.kernel.org>; Wed, 11 Nov 2026 07:00:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=oSB0OBuI
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2D0991F00A05;
	Wed, 11 Nov 2026 07:00:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794380401;
	bh=hG60dKFbWbP+22K73ZiYHmVY3Fznw+CCvkPRtcNi7Os=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=oSB0OBuI26jDW04Td+Xwu3D7aqEJUIdI+13w+uszuhzY43JWIVpxv40Nzjf0Zzr9h
	 d7dQ57ce/UzaYXW5nfomkaIyDNNh/r1BzNxexifIPVsfnadPAbgYFmDak8CkX/nZPo
	 s0tYcjl7GuTWtBpiiPRfHHUpIkrRl5ZQ3cV9qfBrj6FsNU0Aa5DEu3lWViFCgv0AUa
	 DSD3kxst2nQ2ZYQQAebJLmJHZIpau3Y1r7RMjVzU5bUPHjdSasshGoc3UiROETT8D4
	 MgSHWReNovKvPU/atibCCRNgNE0zwFy0IwEuddARzHGoF/FDKDVrsDbOKYkOQts9wg
	 ZqjEcBbl/uvng==
Message-ID: <sashiko-outbox-208479@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] hwmon: (vt8231) Clamp voltage limits before scaling
Reply-To: sashiko-reviews@lists.linux.dev
To: "Zhu Jun" <zhujun2@cmss.chinamobile.com>
Cc: linux-hwmon@vger.kernel.org
In-Reply-To: <20261111065134.17560-1-zhujun2@cmss.chinamobile.com>
References: <20261111065134.17560-1-zhujun2@cmss.chinamobile.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 11 Nov 2026 07:00:00 +0000
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Post: <mailto:linux-hwmon@vger.kernel.org>
List-Help: <mailto:linux-hwmon+help@vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-hwmon+owner@vger.kernel.org>
Precedence: list

> The voltage limit stores multiply an unrestricted unsigned long before
> clamping the register value. Large inputs can wrap and select a low
> threshold. On 32-bit systems, writing 4483265 mV to a regular voltage
> limit selects register 3 instead of 255.
>=20
> Bound the input before multiplication, using the separate scaling for
> input 5. This preserves the conversion throughout the representable
> range.
>=20
> Fixes: 1de9e371b89e ("[PATCH] hwmon: New vt8231 driver")
> Signed-off-by: Zhu Jun <zhujun2@cmss.chinamobile.com>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261111065134.1756=
0-1-zhujun2@cmss.chinamobile.com?part=3D1

