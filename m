Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794948866;
	b=OqZfUmg6O46PpWQPW1sYYMTcMxl9ZQpCV47r3HEs4xnoRacfjKbOIkLVzTXOm6AC5OVI
	 sdvPB1C7YpR4D+tlV3PAGPE5hKhhQ8hz7idBiAde9xiu4h9XPyhYHKxEqHYHECN6uV/j/
	 P//RCDUo7t+VCfP37oABuv72El7kdNb3gKOtiTJZQI+Wi+ZsT7A/TbQY4LtUegRcA2W+b
	 ucqt9oUmaN3TqlxGi/c03Crj2u7XbqnlBghDgPSWZ0d76abvlxYjhqvSrRzBS3gDF0CRk
	 Ks2E40cBmojoEGTro10/S6uCDWZRSMa3fhjGwkfHO+v8XdpktNwGpJlMsPycBmyAorA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794948866;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=J/YUsmEuejjdiOECEbKpeDsd6YwW18iVVHWPIRpinmM=;
	b=DT95fAYtDw3ZDNuPTW9IRw95KUFvpp6ElQKk15uQTd5IJSeMkjidvyAC8qDuyI/CpId9
	 GL9r1Fe/yQU83Zz1VfekHghrrB+LGMjV3vTI5O9nweBqTFvx0QwwLr6x+Y2X2GLRug93l
	 YtubTeLJlACqpEz4/DoN/BaBPNLyo3LEuCEyvyVTLJtTGOYBGla/fbC+ABA+qLvJS2n67
	 3Z2Nwt1p4MStXfVW8nF7FkfnfxTD7+7SFS/zBysR/lYZNjxjRz03cTHOFW14bdrjceumQ
	 nXOdENPkJu1HhpKa8RS05gvufh8AnyrfvCnRq5hUcOpzTMSL881YieH9CowZ/JawR7A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=IZHrpZLj;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 550D2606A31C
	for <linux-hwmon@vger.kernel.org>; Tue, 17 Nov 2026 20:54:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=IZHrpZLj
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0AF731F000C5;
	Tue, 17 Nov 2026 20:54:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794948866;
	bh=J/YUsmEuejjdiOECEbKpeDsd6YwW18iVVHWPIRpinmM=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=IZHrpZLjAUqSqAZsZPTJZrNEz+k3gZ47IXvwR46IV4tlAIN6mD2fERV3T7BQXJoKp
	 m16fNNtidyT1PT3DJVvHjQt/BpR2nuGqGNrVviPQnpkNb6etsOpVaINXCRB/lCkMRq
	 KOLsCGJ6qXa9/0TnXKrdochc5AJ9y0PoMW6XohnWuMbtT+4vgXCvpBNmMc6WqzAlIe
	 AYoQSpHY6QWqELhYJedIJ0+pwTxLYW6yQjEonJhQDfgx9APzANRy3tdag/SL867gh2
	 EidDvLW2EGoUKuCvqqKhLm+OpBmuMetKDqTPTQcWOBEtRzQFZ/Eg4LuJ9yiNl9Lox2
	 Kcu98cB8zE84g==
Message-ID: <sashiko-outbox-219662@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] hwmon: (ads7871) Add error handle from spi_setup()
Reply-To: sashiko-reviews@lists.linux.dev
To: =?utf-8?b?VsOtdG9yIEh1Z28gU2lsdmE=?= <vitorhg20080@gmail.com>
Cc: linux-hwmon@vger.kernel.org
In-Reply-To: <20261117205132.141964-1-vitorhg20080@gmail.com>
References: <20261117205132.141964-1-vitorhg20080@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 17 Nov 2026 20:54:25 +0000
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Post: <mailto:linux-hwmon@vger.kernel.org>
List-Help: <mailto:linux-hwmon+help@vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-hwmon+owner@vger.kernel.org>
Precedence: list

> The ads7871 probe() ignores the spi_setup() error return value
> and it attempts to write on registers even if spi_setup() fails or not
>=20
> This patch returns the setup error before accessing any registers.
>=20
> AI was used for peer-review the patch.
>=20
> Fixes: e0c70b8078629 ("hwmon: add TI ads7871 a/d converter driver")
>=20
> Signed-off-by: V=C3=ADtor Hugo Silva <vitorhg20080@gmail.com>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261117205132.1419=
64-1-vitorhg20080@gmail.com?part=3D1

