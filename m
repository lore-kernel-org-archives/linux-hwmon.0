Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D1AC3C9896;
	Tue, 29 Sep 2026 13:24:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790688268; cv=none; b=RCuO58jDJLEcirCL5Fh5DZuBXUmGAHonq04jBR06C8PLjaGrVJ+hs5Fvp1oxXKCNGRM9nud4G4/x5KZlsYLHLZK0b6rBOoxngnJPaQ5k1wyomU+gDv046ev3xHH9s/ADQch3sAfVnqYqSwzqK46JiFOKxbKuTnkLr5F+u/IC2jY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790688268; c=relaxed/simple;
	bh=RZTIkxV8OBfQRJrJQEWqjjx0oM4nOuAuriDrMg2hYT8=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=cbW+3ycdQoJJ2xRNTQbYbuAbox9T7MSRBx4IPhy3yrvf/38gETPuKfGLIu5YdDqvaLKtxpn1nDiwSMuaHy2QzAUFUUaGS5DpOdRWyciXi1WGot4IiFNxqzCMrhDOx9vNKBMNses+LZiXxJgh1gYo3cUHjt+S2QgCyOZfDRyA4tM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=BXTQEtvx; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="BXTQEtvx"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B462C1F000FF;
	Tue, 29 Sep 2026 13:24:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790688267;
	bh=RZTIkxV8OBfQRJrJQEWqjjx0oM4nOuAuriDrMg2hYT8=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=BXTQEtvxTw3/piY2XJ54KwzkOTEKb968qqIrMDHVC0hsaCnBD1SmHWglMgQlYdYR8
	 qyJu4GpdSJfOts8jz0FuAOre3xSVPuz35yau4tg2dphzgqtyFh3Hi95umyC4WflnbQ
	 qzZTnDtwMboQ920LfAvli1Jkq8ShiAVX2/PL6YQCLeqOTf0hRvBO/Phf5fF3fJthsr
	 RqTfYaaiPYvFLrxFfRsZ6DrQC/T9XksCp/D7Vl9Fss+XJMe6JMsfOj+lBoznkAy5h5
	 h4HB+mTg2oMB3q0nK9l/Bg/XM7+y52OsJrlW92+Gll6tQo9kAbGwvxNwoyH75E44H3
	 fW2347YVgPjaw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 08/12] arm64: dts: qcom: pm8550: Enable BCL sensor
 node
Reply-To: sashiko-reviews@lists.linux.dev
To: "Manaf Meethalavalappu Pallikunhi" <manaf.pallikunhi@oss.qualcomm.com>
Cc: lee@kernel.org, robh@kernel.org, conor+dt@kernel.org, mfd@lists.linux.dev, linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260929-qcom-bcl-hwmon-v3-8-f5ca00889cf7@oss.qualcomm.com>
References: <20260929-qcom-bcl-hwmon-v3-0-f5ca00889cf7@oss.qualcomm.com>
 <20260929-qcom-bcl-hwmon-v3-8-f5ca00889cf7@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 29 Sep 2026 13:24:26 +0000
Message-Id: <20260929132426.B462C1F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

> Add Battery Current Limiting (BCL) hardware monitor node for pm8550
> PMIC. The BCL monitors battery voltage and current, providing hardware
> interrupts when configurable thresholds are violated.
>=20
> Signed-off-by: Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qua=
lcomm.com>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260929-qcom-bcl-h=
wmon-v3-0-f5ca00889cf7@oss.qualcomm.com?part=3D8

