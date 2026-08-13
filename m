Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64DE634D38B
	for <linux-hwmon@vger.kernel.org>; Thu, 13 Aug 2026 17:15:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786641341; cv=none; b=kz5xPheJ4gRsflESNiNB5+46x7Ub6FjCjSp5ItNJ1fl+p8OE8RNAYcbsTpQPMX+tvK8LqSQWg/8wBYYAURqSpYZYcvdnXt3ewv8ZZvqCS2ErtGZhoiSR/OPK5/+Fr5EdgmU5GVRdgncCAxVC8RlY6cghenj0wkXrLJqhgHOjWnQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786641341; c=relaxed/simple;
	bh=6KT7niqib6/LsjUiit8XOtZKj2Ji3WsYir2BkdtTYhQ=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=tKekSll2z58IRKqvAIxFgu/KbsjzASrrTHhQh9s/fy/Y5jxNH8QhY9dL33s46S3dI9uAKhdb0Yze5RLIkXDEZLu02Qs3U79R1TgDmCWlj604nz1EiDGSAk/CqItAGMT8TrgGisNRI+na2zwcACfQC72TX3jwZKAwh/wplAuXg0M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=aQKapZ3a; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="aQKapZ3a"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8CA371F000E9;
	Thu, 13 Aug 2026 17:15:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786641339;
	bh=6KT7niqib6/LsjUiit8XOtZKj2Ji3WsYir2BkdtTYhQ=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=aQKapZ3aylJACDAkyUlwJz/Xq2V9M/cTW00PwDU1085C/nBQVDATJA+SqzoO48gzR
	 6wLQqNnCb2Dj9jL6CldhJsE0AGYq/gtLyQ9oMq36eOapBkf5Jn7xRxFnDCkLZh4em6
	 2QY7yIa4BgH9Vp8x17pmYJxUHoGv9djPrIgoNFDzZ56CTdR81oUOR1KrGeV0vh3QdV
	 Tpu3OBQpNe5qY6hXkstCKcoIJtvh+vGKDxJD6E6Yyc4IVMCLrwkRfEJNn7wQo5i3dj
	 cPYpInaiBNS1Qo/4jNKTvqaSAo3m1b8PkHxeTMH6Ite3WQn+qdey8fj3bT+po+Dart
	 3slJMww3WLb/A==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2] hwmon: (k10temp) Add per-CCD temperature monitoring
 for Zen5 Turin
Reply-To: sashiko-reviews@lists.linux.dev
To: "Gabriel Ford" <gabriel@gford.dev>
Cc: linux-hwmon@vger.kernel.org
In-Reply-To: <20260813170232.3841-1-gabriel@gford.dev>
References: <20260813170232.3841-1-gabriel@gford.dev>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 13 Aug 2026 17:15:39 +0000
Message-Id: <20260813171539.8CA371F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

> Add support for per-CCD temperature monitoring on Zen 5 Turin (EPYC 9005)
> CPUs, as they fall into a separate model range with a different offset
> and a higher maximum CCD count than their desktop counterparts. As such,
> this patch also updates the driver to support CPUs with up to 16 CCDs.
> Tested and working on an EPYC 9555P.
>=20
> Signed-off-by: Gabriel Ford <gabriel@gford.dev>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260813170232.3841=
-1-gabriel@gford.dev?part=3D1

