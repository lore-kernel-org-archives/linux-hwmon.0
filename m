Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6CBE15695;
	Wed, 24 Jun 2026 10:32:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782297179; cv=none; b=uaajg8eptSxXXz7xvtmkiMltbzaveo8+C5fdu3GfHDjAj7v4LzsyG2A5ZK8UxjQTyQkZMltoaoDsY+l7/6IccrNXBExjrOLIrge5IG+SZ0xzgF6qvyX1lGodlUgtXFqg2kejEnAYK6CLi7QVwdq2ScepSsmr32FRwHf+5UIeRE4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782297179; c=relaxed/simple;
	bh=i3PjvAWvCu+HGhehWSCeDEa7SQNHF2PmRQbOeDXwBaY=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=mjpf0R6CQpIfdmY4Ztabyb7kTig6RWYSNERbdbNg/yu+fUVY8HWi44M1o4KS82403bAPuNQplnNKx3k6z1lQF+RCySpL7RPPNzFL2h4NqfHdueTwHl85fhkJ5SGOQ3cEyG02hZ9SPfnnUWKqsnuwLgX58U0Yky6/957IAcu65ho=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Akpf97PS; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Akpf97PS"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9728A1F00A3F;
	Wed, 24 Jun 2026 10:32:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782297178;
	bh=i3PjvAWvCu+HGhehWSCeDEa7SQNHF2PmRQbOeDXwBaY=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Akpf97PSovw1IDgKPgkABZfadnan+rijVA95HkSvdbj//svrY7KYbNlem2W6xlrEN
	 FLJZHgzc/1ZEm3gKKtDukfZOAtuV6B1FVfCtynhvDC/nCP+S8PLV74CSvfAzbwlTNm
	 4Z0qAESgVaOqsmG8HTSLcWT6X/jlCFFtpebkAhzM+GkR3459T/0omU21+APHaFHljJ
	 Hck04XMYbl5xiNZhoaFQwq/9RsBkQcdwV2u5q+9AU8ggEBmbwc5GFkaG9ClBe2WDMn
	 qZb/shlOnz08IbgqiT1GyWyq4WVnLqwtpeOPkYZMKgwMoVTaVktHqZrG0bSyLvMkLd
	 Fjc0z0uc38NQA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v5 09/12] i3c: dw-i3c-master: Add ACPI ID for Tegra410
Reply-To: sashiko-reviews@lists.linux.dev
To: "Akhil R" <akhilrajeev@nvidia.com>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org, linux-i3c@lists.infradead.org, Frank.Li@kernel.org, linux-hwmon@vger.kernel.org
In-Reply-To: <20260624102153.1770072-10-akhilrajeev@nvidia.com>
References: <20260624102153.1770072-1-akhilrajeev@nvidia.com>
 <20260624102153.1770072-10-akhilrajeev@nvidia.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 24 Jun 2026 10:32:57 +0000
Message-Id: <20260624103257.9728A1F00A3F@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

> Update variable names to generic names and add Tegra410 ACPI ID to
> support the I3C controller in Tegra410, which is a DesignWare I3C host
> controller.
>=20
> Reviewed-by: Frank Li <Frank.Li@nxp.com>
> Signed-off-by: Akhil R <akhilrajeev@nvidia.com>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260624102153.1770=
072-1-akhilrajeev@nvidia.com?part=3D9

