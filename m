Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B23EB46EC7A;
	Tue, 21 Jul 2026 19:17:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784661465; cv=none; b=sxToNbr3BOeEx8pipmHv/Jt7Zk5hChnfGXXavJTIxsRZJHDN3laizZXg+c2K/GwJ/AN6fP9B9iK1XX/4lYJwC2N/s6fsxDfCVBj7w9Z3wAU2ircTje10youGvmK/n3J6VgTzRY8mAwCZzPzPNY1DL+P8SjFujKUNR5txp+23hRQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784661465; c=relaxed/simple;
	bh=M+fwcO+xi1eq58cvnlIltzGTpXIFpKmc3z6GT3dlhMs=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=P3ojvo4QdQgFXF1bc4MYfuTrC2gP3cLRehS+E4j1vLUJditSldJZcL8wCYHHEU4F/TEuYKYzPIA8lH4YYru9ywZLVsHRkX8Oou/IvkSSOqutvAcmvyYysb9rgZH3znBsXR5mt6Bk9Zzxgg4//k7mEDl2NDG/pgftZRTBCtGrQhY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=I8bmazFC; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="I8bmazFC"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D75D01F00A3A;
	Tue, 21 Jul 2026 19:17:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784661464;
	bh=M+fwcO+xi1eq58cvnlIltzGTpXIFpKmc3z6GT3dlhMs=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=I8bmazFCLDMuaLd6NxkBkz7T46Ff3UOeyPhdNco6wOl9x9uZmYyZxE8WjeiLsLT+q
	 AUurTFJAsYQxVM8swir1Dn4x3zvrHtloUHTP4PgLWhwpU3zH4TQzDB8PWV0HV5fFre
	 KjC9+jS2uitj63Q3O25JZ105k3icjXylBfC950eygpdi9iEe/WnJfcwmemnyvIClEb
	 HqGzSKIehWRuIvvujz41sJjLtMK/J8a1b/5AXDC93A+EXPO63Sn44wRUabMIiqy+BV
	 2CK9FK35OEVYjqBICZzrNNVKg+kFX/EFW0r9ZTALAmyCKISfoNcdXFxQfW5yaKZVO4
	 iDkS3HwD80GeA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 10/10] arm64: dts: qcom: smb2370: Enable BCL sensor
 node
Reply-To: sashiko-reviews@lists.linux.dev
To: "Manaf Meethalavalappu Pallikunhi" <manaf.pallikunhi@oss.qualcomm.com>
Cc: linux-hwmon@vger.kernel.org, mfd@lists.linux.dev, lee@kernel.org, robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260722-qcom-bcl-hwmon-v2-10-febe2805e17b@oss.qualcomm.com>
References: <20260722-qcom-bcl-hwmon-v2-0-febe2805e17b@oss.qualcomm.com>
 <20260722-qcom-bcl-hwmon-v2-10-febe2805e17b@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 21 Jul 2026 19:17:43 +0000
Message-Id: <20260721191743.D75D01F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

> Add Battery Current Limiting (BCL) hardware monitor node for smb2370
> PMIC. The BCL monitors battery voltage and current, providing hardware
> interrupts when configurable thresholds are violated.
>=20
> Signed-off-by: Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qua=
lcomm.com>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260722-qcom-bcl-h=
wmon-v2-0-febe2805e17b@oss.qualcomm.com?part=3D10

