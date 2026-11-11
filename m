Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794380710;
	b=YG55NlmFytbRlgMLI7CTsc3WlY0IWfS5JT9+6ey6+1G0QXU+Rxd5Q/HLFfqeDyWmnTxh
	 +Mv+6uAhjX/Hm1/m6ykXtalD1kvnUjMVOnUamEi7snyx6C2ilarjGhBB9Lgi3WxJHB5FO
	 e9QkYE3dE8pkk/GG9QhK+lkWNhFYtOhaIQ+4cPz4dXrEh0L1tWtYHur19sCN3dQGcQAqt
	 LgAERsgUzjbtLLc+kHHbSWCiuSJHhjx3uGA44C87D0oaavs/6v4c7QDkIMhLg8gyz41rb
	 d0NL91DNcviC54INeCFS9xrvUJk4aoKxiJ6lj8OKPaG3cFy3qwbYgLs083SwdC3BXJw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794380710;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=n2npn4RQcViO1mW/u9DP3aj57A22MspcW3iM+amDx8k=;
	b=uKxzoD/5JnmobFXvcMo8/1llVkWaEHqHZrjtJfjnC1I+IY5xHdrjLWF/lvsnRyw6T7kJ
	 G0DdZ0dynwtLktcYPxkHnkBkbbfnnRj7HOdwSdw/BrckVszvc4Ko7B40XBpvQhaQ3ZRN+
	 o/GsCOZ0+wlD8D5m/CAVzV002lNVNBYbMhnFO280ZwbmzlXm9ChmMYnVB0s9ubrhJzUrp
	 88hfvy+ETsQUH8Nv4eRG4K4mcXRI8FnbA0ob0EVDrNdQ3afoUWIRgOxNOz4qkfdQbNTzg
	 hxT9rP5T8H8KSsyiwly0ItrcDHVKNBPYXClodFELJPdn+d+zVDUZHD6ixkQVx2OS4pw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=eLRrG89X;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43C1E606A320
	for <linux-hwmon@vger.kernel.org>; Wed, 11 Nov 2026 07:05:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=eLRrG89X
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EA1E81F00A05;
	Wed, 11 Nov 2026 07:05:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794380710;
	bh=n2npn4RQcViO1mW/u9DP3aj57A22MspcW3iM+amDx8k=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=eLRrG89XMAOvkzdrHQLoxAtD1AjELqoZm9fflMop5tRNe4a1r3PoD+o5wZO9xcYJZ
	 APLUTaic0wLgXQL8M05zyPQ/QQA9nwPs04AsM2wrNzNFAhHXCZhJrKS4k7GirkSxNO
	 3WWm7cJe/abRRZaCMIDCNhzp1X4NgvFHskJOjihxd+VFiC15+rgvaJ2iBkzHTI37hK
	 uzHF4c199NpRnBTxDcEZYJjW36OYvZ3cWmnHd0HV4zK+AlzzrwLpvEQ73vPBNRTajG
	 iD7HhBvYg83yWRZZwfH6InBelICQXvC/ZrYUJW2TApVy8QB4OjUkGwCVq77volcElS
	 JJ93T1mHF/XOA==
Message-ID: <sashiko-outbox-208488@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] hwmon: (w83l786ng) Clamp voltage limits before rounding
Reply-To: sashiko-reviews@lists.linux.dev
To: "Zhu Jun" <zhujun2@cmss.chinamobile.com>
Cc: linux-hwmon@vger.kernel.org
In-Reply-To: <20261111065318.17761-1-zhujun2@cmss.chinamobile.com>
References: <20261111065318.17761-1-zhujun2@cmss.chinamobile.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 11 Nov 2026 07:05:09 +0000
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Post: <mailto:linux-hwmon@vger.kernel.org>
List-Help: <mailto:linux-hwmon+help@vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-hwmon+owner@vger.kernel.org>
Precedence: list

> IN_TO_REG() adds 4 to an unrestricted unsigned long. Inputs close to
> ULONG_MAX wrap, so an excessive voltage limit can select register zero
> instead of 255.
>=20
> Clamp to the 0..2040 mV register range before rounding to 8 mV units.
>=20
> Fixes: 85f03bccd6e0 ("hwmon: Add support for Winbond W83L786NG/NR")
> Signed-off-by: Zhu Jun <zhujun2@cmss.chinamobile.com>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261111065318.1776=
1-1-zhujun2@cmss.chinamobile.com?part=3D1

