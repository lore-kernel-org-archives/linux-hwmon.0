Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5DFA34EA383
	for <linux-hwmon@vger.kernel.org>; Thu, 15 Oct 2026 08:58:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792054738; cv=none; b=Vk2ua7WjKaJuNWrl0CjwRMtke50YVUeUOcv3RWhH3itffHy3YbXGmnL9XWtR/ad5OuraA6eHjguQDXDLowEyLzKBXhnfhVBxepXHYiF8Q/V5yiCuqxrcnLTiicCzNxcTGz0NExBnnW/GvpjIvKsgTiPKA8BvZzkLXZg5VRgiGwc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792054738; c=relaxed/simple;
	bh=0JJxSDJnM4CuB4HemZ+JYsfyQuNtrG9Dxxl6t1vd3M4=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date; b=Y79WMFGTQy3AU//A84358UO4T0U2z4+orULxoQxq92fdK+ju1nOhpgZBuWKSXNn65yA8hoauaBBYORkSFzsQN7CGXwpNOxcte9t99Wdyohpy8luFu0TLHL/CKr6Ld9j9re8VmcVr9qVSFbVjolfTBr0YdvQgk7yNllcQnGRUGsc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=iWN7HHH2; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="iWN7HHH2"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DF0571F000C5;
	Thu, 15 Oct 2026 08:58:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792054737;
	bh=0JJxSDJnM4CuB4HemZ+JYsfyQuNtrG9Dxxl6t1vd3M4=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=iWN7HHH2nRAoZgjECEYF9u2f/ZM6IRQK2Mztop+FcgrddIjIf4eGsGzFPt4zEN5rP
	 J/Oj2DQXmWjGQf/cfF83xhnodblQVzEaA4JEHWVR4feXfhnlekXDV2VmeAtAo2hf+y
	 /6HLTZ38O6kKzsnF3IgmeLcfV0cpez+QneZnqLiyWRjnwf32jqn0FY1AuXyxhjBkv0
	 AUuQdbgrO8njp+DHkqB/lj7XwTpXPWyeYx1PS7xczRom3195CMzrR/KfH4xMA71xEe
	 /+qY8AD7CS/nztoaolk85g1+M4omBTLRlcwERF51mWb0tf/BStX4vaEgnVE1TAOcbq
	 +mr60RlEuiyBw==
Message-ID: <sashiko-outbox-172529@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 4/4] arm64: dts: qcom: glymur-zenbook-a14: Add
 Embedded Controller
Reply-To: sashiko-reviews@lists.linux.dev
To: "Konrad Dybcio" <konradybcio@kernel.org>
Cc: linux-hwmon@vger.kernel.org
In-Reply-To: <20261015-topic-asus_ec-v4-4-af6305ffcb10@oss.qualcomm.com>
References: <20261015-topic-asus_ec-v4-0-af6305ffcb10@oss.qualcomm.com>
 <20261015-topic-asus_ec-v4-4-af6305ffcb10@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 15 Oct 2026 08:58:56 +0000
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

> From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
>=20
> The Glymur-based Zenbook A14 features an Embedded Controller running
> custom ASUS firmware (which is loosely based on the reference Qualcomm
> Hamoa EC one with a lot of modifications). It provides keyboard
> backlight control, additional temperature sensor readouts, fan speed
> monitoring and a number of miscellaneous functions.
>=20
> Describe it.
>=20
> Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261015-topic-asus=
_ec-v4-0-af6305ffcb10@oss.qualcomm.com?part=3D4

