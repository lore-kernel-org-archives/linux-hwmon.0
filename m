Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D5CB30E0ED
	for <linux-hwmon@vger.kernel.org>; Thu, 21 May 2026 21:30:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779399037; cv=none; b=ZQU9V1N1bqlIMSVy5xdReMMlZoRcNzwxfkrUwlugibgH5iXtwPEesorKOkjYtdtqdg0jeaiubCxItd/FqCgv2GBxD/MHh3gxcgGECkmWC2fYXRHpm/hioHC9rCld23IQk/9U1YiVQ4gX5KiRLcY+v2cRYeORag7bVT2gtNUOr+Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779399037; c=relaxed/simple;
	bh=7LuCRVBTLG+OZi8jyIMs907nQBc8/SZQX/+B9aiOWIU=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=vA/gZHAG1MHqmABMbbpq2XCwxyk4VF1CQsLMuKRFL0211pVT0Ot+t8mOKSrvB4fpm7voKt7CHkdd7MlcDzk61z6NsiA9Nf7G8OPYP8G0R63EhWZrHocRnYzX0OKmWrF3Qx0LeRksulEQisann0Go+NjhOlWTAudMBrvAPEaxhjE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lD8GjeCV; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lD8GjeCV"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C803F1F000E9;
	Thu, 21 May 2026 21:30:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779399035;
	bh=7LuCRVBTLG+OZi8jyIMs907nQBc8/SZQX/+B9aiOWIU=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=lD8GjeCVMXo2Iqp5QhdNfjo3UOfs6RfKlqLpF8Mro5Lu8tobDdrsN2s4rl/o9RlWK
	 5hxXoyQONsyqb+L/7fMSC334ihQ7ci31WwyOEbiegg/zBPXpTGz+C83INW+UOWeD2F
	 T61UE8lte2J1/oCs9MZ2LtoNYa5JmkjokB4WACDVe4B4KLSRPJRoCm/ocNqnwcs/8N
	 rjvoPtwwGCuEFsB/VExbMjpG852ZBDre6fll8KsW8QuGTNzD+OtqihOmtGe9tNG0ov
	 XSHJkGo9KvX45yadgysoq05jNs2t7gDIe2BAsfeoYtrzbUVj1A6VGTD3BrZzr7GiIF
	 3rcNOwZMFFp8A==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] hwmon: (nct6683) Add support for ASRock Z890 Pro-A
Reply-To: sashiko-reviews@lists.linux.dev
To: =?utf-8?b?UmVpbmVyIFByw7Zscw==?= <reiner.proels@gmail.com>
Cc: linux-hwmon@vger.kernel.org
In-Reply-To: <20260521212632.223724-1-Reiner.Proels@gmail.com>
References: <20260521212632.223724-1-Reiner.Proels@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 21 May 2026 21:30:35 +0000
Message-Id: <20260521213035.C803F1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

> From: Reiner Pr=C3=B6ls <reiner.proels@gmail.com>
>=20
> Add the ASRock Z890 Pro-A customer ID to the list of supported
> boards for the NCT6683 hardware monitoring driver.
>=20
> MIME-Version: 1.0
> Content-Type: text/plain; charset=3DUTF-8
> Content-Transfer-Encoding: 8bit
>=20
> Signed-off-by: Reiner Pr=C3=B6ls <reiner.proels@gmail.com>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260521212632.2237=
24-1-Reiner.Proels@gmail.com?part=3D1

