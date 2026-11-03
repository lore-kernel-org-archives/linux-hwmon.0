Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793716921;
	b=CZ9ySLOy318o/ZhdgjjxgbjDzjQ1fU+80dTnCfFjgVhiIZx41+69LSXh85mOEEuz9Wcq
	 ShEAO0SIIW0HnWCeFVCLx5juLQmTYI4afcI7lEolfwROnVX8Aoz8FfX1F3hcnnRsDXKNt
	 cQh+dBCuunmrtRIBDV5DISH5soF+Qdf1HqJubiGTF0AJ6neCUW5EFTEvMGm8uea/feztw
	 27QV58AxRjCpZBOQxnQbOmpAm2dpEbkD74lB136nlLzUhLo6Fa23eqbH+/k0kNtma7pLY
	 hJeDO6oGEM2dSFA0Dq1nW0YlzIPGxHozxOUwF7nCLJXv4rg4cMITXMCz1TAwMXP+/hw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793716921;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=KMNVI5rvu7O8/1Cq1hRe2Ivhs3aKe2rfyvdLZTV7+gw=;
	b=Gba/6LmeTw+WY6RL5K3TK634JxhrQItu+S0Ek0sWftziiI8vsk6gziBTP8vJuRWFJYIy
	 aZOsalHtlpdEzr5owzD3iOhknDjgzHDWTq30ZjcoM0TZaozb/Z/oKV3VADaHjb5sUVLPx
	 wMj/uWoYnpXlQuN8dxHyNWC49tJbdJ/OIeFsE5oHteWNtGKLDhO7ktmU1PglropH4mDDh
	 xD/WDEETM2jFTryP+8fZ5MUylX+UJU1NnlMllZC0uHXb/OktL0P/jlqIxAQUrfROroqpK
	 R0x6Yk8WkGSl0oz0g693tKJQAHdOFpU0ySFj1uxD1/+HLcTB8qnOPkaLLCzdkvTQl5w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=V0rjbdw+;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8F35606A33C
	for <linux-hwmon@vger.kernel.org>; Tue,  3 Nov 2026 14:42:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=V0rjbdw+
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E8DCB1F00A16;
	Tue,  3 Nov 2026 14:41:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793716920;
	bh=KMNVI5rvu7O8/1Cq1hRe2Ivhs3aKe2rfyvdLZTV7+gw=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=V0rjbdw+4gE0CikEap235g2h2hdBPfchJyf/XvgsZMgx/MKZQsYHKWybSQIgu6RAg
	 9brIGmW6jAxJAuXGCWboLsh8sGKoX4Jxa/qAEHBSQLNKPHPEgo+985Ns084DZog2ZG
	 liVkOV9pT0mYS9fMylrbv8uZKA3KQ8OOtoCmCRK7NF0/jdok4yBOcM1bkD3NDfum4x
	 K9V1DRGrspJwNbDLZoSFsTaRPSuJLlZJH2ZPQXSbn+vGDRsH2vWunkt4LSb2ZUYASp
	 CbZskEAn3YcM/sNcd1UAMDPELYqzzv5i1NuxHunFRTZwQYLGM+mMxMipqrCjouuCQ2
	 +yo1kbLj7W6PA==
Message-ID: <sashiko-outbox-195467@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v5 1/5] unaligned: introduce be56 unaligned accessors
Reply-To: sashiko-reviews@lists.linux.dev
To: "Ariana Lazar" <ariana.lazar@microchip.com>
Cc: linux-hwmon@vger.kernel.org
In-Reply-To: <20261103-pac1711-v5-1-71c20101a52e@microchip.com>
References: <20261103-pac1711-v5-0-71c20101a52e@microchip.com>
 <20261103-pac1711-v5-1-71c20101a52e@microchip.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 03 Nov 2026 14:41:59 +0000
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Post: <mailto:linux-hwmon@vger.kernel.org>
List-Help: <mailto:linux-hwmon+help@vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-hwmon+owner@vger.kernel.org>
Precedence: list

> From: Marius Cristea <marius.cristea@microchip.com>
>=20
> The MAX34417, IIO driver, is using some unaligned 56 bit registers.
> Provide some helper accessors in preparation for the new driver.
>=20
> Signed-off-by: Marius Cristea <marius.cristea@microchip.com>
> [narmstrong: update commit message and move to include/linux/unaligned.h]
> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261103-pac1711-v5=
-0-71c20101a52e@microchip.com?part=3D1

