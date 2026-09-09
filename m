Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E08E3976B8
	for <linux-hwmon@vger.kernel.org>; Wed,  9 Sep 2026 18:34:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788978881; cv=none; b=gV3DAZudYNmuCqCGfaPjFoLGLGSQ7X+N4pneyQYRJDsNuXFwp5uaROzsnYlz4qFI7BrpbeQfsxbHFeJuNjW3yFpCQ1hk8E2F7q7Jl00rKLzTLWwqB08pb2K56EV/yaCF9dwodzt72g4Z+Reh2XzA2JXCfFudPf5Rw00PMU0GSaA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788978881; c=relaxed/simple;
	bh=p1y8SdYf5RKrGYpJUaFJ0dBCrb5etCRhqTH6Qk9UGnU=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=d5xElR4olGFKmpBh8L/FY58UnhR9gofO/k1abc7jCvCyXALhs8gLtLr37trOY6X1nprvANkl8xJF6NTE6nxn8FRtjBuPLaBcydPcYf/6B+tlrgirVjY1Sipwl863gS0K00fh3JzU0HP+IJv3Wtgf78oo5QKHQzWhTcd8xGVl8aY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NdTh1ao4; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="NdTh1ao4"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CA9501F000FF;
	Wed,  9 Sep 2026 18:34:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788978880;
	bh=p1y8SdYf5RKrGYpJUaFJ0dBCrb5etCRhqTH6Qk9UGnU=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=NdTh1ao4HnFU1q3H5ZyNMiNISial7cDlV8YoCIFFrdI4xTEiy/mPJ5Briza+xYl/i
	 QKh5l6yk7kXjiYcw7/2r4l62HK4lzacOmTkzQ1P3HF2+OaHyK6j3tbf9q69cGQuwqI
	 8L/yIr6JTDMCQEIhe5dxiUPRc1/WTTV6AUx0HyIjWXsJAOeqDKNC65bCxacKjW0OTQ
	 IbjOlvYB8JZdMWf6husz6M5k1FfIrouvQZg4MrCgmOIgUk+AwtFD+5D7q0GCTnzEyJ
	 ySLpMl4NELuQBtpsRBOP+xchBSjmjpkWVIiR9f6uoTxfufHtc630WAcluVdjZuKRdw
	 OcqGat0Yz5MWQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 3/3] hwmon: (nct6775) Add support for NCT6122D
Reply-To: sashiko-reviews@lists.linux.dev
To: "Paul Louvel" <paul.louvel@bootlin.com>
Cc: linux-hwmon@vger.kernel.org
In-Reply-To: <20260909-bootlin-hwmon-nct6126-v1-3-4e85615fef10@bootlin.com>
References: <20260909-bootlin-hwmon-nct6126-v1-0-4e85615fef10@bootlin.com>
 <20260909-bootlin-hwmon-nct6126-v1-3-4e85615fef10@bootlin.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 09 Sep 2026 18:34:39 +0000
Message-Id: <20260909183439.CA9501F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

> The NCT6122D hardware monitor is the same as the NCT6126D, the only
> difference if the number of UARTs: two instead of six.
> Add it to the driver using the nct6126 chip kind to avoid code
> duplication.
>=20
> Assisted-by: opencode:z-ai/glm-5.3-flash
> Signed-off-by: Paul Louvel <paul.louvel@bootlin.com>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260909-bootlin-hw=
mon-nct6126-v1-0-4e85615fef10@bootlin.com?part=3D3

