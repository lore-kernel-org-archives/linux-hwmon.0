Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E601F1E8320
	for <linux-hwmon@vger.kernel.org>; Tue, 16 Jun 2026 12:17:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781612277; cv=none; b=BzGbc19wWLoWTYZxGdD2+ri4qgK/UuY4/eYiZnry0EsGXctHGyrDFQlNeFJtFetT1JSVhWFdDDLkteYjpKq5qA2JH09/tl6F/tnhAUGV4P902j5pUizanhGJ7GNw/BBAjgse86mBHP/LG/QiAv684QUsqQL0IdKGQzBCm5AjK1Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781612277; c=relaxed/simple;
	bh=1Ua5UYJAHVXuEEa+ZfTQQy0QLgpzC083adNvPICCHs8=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=eMpLlhLeNIMblRZDAUPPvK3SKJMQasiKM8FrmbBX/s8iJnexx7mZGHECBXTPIsk9YHznaQOOsx3fGnjZYv0pJ8sns3TGoC/hQCQ9FqbHTBgrD3G6JNLZ7/V+NPJpD3bta5shYTQuwCa0SE3NHU7666Q49tDIqGa651XbIVSOVzc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Icr/G7Yc; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Icr/G7Yc"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B9E041F000E9;
	Tue, 16 Jun 2026 12:17:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781612276;
	bh=1Ua5UYJAHVXuEEa+ZfTQQy0QLgpzC083adNvPICCHs8=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Icr/G7YcsAIbRa7LtODHz7iF3gjpn7g9Cnacws4it8D7/ZeleBy1LvG+IiG0G8i53
	 cpfA6IEfccnlyonEONnU79NKshbIOgNiqPyo7yEBE6S9upp+qML2l0xz7oeoBLLYQA
	 z9dRMcN6IIBL59uqQ5xIxT2myX4OW/F99YPAMIPT5U8lPyJExPOWd2RXgjRPyV9pqB
	 IVM45YI441YCt4iGZIxaPEw8gv7FF7jOITcihdfDn7VZxZrm0wdJulWUJt1xTye0t2
	 tlp10hTxILn7l1QUcnfICeIb9vgkRYNm2iVBEWID7WxbjoOFykT0Y7Rau41GMxImjz
	 xYa5Z3ZoMGemA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2] hwmon: coretemp: Fix documentation wording
Reply-To: sashiko-reviews@lists.linux.dev
To: "Ximing Zhang" <xzhangjr@gmail.com>
Cc: linux-hwmon@vger.kernel.org
In-Reply-To: <20260616121549.29484-1-xzhangjr@gmail.com>
References: <20260616121549.29484-1-xzhangjr@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 16 Jun 2026 12:17:55 +0000
Message-Id: <20260616121755.B9E041F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

> Fix two minor wording issues in the coretemp documentation.
>=20
> Signed-off-by: Ximing Zhang <xzhangjr@gmail.com>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260616121549.2948=
4-1-xzhangjr@gmail.com?part=3D1

