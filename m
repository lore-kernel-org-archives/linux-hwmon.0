Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6548A303C8A
	for <linux-hwmon@vger.kernel.org>; Thu,  6 Aug 2026 06:16:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785996992; cv=none; b=gxKE0pMuJqNsBMSJseYh+g4gw0jzJA5SS+oxYRRyP1KQFwTg+brtm23SE9BRUeaq7iAYeoQ0qEh/HV3cr0sP5s4wpl+piKo4Ixw4PjSKu0CTgWFWvr1hesDw9IKSCosO6RkXWl8BI2rLrNzwYPRunYs865Kz7oG4kWZlsjsgwpQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785996992; c=relaxed/simple;
	bh=66gCHlCaOPJ8C4+cl67IOMPo7/Gal+QQghfnakF8/VI=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=HuG4Utz+CiqVuf/TJMkKpSLPETHgmzRo9eax0VbSni6HjJxj6F4XtvPEGYZ6RqzqffXuM6wjhzCrvqm+PDgEfAnAXhFse7PX2276Df0lL/5JXwY0CBu9BvZ0LO9ChISKbVTH5A5w0VxXbYUUK7+8B37craoJHiT9EG4IUE/h3/E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=G5vJTqnT; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="G5vJTqnT"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 208091F000E9;
	Thu,  6 Aug 2026 06:16:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785996991;
	bh=66gCHlCaOPJ8C4+cl67IOMPo7/Gal+QQghfnakF8/VI=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=G5vJTqnT4sUwHcCb//TlpGpfomkTT8XA080iLYqxWZZs9ma2EElrP/76HAxWA6U0F
	 kEhkzEKLmCDdwhUT5ko5Q7pdelxxIvpin9c7ZwHkSXlUny1Tg4tzoPCV/xBbMd0D3n
	 AoXSG6GK/bX6byoqPlq5TJHVzPkZeEjDYH0nv+DrfP5+Swy+BKCJIM9Efmeh9sM6bV
	 6rPHfKs90yCzuOS4JGs7JHaGDm4svmpsQ964RDsYDrWjfYMq/xgGSePVU6qjNsDMTP
	 mKNffe53g0Ln1hew86SYz9Vrk974ohkdScLVcbX3p2vB7k8f2VHOSxspXjGLi3sbT5
	 gBBW3RtVNcV1A==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 3/3] hwmon: (sysfs) Allow drivers to register const
 attributes
Reply-To: sashiko-reviews@lists.linux.dev
To: =?utf-8?b?VGhvbWFzIFdlacOfc2NodWg=?= <linux@weissschuh.net>
Cc: linux-hwmon@vger.kernel.org
In-Reply-To: <20260806-sysfs-const-attr-hwmon-v2-3-22fee8b85509@weissschuh.net>
References: <20260806-sysfs-const-attr-hwmon-v2-0-22fee8b85509@weissschuh.net>
 <20260806-sysfs-const-attr-hwmon-v2-3-22fee8b85509@weissschuh.net>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 06 Aug 2026 06:16:30 +0000
Message-Id: <20260806061631.208091F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

> Switch to the __DEVICE_ATTR() macro which can handle callbacks taking
> both const and non-const attribute structure arguments.
> Allow the step-wise migration of the drivers.
>=20
> Also use container_of_const() over container_of() to avoid casting away
> the constness accidentally.
>=20
> Signed-off-by: Thomas Wei=C3=9Fschuh <linux@weissschuh.net>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260806-sysfs-cons=
t-attr-hwmon-v2-0-22fee8b85509@weissschuh.net?part=3D3

