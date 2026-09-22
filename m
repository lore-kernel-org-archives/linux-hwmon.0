Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD06C47B43B;
	Tue, 22 Sep 2026 09:37:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790069873; cv=none; b=FH8plBzXUIG2fl/c80ZSTWOsVG5728tWCrESduyi3gor3z0GQHWjv6VTdLAmsKjFt5/IcCyR8qkEwhtcYTY5a6ZTNhhDrbthci//PPKX7/4RkfO1/JTdlu4QjdysExqoqUiVmsg6b64xuBy1BlLruTR6xhBf6+92XSZ5Gg9ZZJs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790069873; c=relaxed/simple;
	bh=WwByykxAFPzXxROEr+NiLjybzKOczzR2s9On/2GaOi0=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=hpK94HTfDRv6DMc9q4TwNf2E1nukO4HU6GFGWAYiFHXgt7PwgEcc09j+eC8J2JgMA2BdBSpbJyxXKNehlDQOPabVyX23MVDdHo2ngaWaRXV2FtjF0JSJxuWlCamilJGQZXLEReQyyCVdhdG5g/D6hpmXuWcrNb+nErvB49Jkyf8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=PDXFGpc3; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="PDXFGpc3"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 203501F000FF;
	Tue, 22 Sep 2026 09:37:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790069871;
	bh=WwByykxAFPzXxROEr+NiLjybzKOczzR2s9On/2GaOi0=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=PDXFGpc3eeLMkOzSZvKc7GzTi7HN+cQsZWDGqksnnT6J8hgyaTwavuMBf9Anc/qBY
	 7YcAakCdq1Nkc90Mqss3L7V0ZAjR2bxi/exD9pkgsBFvjGVArL+E6pFsp80+qQjwFJ
	 oqM/r9dIvQpQ9pxCyxzLSQS6/eVRfStGpDA0LtQh9hODGHAWFgPTV/K4PfNl22qvCE
	 Q/LY1fChtbXnni6nILb0xI48mGgqeiI5n41l1CrjhTFByU+SBKLAkJ+g7Yfe2O5Pt9
	 7tse6/sT3honwfK4LEZ+mLNu/Jgu+46UCPBH8FcIAqor151Xu3nO7v+dMvXYbpbgl1
	 OlLe3LWe7UXHg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 1/3] dt-bindings: embedded-controller: Add ASUS
 Zenbook A16 EC
Reply-To: sashiko-reviews@lists.linux.dev
To: "Konrad Dybcio" <konradybcio@kernel.org>
Cc: robh@kernel.org, linux-hwmon@vger.kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260922-topic-asus_ec-v2-1-0bd923d1b853@oss.qualcomm.com>
References: <20260922-topic-asus_ec-v2-0-0bd923d1b853@oss.qualcomm.com>
 <20260922-topic-asus_ec-v2-1-0bd923d1b853@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 22 Sep 2026 09:37:50 +0000
Message-Id: <20260922093751.203501F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

> From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
>=20
> Some Qualcomm Snapdragon X2 Elite (Extreme)-based ASUS laptops (at
> least the Zenbook A14 and A16) expose a custom, somewhat
> Qualcomm reference-derived EC interface. It allows for fan speed
> reporting, keyboard backlight setting and receiving of a number of
> miscellaneous sideband events.
>=20
> Introduce a binding for that class of devices.
>=20
> Two separate compatibles are maintained since the two laptops' ECs seem
> to be generally alike, however assuming full compatibility with the
> limited available information does not spark confidence.
>=20
> Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260922-topic-asus=
_ec-v2-0-0bd923d1b853@oss.qualcomm.com?part=3D1

