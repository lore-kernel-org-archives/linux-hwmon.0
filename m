Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ABC483D1A81;
	Tue, 29 Sep 2026 13:29:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790688563; cv=none; b=Nzg2+V2RCQqMXKI8rdjX8yabAb1WfRzYP/ZmMOjRZAj5wxEZfMR9Fezc06HJ1wTML808a9mIvd75pknIoiscCszMbQfNj20Irubff7s+rpgw0HmUdJHgL6IL7yupNhfR5FETCMUJHMfcKlDJQ2zV+j2AidqpaX/x0O89ETaRRls=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790688563; c=relaxed/simple;
	bh=6aTbfxPxTtV9BmPR2O2YOyZ529g4g1fURAHlcDFrnco=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=CxkzqeFUrzjOb7qimnOKY8QYpNz+/YS4dq7Mr7s/eCHJ0FrcUFW9B1OKbZDU9OZdCkU+kuRtQuPDvvOY+4G9mq32i+N9UFoaTPumKgCW1UHlVR56q1Zl1tME2vk9EHcNNMwT7cBRgjif/Ym44+cUI/mU6oOE1Ugxgx3c8PJ6ng8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Zqulz+TF; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Zqulz+TF"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C84941F000FF;
	Tue, 29 Sep 2026 13:29:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790688562;
	bh=6aTbfxPxTtV9BmPR2O2YOyZ529g4g1fURAHlcDFrnco=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Zqulz+TFntOslVsFXMuiU31Ea+Sxz2ibc3FoYHckCrb7iPd3njV8TlpLNJPOzBFrb
	 aqxm+Pv4l1by79FNKOD1No/aKW9TXSzCPVzniiWBedgvErXs1cRkg6/CJTb/njb9Dn
	 zPksMxG23LvnberPQTnjyUrY1IFmd01+/nQVzZqsZW6c4xjtFGCxQkcdh/+QuVw06r
	 SfFdEJyp+BoWpDomXOPe56i0oXSyWUnCf6aakFVxmOYY0pxXFXrfJ/l+J2HE5LxWI8
	 b3vDzLXB9BsGEvTuTY4kExfKR6DG4iEqiCH1HA34hfRyBaipGS7/cYrPoBmQO2xmsI
	 R7BZPB+b5VtAQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 12/12] arm64: dts: qcom: smb2370: Enable BCL sensor
 node
Reply-To: sashiko-reviews@lists.linux.dev
To: "Manaf Meethalavalappu Pallikunhi" <manaf.pallikunhi@oss.qualcomm.com>
Cc: robh@kernel.org, mfd@lists.linux.dev, lee@kernel.org, linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org
In-Reply-To: <20260929-qcom-bcl-hwmon-v3-12-f5ca00889cf7@oss.qualcomm.com>
References: <20260929-qcom-bcl-hwmon-v3-0-f5ca00889cf7@oss.qualcomm.com>
 <20260929-qcom-bcl-hwmon-v3-12-f5ca00889cf7@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 29 Sep 2026 13:29:21 +0000
Message-Id: <20260929132921.C84941F000FF@smtp.kernel.org>
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
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260929-qcom-bcl-h=
wmon-v3-0-f5ca00889cf7@oss.qualcomm.com?part=3D12

