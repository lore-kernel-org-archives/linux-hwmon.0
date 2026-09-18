Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E62124D37A9;
	Fri, 18 Sep 2026 10:45:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789728351; cv=none; b=ceq48s65XzOYJidReWlPgrLVhrZiQb1p45ew/sv8dF/67jT/QUDSn8AIxo0Cu6JbxYkC83LcwnYTHfAZmYWX+Me7+h1LKv0WopQjw5nzUYVRPYjxh8zXS6AinUaRUnxmteRSSJ8fSRDSivbavWFMSz9OdNfanPEOnHftNktc3Ds=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789728351; c=relaxed/simple;
	bh=dbFcW5OtfJxrD6NmIf98LBpoAeTsFmeDN/vC/v3vDWQ=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=XAD+5znO4NbRcYlLB+ItChNxyOpVzCVthEn8XModBzYZwVrtmkquUC9mBO8eMuxFcVF+pxIpY4YDUI7ciC48g74wnbHptDOKzJDwXKZcmbjx4K31ZdM4Am0qUZByjAcFdPeEb2vagO2L3OBUQ/Ej8sROuXjWIQzxaP7tTiRm1UM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=BNmeKJN5; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="BNmeKJN5"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 92F3C1F00898;
	Fri, 18 Sep 2026 10:45:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789728343;
	bh=dbFcW5OtfJxrD6NmIf98LBpoAeTsFmeDN/vC/v3vDWQ=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=BNmeKJN5qia61uHMsDpjdPsiSjWhv55uefyqh0YWFAu5h1r/WrOLPpLFFR+U4HRfc
	 70RSMbIdApZcPIraViCXyoQruZDvN0ZSFF5POzKWIw2C7p4f+b9yLwGUFk+0L3mzR7
	 NdKgK54LbClVwTkDTd+GfQdllwMdLiJRB0Hu22b1YT2HH9nkMDxRjFNQKq2wUyGmTW
	 6nE4ejcNq4SeA5w3G/TP7Ezs6SKy2NeQGk96XxvlEmxCyoHmbXmHGbOxDv8zVDq4Qp
	 T0oky/gvX4Knu190et3ULdTSD+X3mJ4lh0Qzp2XaPYDxXBNsDWyikBAegJf4if2k73
	 wz2HiuMlaWm0w==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v6 1/2] dt-bindings: hwmon: pmbus: Add Infineon tda38740
 and tda38725
Reply-To: sashiko-reviews@lists.linux.dev
To: "Colin Huang" <u8813345@gmail.com>
Cc: linux-hwmon@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260918-add-tda38740-and-tda38725-v6-1-a8b11018d850@gmail.com>
References: <20260918-add-tda38740-and-tda38725-v6-0-a8b11018d850@gmail.com>
 <20260918-add-tda38740-and-tda38725-v6-1-a8b11018d850@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 18 Sep 2026 10:45:43 +0000
Message-Id: <20260918104543.92F3C1F00898@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

> Add devicetree bindings for the Infineon TDA38740 and TDA38725
> single-voltage synchronous buck regulators with PMBus interface.
>=20
> Signed-off-by: Colin Huang <u8813345@gmail.com>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260918-add-tda387=
40-and-tda38725-v6-0-a8b11018d850@gmail.com?part=3D1

