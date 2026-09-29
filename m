Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E24A152758A;
	Tue, 29 Sep 2026 13:15:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790687737; cv=none; b=GhaQGcA5I1yOWm1wYE44VlPj/NPZ4/JZMHaD+K6pKWk5Y89yZtkmsLK3fMGQfmOfJqHdr8MNg3MnIbqSXmv7ygwdWpf0c6PKo5o9qDSQ7II9axXFEhRNLxhwsValNY3JBGBmlZF3aG1Y4gzxJ7coq3y9u/XmhXEAGV/u+LX8rro=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790687737; c=relaxed/simple;
	bh=Oo3MnRIDLva88dXDLkmpCekC+s3i6UUoS8Qxp8xMe1k=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=jbeQ3GkPmA8uNwYe98u1c+BOxWpe3eUSdO+P3J6YtHpOtR59ehvg3Y547BQ1Wf/Loninve4lfMxOcblD0dnIsr5duPt8u1TYnHlz1SpDYXYi0lZEpv1Sh4nO12p1T4oY0a81OMPUB/Ssfv2/hTqX1956ze7Sc4rAunhUBefjl6c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Ob9dZ4/N; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Ob9dZ4/N"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8C1AE1F000FF;
	Tue, 29 Sep 2026 13:15:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790687733;
	bh=Oo3MnRIDLva88dXDLkmpCekC+s3i6UUoS8Qxp8xMe1k=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Ob9dZ4/Nuck15ICD2k1cmNrlmuwEzxptH7j00cgbWU8NejAwqxlfR8keLpVxrXvtW
	 CgyKjeFen5aCxO7cGAK1KrRNisXzKXaDPJJbZsRhonw+9Hrs9nGchMkCr+d35BIIow
	 vlgUwa8uVjJeX364lEhXHwnyh/gwUQJwEB7YeXk1f3jJmvT+p+M3MsYzV1mfb3j51W
	 vo8Ctr27vFn4tdVsb5XGv/asU/BtnxSURcLcXnyKMEdyf+jywT5p7/uiOkUJvu7lI+
	 e4qT+zaxEUxnS3SSrCaSksGrFZrdKAXCFfSiw8OrdMQgfKRVRnZWHksrbDyE2wep/i
	 YaNFBcQNNyFnw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 01/12] dt-bindings: hwmon: Describe Qualcomm BCL
 hardware
Reply-To: sashiko-reviews@lists.linux.dev
To: "Manaf Meethalavalappu Pallikunhi" <manaf.pallikunhi@oss.qualcomm.com>
Cc: conor+dt@kernel.org, lee@kernel.org, mfd@lists.linux.dev, linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org, robh@kernel.org
In-Reply-To: <20260929-qcom-bcl-hwmon-v3-1-f5ca00889cf7@oss.qualcomm.com>
References: <20260929-qcom-bcl-hwmon-v3-0-f5ca00889cf7@oss.qualcomm.com>
 <20260929-qcom-bcl-hwmon-v3-1-f5ca00889cf7@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 29 Sep 2026 13:15:33 +0000
Message-Id: <20260929131533.8C1AE1F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

> Qualcomm SPMI PMIC BCL (Battery Current Limiting) is a safety feature
> that monitors battery or system voltage and current to alert system
> for overcurrent or undervoltage conditions.
>=20
> It provides:
> - Real-time voltage and current monitoring
> - Configurable thresholds per channel
> - Hardware interrupts when thresholds are violated
>=20
> Add a devicetree binding to describe the BCL on Qualcomm's PMICs.
>=20
> Add sensor type to SPMI device list for BCL device.
>=20
> Signed-off-by: Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qua=
lcomm.com>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260929-qcom-bcl-h=
wmon-v3-0-f5ca00889cf7@oss.qualcomm.com?part=3D1

