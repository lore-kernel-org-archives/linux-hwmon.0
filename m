Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792551903;
	b=2o522iy0G8JMbbyUl0nOoSKD42w4D2x5lXSC08m85YNX/oxPhGDDr7qMmLJpPxxfxmN0
	 oBGR2VVpGcBen+PzM7KX2OEOeCwRVByx1mcfN60/V/Mvq1FmD4ZeVActGNvduAL2icMq9
	 QYeXCBVc/DIAYUge6Kcf+uvNEvYjhaTOPR+OQjsdlBtwiXCQawzBxZ0JXSS/YZ0JX/EoN
	 p9K1NnckHGnGW1UApwOh4dtY4TiCpBFNNp4m7aowJ8XDGBeauXyFRpO/cONKuWLvJVyXA
	 Lw6S4o5umr5GehjVcViWeF9dHFLhq7iQZM9vx4ZxpnG6eYHH3diHyji/iyiSWoO7Ayg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792551903;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=eDxQ23DItBbGwKu9J2SoBzTuH/rsfi5tjwPVNYhT8MY=;
	b=FOZWZzmc/YV0VFdRYRpcI/kqs9Lc3F5LtjAyD8JhXzaPl8Fo5wyaQPlLRY8iKZhbdzOK
	 EFlvgFMHCWUstafo3wbDy5KH3cmI3BVerK8BBfb0tNsjVtpgo0LZGwB6kUTGIMKfhxXrK
	 93q3kTuQ5SG5SJe97FPPUEXBE/+BYcbn5vyB3VCHBSFh98DN6iRL0oArDHooQl7VN2m4J
	 z7d5lfxBooO7O8P4xx1AjIHSNpQwHeBGoIXcNFYZlkcAKhg1k49kwrVEA0UdC5+ba94PU
	 O3pVDpw1Z87dxGLit3aS0kkpwHandUPRfqjr1MSEmLmnt8UJ6UhY5p+54AgoYtHXCxQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=FLrP6JLl;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48CAA606A319
	for <linux-hwmon@vger.kernel.org>; Wed, 21 Oct 2026 03:05:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=FLrP6JLl
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 000D01F000C9;
	Wed, 21 Oct 2026 03:05:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792551903;
	bh=eDxQ23DItBbGwKu9J2SoBzTuH/rsfi5tjwPVNYhT8MY=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=FLrP6JLlFFbmxyBaQwDR5FIVctcm76GWk5gyvuwZ4cvGHqeQXQarMbMWsnXx36wFC
	 OtinqwBq7lQpeBJ33x6Q5uHAVHFwaUgHFxRvKo8XgOWCID87X0q5qAnir1mNxrEhHn
	 Xnogp7oaePMjkfPf/12emnA7Pat4FOGpW1rN8BkGIoVHTW0oWaW0jJ/5MxzMr6RLwh
	 GYlx42GoNJqczcHli8+JUi2+sNx/oxRvra6iwXJvz1KMMEaSbYKSFOdi90ZgbE+7zD
	 zhwDsMVrohtXes9jash6LZmM74L22w6836++UGEbxoKSDmP99tSrejSaYnoiIfrj79
	 1bmSeYVnvCSvw==
Message-ID: <sashiko-outbox-179739@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 1/4] dt-bindings: vendor-prefixes: Add TDK
 Corporation
Reply-To: sashiko-reviews@lists.linux.dev
To: "Abdurrahman Hussain" <abdurrahman@nexthop.ai>
Cc: linux-hwmon@vger.kernel.org
In-Reply-To: <20261020-hwmon-pmbus-fs1412-v4-1-27ece4e43d04@nexthop.ai>
References: <20261020-hwmon-pmbus-fs1412-v4-0-27ece4e43d04@nexthop.ai>
 <20261020-hwmon-pmbus-fs1412-v4-1-27ece4e43d04@nexthop.ai>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 21 Oct 2026 03:05:02 +0000
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Post: <mailto:linux-hwmon@vger.kernel.org>
List-Help: <mailto:linux-hwmon+help@vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-hwmon+owner@vger.kernel.org>
Precedence: list

> Add the vendor prefix for TDK Corporation, the maker of the FS1412
> point-of-load regulator.
>=20
> Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> Signed-off-by: Abdurrahman Hussain <abdurrahman@nexthop.ai>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261020-hwmon-pmbu=
s-fs1412-v4-0-27ece4e43d04@nexthop.ai?part=3D1

