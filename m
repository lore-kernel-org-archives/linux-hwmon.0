Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A963165192;
	Tue,  8 Sep 2026 18:38:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788892699; cv=none; b=UGy+gV9phaqPU6juGDKigTsQxbMHllbvK5Ak8HeVsabMdDoAPLCTB3PtW6Prm6z/NjOueM4HqeX9Q7EhqljTHVkq/HS+sKdECe70avTwDsL+3l/wmDRCGsqEJf5icKzuIv+yBbhVmLJluoklyi51f8iGoVggIPJlJaLTVCFMZ5s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788892699; c=relaxed/simple;
	bh=v/Tou3XyOKJxsCnQO6Qzbwi8Eg+LkLwYw72jXYQ+H7E=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=GKKeWekasOxATHPskN/FUa0hG2l/zYVFepd3sMIRzH+P5mshdV6u+haUoxczSChSTyV3EUWziZNmcmzR3Ah2ceRZHg3u4AdTaTyd4KyyRH820cbROR5jch5TKGleRrBPoInPzM2BXdPNbsPbjxhKnx1xz/mjCLt7Ujs+r5FswB8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ejBUMQPn; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ejBUMQPn"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F11921F00A3D;
	Tue,  8 Sep 2026 18:38:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788892698;
	bh=v/Tou3XyOKJxsCnQO6Qzbwi8Eg+LkLwYw72jXYQ+H7E=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=ejBUMQPnSYCaoPqoIt9w6hdU2nJWdpA9nsBVc9+8DTGIRrwynFu1S7BiLWjen/XXV
	 gXklphhCujjElOiwwnQwIc0I1+NSptHi9F/0s1ch1XP3HkzyF+GGjs/HO0ZdWnZe2a
	 xghQClsG6AQNqYI2R4lsmBHp+6V213o/uh7vpf2YznWrQqTMyT6HAkDuf9AvP3SFL6
	 f5nV2ZB7BJDsSLfCw5VTvrZfjwH5MnITY5X/fsTBCL2OFzWHSZwGeGKHv4dGLofJql
	 FbtGEOekXTsYkZ0tDBAYHh/8lD+bOkxBrKSkfVtyiLkpFF4fhhpy06n1pqGt+AYlWG
	 wmOHR/+MFSBKQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 1/2] dt-bindings: embedded-controller: add Lenovo
 Yoga Slim 7x Gen 11 EC
Reply-To: sashiko-reviews@lists.linux.dev
To: "Oleg Keri" <okerixx@gmail.com>
Cc: linux-hwmon@vger.kernel.org, conor+dt@kernel.org, robh@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260908183403.2107-2-okerixx@gmail.com>
References: <20260908183403.2107-1-okerixx@gmail.com>
 <20260908183403.2107-2-okerixx@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 08 Sep 2026 18:38:17 +0000
Message-Id: <20260908183817.F11921F00A3D@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

> Document the Compal embedded controller found on the Lenovo Yoga Slim 7x
> Gen 11, a Qualcomm Snapdragon X2 Elite (glymur) laptop. It sits on I2C at
> address 0x70 and is distinct from the Qualcomm reference EC that the
> reference designs place at 0x76.
>=20
> Signed-off-by: Oleg Keri <okerixx@gmail.com>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260908183403.2107=
-1-okerixx@gmail.com?part=3D1

