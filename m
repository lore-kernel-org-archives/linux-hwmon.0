Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0CAD768EA;
	Fri, 24 Jul 2026 04:56:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784869004; cv=none; b=JRKY2LYzNc1bSaT9zZRMhO7Tedb9835QPbhEMWw7VxqaANiib724k/tTTjxSBuIRYddLf4sOaY9ZTTWNsEjePyda93nQYITvwFrMqRFbIVIX1RwNSGrtOseAHW7ehbR4xi60HdC7/2nvCmPiClAEFgaK36GXKsO4i8hffnAJdPU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784869004; c=relaxed/simple;
	bh=AGfBWkX24fEt7pRVQQ0C0MEupSTUWD2PfRcia8LORSI=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=ElEfGy3GAPJFsz6sZTyFE8R4vnTjbGq6uIQEppZGLXQ64PEyHB5TuRgNGkPCbR/hHmBKcLw/WKB4S7kE3yi7RAyBo6u9J7YuvwwfkYuhl4GMDSF6NOnrUxoLjxyKWCmp0iImhGZXbX9kEoML45/1dlJC63xhqCtTVozvOdj+Fbo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dwSWw8WO; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dwSWw8WO"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 645DC1F000E9;
	Fri, 24 Jul 2026 04:56:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784869003;
	bh=AGfBWkX24fEt7pRVQQ0C0MEupSTUWD2PfRcia8LORSI=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=dwSWw8WOKAXlot0myn25MWxwEadTW+ucccFCGD8axTab5TU0GB4u7S+zzEoVdmp/x
	 9gPpWfQO0BnlKbxKCz+YqHMtOWT79gK30t+HrdywdzGUo76TnYTKtXGJzuImYA49ta
	 z1uiD7JPzj97u4xweewkJCl8nvRsf5NSrsnDIppIz2Oh5KNub1SwqZb2Dl8YZF2ZCb
	 beD8+BO7ZRoLNXicpOfRVtqvZeIvhK/Jrd28YUtfQVMiv2lFAC1Gc1snqW49XcOjN8
	 0Ra+TG/GNRcOdUlA4Hlztpdhm/9XovGuFEhni3wS+mTUr7bfP/+Eij1MRXaCAASCrs
	 cG/DKPMKMkpSA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v5 3/4] hwmon: (kb9002) Add driver for Kandou KB9002
 retimer
Reply-To: sashiko-reviews@lists.linux.dev
To: "Andy Chung" <Andy.Chung@amd.com>
Cc: linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20260724-kb9002-upstream-v5-3-9523c3ffe83a@amd.com>
References: <20260724-kb9002-upstream-v5-0-9523c3ffe83a@amd.com>
 <20260724-kb9002-upstream-v5-3-9523c3ffe83a@amd.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 24 Jul 2026 04:56:42 +0000
Message-Id: <20260724045643.645DC1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

> From: Andy Chung <Andy.Chung@amd.com>
>=20
> The Kandou KB9002 is an 8-lane PCIe 5.0 retimer that exposes an SMBus
> target with mandatory PEC. Add a hwmon driver reporting the firmware
> aggregated maximum die temperature as temp1_input, with the firmware
> version and boot status under debugfs.
>=20
> Signed-off-by: Andy Chung <Andy.Chung@amd.com>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260724-kb9002-ups=
tream-v5-0-9523c3ffe83a@amd.com?part=3D3

