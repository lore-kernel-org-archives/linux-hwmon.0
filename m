Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2AD533BB12A
	for <linux-hwmon@vger.kernel.org>; Mon, 17 Aug 2026 09:47:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786960059; cv=none; b=Mxsi3DhPUiqz2fpJeDCrvZ9ptzZbkAVTmkAFLJAqhvW3TLsQlZS3EhC/saullyyFVg7OHsbQLro6y/RN2FVJnvT6rWBNHX3YDmSq1q5ehe8bvqvVUTBP9A1YezTawwLhtPLrlVWKjg9Si8Qxc/bGDaoviRROzBloCnTKUsbT4tE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786960059; c=relaxed/simple;
	bh=XLPBLkePdQxwmRinJzl7+CV0HJ7h+ONzsEtPcIQbyfM=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=i1EX7Odiq+Isz1p1mF4EfCsIn8XHytTfzskEPNWvOGIQWyznIGhZWLkR+0HNC3ZHGkRebqYdRVhpSWDXRZlBtNuOBitaXeIc2hkJQf3YFzP7s6ViC8fWdDKy4qJc8OgGBwsWslFMESZUG1BpUbV2gOXewd8rfJzJLGHWb9ZbWgM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HffapJSW; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HffapJSW"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B0C981F00A3F;
	Mon, 17 Aug 2026 09:47:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786960056;
	bh=MBOJO2Bl/+uZetbV7xUty379NnDNCbo9vbR5KgZqI2k=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=HffapJSWVa79HiFv59K3AU300Aa7CeKFZ70oE9IlsPOQaWHqfXT6D/vMN0LfHv4r6
	 k1/ReuAKY97kEmIZ5s+qmhxAupELkI+c4uw0xyorzk66m/ELRHPILfOWDFvShpmJtR
	 sUD4uYyDAkWNwfcPZHKQioEsUBi0Mh40yKqI22NNMRSv9duA9HnFJHBiUy+fJb/MX7
	 xMqRPwupg5MV4qQgLLZ0MTD49Rmz7fZfcb/sdj0yWI/AFct228wt/m6+HxruMZskmQ
	 1iEnjEoUThISPSXOQCbX3E53AwW5asOX7E5L40Wxli8iEYkm4nw1Mbm7JDRKwJlEya
	 cpBiiKvdUWzJA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] Documentation: hwmon: replace a confusable
Reply-To: sashiko-reviews@lists.linux.dev
To: "Antonin Godard" <antonin.godard@bootlin.com>
Cc: linux-hwmon@vger.kernel.org
In-Reply-To: <20260817-doc-hwmon-remove-confusable-v1-1-dbfbaa8e952e@bootlin.com>
References: <20260817-doc-hwmon-remove-confusable-v1-1-dbfbaa8e952e@bootlin.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 17 Aug 2026 09:47:36 +0000
Message-Id: <20260817094736.B0C981F00A3F@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

> Remove a confusable that prevented the pdfdocs target to complete,
> prompting the following error:
>=20
>   Latexmk: =3D=3D=3D=3DProblematic refs and citations with line #s in .te=
x file:
>   Missing character: There is no =EF=BC=9A (U+FF1A) in font DejaVu Serif/=
OT:script=3Dlatn;l
>=20
> Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260817-doc-hwmon-=
remove-confusable-v1-1-dbfbaa8e952e@bootlin.com?part=3D1

