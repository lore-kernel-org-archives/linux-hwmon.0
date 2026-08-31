Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 665C839A07B
	for <linux-hwmon@vger.kernel.org>; Mon, 31 Aug 2026 18:58:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788202695; cv=none; b=HkhdJ/VIrmyUsrV17oHb5X92wp4MA6f4ymT3dKBdxbBLcs9uf6zGzdJCm8t2mALDyJ9XVGe2xBCu2ue2GvDW6GQTYYx2VFEFb9vBljCofyUyXgFUxh8UDiD6jxJ5v4i1DtMe5ttTsj5fMK4xY2BiuqXDVLB+svFgPTU7ll1Lx4o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788202695; c=relaxed/simple;
	bh=pA/0CDy3jz1jw+Ub19/BXY7eMzyyme3nF9TyELeiaU4=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=UKWslAqRkHEI5TbRRlLUT9q4+u8M4p3ii8s4/pbTCLPpfppPI4lshWCPmahka4BZ/lkp/M3tOBukLvuSY+knT5S+AM9gXzCj51J86XcT/qON4MKo7JUj9XpVSc5kux8m7oOrp1qEjAuKYxmU/7r7Hr9Yogu13Uz3LSbVq1c5Uw8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fdzB5tnE; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fdzB5tnE"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AF93D1F000E9;
	Mon, 31 Aug 2026 18:58:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788202693;
	bh=pA/0CDy3jz1jw+Ub19/BXY7eMzyyme3nF9TyELeiaU4=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=fdzB5tnEEw+8AhMwTbsWrwze/p8u8k1u4ImOIk8NYd/lBbtwu8e+gvY23LoTaauHy
	 ZoNCKqEQ+AKIIk8JIEUaCdtjLkn/5MpdxW9Cq0n6tVixKojCXkwO9o7k94ZYoUf17b
	 H3rsUhcGcjFagOkDCcylROfZUn4PaKHZAd4qVZw2soYaNAPRxMghCPmXXmAVM5Lz0p
	 DEgafPUWVuX4zZhxCy0lzMhOrnO0NCJLD+H5VhqEXjIFIEW/HiBP1fkPFhQs1jhB+e
	 kaYpiv6wbHlBruz/aEoz7CLSj3KhfnFrg++lG7XIUOvva11Ea6VZ5AW5ARCJ06M+xb
	 Q1SvnErajprbA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2] hwmon: (asus-ec-sensors) add ROG STRIX X670E-A
 GAMING WIFI
Reply-To: sashiko-reviews@lists.linux.dev
To: "Asai Neko" <sugar@sne.moe>
Cc: linux-hwmon@vger.kernel.org
In-Reply-To: <20260901-asus-x670e-a-hwmon-fix-v2-1-759406c2a61a@sne.moe>
References: <20260901-asus-x670e-a-hwmon-fix-v2-1-759406c2a61a@sne.moe>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 31 Aug 2026 18:58:13 +0000
Message-Id: <20260831185813.AF93D1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

> From: Asai Neko <sugar@sne.moe>
>=20
> The ROG STRIX X670E-A GAMING WIFI is missing from the driver's DMI
> table. Consequently, the board lookup fails with -ENODEV,
> asus_ec_sensors does not load, and no asusec hwmon device or EC
> temperature readings are available.
>=20
> The board uses the same EC sensors, access mutex, and AMD 600-series
> register layout as the ROG STRIX X670E-E GAMING WIFI. Add its DMI entry
> using the existing X670E-E board information and document the board as
> supported.
>=20
> Before the change, there was no asusec device under /sys/class/hwmon and
> there were no EC readings. After the change, the driver registered four
> sensors with representative readings of 57-61 C for CPU, 68-71 C for
> CPU package, 43-44 C for motherboard, and 49-52 C for VRM.
>=20
> The readings correlated with nct6775 and k10temp. Repeated polling with
> both hwmon drivers loaded produced no EC access, bank-switch, concurrent
> access, or locking errors.
>=20
> Tested on an ASUS ROG STRIX X670E-A GAMING WIFI with BIOS 2704.
>=20
> Signed-off-by: Asai Neko <sugar@sne.moe>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260901-asus-x670e=
-a-hwmon-fix-v2-1-759406c2a61a@sne.moe?part=3D1

