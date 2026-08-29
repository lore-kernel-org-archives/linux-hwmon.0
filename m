Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF2B82C11F3
	for <linux-hwmon@vger.kernel.org>; Sat, 29 Aug 2026 22:08:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788041313; cv=none; b=O5EN6hMCfv9oJcih1QqyuvHqg2kdAUhek3QpN3BVm+ia209GnbvvWjsvy9ek0E0UvsVaASsCCdoerI0cBlTu2lewgfbYiAsHguw0HgCu7MD4xiPzKupTZc8YmcM4gCPViiDCTf4sjIeKLFMO3iljjtwvBVOxKqmiTNx/CMcp3jc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788041313; c=relaxed/simple;
	bh=jVO22JFYpJp5iDmzL4yFvrAFSe/vslOUF+6Qkw0z+4M=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=fwx6MSs60Wc7n9+goCX3zRSsY5O5xgGwm69HaTT74ENQldWKkaX0dqjz/BMA1sab4gb8ulgKRQkRnMmW3m5uxSqrZBcjuZd6XwY8STm/HVDkqUN+DXrzq1S3zxbOpQSJ/ToDE0ktwu+Y7tAPdG5GY4Akv6GA/xiGs+SgpYFi5u8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=BSYHb8rH; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="BSYHb8rH"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2731A1F000E9;
	Sat, 29 Aug 2026 22:08:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788041312;
	bh=jVO22JFYpJp5iDmzL4yFvrAFSe/vslOUF+6Qkw0z+4M=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=BSYHb8rH1KwxA9dpE/2qnsmBJ9Hx5lKf5+SwPsDOAhIVIKpVk2NUm8l/qUmHbXAAK
	 4VPchzNiTBPZDJAQSLEWLFlwjRDV5GknG12i9ey2rpe+9eDbNT5bFebRUjJfTt1Vwm
	 nKgeXL/Tk+SeYQG6hqXxRHrv50JSAdCR76bqe24p+qcwCenAUA0ZPLlC7YKqVdUZMW
	 2bB7WYNtf3bcF7MqDz4eERkgxXO0sCys2398QX6I3EsdPqp8vEkIcSxjQ0evJ8KqRp
	 V79KhLIQ58ETPodAchmMY8fRr1vq1pMy5POatQnpK9ZdJBKA9ZPPGDVOcHqansWsX1
	 g08MitnDcx85A==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v7 1/3] hwmon: it87: describe per-chip PWM temperature
 maps
Reply-To: sashiko-reviews@lists.linux.dev
To: "Jerome Tollet" <jerome.tollet@gmail.com>
Cc: linux-hwmon@vger.kernel.org
In-Reply-To: <619425df92463b3c3f9e90f00c527c4009599ea8.1788040385.git.jerome.tollet@gmail.com>
References: <cover.1788040385.git.jerome.tollet@gmail.com>
 <619425df92463b3c3f9e90f00c527c4009599ea8.1788040385.git.jerome.tollet@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 29 Aug 2026 22:08:31 +0000
Message-Id: <20260829220832.2731A1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

> From: "benoit.masson" <yahoo@perenite.com>
>=20
> Add a per-chip count for PWM temperature mapping sources and use it
> when reporting and validating mappings.
>=20
> Keep existing chips on their previous three-source defaults. This
> prepares the driver for chips with a different number of mapping sources.
>=20
> Signed-off-by: benoit.masson <yahoo@perenite.com>
> Signed-off-by: Jerome Tollet <jerome.tollet@gmail.com>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/cover.1788040385.gi=
t.jerome.tollet@gmail.com?part=3D1

