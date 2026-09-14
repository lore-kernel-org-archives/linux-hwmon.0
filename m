Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1435841D4F1
	for <linux-hwmon@vger.kernel.org>; Mon, 14 Sep 2026 09:18:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789377482; cv=none; b=PS3yYyQGwyJ5TI2yQMmGj2K+Tue8Nj6/mfUiqBu4mCh9iMcUzSpgfJ1Uhy3DOGkDkFF/jPyAJPFJFP6MYLnYY32jL3uYN5O3ruygU/vdxBU79bUjg6a2QTy6yUAIm+MTLH4dq9HTUaNQqlcPQUs3cRIkqyKWKwBMjfwUlhiLPbY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789377482; c=relaxed/simple;
	bh=cwMxn1ADbwb+BOnuvNeCphTK9VsiEp/j7TM/SyOxYp8=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=EP+ku55qbgLklWlkdtsJ0YYtLT09jQmCjFhN81dkZ+VeGXWwIbssWb+sPeNrZ/wS8klRwRpmhKvdQryDi4MtfZaSBWfq/9rSlahY04jY88pkc7lu11Kjc6lUxSyLaak/U7K92TYKNz4yAAdRBwfIEIGSxf/Jgh9jrBbB1TstkG4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YEmaWuEq; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YEmaWuEq"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9472F1F000FF;
	Mon, 14 Sep 2026 09:18:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789377480;
	bh=cwMxn1ADbwb+BOnuvNeCphTK9VsiEp/j7TM/SyOxYp8=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=YEmaWuEq03HsPGdngWH6AzDbGNyvO54rEOf+NirHIc9MKjdUAuB9XiKfncd4XNztf
	 l/xxrLTL4yKFEKsL0IaLILDWtUsAFsJtBct+gfHY9FLZNlXNt9fOUDDnsXqlHFy/6j
	 Vrl8WlQqS1f+eTHcwH9VVNM4Bkt5BQtZRwwMiithO/+JmCyLnuM9LcdID4v+OBcY0v
	 /96GgYixyQ1GmgTTLNpfIwytdBAyZ8SS2lg/eLxjw3JnhgFaLuXYad33xsMRN6F0qZ
	 l8xEHqqwk5P4K4JBM7ol8BICYC9211TqU3F6v0AnC63NuD/HIAjshBD9uV2KddMdTx
	 oXrOhajnGxRwA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2] hwmon: (socfpga) add Agilex 5 channel mapping
Reply-To: sashiko-reviews@lists.linux.dev
To: tze.yee.ng@altera.com
Cc: linux-hwmon@vger.kernel.org
In-Reply-To: <41bb317cbfb6f4e2711581f2ccb22071db17b19e.1789373027.git.tze.yee.ng@altera.com>
References: <41bb317cbfb6f4e2711581f2ccb22071db17b19e.1789373027.git.tze.yee.ng@altera.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 14 Sep 2026 09:18:00 +0000
Message-Id: <20260914091800.9472F1F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

> From: Tze Yee Ng <tze.yee.ng@altera.com>
>=20
> Add temperature channel mapping for Agilex 5 and bind it to the
> "intel,agilex5-svc" compatible string. Reuse the Agilex voltage channels.
> Agilex 5 omits temperature channel 2 (top-left corner) because that
> sensor is not present; remaining sensors keep Agilex channel numbers.
>=20
> The "intel,agilex5-svc" compatible is added to the stratix10-svc match
> table by a separate patch [1]. Without that change the service layer does
> not bind on Agilex 5, so the socfpga-hwmon device is never created; this
> patch depends on it.
>=20
> Update the socfpga-hwmon documentation to list Agilex 5, the matching
> compatible string, and the SDM temperature/voltage channel tables.
>=20
> Signed-off-by: Tze Yee Ng <tze.yee.ng@altera.com>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/41bb317cbfb6f4e2711=
581f2ccb22071db17b19e.1789373027.git.tze.yee.ng@altera.com?part=3D1

