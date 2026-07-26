Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0BB117745
	for <linux-hwmon@vger.kernel.org>; Sun, 26 Jul 2026 06:59:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785049180; cv=none; b=jG64PvERihThhOK3gWOZ7ukbCb9wNzymBEqrVTO688QSHV7f7nntoLbTdsFIUmM7d2FeLWidN3x1NeqJQKAqktzgTtA0S0/puukB8H3CfQOY8ViBBuEL4Zw0PJPYvaAZSGdQcm4P3jiJ5BoAcB02hfnupexKE7zr35xdIOWegL8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785049180; c=relaxed/simple;
	bh=zKibobFzsFH/bPtCBp/bnZo24i/GqaTcpyxTliBgB4U=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=ITL3YUcjmG3NagDtNeBn/eSmf8PMwtBLXe0rLV1cxQn+0iDXxHQS4OG/5L0lV8x9Xm+/t2SatCV44Db6XdArnAWHhOfvTqPVEfhxLXHnUUoj5duQ9X3fwTJ0wsAo/QBlR98sy0K8W5LVxUVZkncoOQbU4LEZnQgRWZVSF68PZrI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Y1ogA8Ks; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Y1ogA8Ks"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3BB191F000E9;
	Sun, 26 Jul 2026 06:59:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785049179;
	bh=aT/XcltR0Qn1mj+7Ky1jZA1HdUF9I6eIKqAfiz6HLS0=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Y1ogA8KsTawKIEzHDNpXztsUpE3Lozk+4kMYrrZKrvahTDj8vxOMfKILRfiVs822x
	 pTVy+Ga7sJ11h1wHjwC1TJ1aJT4gmunbkCLJxrd8l/k22tlHgEBN8lXXT6uDI/asyQ
	 2K2ik8KzPtXbG9PMM6GTPppFJOTJDC752bg9VCDnuk9fKBOoU8zWmbT07Tj4ECt9f9
	 0FXY6Tt/Y8XZvYJj22QBfD9Dd0W/lZVtH7aYIKRQYJhaDA0npCVhF7jAw3dZTYAdix
	 XbACghkKFHLRjchoat2W11OzF2F1FOEqKYQI+10Z6SUjJO8D1FS+J0r9oZZmlvIO2T
	 f8He3A6QBdgaw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] docs: hwmon: fix spelling error
Reply-To: sashiko-reviews@lists.linux.dev
To: shaikh.kamal <shaikhkamal2012@gmail.com>
Cc: linux-hwmon@vger.kernel.org
In-Reply-To: <20260726065835.21012-1-shaikhkamal2012@gmail.com>
References: <20260726065835.21012-1-shaikhkamal2012@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 26 Jul 2026 06:59:38 +0000
Message-Id: <20260726065939.3BB191F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

> Fix spelling error reported by codespell:
>=20
>   supprts -> supports (sg2042-mcu.rst)
>=20
> No functional change.
>=20
> Signed-off-by: shaikh.kamal <shaikhkamal2012@gmail.com>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260726065835.2101=
2-1-shaikhkamal2012@gmail.com?part=3D1

