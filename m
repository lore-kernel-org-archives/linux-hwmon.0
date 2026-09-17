Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A34A49C4D3;
	Thu, 17 Sep 2026 11:38:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789645100; cv=none; b=H56htu4w6Z7YIK/eI2tW7rq0/WLkZgVtUS+AdVuDmw1YKBvoEm2tOakKPwRsdgSzc0JU8LyrIe2lGB3BUzKAAz1ixBTbDAK7yejc6M7FEun+WmOIHLfDGZnBCknL0YEUHeEPVyKKkP6REA8WB9Op3zYIx8qsBcE/P/osKPHNdDk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789645100; c=relaxed/simple;
	bh=2N/keqt4u/kwHwMbCypm2cuwunGlx4nDFB/KOr1zp5g=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=gL5gis4rWsnoxnwa1jRqoZ56fTpOUie/eiL8SzYS6FvypgN5cJmyFZlYYrzsss1AFSb4LPCwtVvRFyHGOf4KRUV309eRoZT0BOET5/yLrHQyfLjqlfTalvFD2fNn61FylvmNQzREVzTnbBbpBdugm0N8Db9JpbJGyjXn2I5IigA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=W6bQ4xPq; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="W6bQ4xPq"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CFFB01F000FF;
	Thu, 17 Sep 2026 11:38:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789645099;
	bh=2N/keqt4u/kwHwMbCypm2cuwunGlx4nDFB/KOr1zp5g=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=W6bQ4xPqX8hta+4poE8IGlEDF+jrIIjA2ONKTDTt4bmjAainhpTc4rHtawj7S/PV5
	 SICtoHje03pSIQmzPHH4FOamxC6poNNlga/H3r5zRyP93++6Pb2B2qaMfLCb+O2krO
	 N2EeHlV6X/vDeKGwQSPMLZ0jRL2c+VTCH2Wggw9CLXcIlHVlafvNwXKutA3lq7xHZx
	 hft5aOVOdVdMRoXkxTO4k0rCafK1gdvFU66RVenpnCj/kZ+Knof4v/SlMdMq1viFMd
	 SYEy1GQP+yN1t5MvO23R8Ru9EICfoPJzn4Go05H05Vm1v+CgBpIBGLW7rzRD4+m2vr
	 ofqNrbufz+Fqg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v5 1/2] dt-bindings: hwmon: pmbus: Add Infineon tda38740
 and tda38725
Reply-To: sashiko-reviews@lists.linux.dev
To: "Colin Huang" <colin.huang2@amd.com>
Cc: linux-hwmon@vger.kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org
In-Reply-To: <20260917-add-tda38740-and-tda38725-v5-1-7fc19668ada4@gmail.com>
References: <20260917-add-tda38740-and-tda38725-v5-0-7fc19668ada4@gmail.com>
 <20260917-add-tda38740-and-tda38725-v5-1-7fc19668ada4@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 17 Sep 2026 11:38:18 +0000
Message-Id: <20260917113818.CFFB01F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

> From: Colin Huang <u8813345@gmail.com>
>=20
> Add devicetree bindings for the Infineon TDA38740 and TDA38725
> single-voltage synchronous buck regulators with PMBus interface.
>=20
> Signed-off-by: Colin Huang <u8813345@gmail.com>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260917-add-tda387=
40-and-tda38725-v5-0-7fc19668ada4@gmail.com?part=3D1

