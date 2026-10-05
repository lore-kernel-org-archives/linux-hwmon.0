Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2DEC5471D1C;
	Mon,  5 Oct 2026 12:42:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791204142; cv=none; b=sr5Yi8D+35arHTDhg4aEzhxTRYOsZBCU69rzpbThlMoyE1jwScr0Uw7bsDxUK1FBigwucqtYs79DC6s5zFFGVy2PwmCzA4gt1+rBq4jJcUxaTwWx/hs29Dx6F3V8QHxWyQ+iVIz/CHSCZiAT/Y4yII+Z1Sc4BeSMPZxhSOIYR6s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791204142; c=relaxed/simple;
	bh=b6M39SlxeyQYgguMvKZttwT8u4BTvJF9v3BsIdQKuEQ=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=eBllvS8yxqLMGojV7e8CtmSod5DrI6hmxCRO5OnUsV6OOZpqO/5aeyoE744FRk5qTgsxueSUeFdqI49XIslQUCF56tXuTB0ymVX7yVVu1FcMgpsAUqacCXmo/G4d6thtYQIa8D1VEzSLTd2oHN/P/nixz2Yt3JmBPgDWUjwjb+0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jlM/jKCN; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jlM/jKCN"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4ED2A1F000FF;
	Mon,  5 Oct 2026 12:42:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791204140;
	bh=b6M39SlxeyQYgguMvKZttwT8u4BTvJF9v3BsIdQKuEQ=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=jlM/jKCNY7Fxb7CzELoHhDrhSVt3QgQdvqUR1whfLxU8FC7CtPLKNNC4UTAeH0jSh
	 xcc2eQYrn1/eOALGDLTFBrBuW7dKSN4QpbtignDTAt5M9cqsgACiVC0f+mSp1QNmsw
	 4nlou5GYVOv5s8y0wJ8o59UzNHqe0hxUTPOP4J+CjymGoTaI3195y2zoIUs5aY/FGS
	 OpVHIWyJ9FNHc50JTusGClUxBPAIdPPrJU2F1wfWYE9WqNT8Gm9tnK5ij5JQuZsM9d
	 /OhcMkemhRhRi4Z+NZX8i1mBOtveJVr3zVVysSMzZeU8HTWaryV/hfPtRFc/VKXA9N
	 7BXSRaY9rXrxw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 09/12] arm64: dts: qcom: pmh0101: Enable BCL sensor
 node
Reply-To: sashiko-reviews@lists.linux.dev
To: "Manaf Meethalavalappu Pallikunhi" <manaf.pallikunhi@oss.qualcomm.com>
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, linux-hwmon@vger.kernel.org, lee@kernel.org, robh@kernel.org, mfd@lists.linux.dev
In-Reply-To: <20261005-qcom-bcl-hwmon-v4-9-50b9a8c730b7@oss.qualcomm.com>
References: <20261005-qcom-bcl-hwmon-v4-0-50b9a8c730b7@oss.qualcomm.com>
 <20261005-qcom-bcl-hwmon-v4-9-50b9a8c730b7@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 05 Oct 2026 12:42:19 +0000
Message-Id: <20261005124220.4ED2A1F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

> Add Battery Current Limiting (BCL) hardware monitor node for pmh0101
> PMIC. The BCL monitors battery voltage and current, providing hardware
> interrupts when configurable thresholds are violated.
>=20
> Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
> Signed-off-by: Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qua=
lcomm.com>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261005-qcom-bcl-h=
wmon-v4-0-50b9a8c730b7@oss.qualcomm.com?part=3D9

