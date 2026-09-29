Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4AA6051589F;
	Tue, 29 Sep 2026 13:26:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790688411; cv=none; b=OR5Hv2OAcX5PNSPLsjpR60lu2FBWZN0fwmtqNztPT2JxX3GT7MXXvaFh7ASHoRl7DsMaSuY5BBjdxsViOr6jQSmXHM8DCvJVFBjeHnOpsSacUq9joJlt13iWA2VoLfjBGCzL/KkChZ8NXPbWAppA2h69hGQDsXnpVRHnktc4nY0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790688411; c=relaxed/simple;
	bh=cxOvC96KegBOZQQUEngysEr6Me1/DKR6BI7eD7+1ZmM=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=PQVEFpza2l2gwAXK5BSwnDmSLeOn1JXAYKT9cioe4O85oAetFKcfg9XyY5qwsLwYRxmfrfKWts8GdFxbvmfa4DlIGH94GI/Ql4jVCrDmQUblEyO1yZBDs7efYrCSYShruBfp1xYNcXxRiOQ527SrflGeo0SlYKEBk1vn879sQoY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hJBI9d62; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hJBI9d62"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 765401F000FF;
	Tue, 29 Sep 2026 13:26:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790688409;
	bh=cxOvC96KegBOZQQUEngysEr6Me1/DKR6BI7eD7+1ZmM=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=hJBI9d62YiQTZHaMFZRgtZOZrx+SRFgSuId0pNh3eugfH+RjU86WgZljD3YK1v02B
	 MaoKiPfw/B5MfxlbRArH9X8U2snkUkzEwHtyoO3YqMtQZfysX9kSyrRrdMwzOdhtmY
	 1hw6tZFQ1xq0n94YLfBdKS23ngzOMcqGYG88aJIOCu1E8bIcfUPqtoJ9x3NRim6hpj
	 ys5K9H0z00u4CAp+oqs3XIu3zzOkx4s0LfPsJKvorTIksgESUciVKgDZIMqf6V0QCo
	 hQXhRV7qskwJ1nZWmJzIwwBD0A98FatP/J+tKoreAu4cn+TPKLIx2FqaDWLV+C1E7I
	 kV4oWIPpoIcGw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 11/12] arm64: dts: qcom: pmih0108: Enable BCL sensor
 node
Reply-To: sashiko-reviews@lists.linux.dev
To: "Manaf Meethalavalappu Pallikunhi" <manaf.pallikunhi@oss.qualcomm.com>
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org, linux-hwmon@vger.kernel.org, lee@kernel.org, mfd@lists.linux.dev
In-Reply-To: <20260929-qcom-bcl-hwmon-v3-11-f5ca00889cf7@oss.qualcomm.com>
References: <20260929-qcom-bcl-hwmon-v3-0-f5ca00889cf7@oss.qualcomm.com>
 <20260929-qcom-bcl-hwmon-v3-11-f5ca00889cf7@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 29 Sep 2026 13:26:49 +0000
Message-Id: <20260929132649.765401F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

> Add Battery Current Limiting (BCL) hardware monitor node for pmih0108
> PMIC. The BCL monitors battery voltage and current, providing hardware
> interrupts when configurable thresholds are violated.
>=20
> Signed-off-by: Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qua=
lcomm.com>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260929-qcom-bcl-h=
wmon-v3-0-f5ca00889cf7@oss.qualcomm.com?part=3D11

