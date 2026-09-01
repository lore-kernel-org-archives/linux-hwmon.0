Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3ECB047044E
	for <linux-hwmon@vger.kernel.org>; Tue,  1 Sep 2026 20:14:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788293648; cv=none; b=IBXeqFBCdoyGOCR3T1U8Fya6BwZHc3q6YyN1lJB74Ai28KHkhfgoqmwtvl0pOcgm8iyb8hXui6pIBC6nEsyS9H+R9aGqpP9t6vclRD0Eq6oiBwl+aSy4j4X0vPr3Tfgamwa0a+GOpGENRcinawQNyEb4TQRjgsfTv/leDhNlDl0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788293648; c=relaxed/simple;
	bh=mi5GsczxGiMtxwIvFNNN3menH0MMwUJoAJtLCjV1+20=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=mqKQBXhpRJkXBKCJU2IsvuCXbO0WPgL3EULbXHep5BzE4JBn3btzcdho2J/Tg6zT7/yD+33HFAaV9g8bx9jPWDWBoc/L8ZpCehEKgEmm8wdEvyyjCOinvYIzod69KrPjEx1e3b+RPs6IquuRVJoz5Yx9ZrhxSxmpE8hnqlL2SkE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NfoubAsI; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="NfoubAsI"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A89F11F00A3A;
	Tue,  1 Sep 2026 20:14:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788293646;
	bh=mi5GsczxGiMtxwIvFNNN3menH0MMwUJoAJtLCjV1+20=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=NfoubAsIZRpD9TA0YjGkQnk3kRjLtWDfnhBpLcLzDJedcyi31pb/JBvUsyWY7Ts7O
	 vo9VW2+wU0zXttD1GKeLOxfSk/AwNYXWyQdEw4RMH0KkiY0M4HkpScFg3gy9N491MI
	 A22+7uKoGtqgLRRClh4/lbSjG9nebjWcmCDxBRfk2fo9GIJaXBKbmtLfvVtXyf+rYe
	 by4HIrB766AX1SADFgcfSQqqN1ayeo5XkVx2dd+oZd10hKmeaK/jtM2vywNHO9g7V8
	 MOJ2SRBzOk19+13WlKjlAexeAdblQsFDfnFEXBhBLCR0b0WQU2CMrv5jaIIGJUm9fy
	 oXbpoak0pitbw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 2/2] hwmon: (spd5118) Avoid probing when 16-bit
 addressing is enabled
Reply-To: sashiko-reviews@lists.linux.dev
To: "Armin Wolf" <W_Armin@gmx.de>
Cc: linux-hwmon@vger.kernel.org
In-Reply-To: <20260901200142.495319-2-W_Armin@gmx.de>
References: <20260901200142.495319-1-W_Armin@gmx.de>
 <20260901200142.495319-2-W_Armin@gmx.de>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 01 Sep 2026 20:14:06 +0000
Message-Id: <20260901201406.A89F11F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

> Support for 16-bit addressing was removed when support for i3c
> was added to the driver. Switching between 8-bit and 16-bit addressing
> might confuse the system firmware, so we are forced to bail out if
> 16-bit addressing was configured during boot.
>=20
> Signed-off-by: Armin Wolf <W_Armin@gmx.de>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260901200142.4953=
19-1-W_Armin@gmx.de?part=3D2

