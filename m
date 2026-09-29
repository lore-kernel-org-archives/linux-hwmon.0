Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52A9D3C108D;
	Tue, 29 Sep 2026 13:27:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790688422; cv=none; b=TqkvD5Kv7TwGFnyYZnGCey8nSAAe+g8Uk1ynkho3gn4GmT6UaXVoSBNEqr+Nm+htW/yQ9xG7o3D6Bf1CmtsT5s8mmpbxgS+3O0EJcgw4LQubjBk+YejdSxrO5XQ8QesS5x3ogNEI+g6bqmfeAUbUbFaq/hDdHhDu+mogt6Mv1mI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790688422; c=relaxed/simple;
	bh=gNij1iAxsXu+hKGgtX+l9PNko1ypDTZ63hAfCeliGms=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=r4AocrtjRLkfifHXa8TLOqbidJH6l/n2gR889Wn4cddm4SxGEpvz9/b4+54nUM+TJojpUcPuQlTrdCmld+oWU8sn2tTK6XskLYT52o3fOODi31lJI4pywUmS6aQrzoslU7xhvXZUxhfY001HbQ8gtObRL8u808B528zOnqoTScQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=PVJmzjj6; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="PVJmzjj6"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 755341F000FF;
	Tue, 29 Sep 2026 13:27:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790688420;
	bh=gNij1iAxsXu+hKGgtX+l9PNko1ypDTZ63hAfCeliGms=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=PVJmzjj6fd5zsPN2kz1wrI+vWV3sjwxHB3MWxi2vU59px7FnBYXput59TjmoOJY5S
	 IcbVGOg+oiTfCK3lKiEDwA3Km3Cw9TV9yK+M3igNpmoJ6uEe/uK7t6jTq6K1IkYn2w
	 BsOhniKF1XqFhQjLu56QOgt8GQSZ+rHl4EBWfunNmczGMmblEo0NsE6vnwl7ewqJ1c
	 h5XfcHsxaoOI7SZwwCPL49nZppT9Sb6AwKm617+6B8vqQgM5+vD2j5KIj7VDOlkoUx
	 l7OTEzZvlSeVEeAIPuJNbjrIe/s3U91N24L+SC+52OEN5yc6tzBRzw73mLkek8mwjn
	 uJ2KQMAa4AJ8A==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 09/12] arm64: dts: qcom: pmh0101: Enable BCL sensor
 node
Reply-To: sashiko-reviews@lists.linux.dev
To: "Manaf Meethalavalappu Pallikunhi" <manaf.pallikunhi@oss.qualcomm.com>
Cc: mfd@lists.linux.dev, lee@kernel.org, linux-hwmon@vger.kernel.org, conor+dt@kernel.org, robh@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260929-qcom-bcl-hwmon-v3-9-f5ca00889cf7@oss.qualcomm.com>
References: <20260929-qcom-bcl-hwmon-v3-0-f5ca00889cf7@oss.qualcomm.com>
 <20260929-qcom-bcl-hwmon-v3-9-f5ca00889cf7@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 29 Sep 2026 13:27:00 +0000
Message-Id: <20260929132700.755341F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

> Add Battery Current Limiting (BCL) hardware monitor node for pmh0101
> PMIC. The BCL monitors battery voltage and current, providing hardware
> interrupts when configurable thresholds are violated.
>=20
> Signed-off-by: Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qua=
lcomm.com>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260929-qcom-bcl-h=
wmon-v3-0-f5ca00889cf7@oss.qualcomm.com?part=3D9

