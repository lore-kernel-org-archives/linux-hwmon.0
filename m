Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92A2E4279F7;
	Tue, 16 Jun 2026 10:10:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781604604; cv=none; b=KXCCsZQ/00UQrmnx717yOXbOE9OWqBU4e0DK8fnDIFcaZCk+uliPpJSPKDqtxe6/YdMRGXfK+at74dtljyh10tuHiQu/SiSLVXwZy0m9AT3kKpjczIZlgM86a4uk/k5YXzPSVrcN6sDWuNiOFnnGUORMmx1XpbkMp4/fYDpCJYw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781604604; c=relaxed/simple;
	bh=7BOuOW+gx8Zukt1P3EBkLq6Bwvz9gfQYmCoCyoMelJY=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=ZxBV1yCL+1SMibWXOPzclVA8o/AG4Novdny5ZNrDJQ8pTJurCq7SnwqM2YOe0DNpNvaNos1qA5sbokgejPMmxG2C3pfOGJhQQ6eY55sPM82yAl7zi7yE99fUYy8xkg/EUmIraQjVpHaKDeBz60E3OpxxlimxOtwOTHItvQd3wkU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=T2BoJrQp; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="T2BoJrQp"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C5D4D1F00ADF;
	Tue, 16 Jun 2026 10:10:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781604603;
	bh=7BOuOW+gx8Zukt1P3EBkLq6Bwvz9gfQYmCoCyoMelJY=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=T2BoJrQpSnonZxDaDdWu81uAvwmPZqjAw00wkj49eZt6ujR80LGL29k+yznKCZExR
	 Inm0neB7S2ZaTSVr+x8jAzWXqRhm6v9t1eHXM+1xa4iklH9cjhiZre/36bHdeGErC7
	 gdc6l9heBHFWhQkczIJ95LPBH3mAD/HQX9TTaOnUVEXSV0BC20VAe5UTDX8M1AyYVe
	 slcCZu8tRiZHZxeOFL1fT5G60douk6NfV39bnM/fMbG0eyuzMKZePeTMHwOGsLoEdb
	 FlNHimdgKZrMcBPnzIGgPTkv/TmYTxNgtV6al6/MFmpt1GWMisfiivJtjVSJnPBmRY
	 8OOsPIgO/3CRg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 12/12] arm64: defconfig: Enable I3C and SPD5118 hwmon
Reply-To: sashiko-reviews@lists.linux.dev
To: "Akhil R" <akhilrajeev@nvidia.com>
Cc: linux-hwmon@vger.kernel.org, linux-i3c@lists.infradead.org, Frank.Li@kernel.org, robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260616095429.3947205-13-akhilrajeev@nvidia.com>
References: <20260616095429.3947205-13-akhilrajeev@nvidia.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 16 Jun 2026 10:10:01 +0000
Message-Id: <20260616101001.C5D4D1F00ADF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

> Enable I3C subsystem (I3C), Synopsys DesignWare I3C master controller
> (DW_I3C_MASTER), and SPD5118 hwmon temperature sensor (SENSORS_SPD5118)
> as modules.
>=20
> The NVIDIA Vera CPU uses SOCAMM LPDDR5X memory module, which contains
> SPD5118 (JEDEC JESD300) compliant temperature sensor. This sensor is
> accessible over the I3C bus through the DesignWare I3C controller present
> on the SoC. Enabling these configs allows monitoring memory module
> temperatures on platforms such as Vera Rubin. Vera is an ACPI-based
> platform and does not use device tree.
>=20
> Signed-off-by: Akhil R <akhilrajeev@nvidia.com>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260616095429.3947=
205-1-akhilrajeev@nvidia.com?part=3D12

