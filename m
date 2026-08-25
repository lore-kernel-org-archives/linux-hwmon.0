Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CEB79329E6C
	for <linux-hwmon@vger.kernel.org>; Tue, 25 Aug 2026 17:51:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787680284; cv=none; b=amuqtxI/BF+YNxqX3DxBdajqzLxpX//WN+s++J9weHaAZf2jGlBvIjT1LPPreGbda3Qv1WzwX1y8ZONEJGw+7UjDX/lzVy6/pNjybacku3HzuXJ3hDEvsziE7/1U1ZqMXf+HffKDTUz20g6vtV4eyd72fzyxFcp7TPgfyhymA1c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787680284; c=relaxed/simple;
	bh=JC0ogG4zGaPFOdBal5NOfe05lp9ryqKkmwabEYibwBI=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=pPRlX8/u9ZOOC8gWJEdRNc8tnuiMdFPnXRMexOwm3lzSxmC2aGEKgtDJKpETB1213SKra64Oq0Ts+OozQvYVkvRS1lqY+S8aaA/20TPn9JguI6Rzd/n0ArHZy2ZerT0DOoTdweWDnR2Ynlzk8JQANZetTx4STjY2jhXK0vbOroo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kojirkt/; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kojirkt/"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3F46D1F000E9;
	Tue, 25 Aug 2026 17:51:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787680283;
	bh=JC0ogG4zGaPFOdBal5NOfe05lp9ryqKkmwabEYibwBI=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=kojirkt/9vIe7P4SmQadPpJuZvWysGy54OmDUHwGzJMLeMh9eW+hX+9LUuSeMQkQz
	 A6cuO925ofa31SZMXkHjiLXy1V/u3xkdUpZ3je5MAaxY66tD9xZE+MP2Lq25i/HoU8
	 Z64VeKg8AsQpNIPaURoftSUfrLfZs6AbEJajzQX+F/3ghz3Rh1sTfH2KG3XsRF7uUk
	 HNFhMCzyrYCd0V3JmGfx3iSrocgun+bnvPdS1Ljj09WpXgxRYIroa1dg+o+K93DpPK
	 eKoTcQJUhbUCtre2ZZQV0NZSNKWT7UY9Ug0OCeWlrNzthv/7L/rFNYmLg0lbgRr/Dw
	 lGWNGuwAhtIaA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH net-next v2 1/6] eth: fbnic: move sensor read logic out
 of fbnic_mac
Reply-To: sashiko-reviews@lists.linux.dev
To: "Zinc Lim" <limzhineng2@gmail.com>
Cc: linux-hwmon@vger.kernel.org
In-Reply-To: <20260824175059.2485048-2-limzhineng2@gmail.com>
References: <20260824175059.2485048-1-limzhineng2@gmail.com>
 <20260824175059.2485048-2-limzhineng2@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 25 Aug 2026 17:51:22 +0000
Message-Id: <20260825175123.3F46D1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

> The sensor read lived behind the fbnic_mac get_sensor op, but it is only
> ever used by the hwmon subsystem. Move the read into fbnic_hwmon.c and
> call it directly there, closer to where it is used, and drop the
> now-unused get_sensor op from struct fbnic_mac. No functional change.
>=20
> Signed-off-by: Zinc Lim <limzhineng2@gmail.com>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260824175059.2485=
048-1-limzhineng2@gmail.com?part=3D1

