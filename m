Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C4E53ACA41;
	Tue, 21 Jul 2026 10:05:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784628317; cv=none; b=VDAcvjRelPWM+ivZX5Xeo24BiFvS6mMXDUMD5v2nabwJhg4iwCC3JEN03CVde40p11FM8/nMpqGtRSaKPFEqOlHJvOVUo1I8yC1g+NlSlBCG1RJ0IYmjwiHPB5xBmfORBtkmbvNDSGY98DWphrEH81y8H666RuAwFeZbz3Vtko4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784628317; c=relaxed/simple;
	bh=FgFdx4ESthlVzTrLfslnyJV3AxUQJHulkS7/P1S6tB4=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=jy0VsD346HUgH43INrYv16qnyi5ulpzyAf8NesEuOY/spXdScy/DR15v/pc4SqC0JoHe8wRWxjZen8V/uz/BsTvaZ5EhUOlDhOf3H2wM+Dabr8rIoJR8fGSOcIBVTxTUAyH4kuYwGCN5pdtjcvn6fnoA8HZb2gXjR45mZ8+74f8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KbZJlzsZ; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KbZJlzsZ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9AAB11F000E9;
	Tue, 21 Jul 2026 10:05:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784628315;
	bh=FgFdx4ESthlVzTrLfslnyJV3AxUQJHulkS7/P1S6tB4=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=KbZJlzsZFOQA02kOGm/JeeNgtrcmJxPZ6v17Q9bVOIB2kg/oI9EZbBn47dqQLDBxp
	 x2nzAvclEbPTS/veYRiP0QLl/CPA5a1GXWsX4z7XYjI9e9XsGeqAGTm0+nVCXqJFzK
	 MKcSpwfiqba5Fq0gJgF8x08LYNgprDytaHnMfKLhQtgSnHB0cVUXJWVYo+aMWLp2es
	 1n02FkL7QVct8rYVX4sWqzcabt8q6j9gdXIBgFnszs7PByklc2FW2IyS6EhB6se6b0
	 MAFH+ZsqRCO2HSUaS+6uYAOGFIxCVmQ/8m+3qTupiXS6YhwYarGAOINh9iyhBhSfXu
	 93V24JT/4LMEA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 1/3] dt-bindings: hwmon: Document SMSC
 EMC1402/1403/1404/1428
Reply-To: sashiko-reviews@lists.linux.dev
To: "Svyatoslav Ryhel" <clamor95@gmail.com>
Cc: robh@kernel.org, linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org
In-Reply-To: <20260721095935.439174-2-clamor95@gmail.com>
References: <20260721095935.439174-1-clamor95@gmail.com>
 <20260721095935.439174-2-clamor95@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 21 Jul 2026 10:05:15 +0000
Message-Id: <20260721100515.9AAB11F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

> Document the basic hardware layout of SMSC (now Microchip)
> EMC1402/1403/1404/1428 thermal sensors.
>=20
> Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260721095935.4391=
74-1-clamor95@gmail.com?part=3D1

