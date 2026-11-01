Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793571710;
	b=K80/beWJBydrffjbc2aByIV+oS8bK71nqB17kKbUyiG4rbkDzNw+Ooa2eaZ/sYCgWTA3
	 FH9lJ5h9tigGfroyPpC/Dbe8As2eUTXlvQaP36YBc91jcSHvVVOf76J+gYKnfdDXbkpi2
	 jam94CQmckzwe3rFEMKNYdZmYJV40TSg2PepEUrC6VsSk6AziHN7P2xWlEa0NtemaDwob
	 Q+ZDBX7VXV4BIIN3qOsONsFq4rCRndzNIBjLER2Vl9YJ5FPvXCV5IwqN7vAG98Gup4j1G
	 qjP/3LbRjnkIHFY8FoGDMqjnnIvsxvsgm/dtF5mEakrZBEO9FZkImUp5Ohdr1N2YkCA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793571710;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=hZ5DA9V7/pDlOG8t/lilXixJ+pXl1VQuSZjiaxN6fWU=;
	b=CHzVzRial+tBJI9DGOkhCtaLwwSNKklBEzR4DGN0W7CZVvZB5Qv443sJS8Nu6BU+OTUB
	 t1JM5hdATvysfDGI9sFC0tQuu0hqntYWPtM/03BOVUh33R14bCGodeGnR22xKlWF87SCJ
	 dtsyDfoFiw64hENq6dE/wTg5cmF6gVyydlvv2rIrnhoeXQbKmeTpYloMppGof129homA6
	 L0sOqEgAw7YT3DcxIDUYvu5+9ffjPk+ZQLTVCCiFOLwEhi6nZXdwyqZptaadrOeEK/K5P
	 C3AEV1uvTlaUgjpjGHzikZQVWKuu3hlM5LoHUks116+f0R3D+pfzrl22iSdOvoh8XCg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ckVN1fN+;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D847606A6F1;
	Sun,  1 Nov 2026 22:21:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ckVN1fN+
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CBFFB1F00919;
	Sun,  1 Nov 2026 22:21:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793571710;
	bh=hZ5DA9V7/pDlOG8t/lilXixJ+pXl1VQuSZjiaxN6fWU=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=ckVN1fN+yLJfTWcgDr/Kt1rgBPkewt3irbfX3Gt6Ql7p6D8KNHHbUo+Zeka/z/Ihx
	 KgKU+9VaSuJUAsL1hLldKlFfxknr2JbIyZVOy6SgeMNDE+wglOL4gUcMwT5a4w/G6V
	 VdghfwSJy+Bbnpz9ALs80wK0/9r89P7HvL48g0W2oUxH2x+2ymhS57gQd3v8BkhmIK
	 61kOgBDHFvVOrpb+ftG0ffuGjsYh1X2ksLdv+6d8s/JF1VQGDp5+IPdp0e6J/D+BcZ
	 JpK4Z8sGFWKy1oxaHxvlEPWu0qdXLtBMlQGBYAZJ7rUEmFFTJv4Zzsb23I/yGJZuCa
	 CHG2jpgreQdzw==
Message-ID: <sashiko-outbox-192708@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 5/7] clk: bcm: Add BCMBCA PMB clocks
Reply-To: sashiko-reviews@lists.linux.dev
To: "Linus Walleij" <linusw@kernel.org>
Cc: mfd@lists.linux.dev, linux-hwmon@vger.kernel.org, lee@kernel.org
In-Reply-To: <20261101-xg6846b-bcmbca-xrdp-reset-v2-5-455fe9eed5ee@kernel.org>
References: <20261101-xg6846b-bcmbca-xrdp-reset-v2-0-455fe9eed5ee@kernel.org>
 <20261101-xg6846b-bcmbca-xrdp-reset-v2-5-455fe9eed5ee@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 01 Nov 2026 22:21:49 +0000
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Post: <mailto:linux-hwmon@vger.kernel.org>
List-Help: <mailto:linux-hwmon+help@vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-hwmon+owner@vger.kernel.org>
Precedence: list

> Add a BCM6846 clock provider for the Processor Monitor Bus (PMB) MFD
> cell. Expose six outputs from each of the RDP and BIU PLLs, the Runner
> clock divided from RDP PLL channel 1, the crystal output, PVTMON and
> block-zone clock gates.
>=20
> PVTMON and zone clocks provide gate control only.
>=20
> Signed-off-by: Linus Walleij <linusw@kernel.org>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261101-xg6846b-bc=
mbca-xrdp-reset-v2-0-455fe9eed5ee@kernel.org?part=3D5

