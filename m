Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 912D84CDA3A;
	Thu, 17 Sep 2026 10:59:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789642746; cv=none; b=qjmXhUuBZQv5swnbduKJCrrBX+2/39D3Y5ghhKpsFpFlV9ZimQnSeK6/2xJia9fuFqH621/dXnwQotmbVwcRToVSV12557fXdjglvyjHPN4Zg5LGVBr7PLrwjdptXkkRPH7vnYPBnNIpdkaU913Xm1oS+Hj0LAg4+UZoD2HiGiU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789642746; c=relaxed/simple;
	bh=Vzb7KQTIhBXbj6AG7bsVCU+EPO1cQMvsXqB08yMKInQ=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=B0bWA8GQ1p1QiGSYeeL0r6m3JWHsylyd0coWk0ObevCBHydKPh+96ncTvqUTQUHKgM6XWYGCMGAgxTtCJ012f8pw0OVBA35I1CD6NMdw0N2htTBsk+yS6BfiYKAvqdqa+hIZTPdVo+VCjoBPoyKCNcti/BniHw3tS05zd3VWSFs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=EjTFNFrj; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="EjTFNFrj"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A64751F000FF;
	Thu, 17 Sep 2026 10:59:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789642742;
	bh=Vzb7KQTIhBXbj6AG7bsVCU+EPO1cQMvsXqB08yMKInQ=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=EjTFNFrjr9Y0igOkoaKXd/NNajzHlWJPi9XFaSqkFlm3V+DWzdzTJ4PR0z7kCAtc8
	 e8T00MYO2PpNs7WmIWsjTc/oeyRo1OpLl1g4I7zNSEDlJlQPfrSAw5ZlTHE93c4zcj
	 LDlaS9nM+7+9Zai76araZAasN2DVeJnNW2HGSVginZE7AQRFFgvbP3+9GEOkFgGJQn
	 8wN8gE1HPNQ2ORNmhsKoZbLL7iGUOVnjxC4IwhHCe21sv7s5tPfqbNONDx7+uWmjfP
	 Isrtom7J7BBdXvxcJ1BbfvPeob8i5+z4W0z4QYiO8UWOmhExBKXzMMR7rqNOCiwvJt
	 UdXXuP1YDTjig==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 1/3] dt-bindings: embedded-controller: Add ASUS Zenbook
 A16 EC
Reply-To: sashiko-reviews@lists.linux.dev
To: "Konrad Dybcio" <konradybcio@kernel.org>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org, linux-hwmon@vger.kernel.org
In-Reply-To: <20260917-topic-asus_ec-v1-1-373516d347ae@oss.qualcomm.com>
References: <20260917-topic-asus_ec-v1-0-373516d347ae@oss.qualcomm.com>
 <20260917-topic-asus_ec-v1-1-373516d347ae@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 17 Sep 2026 10:59:01 +0000
Message-Id: <20260917105901.A64751F000FF@smtp.kernel.org>
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
> Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260917-topic-asus=
_ec-v1-0-373516d347ae@oss.qualcomm.com?part=3D1

