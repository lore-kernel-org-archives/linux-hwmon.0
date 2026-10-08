Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A9BC448393;
	Thu,  8 Oct 2026 11:48:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791460125; cv=none; b=V4UzsCJsYenppV4wpDGqISJcBfA7Zqmx6WiPqFtUvEPq1jGouJQcVZ9RrFGdtbu4Kj46osHauGY3sbBbqqPzQiaDR3vM4SdUtfAO7Jc5A/Aws96Wr538BU2Jc6S8rOFtNaFIVSgyOu9+lRPL71m37HqTxiHNvH1E6wuRFslo05o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791460125; c=relaxed/simple;
	bh=hSyPXp7SJ0NULGNcHuIXEM8snF2Bruthyt7agjUTLoc=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date; b=k/M7xoFimI7lbRrh6/CCy+Sj+CFyNL6SRgV4H+XForVr184x89jcLKlADXDogOO2tk9gPDf8pxRiwTvhJsXNxLBr6MxJHqaGilsD3mDlN+LucYPzoyYuLkqe6QzmVRCLz4xAgBN0jOVWiYd99Kjn0GJHR4ecy7yUtXXmh19auuA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=laIk8Beh; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="laIk8Beh"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 82AE41F000FF;
	Thu,  8 Oct 2026 11:48:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791460123;
	bh=hSyPXp7SJ0NULGNcHuIXEM8snF2Bruthyt7agjUTLoc=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=laIk8BehItMnHxxePV7/hb6wi/fTEutji6H7iYt0+dfbULu7khyTyW9svWWLl/tY/
	 JGvlMmCNXRaAgXChOiLwt8VMBx9ossPMTww9UpPVOsy15Tbov5GNerU7KpBaNPjaxU
	 IDvAttbf5FjKuesTF9xuzjuCqwYkRPfVfUcOp6eIAjpKdp2Fac7eE6NUmvQgsJ1X+V
	 eM3bAAPFtSD276MGd/6mRwcq9MYW/E9gMu33DSex/eGU+QrwqtHw/DJB+1KLPs3B44
	 eYTRAYzhLIqhqA8tCZNNMO/Mt2Nkdhnbsh/fNgMBmx/IMkUJNrWnowvQt1rx+Sd3F6
	 Mt/EGX6MVQh1g==
Message-ID: <sashiko-outbox-164103@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 5/6] hwmon: (peci/cputemp) Add support for Granite
 Rapids (GNR)
Reply-To: sashiko-reviews@lists.linux.dev
To: "Changhuang Liang" <changhuang.liang@starfivetech.com>
Cc: linux-hwmon@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20261008100623.7085-6-changhuang.liang@starfivetech.com>
References: <20261008100623.7085-1-changhuang.liang@starfivetech.com>
 <20261008100623.7085-6-changhuang.liang@starfivetech.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 08 Oct 2026 11:48:43 +0000
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

> Add Granite Rapids (GNR) CPU support to the PECI cputemp driver.
>=20
> For Granite Rapids, the resolved cores mask must be collected from each
> compute core. This implementation is relatively complex. Since we do not
> use the resolved cores information for these CPUs, we can explicitly
> state in the driver that the core mask is not supported for this model.
>=20
> Define new cpu_info structure for GNR with minimum PECI revision 0x42 and
> the thermal margin conversion function dts_ten_dot_six_to_millidegree().
>=20
> Signed-off-by: Changhuang Liang <changhuang.liang@starfivetech.com>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261008100623.7085=
-1-changhuang.liang@starfivetech.com?part=3D5

