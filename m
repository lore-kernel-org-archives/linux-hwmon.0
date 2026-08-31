Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A460933937B;
	Mon, 31 Aug 2026 16:20:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788193230; cv=none; b=SqmI0gqDNAYOHF2hi3WbByVresGHRzvsUXgVIX4iMjcrm+UD6HIMCSQ2mVy4QtLIKof3jU8JoBkZdrd+pYeUSH8pL0hOxFh9z8mGSgqq2+5VvIrtQSSenSFbLgbLM09d3d6iTiKN0b//BZKyB4LgtsFMKM0knzn3S19DU0THgys=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788193230; c=relaxed/simple;
	bh=RmPKeyb5JmeXl0CL43G9FYN4kuC5+5DWpMeilIw0Soc=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=EO/97EIrbSsswutizpgYcmtpHt9wVxnAHJzAJrI1sXLIia+XlxPgPh4MDt86fbQwDtfZzUF7T7aADql3uqEzSPqaXYsTxgrydupPJ8dBtEGziMWlJEKNfgXU6ptBCI5orc4UJp13X3pAaBZHYpwcn6kAKTKbOkmwSmQIvad0eEM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=H3pRWDbf; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="H3pRWDbf"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 444B31F000E9;
	Mon, 31 Aug 2026 16:20:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788193229;
	bh=RmPKeyb5JmeXl0CL43G9FYN4kuC5+5DWpMeilIw0Soc=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=H3pRWDbfuqZkm4MOmuLjAFQ7v6apyAeJWkgHiIXImYU+NGpiR+64P+SEM5XfLF9ZL
	 H1bAG/foFWM+gj/8XhMxLWTahebTBp2+btIMrgy/yiBHAVTJT2OvX/9+DAJy1AQLu+
	 5NQ0MDKGdRjfGualqCazht5PXi/mesKVkyYMEIDiQiph0cuVRnEaw60p8jaF5bwHE4
	 /BkHVGdptdfof7eIbPgnVKfdtMKdPLEm8afc8gHWLtDXELnpLBSzN2mWC0vVpF015n
	 DsBEHp6nFrDAbc4Ua5c6uemxRrrUzg62puX40+CSps5HYfa9XtxnPa73b41mZzvuBQ
	 bFJm+y9vwQKqw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 3/6] dt-bindings: hwmon: Add Sensylink CTF2301
Reply-To: sashiko-reviews@lists.linux.dev
To: "Troy Mitchell" <troy.mitchell@linux.dev>
Cc: robh@kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org, linux-hwmon@vger.kernel.org
In-Reply-To: <20260831-ctl2301-v4-3-b335d52a0570@linux.dev>
References: <20260831-ctl2301-v4-0-b335d52a0570@linux.dev>
 <20260831-ctl2301-v4-3-b335d52a0570@linux.dev>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 31 Aug 2026 16:20:28 +0000
Message-Id: <20260831162029.444B31F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

> Add the Sensylink CTF2301 temperature sensor and fan controller to the
> LM63 family binding. The chip follows the LM63 register model and can
> provide a thermal cooling device when #cooling-cells is present.
>=20
> Do not provide a national,lm63 fallback because the CTF2301 is not fully
> compatible with LM63. It uses different conversion-rate encodings,
> extended local-temperature registers, additional fan lookup table
> entries, and device-specific PWM and ALERT/TACH configuration. An older
> LM63 driver would therefore not operate the device correctly.
>=20
> Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> Signed-off-by: Troy Mitchell <troy.mitchell@linux.dev>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260831-ctl2301-v4=
-0-b335d52a0570@linux.dev?part=3D3

