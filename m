Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DBF33F7886;
	Wed,  5 Aug 2026 09:35:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785922517; cv=none; b=ko3E/UivJCLzHfw1SmKllQrmH6O1wAdQsLXtmDiy6j32K2GamuvcxRZiHri1p1YYEnDEdnE8smP5U5dZuifj0FLVlL11oyqknpeCyY7QwTZWEe7eS/SWDhkKqBTshyhFYfRKGQ33iro/W9O+rb//Rrz6o/J5Rzllwl+aEpsWIRY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785922517; c=relaxed/simple;
	bh=2SR3HA0G2kEYV6RnR89+8bDxGm26IJlE1YpDHQS9Oug=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=k4xZg4ORCBcJWszMHnNfFIMcSlay4WOkMpyUdDXrhlsu2yDZL+8Q+Zh/f2mSlpgjuIIHeqjpVbuajdRTDdTTnYCT0DF7MQTowT39hJCh46hu7NOHVax1NUOTIcQKBuV/ZdnO2jl9jmb1LOO1o35lFxNB7fPq7JFUcUC4FaTnO0E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=l/D3GGQX; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="l/D3GGQX"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D304E1F000E9;
	Wed,  5 Aug 2026 09:35:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785922516;
	bh=2SR3HA0G2kEYV6RnR89+8bDxGm26IJlE1YpDHQS9Oug=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=l/D3GGQXXjZo39piN0VT9an/oKzAs2SMuWNSX/KMUv+z0It+7quvs2hUohSqCBQXD
	 R25gjYYXpfA2Xr4NQKCjSrLBqODqERc103H/GMXDrqNDQbamA9ajgrAy/TR9jKkqV7
	 M06hTIWjvnXgDwVb77KypPfZs/gS2eWGAMIW/JmFerORUf1DiWYCE5wjn3sogsVCC0
	 ymz+L1T2cj9tGmQuKmwBHCk7XVVlBeOPyE+rByw/+0SPQda2p8AHLw3VpyyAVeQLFE
	 z/szFJrtteH160tqRxyKXWECHYG0929bOt8L/DlbFM/gfaybrkpdFPRLdRYR69Cu9M
	 CptUGxNsHkN8g==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 2/6] dt-bindings: hwmon: Move LM63 family to a
 dedicated binding
Reply-To: sashiko-reviews@lists.linux.dev
To: "Troy Mitchell" <troy.mitchell@linux.dev>
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, linux-hwmon@vger.kernel.org, robh@kernel.org
In-Reply-To: <20260805-ctl2301-v3-2-b86c75d1c552@linux.dev>
References: <20260805-ctl2301-v3-0-fd4b8ffb5b0d@linux.dev>
 <20260805-ctl2301-v3-2-b86c75d1c552@linux.dev>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 05 Aug 2026 09:35:14 +0000
Message-Id: <20260805093515.D304E1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

> Move the National Semiconductor LM63, LM64, and LM96163 compatibles out
> of trivial-devices.yaml and into a dedicated binding. Describe their
> integrated fan control and preserve the optional interrupt used by the
> ALERT output. Permit use as thermal cooling devices via #cooling-cells.
>=20
> Signed-off-by: Troy Mitchell <troy.mitchell@linux.dev>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260805-ctl2301-v3=
-0-fd4b8ffb5b0d@linux.dev?part=3D2

