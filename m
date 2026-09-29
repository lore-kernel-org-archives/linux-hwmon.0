Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0FA2C51589F;
	Tue, 29 Sep 2026 13:25:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790688345; cv=none; b=ahDKWZI8HrRbkruErOcCOrNU3qIeDNb3CO9TsAPBV6zWn+zVF4Dc/+OQeaD1YH0/TGTp4H+yLwoya5O2zDEAxrLR/MaCw3G6Tvrmts7nH/NiIJVzSsVUpR4jDIbYToBk6Vga8Uu/WYyxReqGnLw12tCs8Dg53O14h3b+azvUgrs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790688345; c=relaxed/simple;
	bh=LQIGVwIJJvz/wspkU+itzuEHgDRSa5bJoFbxK+dWw+I=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=aSnfkPIEWA4qx2QFb1ErFLsmJptABWU/69nLc2pK17ZG8VIh9e2vAXXhecZTK/9HDeY1b0XZWtLKpP4GC/X/p90tToFV8ivuVwsYYPV3ixtkY/9O3tqtiAqXMkxWHko9O1Ku7c8Ik1NIKlyP+WpkOxv1bbGrHu4moS0hdkVzp0I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=MniCQOfb; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="MniCQOfb"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7E7371F000FF;
	Tue, 29 Sep 2026 13:25:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790688343;
	bh=LQIGVwIJJvz/wspkU+itzuEHgDRSa5bJoFbxK+dWw+I=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=MniCQOfbZRLUnyOJY+mD2kiCYUft3bFCt34cMogQs/sCml/TtcBS73eCZlF3Tdpfl
	 ef37n/E+YS1f7QzjhrVLlikX0dFJeAg7FlXn2hCWsHX1AGSOLt3Mx8PvchYT4WngoY
	 dvkYEKGx4CSqlWuJW8/DU7cQp/k7wf1fp4WX4jUNRttx+SLzJG5+Xj3pQUu+ZnDuTI
	 WZ8wum2Bd6R0CmJWR+7qQLgYcdGmI86uc1xKEupvcOgliD8zJKtI3sufv8VcB0TS3w
	 erSuFdEjtGqiYKmEGleO+9l3fB2GrKSYqyjq3gkYinvY9Wg0oGuy1wyJzFJ+Lvzyhm
	 fdjN8Te0cODJg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 10/12] arm64: dts: qcom: pmih0108-kaanapali: Enable
 BCL sensor node
Reply-To: sashiko-reviews@lists.linux.dev
To: "Manaf Meethalavalappu Pallikunhi" <manaf.pallikunhi@oss.qualcomm.com>
Cc: robh@kernel.org, devicetree@vger.kernel.org, lee@kernel.org, conor+dt@kernel.org, linux-hwmon@vger.kernel.org, mfd@lists.linux.dev
In-Reply-To: <20260929-qcom-bcl-hwmon-v3-10-f5ca00889cf7@oss.qualcomm.com>
References: <20260929-qcom-bcl-hwmon-v3-0-f5ca00889cf7@oss.qualcomm.com>
 <20260929-qcom-bcl-hwmon-v3-10-f5ca00889cf7@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 29 Sep 2026 13:25:43 +0000
Message-Id: <20260929132543.7E7371F000FF@smtp.kernel.org>
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
wmon-v3-0-f5ca00889cf7@oss.qualcomm.com?part=3D10

