Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 008B436167B
	for <linux-hwmon@vger.kernel.org>; Fri, 18 Sep 2026 03:27:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789702037; cv=none; b=oP3o4zP4lZpXLEjwnE8cxRWAtWKtPNwBaP708+Uz3yrXuM5LBKxoYfp791OacCoOYlqW99j2Un1fbUUiexvqeFlZfHF0LL0p4JlP+nG+Yl/MyypcLT5zIVf85Vwct2uwaYaT/iF4kAENIgDaPjx0279CyEfbCiKd2zUhgmCQUaU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789702037; c=relaxed/simple;
	bh=KB2xPm4xBfPpBHCg0w+8G1o54379yE80I8CPfvpxxuw=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=KCio8Ye1rb+zTwvu9bXSxRGvohdP2ss8VX+uqlnsIzTSDJOFzHhJgNOO7p1idDE8AmT0GPg9Zobhew1BGVZ3qfzhkcEmal2IUMAluAN2wD7MYdMJl+Hnotk1qgZEX8O+pCK11z/ko1v9H+v9UWJggwf8O1xmQp1TjBOalq1jGJI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lQw/KpIi; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lQw/KpIi"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BA5721F000FF;
	Fri, 18 Sep 2026 03:27:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789702035;
	bh=KB2xPm4xBfPpBHCg0w+8G1o54379yE80I8CPfvpxxuw=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=lQw/KpIiKOITR6WcX6H1s9+HJ8zVzTrhEg6azhLW7fTfXmDD+GFk2P8sBY2CNCttn
	 wgtaot9+vcEJcqWZDsIaP2UjJ27NzwuzJQ3/EGbTdlDgUNPscUOxhg5rHljVBobsnr
	 ZARjoAb+6lWI9NRBHix0juIQ44KTDzNLsetQUqWFuIos8ABNf/AUjDfIZP/zbDsRzT
	 cyArvO4FDOoCnXnolslSKODyoPyXwnz+NW0lhTys6RLEHe/F3sJwZYIUNGuB1PWHJh
	 L5CCE0vVAg7Biru8wXTtEZ6pekJ+MNbou9HeQ1IPq3QjlvE2eaAz3F+w2azJcTcN1A
	 d+elU0PAJpibw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] hwmon: peci: dimmtemp: Retry unstable DIMM mask
 detection
Reply-To: sashiko-reviews@lists.linux.dev
To: "Jian Zhang" <zhangjian.3032@bytedance.com>
Cc: linux-hwmon@vger.kernel.org
In-Reply-To: <20260918031831.1937973-1-zhangjian.3032@bytedance.com>
References: <20260918031831.1937973-1-zhangjian.3032@bytedance.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 18 Sep 2026 03:27:15 +0000
Message-Id: <20260918032715.BA5721F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

> Add a stable DIMM mask check around PECI DIMM discovery.
>=20
> During host DIMM initialization, PECI can answer the DIMM temperature
> configuration reads before every DIMM has reached a stable ready state.
> There is no separate all-DIMM-ready signal for this driver to wait on,
> so a single early read can capture only part of the populated DIMM mask.
> Retrying the mask check avoids locking that transient state into the
> hwmon device layout.
>=20
> The first successful scan is saved, and the driver immediately scans
> again before registering hwmon channels. If the two masks differ, the
> driver returns -EAGAIN so the existing delayed detection work can retry
> instead of exposing a partial channel set.
>=20
> Signed-off-by: Jian Zhang <zhangjian.3032@bytedance.com>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260918031831.1937=
973-1-zhangjian.3032@bytedance.com?part=3D1

