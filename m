Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4652F415F25;
	Tue, 21 Jul 2026 19:13:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784661203; cv=none; b=m/IsoHrpfpmBr+9C6utoAKeJuowCTKkSrMzQMTbc0ikWZ6uqHGd1ytCum7ruWrxBOfybRA5vN71MDY+NrIFJa+FDFu1KxAvzz1hgI+FYfw1BqDMqxYbEO67spDPb9pTQy8ksoP1gOf4ZxYMMMG6gBAC9CvRxSZ+c1S+zMw1oRgw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784661203; c=relaxed/simple;
	bh=YACUPA5eVVAD3B7PHmE+hSzK8etT9mVafdQMfiqF+H0=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=VBMFOLR5mSxBeeh3Qp9Y9v6qzppbrGq8DAtiiZoa8tySxYeX9vzqUiL+Tb5PjjYUMS2qb013hOasEfitsuSESTe6ezo0jita3fOzd5WXJzJ7G7CsIoILYdT+RbaveaJPdjfazfJ/bdJMCn1n6FNCo3jNsFS7nrvgc2TdfTpCRBs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=i/sMxLED; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="i/sMxLED"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A67BC1F00A3A;
	Tue, 21 Jul 2026 19:13:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784661202;
	bh=YACUPA5eVVAD3B7PHmE+hSzK8etT9mVafdQMfiqF+H0=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=i/sMxLEDb8R7nqz9IanO2FGiOYIdxD3LXoTS3Ca2+OsthL73ysClplEQvY2Hfwwm3
	 zeiegbAbB4CQJCDvOBwFUWyFAawPuyfqnlSD8uDsUKj9WgK2KlrQzRbBxJMA/fyA3m
	 /1oKOCpKdC5LLnFaPkIVdjDtZ8nTevmS45th9zSU/iVdH2jgv/bxxvpWy2soMsSGq+
	 YXBuwqhgPPCf7YVkXfM/BbyFwTfMu6mgKXTRWkUMv2tHrjJGCmHH57LtNRH2b/giHa
	 NYqbm/frPwgjzkGrN9xxBNyFj24q41BBMrqo/tYyP840SmoLIW1+tOGo/fPbnEp7xL
	 cj4tVPFCMZIbw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 03/10] arm64: dts: qcom: pm7250b: Enable BCL sensor
 node
Reply-To: sashiko-reviews@lists.linux.dev
To: "Manaf Meethalavalappu Pallikunhi" <manaf.pallikunhi@oss.qualcomm.com>
Cc: mfd@lists.linux.dev, conor+dt@kernel.org, devicetree@vger.kernel.org, lee@kernel.org, linux-hwmon@vger.kernel.org, robh@kernel.org
In-Reply-To: <20260722-qcom-bcl-hwmon-v2-3-febe2805e17b@oss.qualcomm.com>
References: <20260722-qcom-bcl-hwmon-v2-0-febe2805e17b@oss.qualcomm.com>
 <20260722-qcom-bcl-hwmon-v2-3-febe2805e17b@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 21 Jul 2026 19:13:21 +0000
Message-Id: <20260721191321.A67BC1F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

> Add Battery Current Limiting (BCL) hardware monitor node for pm7250b
> PMIC. The BCL monitors battery voltage and current, providing hardware
> interrupts when configurable thresholds are violated.
>=20
> Signed-off-by: Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qua=
lcomm.com>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260722-qcom-bcl-h=
wmon-v2-0-febe2805e17b@oss.qualcomm.com?part=3D3

