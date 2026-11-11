Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794380453;
	b=WbcACL4ldLcABQLbhlZNeWJsV7wkxFE1o1Q+ktMg7gbkmB6/X+o3j2FvsDCQ0k9dnpeZ
	 i5G846UuyKbFok59ts9BDP0bKiKQ9U/SWWbJkNIuk09DgHzV2HPD2adGOUDGN4pwn0r/L
	 1uAcnZcwSfQrWHXdgJCC8+UvxCttTTIGsycAHCskWSliPs7q0vBp9NHIdmRwTNfDs7dm7
	 jh9cjflj8eZcxMBfZXje6QwVkAWmbsTHBeuSz6zveTawGhWx39TcQ6eBlyUJVdMuOegk1
	 /CPYZ20LJRM0+voyR7uyxj1pMiE97qUqEx62WE7h4tYRRnGTN6gwRUWR70t13L/8wAg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794380453;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=zqg5hrEbLaBxvg6R2VzM7U1gMb3h60pU1p4/CNlA5gs=;
	b=CoIVARKrpkAkyV2krMF80jJ3tGHa9UAX1UQX9raVxDjoMqYP4GQz0mwP/IOccKjdDfT0
	 AMREPwlIYvg1DXXKZpEygO4BqM0h7mgIhvl6RDe/TPdpB1LWKiX7bHLxSsSjFwZ7wTvpi
	 qm+9YwdcTApaeSa7O4yRxyj4fBfiiqykh0P+9vnoO+0TU73hYldqieV6F4YpMMfPxFVrc
	 NHOZKQxbZecqX7U7nZMPi5PYAU55R/00Z9Umd4dcUBzMzSAShbQJBBR2PpAXuNxHCnxV/
	 rxAdeTTGDboUAlIjvDA8RMbzI4j3Gv+cqxvCi/fc/MQxODbgotOpRQymhwG6+rs27jA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ZeitnL51;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF7C9606A335
	for <linux-hwmon@vger.kernel.org>; Wed, 11 Nov 2026 07:00:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ZeitnL51
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 15E1C1F00A0A;
	Wed, 11 Nov 2026 07:00:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794380453;
	bh=zqg5hrEbLaBxvg6R2VzM7U1gMb3h60pU1p4/CNlA5gs=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=ZeitnL51w3Q1xBVitfMZrhRIe2zS13bt0/42tE6uDRQU96IOBWosBZfhYMdTOALRb
	 v5yQmnML3hSJyCDS4+kX1mCuHg91uNlFPY6wJXxOq9wJX2tEN7lmlN+1gyfvxXol7T
	 dDgeMEZAjj7XJuenIIv23RSyUHKRh+zoPSWJk8f58YpeVF4HLYyh4su02NwtJXpoTA
	 SjnO41oHLVOjjpnRT3RNV2l+9dZqlc5Y+YyqR2FDXRSMWD0ZsQTE41J7ubnf7JJgNG
	 SkHkQkLzgj3TmO23iUFHeCh9/fT/8CeyDGHu4C8hVZ9lgEAvsKYZOvYaNxLKrS493+
	 e33+E49Ppcylw==
Message-ID: <sashiko-outbox-208481@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] hwmon: (w83627hf) Clamp VRM9 voltage limits before
 subtracting
Reply-To: sashiko-reviews@lists.linux.dev
To: "Zhu Jun" <zhujun2@cmss.chinamobile.com>
Cc: linux-hwmon@vger.kernel.org
In-Reply-To: <20261111064900.17338-1-zhujun2@cmss.chinamobile.com>
References: <20261111064900.17338-1-zhujun2@cmss.chinamobile.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 11 Nov 2026 07:00:52 +0000
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Post: <mailto:linux-hwmon@vger.kernel.org>
List-Help: <mailto:linux-hwmon+help@vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-hwmon+owner@vger.kernel.org>
Precedence: list

> The VRM9 limit conversion subtracts the 700 mV offset from an unsigned
> value before clamping. Writing zero to in0_min or in0_max therefore
> selects register 255 instead of zero. Multiplication can also wrap for
> large inputs.
>=20
> Bound the input before applying the VRM9 conversion. The chosen bounds
> cover the full register range and keep the arithmetic within range.
>=20
> Fixes: 1da177e4c3f41 ("Linux-2.6.12-rc2")
> Signed-off-by: Zhu Jun <zhujun2@cmss.chinamobile.com>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261111064900.1733=
8-1-zhujun2@cmss.chinamobile.com?part=3D1

