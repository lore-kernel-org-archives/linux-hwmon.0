Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D6EA44B68B;
	Thu,  8 Oct 2026 11:49:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791460191; cv=none; b=br0h9nZMJpNIWcBFWyYXcB53KvZeUgsgFX1Og5r8m2pskigP41btxomP79kKw0GzZ0tUseeBbjpbM4Mw2ONxuLdumduxPv3XTZhBzz8GSHn4O8od36tsFI4tpYw7j2GWAHQu38iO6PRGQvV76/C7vaISOj+1remIzd1///zfGsc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791460191; c=relaxed/simple;
	bh=t25R2XEBAqcEh2zxLxd18TNBevLCgrI1cFsDq9fUJ8I=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date; b=PUVFQi8BnMIVn5rYNVLqtZ1jiDksA4YBIG51jOOBPqhYagdIXprCA09g1AraboOtJV99tvztJysX0cYpwEy2WNv8caKDVaM13ZeHop/SF71WCeUd4J4QyF+ajVuGxh3dQaNUOY4Xdmit8CIa3tHe5ke1BT6rPsIzi5/wb8L5JP4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mZsfQrDD; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mZsfQrDD"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2CD311F000FF;
	Thu,  8 Oct 2026 11:49:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791460190;
	bh=t25R2XEBAqcEh2zxLxd18TNBevLCgrI1cFsDq9fUJ8I=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=mZsfQrDDOrAP9kcuW9K7VGwAAN/6soGEBBLKPePITj31efWc7W/rSzR6bs8QLhBj4
	 IgNYb+qnoFB4PWRzL3/ivIsKaOGy0fFcG9swJqqIW3sn0bFkW7YqZN1nuXedTJeNni
	 fT47A3a5L656/cnNvQMBbm8Cdl2+1Tag5Y9kK1b7AR118UHyXTU9TgXDCn5iFxVNQG
	 K8XwHY1YpeuuyyD9kJZ22dgyxe0M63fIheXwbQweWQTBjm/YKC2dIBvPvPnqsAzPtP
	 5GybiqfmX33rVQn2Sx2dvLpF0RlmAcRxXS0RCYjd6PK2YmNOMO+x3jp8U11ygxI56s
	 5gKABT2Hu+xbQ==
Message-ID: <sashiko-outbox-164106@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 4/6] peci: cpu: Add Intel Granite Rapids support
Reply-To: sashiko-reviews@lists.linux.dev
To: "Changhuang Liang" <changhuang.liang@starfivetech.com>
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, linux-hwmon@vger.kernel.org, robh@kernel.org
In-Reply-To: <20261008100623.7085-5-changhuang.liang@starfivetech.com>
References: <20261008100623.7085-1-changhuang.liang@starfivetech.com>
 <20261008100623.7085-5-changhuang.liang@starfivetech.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 08 Oct 2026 11:49:49 +0000
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

> Add support for detection of Intel Granite Rapids processor based on
> CPU model.
>=20
> Granite Rapids processors with the model set to INTEL_GRANITERAPIDS_X.
> The data field for this entry is "gnr".
>=20
> Tested on JHB100 BMC with Intel Granite Rapids processors.
>=20
> Signed-off-by: Changhuang Liang <changhuang.liang@starfivetech.com>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261008100623.7085=
-1-changhuang.liang@starfivetech.com?part=3D4

