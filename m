Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42AA23F12C2;
	Wed,  5 Aug 2026 09:07:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785920825; cv=none; b=jrq99bpN2NajXshkF6X/h2awi52b17/uYQC23AXa/XqGMEAy1nd5NXCSJFIEVCh6xUTGgwCuE3gF3MBi9V35L9ANtZkcPtS0LqSsUhwYt/Qel/wC127D+oEj8c9z3Hmr3d+nayJ6rI3ss8WsOAjZ4RkkOpKBh5ICFeSsf0TTznc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785920825; c=relaxed/simple;
	bh=ldWwfp6eZgwwwaIiSF84UxXjp0cOzF84VunnzMMkcoA=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=fqCE+ODW+1AY/obeQNOLOK/wDor/99J44zmN1vDjuT3hv0gGc5QbZeLrqj/9kPH+KsRoIM9fSipnuBRCs8gSUWX2Z4KsGPVVg2lYfkYUJTmAjMbtzp1FZiJ1+/z5dgjQLv+IpWfRPFQ7TkQYVOE7xa3bBT6KI5ahaiNGT1+MO+A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=exAtPUIo; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="exAtPUIo"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 42DA31F000E9;
	Wed,  5 Aug 2026 09:07:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785920823;
	bh=ldWwfp6eZgwwwaIiSF84UxXjp0cOzF84VunnzMMkcoA=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=exAtPUIoJIU9dU9jkXiuAKZiJHxAtp8RH6p6OcJUo+frbtmE3yoxyKGGa3Qf6Jmur
	 R85Aq9d4PVPyiIAW6u5643QSpEjzYj22RdgTXoMfHF0FgKCMuOog95XNy+XF4aNVUP
	 9yCrcuTP269VBAZ71ui69Z335jIi32OpwlnXsqar16/bsS9DVN7zVqBS4aeha6ec+c
	 hcv3jGFLp1Zo9qyiNkKKSoEkStx4nLT1xqAcVKys+imLpE0zjkiVcwkleF/RUCd2Qo
	 LzgyT0700wFn/UHzWAusz9oSymzqyE226ZjZDDXpwg5HmdfllB3lZiFCgWeuhLMp2p
	 AX38DdYM1UCEQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v6 2/3] dt-bindings: hwmon: pmbus/tps25990: Add TPS1689
Reply-To: sashiko-reviews@lists.linux.dev
To: "Stoyan Bogdanov" <sbogdanov@baylibre.com>
Cc: devicetree@vger.kernel.org, conor+dt@kernel.org, linux-hwmon@vger.kernel.org, robh@kernel.org
In-Reply-To: <20260805090400.2059006-3-sbogdanov@baylibre.com>
References: <20260805090400.2059006-1-sbogdanov@baylibre.com>
 <20260805090400.2059006-3-sbogdanov@baylibre.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 05 Aug 2026 09:07:02 +0000
Message-Id: <20260805090703.42DA31F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

> Add device compatible support for TPS1689
>=20
> Signed-off-by: Stoyan Bogdanov <sbogdanov@baylibre.com>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260805090400.2059=
006-1-sbogdanov@baylibre.com?part=3D2

