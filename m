Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792535567;
	b=MX8/qXRK0lJnZPoGrpSpHpFyOJ8r550kfKE2dxY16f0nHp8EBGlgTD3rXwWs5I+tM3tI
	 fvcQ6iNlWu7xaDEcm6KoC5BNyMpVwvKJfi2j6HbEfyfkb9H8MJjuIaekDx1deOfVVy6s+
	 7FulzJIg5c57pDefP3nmVMYS4X7FFt6aUel1Rdbg9MCfGTVsUs7D/0PhdeW0kd2JPGVAQ
	 BGO1P5zWa5Sm7EG+/+jMys4TXFwOm9+r2EMPvqPs60nKNwfWuySVtIHpp/CLCQRp6mf80
	 tz5nDEG9p9VBAMsknqjxO6CyuP1PnD3tNLwf5zIUJ9uyKFyx0FwgLWpYvm3zEaYIc7g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792535567;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=9Q8WloGY9VADCodXxYbllOWp6f5LjF32uMYJPEFLW8Y=;
	b=hU9qcUgaXGVehH+3Hce5HX9ZGS8RvQdi0gaUvs75MuX1r15tCVvBxmzvtdHNgGzJha6q
	 DiKBdtUnboqQtuBrnl9gPXNB37iSlHFH2xmXvxckjIJM9GuZm+JFybs8bmatfhYD5UT6a
	 Gq6NAKaLhGPIP1dexqn+Y27SM52X2YdeuxO4XcfEm2yg4EnbULkFpDOeIPeI03vOPonfd
	 0bRC1aBOPwCfErIJI+MaOXC2IhM1Uh+KWG4+7dVLvtQUkCItrq0HxXZtL47D8wwWjKeY2
	 Yqs+hjdoKiDkNTJJ47Wo5+wXcgVviWi7SPFfErUXVvhnOaR/VBfZ4xfW6TEvNDqSsRQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=KoLf5bGj;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82C47606A319
	for <linux-hwmon@vger.kernel.org>; Tue, 20 Oct 2026 22:32:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=KoLf5bGj
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2FEA11F000C9;
	Tue, 20 Oct 2026 22:32:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792535567;
	bh=9Q8WloGY9VADCodXxYbllOWp6f5LjF32uMYJPEFLW8Y=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=KoLf5bGjamDEzyQwOyirQkGOQnGD08Bx5axphCbfSyPYV8ARmXXUs0+zvXpW/6sF5
	 Ps73JWcArDb24vk1y3OEchosgxTNqV2fsLtuR33Orb8oN4lZG/C6U1Jkxb+WgqGGlG
	 7m+evP9vflC/rdwPeAicPXecJC8cjPkFpg7WxA9iwcljp7vWx0TUuI3jeSmllp2G0n
	 LasJgQc8+Q0bsyallhoJqf/9fAd6SbKBMogzPPt/n+0cwnl3aZI/JM1KkBc/BwRq/M
	 Ntm3DjAnmy4oHKH85SRjgmY2+HFf3XhvHWEAxaqH0zL6wE3RSjBeD8jYvUS70s6ejH
	 0KJ78yickNzBA==
Message-ID: <sashiko-outbox-179531@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 1/4] dt-bindings: vendor-prefixes: Add TDK
 Corporation
Reply-To: sashiko-reviews@lists.linux.dev
To: "Abdurrahman Hussain" <abdurrahman@nexthop.ai>
Cc: linux-hwmon@vger.kernel.org
In-Reply-To: <20261020-hwmon-pmbus-fs1412-v3-1-51df629e13d7@nexthop.ai>
References: <20261020-hwmon-pmbus-fs1412-v3-0-51df629e13d7@nexthop.ai>
 <20261020-hwmon-pmbus-fs1412-v3-1-51df629e13d7@nexthop.ai>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 20 Oct 2026 22:32:46 +0000
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Post: <mailto:linux-hwmon@vger.kernel.org>
List-Help: <mailto:linux-hwmon+help@vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-hwmon+owner@vger.kernel.org>
Precedence: list

> Add the vendor prefix for TDK Corporation, the maker of the FS1412
> point-of-load regulator.
>=20
> Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> Signed-off-by: Abdurrahman Hussain <abdurrahman@nexthop.ai>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261020-hwmon-pmbu=
s-fs1412-v3-0-51df629e13d7@nexthop.ai?part=3D1

