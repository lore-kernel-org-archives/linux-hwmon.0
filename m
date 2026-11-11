Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794380042;
	b=wTe562KXCQA/NXKOx25+CGnQs3wph97zNoAQSagnlreJv3uatjojqSOTCsh5GgW/QqqY
	 NfhOSY9YDlWHO5AyoED1+ITABYE6OH6FLVT+eWjLY92Wk9GbeHV1Yx4gl7s54CaVlUeoe
	 G6LKggpN6ZQpNrmzd42cOiCV4pvf1Y/g5r2WM/az415u/XfMq3DDy8z09+ix4YZB+rRE5
	 Ke+ofFwdC24dIhYgIjg6Bm2j1LJv1JW7XwrFyEPXgSSN3zbRUef6wU2WuEwJwyiz38O74
	 FReakjB6cOLblU36CkolTUT+/Oa3EQfKob29w1dazh+TvDwhvS3kM0yxGIb2h7+CYDQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794380042;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=cuU2q7FVmMK2X4Obj5s6jBJNageE6TbZtLZ+09cDCyg=;
	b=nsdfQW1HvHP2VWdYtLYmLEpXpGP+VF/3JHEwZpXlAU/ZVRzYjgnoSCA1PkzmnSgoccoS
	 cIYd1mFpSbVysPiNUtt8Qng4CDDCB5Y590XXYT+1qKmpHim1nF0TzMV5xc9nnCBOpLSzs
	 njfrpwRvgnaM3A9STI7POOtbcK9r2SZ14Ict5tYYKsfs6I3iGXJMkOkapm5pp2bJ1PLaA
	 OJF2K8pb8OzcQAKHLjHcp/w3+VPzkfVzMs/DyV2kYVUqn8slKlMJ/21pgU7AGptnBK7tJ
	 QlMU2/z8btG3ZOvmT6U8h+UmZYkXpLSygospJ2UBeue3MseWdN4gTGnfACumBqxeGZw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=M1TOgfzD;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32592606A31C
	for <linux-hwmon@vger.kernel.org>; Wed, 11 Nov 2026 06:54:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=M1TOgfzD
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A0A301F00A05;
	Wed, 11 Nov 2026 06:54:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794380041;
	bh=cuU2q7FVmMK2X4Obj5s6jBJNageE6TbZtLZ+09cDCyg=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=M1TOgfzDXPHKeV8P2koOjwmFO6Q2pIgUlIcrTXBDQsHl2N9a5NyOISEMLV2jQ9XoA
	 3OSCwxb4ZE0rkOKlt8VM2ES+tQyeuy+vXx7iYHFHEPsaR0ggi0Ndc2eGxKe68FHfzf
	 BpHqnEPBV6EcJXEm3e4vjJ4ne8xFEel3N1mj9cWmgsV4NDTrE8V9xQwpT2dS6JSWzA
	 tEvMb/9yOnSoz9i1lTLbQWDSUFS+ayZORYjkiRRmuI2CqkyuC6tNh+aBq2s3BwGmVx
	 YYlfWi9LQ4shx/Ua6eohwMPzIf2ZkctbETtdK9BslNq+7YVFql6lik/+vHjadWI0C4
	 zZEat7E0V+8Lg==
Message-ID: <sashiko-outbox-208467@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] hwmon: (w83627ehf) Clamp voltage limits before scaling
Reply-To: sashiko-reviews@lists.linux.dev
To: "Zhu Jun" <zhujun2@cmss.chinamobile.com>
Cc: linux-hwmon@vger.kernel.org
In-Reply-To: <20261111064831.17299-1-zhujun2@cmss.chinamobile.com>
References: <20261111064831.17299-1-zhujun2@cmss.chinamobile.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 11 Nov 2026 06:54:01 +0000
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Post: <mailto:linux-hwmon@vger.kernel.org>
List-Help: <mailto:linux-hwmon+help@vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-hwmon+owner@vger.kernel.org>
Precedence: list

> in_to_reg() narrows the sysfs value to u32 and multiplies it by 100
> before clamping. A large positive voltage limit can consequently be
> programmed as zero instead of the maximum; 4294967296 mV reproduces this
> on a 64-bit system.
>=20
> Preserve the input width and clamp to the representable voltage range
> before multiplication.
>=20
> Fixes: cf0676fe42c8 ("[PATCH] w83627ehf: Add voltage inputs support")
> Signed-off-by: Zhu Jun <zhujun2@cmss.chinamobile.com>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261111064831.1729=
9-1-zhujun2@cmss.chinamobile.com?part=3D1

