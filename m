Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46DAB4DA9B4
	for <linux-hwmon@vger.kernel.org>; Mon, 19 Oct 2026 11:48:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792410529; cv=none; b=SZkijuH5CBrband003/i8eL3xiy25kerel7FHj7Ge77tfBBAhrnq+BJoO2W8MRky3p+NTwMtcRdIF+FdjVq31I+ZWppMwEKcPXRRBMQNsLpnxjhlMwJ1+WFxnyetM9kctFu68+mes4rZkKO+3HVw3zhQxkqf+0CbajWDA1sVhXo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792410529; c=relaxed/simple;
	bh=7nKBWdksxq4Y8mxign7W3TiaVGEE6jJTfpJcmUE1GZs=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date; b=f5jc9kW/zitaEYWsXY5/bhemxqxZp0qnwjNPJWx+vvbILNPddTUneBuYlEAUQWE0X3HQdD0JNLf++FDT+HnTinXWLsq+3rR0IJP25e2HkmW0xIb8KnVeSzGAIBvwlw/RMi9uq/8en6DUUS0r7NrvmuiwKpjW/oLRWyxIzAVTRdQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Lz9TmLWg; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Lz9TmLWg"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EEA0E1F000C4;
	Mon, 19 Oct 2026 11:48:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792410528;
	bh=7nKBWdksxq4Y8mxign7W3TiaVGEE6jJTfpJcmUE1GZs=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Lz9TmLWgcJRH5Rj7YvxgvYp8At47CV7bojIN3a9jbBpofbcf57TXFXry0Qlg+VtyC
	 vbTR8jTugV481LF8OUKlnT7aSqeeTvMUxRAqeutteCxx6PlUFonXYDQ3HRgZZwOiwr
	 9ABCHARKzOeNYSF4qrbvoNBUAQOsvZGzMvDs2k17uEXpX1giDXT7NuUHaO2/BFlSXJ
	 vrccAF/OKW/65kA+4I341jCLlo7rPM1JIDr87gJQ0KzIFypASxiV30F3/6PPM2wHx5
	 6vyN4p6ETX/IVZESnvi/hU1a6lWQcpg37vpfsEFAencAo2dezQT96o0zxhj7hsvACv
	 ffoOCfCoxEFWA==
Message-ID: <sashiko-outbox-177051@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 1/6] dt-bindings: peci: Add StarFive JHB100 PECI
 controller
Reply-To: sashiko-reviews@lists.linux.dev
To: "Changhuang Liang" <changhuang.liang@starfivetech.com>
Cc: linux-hwmon@vger.kernel.org
In-Reply-To: <20261019114502.55307-2-changhuang.liang@starfivetech.com>
References: <20261019114502.55307-1-changhuang.liang@starfivetech.com>
 <20261019114502.55307-2-changhuang.liang@starfivetech.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 19 Oct 2026 11:48:47 +0000
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

> Add device tree bindings for the Platform Environment Control Interface
> (PECI) controller found on StarFive JHB100 SoC.
>=20
> Co-developed-by: Mason Huo <mason.huo@starfivetech.com>
> Signed-off-by: Mason Huo <mason.huo@starfivetech.com>
> Signed-off-by: Changhuang Liang <changhuang.liang@starfivetech.com>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261019114502.5530=
7-1-changhuang.liang@starfivetech.com?part=3D1

