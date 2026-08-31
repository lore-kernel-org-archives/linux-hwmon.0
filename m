Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 611BE46EF73
	for <linux-hwmon@vger.kernel.org>; Mon, 31 Aug 2026 15:32:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788190375; cv=none; b=urdA058fYyJR76XFq/SWqHtsvZq/qrL/r7AUrWdYTPLwmvx/Yfex2TLoz1W3dYvNHJMjSf/SOf+67WurYg6d82FDOl/HkdEOncKuuFa0PmfSGe9+rWNwiPdiYdvINBTb36v2TgrJRFRkU+uVybxkgpVCiA1klYZKUeE0fOSo0+g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788190375; c=relaxed/simple;
	bh=SfT0NOfMZ++22B790TINl9Kbcjkcy3Yh5QGjROfVCt4=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=hsuV7A5SE/gUf89h+lV89bkPV8mXtkRmo8p51U1ts2/87+4XRRMPXBvq5xUIpc57JUhH6rpVzpkg6LTXdGTbSY9YWO3l2QDlr2w7XPm+RE+I3G3wvyLLc1dZpp83un12a4+Xp8K2o05ZD//xoxTEmglK+KTSigl/avwLwirB140=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HzqFUF+6; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HzqFUF+6"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 254491F000E9;
	Mon, 31 Aug 2026 15:32:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788190374;
	bh=SfT0NOfMZ++22B790TINl9Kbcjkcy3Yh5QGjROfVCt4=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=HzqFUF+6/Tk8e/t3O+ohn4piCS5CxDip/UxQXzHEGA2aAECzqHc48VmiNOgxwodJZ
	 ex/r5MZx5o1TYkelLwncJ2D1FtP8OpC5yz2FWexup5qdKY0QlztAnRUcEVPtbG8DcG
	 paRjFSKbMj1oUWmccbQtJ5AMJ28rvzaHraqnPmALLyw4RtHVPrRcZvII9afaVempZ6
	 OjlTpiIw5gAasr+dnUh5szp+bOtVrfXeMY0Zq+CU1FQX55vWcK/FbzDFPB+mhYnpnu
	 neWwegQMb01Y3wzzP9No1c6/GHMimAE2a4CfUXEbOBJrSeR4rP6u9sji9mhxr+Dh6+
	 o/DROflvxvmIQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH AUTOSEL 6.18-5.10] hwmon: (pmbus/lm25066) Fix PMBus
 coefficients for LM5064/5066/5066i
Reply-To: sashiko-reviews@lists.linux.dev
To: "Sasha Levin" <sashal@kernel.org>
Cc: linux-hwmon@vger.kernel.org
In-Reply-To: <20260831133314.4125787-321-sashal@kernel.org>
References: <20260831133314.4125787-1-sashal@kernel.org>
 <20260831133314.4125787-321-sashal@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 31 Aug 2026 15:32:53 +0000
Message-Id: <20260831153254.254491F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

> From: Potin Lai <potin.lai.pt@gmail.com>
>=20
> [ Upstream commit 83dda7ed185501ba1f8165aeca83ff4a8ef7c263 ]
>=20
> Swap the high setting and low setting coefficients in the lm25066_coeff
> table for LM5064, LM5066, and LM5066i. The coefficients were previously
> mapped incorrectly, resulting in inverted current and power scaling.
>=20
> Additionally, dynamically assign the exponent (R) registers inside the
> probe's LM25066_DEV_SETUP_CL check. This ensures that the proper
> exponent is applied (e.g., for LM25056, high setting power exponent
> is -4, but low setting power exponent is -3).
>=20
> Signed-off-by: Potin Lai <potin.lai.pt@gmail.com>
> Link: https://lore.kernel.org/r/20260611-lm25066-driver-fix-v3-1-9d7d4b4e=
253d@gmail.com
> Signed-off-by: Guenter Roeck <linux@roeck-us.net>
> Signed-off-by: Sasha Levin <sashal@kernel.org>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260831133314.4125=
787-321-sashal@kernel.org?part=3D1

