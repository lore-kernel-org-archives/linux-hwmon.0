Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 409D82594B9;
	Wed, 24 Jun 2026 10:34:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782297289; cv=none; b=hQ1i+5jrWV9c4lDuyPIDT9uMZTikag8U86/elnanl1V1ryja/zr5ObYLukRcuZznR5VJR2CKAV6F1EgYATxVeTyD4FeJoTKkut5jg+A3ztMas9S1AwgfOgyw5bHgnS6L3M5EoUI5LlO7SkTxMf7kzmhiiywrtvs6vG7y8vQc2ts=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782297289; c=relaxed/simple;
	bh=5u2mB94KU/2aCCKO6pwMVLkSA/uhHZfjjiATcfwE2bw=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=uWFsYCWvltsnrfq19HVsIFRNVugS5Xw1VJt8ScZPl1Q1i+WaAhNz9x8PlFWMxIKZxfPxPXgIqVzuu4dLbrv/4MYS/WwIDeBI5+k+1ae6IaEQnOXePGModLGnfvdhqbtJHZa1lOMpLKAzE5AC2S/FYQhs/kF3xg+YTFvAVgA1yvQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=iyV62ObD; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="iyV62ObD"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 843941F000E9;
	Wed, 24 Jun 2026 10:34:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782297287;
	bh=5u2mB94KU/2aCCKO6pwMVLkSA/uhHZfjjiATcfwE2bw=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=iyV62ObDp4dxEdmUYA4X5Oh8V+3WtK+NzB731X8YQLYaiVth+7mKwGvHUWpqwOTp0
	 mVmlbiP/Gd19+e3Fv5KtIoSj5BjINeJXguO0943jJGLOa7fqB6dh/1SwF1DYNDHqer
	 lQ22As/S1pEMzjjPSDeshMWENWqU0OkqNaH31RKbCmXYg6HyXLLeWXGHaI1MMdcUag
	 +ae2jYtIkFYYXgtDrQYGf1beZgYh417ns1GpCbAzabH1g7tQT6GAD35Z2vHnTLkss7
	 nb3ccWo14soBr/Rx+EROnAF4Z6z+/2YpcbKlJfiE5fhHMtzGOD6X5v2cZagkwySSDT
	 9HM0JUauCfSaA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v5 07/12] i3c: dw-i3c-master: Add SETAASA as supported
 CCC
Reply-To: sashiko-reviews@lists.linux.dev
To: "Akhil R" <akhilrajeev@nvidia.com>
Cc: linux-i3c@lists.infradead.org, robh@kernel.org, Frank.Li@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org, linux-hwmon@vger.kernel.org
In-Reply-To: <20260624102153.1770072-8-akhilrajeev@nvidia.com>
References: <20260624102153.1770072-1-akhilrajeev@nvidia.com>
 <20260624102153.1770072-8-akhilrajeev@nvidia.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 24 Jun 2026 10:34:47 +0000
Message-Id: <20260624103447.843941F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

> Add SETAASA and SETHID to the supported list of CCC commands for
> DesignWare I3C host controller.
>=20
> SETAASA is a broadcast command that assigns predefined static addresses
> to all I3C devices on the bus.
>=20
> SETHID is to stop HID bit flipping by the SPD Hub to which the SPD devices
> are connected. It is a prerequisite command to be sent before SETAASA as
> recommended by JESD300-5 and JESD403 sideband bus specifications.
>=20
> Reviewed-by: Frank Li <Frank.Li@nxp.com>
> Signed-off-by: Akhil R <akhilrajeev@nvidia.com>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260624102153.1770=
072-1-akhilrajeev@nvidia.com?part=3D7

