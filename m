Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794463479;
	b=X46A1cne61ZoRt6OUc0oefnDibCs6sfOJjmNLX8mgcHiOFSYmn9wOlTdR6myG0awvR0R
	 WPGaVdR3Mu/IME5l6KGpMIubTWUV/FqaeYlhcw5vQkfyCXhxmCWBb5NuHyQA1Ic+lu/+I
	 vcoCPu3zH+qCd/ddewe1/3b2U6NOsSpkYG4rjj5sMNrTwhCuuFow7A5teL7McSnWVy0HW
	 Dme8veYdG2/WB4Diu496CCmWLwVYd0g1ul6PMbCgRZ0fKvxhtSjpt2w3tNiXR+gItW1Vm
	 lOb04sfO79HCPqvGWUEQfnw51PSgJTkB1fb+PBSDLChm6KkyVKtdfBYOSmT3oveVCMw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794463479;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=9nkYyFtsFhOnv+iV4mupy8SRet8r79RiDqz4W6IB7/Q=;
	b=CS/yxOKs8vXfFst5bV7/NAtnzJjQNWAff5Phmof92KXM3mVZqqbAMTMD+wyZCZFDhfEI
	 SGAHJnOlJf3R2skU/JjyGaEmaWX8GlFV8rfrI7w9B2lrByiw6I6IfkaGFLfIKabQKuaMe
	 YV0wq+nAFT7kFUtE6+rZvZ7yiCWKGbuW6JEmPbUoV7UfBXNxScCXVXlL9/4emGpZP4+q6
	 Ne3O4sd26SRxRsXK6nGf0FH4q48Qgi9B/fdBatNw5mzDAXitB6p6uzw5DJ6HMcuGNQk48
	 Lm7XHlrc5WP3xiC3W1WvPJEZldI+fAezU0oWiI8IluRTYY7JCNkcSSYkxH4LYwXIYXA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=fyZ2hb5O;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA31A606A321
	for <linux-hwmon@vger.kernel.org>; Thu, 12 Nov 2026 06:04:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=fyZ2hb5O
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1D3291F00A05;
	Thu, 12 Nov 2026 06:04:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794463479;
	bh=9nkYyFtsFhOnv+iV4mupy8SRet8r79RiDqz4W6IB7/Q=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=fyZ2hb5OL5vGjuGgbj12NPxSfxILlsCcO4WJDbNnB87nw2i3Hr47tOFmBxMS4822Y
	 gfSQvvS7c+yjl1KSgB9Fe9YzqxYE3A3G3FU/IP8LKs9B0LFlNfGDo0f7e1ebJ0X4R2
	 UfnTyyIauzkN01acTGZ7Wh445rFcyGZae+WrMTdiD42N0vpwc1x21G0+2mBtEoZpTA
	 wAMi5H5CUI0HO4JPADloADC+lh58umXmwu/sO9UscK61YSJsP2eC8lbe9BqH33Y+bQ
	 YLmGuodMuWo8MRwk1KnnrHFlUW2AilCETOmS7BBkdnJEAyMPtQp0zymnk6ECKG1Vkx
	 HVW6Pg4TuhRhg==
Message-ID: <sashiko-outbox-210495@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] hwmon: (sht3x) Fix alarm attribute names in
 documentation
Reply-To: sashiko-reviews@lists.linux.dev
To: "Wayne Ho" <wayneho219@gmail.com>
Cc: linux-hwmon@vger.kernel.org
In-Reply-To: <20261112-sht3x-doc-alarm-attr-v1-1-91676362d133@gmail.com>
References: <20261112-sht3x-doc-alarm-attr-v1-1-91676362d133@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 12 Nov 2026 06:04:38 +0000
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Post: <mailto:linux-hwmon@vger.kernel.org>
List-Help: <mailto:linux-hwmon+help@vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-hwmon+owner@vger.kernel.org>
Precedence: list

> The description of the periodic measure mode says that "the alert
> attribute" is set when a reading exceeds the configured limits. The
> driver has no such attribute, and never had one. The alarm state has
> been exposed through temp1_alarm and humidity1_alarm since the driver
> was added, which is also what the sysfs interface table further down in
> the same document lists.
>=20
> Refer to the actual attribute names.
>=20
> Fixes: 7c84f7f80d6f ("hwmon: add support for Sensirion SHT3x sensors")
> Signed-off-by: Wayne Ho <wayneho219@gmail.com>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261112-sht3x-doc-=
alarm-attr-v1-1-91676362d133@gmail.com?part=3D1

