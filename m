Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9327E3D4129;
	Mon,  8 Jun 2026 15:32:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780932734; cv=none; b=VV6sdD3Mv1e2qFiiSJqgzhUAI7KFI4Egv9CWPJeu016zLIdSRDL7oLu5NyOSXZF7Y/fS5kVWRejs/kz8oiGr+G/HNBkSFXXrwFcOM3z7Xh/5Iugo4UxnaKgsQoATexfy18uPVRgEyp5tmaZTinwAjwaTJ1fo+d/L3sFT6ad40fc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780932734; c=relaxed/simple;
	bh=Cr5P6UnVLY0Djq4F+KHqIlP4aLdikcrY7PkYgIUvDwg=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=cB6emYV19Dpt3ybC7TZarPOApvcYVq5fM135P0n9UsTRgClUUPC4vlrq/T37Oxvj6wnBDIqXZZ2zy8/9QMYG//kAzFtOdRuzAe83dT5qrkqjEuDHOpZBpNFfYyWX8MT2MKuvo30zASMaw9yTTG6n3R/Y5Jq8RazK71yjzvPhaNo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CkrzNhS3; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CkrzNhS3"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3795A1F00893;
	Mon,  8 Jun 2026 15:32:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780932733;
	bh=Cr5P6UnVLY0Djq4F+KHqIlP4aLdikcrY7PkYgIUvDwg=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=CkrzNhS30OF/8c5j6VRuq/tnC8Hl3HzPWX6Oz7Cuboz+xPJfcx6gu070Sy8dpV/IU
	 eRSxUqoPt0qrNBU0wHHaTePC/ssA3tyPaWJjmcEIg66LEkq2KogGo52WOtARUfyYTV
	 WryTmdfJ1lD92/CKepQ+S0E50D8kqyMzrLXrMEvxcmwEz7LaeLgwI4EXIrZLjNeuWG
	 X82yXoQVJp+pc1gVYmfhhATg6jWYU1pfo9CQh8Y+iRm7QRA3nYSACczXPCTeoe2bjp
	 lV28YBsFytjlgrObDb+9yPhEDnYEeWq/K2Ef95/hOmbK4vXkUKA6Pvq7t5fdQPmb4K
	 mfbjwJCAjouZA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2] hwmon: (adt7462) Add of_match_table to support
 devicetree
Reply-To: sashiko-reviews@lists.linux.dev
To: "Romain Gantois" <romain.gantois@bootlin.com>
Cc: linux-hwmon@vger.kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org
In-Reply-To: <20260608-adt7462-bindings-v2-1-272982c40325@bootlin.com>
References: <20260608-adt7462-bindings-v2-1-272982c40325@bootlin.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 08 Jun 2026 15:32:12 +0000
Message-Id: <20260608153213.3795A1F00893@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

> From: Kory Maincent <kory.maincent@bootlin.com>
>=20
> Add of_match_table to add support of devicetree probing.
>=20
> Signed-off-by: Kory Maincent <kory.maincent@bootlin.com>
> [rgantois: Removed of_match_ptr().]
> Signed-off-by: Romain Gantois <romain.gantois@bootlin.com>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260608-adt7462-bi=
ndings-v2-1-272982c40325@bootlin.com?part=3D1

