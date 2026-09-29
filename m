Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08FF1529404;
	Tue, 29 Sep 2026 13:20:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790688038; cv=none; b=li6VVamXCE/0v9g33W09RO7qRrfkpTbmAfO90RgI+cD0v1ZlyYoO8jNNdmV/FJuosfToiEZp7wT54l8NJUGPYPFfWmjes4Jktd/Vxmpwco2bTxZK63HZtdQ7Mj2EsmC18LjVmNV9LdVFmTcYtL7p02BTLz+fB0dIdKmXybXctz4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790688038; c=relaxed/simple;
	bh=eNT5zSWxsq1DM2vDR12ZkOriE16315o6FzUJpaV0JQg=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=PmZ/uiUS5BCvBbWRrd07UUEm+x58NlGh0xNwY5sOaAosUfFJTae49GUhDJb2u2MV6mJkj4FExtQ1GILoHbqIPrdgftwSh6pxzCPqj4fba5zDA5ZLOR7awrvqsJwasJY1AptWtSArrdZXvfaJdgcZkwu6lktDnuo9L5VZP6KAUKs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gjbgUOFF; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gjbgUOFF"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 45A7A1F000FF;
	Tue, 29 Sep 2026 13:20:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790688035;
	bh=eNT5zSWxsq1DM2vDR12ZkOriE16315o6FzUJpaV0JQg=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=gjbgUOFFcjbaF4QhV2AtIuijAulnDXe/SdRw8p5MeYbWtIHvpPTtAVxgOIaC0paJD
	 +s1hnnBaMXCmQw0GwQrfUNOggN9sarJWP9GftvZ9DLvwlR0xgIoXCWprxynBBURjLh
	 ogBJtAsif/NOCJIICYLzTY2ZyW82niaOpRH1d48DnjdiTVkq56WnHPPJfTqIelcjLa
	 2Qrt1RRw+KimKM0OrxqJSwRUxRMlS6sIEffTvQGSsEArx0VCNpICHar3JO6MjippZ3
	 ObECwAbJXvv3sd2P9u+tzS8mLV6DOk6jsBBMsuOQ7i7EATpqWjAFCoQfYsj2u8Synj
	 nh4HBqIZlk5Gw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 06/12] arm64: dts: qcom: pm7550ba-eliza: Enable BCL
 sensor node
Reply-To: sashiko-reviews@lists.linux.dev
To: "Manaf Meethalavalappu Pallikunhi" <manaf.pallikunhi@oss.qualcomm.com>
Cc: lee@kernel.org, robh@kernel.org, mfd@lists.linux.dev, conor+dt@kernel.org, devicetree@vger.kernel.org, linux-hwmon@vger.kernel.org
In-Reply-To: <20260929-qcom-bcl-hwmon-v3-6-f5ca00889cf7@oss.qualcomm.com>
References: <20260929-qcom-bcl-hwmon-v3-0-f5ca00889cf7@oss.qualcomm.com>
 <20260929-qcom-bcl-hwmon-v3-6-f5ca00889cf7@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 29 Sep 2026 13:20:34 +0000
Message-Id: <20260929132035.45A7A1F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

> Add Battery Current Limiting (BCL) hardware monitor node for
> pm7550ba-eliza. The BCL monitors battery voltage and current, providing
> hardware interrupts when configurable thresholds are violated.
>=20
> Signed-off-by: Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qua=
lcomm.com>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260929-qcom-bcl-h=
wmon-v3-0-f5ca00889cf7@oss.qualcomm.com?part=3D6

