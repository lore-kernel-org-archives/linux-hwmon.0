Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67E1134BA5B;
	Fri, 19 Jun 2026 09:44:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781862262; cv=none; b=dEOgJ6QsgJk0tfmoaqsqzAWnSGkyfIz57Q2zJp0xlD9RrTDV2GIyG6IcqWycMdt9gxavlVAhLJdNAKLSufbhKflSucMMa9ijLPRgusikvF0shYRjUURgTxSXhjR/TBkljTdAOxGW6MmeCmUABCVYSrCFMdp2Cj3HXR1aJqbooVA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781862262; c=relaxed/simple;
	bh=Q1OWbMr02l7jrlMhkYC1M/4rdjypG+d3wiMACV8ghqo=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=ulRpjEZ7y4EGlsurkhyNqv9Xns0UKLBM3PlCA85cD3W5A5oCjJm3jnsZgAzpTyn9CKs/QqJwbnvXwg3RTz58D5XmgnZF/1Cshuh1oEmN3FCfONFLMaSVouGJEbX/qALkRuf+OSDFWTo26yCPMAkjHhriFGWl6duGl+f5BhAYspk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ljEotMxK; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ljEotMxK"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F0AE21F000E9;
	Fri, 19 Jun 2026 09:44:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781862261;
	bh=Q1OWbMr02l7jrlMhkYC1M/4rdjypG+d3wiMACV8ghqo=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=ljEotMxKThQADj4ELxbuy1UTk6s9cAAsN/O0aBx43iKqSc38InCCCBID9OtX3+WFg
	 FOd0ZTkuPlqj8ZyfsOYLDWP3GEkMgfLYWdSt+bGqFtIZL3Hkp0p418/H5dHwlug2Sw
	 hULTQ4XstUz3uU6B8g3QHYPKg0e78HlQrsPb+i8asIrstoK6Q9spf5MdvFS65+4bwn
	 Rq4QBPDUcsmlST4GwM36SupIVjSsRF1Mm7FVb87ZPOgFKzRLyOxkysxh18kp9xP9G/
	 A9rLL33C2BPoLtBi44ruDZumpcRDfYvy0SWUd53yBimOELOwPMGkzH5KXoC8a7zvij
	 bEyV0oy+tDukw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 2/5] dt-bindings: firmware: svc: add hwmon property
Reply-To: sashiko-reviews@lists.linux.dev
To: tze.yee.ng@altera.com
Cc: robh@kernel.org, linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org
In-Reply-To: <be798fdfb7ec76e1f7d04c1fd00126c88c8a2e31.1781861409.git.tze.yee.ng@altera.com>
References: <cover.1781861409.git.tze.yee.ng@altera.com>
 <be798fdfb7ec76e1f7d04c1fd00126c88c8a2e31.1781861409.git.tze.yee.ng@altera.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 19 Jun 2026 09:44:20 +0000
Message-Id: <20260619094420.F0AE21F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

> From: Tze Yee Ng <tze.yee.ng@altera.com>
>=20
> Altera Stratix 10 SoCFPGA supports hardware monitor access through the
> service layer mailbox. Add an optional hwmon child node to the service
> layer binding so device trees can describe the hardware monitor.
>=20
> Signed-off-by: Nazim Amirul <muhammad.nazim.amirul.nazle.asmade@altera.co=
m>
> Signed-off-by: Tze Yee Ng <tze.yee.ng@altera.com>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/cover.1781861409.gi=
t.tze.yee.ng@altera.com?part=3D2

