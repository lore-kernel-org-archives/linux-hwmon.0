Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9EF4C372073
	for <linux-hwmon@vger.kernel.org>; Wed, 10 Jun 2026 20:43:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781124204; cv=none; b=DA8S224duFIvxfdLnwbtdT3WeNlXesN2/muWW3w8p2fTzcesE/NV0irixgyF4eU9Y0UXMbLrVMVCTpD7yz7n0tjuEegr0e/cwJPscxibWO1faDNbdBc/B75wmIm+R0PV+jffCjTNK6UWdtLGFiFH6w6IZ3O1erSywVgHlN/bSLA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781124204; c=relaxed/simple;
	bh=dlZ+S56nnzVh3A9MmqEVYvUq0BnUjGKJJjTwARyuNDo=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=hcxwwdhnjHmK2MVAkZFBm6Fi3itsMGUXyKt7mtF65EgAmyxeAswwt1S+MXoSt07Ks3tnapyWBX+AAvnY+YAqH3xxR5X2oPVmx8ZLgLZscKTE9TAFz8VI681yZO6hrGTxc/3/RXmLtzjXsWOZBPHMu9HSShVBiG3i6oQQ1v/oRDE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=b6NeRXT2; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="b6NeRXT2"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2198A1F00893;
	Wed, 10 Jun 2026 20:43:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781124202;
	bh=dlZ+S56nnzVh3A9MmqEVYvUq0BnUjGKJJjTwARyuNDo=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=b6NeRXT2DYCvD2AnIuewP2g8h4d6IxjJLscvarvm4wk7zQ5+nUXCXPtLvf3ibdmHH
	 280Jfk86yilLOt4vCZezdwVBL3emyzRRXEncC0ED28rq0SIY2WJIwx3OcpVu2ng1mJ
	 Ay/zOKrZjjTWWzRBxMxomBlWjixUhxdhHFvXPN4u9lNOXn4swsXOBh242i4e/ZXxFP
	 IesC3SLgUNpZuxBclm5FuCEJLZtuqkMe2cjstcW7ppcyRM5Jwy09PfDgzZq4gR33yI
	 m+5s6Ky4gTuVjCdYaPUyes+5DYv3Q1BK4PK7UmJyHMBAHPztiM7mXo82X2ardoAEzy
	 f6eXMybKV4hSQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v6 8/9] platform/wmi: Make sysfs attributes const
Reply-To: sashiko-reviews@lists.linux.dev
To: "Armin Wolf" <W_Armin@gmx.de>
Cc: linux-hwmon@vger.kernel.org
In-Reply-To: <20260610203453.816254-9-W_Armin@gmx.de>
References: <20260610203453.816254-9-W_Armin@gmx.de>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 10 Jun 2026 20:43:21 +0000
Message-Id: <20260610204322.2198A1F00893@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

> The sysfs core supports const attributes. Use this to mark all
> sysfs attributes as const so that they can be placed into read-only
> memory for better security.
>=20
> Reviewed-by: Ilpo J=C3=A4rvinen <ilpo.jarvinen@linux.intel.com>
> Signed-off-by: Armin Wolf <W_Armin@gmx.de>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260610203453.8162=
54-1-W_Armin@gmx.de?part=3D8

