Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E92836F8F9;
	Tue,  1 Sep 2026 22:29:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788301796; cv=none; b=R1HSgvJDSg+yFae0tiuNfRG9BrYkSR7aFZRSDu7eoVsnLhE/B1ODAwrcqb5IWnbuF5w0iAkh88YQ2wrKZhbQzPL/cER3RzS23cQaGzE/JrGzrn7STqbzqixYJJMA3Q7ugm4EeRxhwMsNA1z05kQ5en6GjKX1tT6nTSo2c0tdXlc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788301796; c=relaxed/simple;
	bh=YUVSAbheUBzc5ru6JPJkg0SGyXtkjy/oihE74Uaabck=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=g8D8Khlsg10+6OKaxvrJ4p+QGkRngkEXzfOL2KA1PrPYQp6UHHQkbcZpBmEUY2jbh5takzSRhpfYnGmuJczS8hlEnHpGgvJ7wK9qPVWzkLtl/qOTxna5aNCVlqz1/IerAbdrigVAqky19jPKJrJRYjsNZDWfgbUxTQH7NIR1ajk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bk7bt0EL; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bk7bt0EL"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 487C11F000E9;
	Tue,  1 Sep 2026 22:29:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788301794;
	bh=YUVSAbheUBzc5ru6JPJkg0SGyXtkjy/oihE74Uaabck=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=bk7bt0ELUt4navYi/LKyQn6Gx47U67BxI4u+Go/hoDjjYXihrPUxi6of1u8l+ZeG3
	 1xZVxnWk/iOLQWHYPOnWEH3jox1mPR2Wuv1c5KEZdTYPHxThr2kb6uTRcO6RzQlq7L
	 xEurkCTVr6qJbYCnIxg62cGr91Y3zs8QBtRJuQ+H9Ah85uXPfI5JWjuy/2mKpQS0TX
	 gX/QBb+XaQS4wv46ymZMbWLEWS9TV6pC1lNmqr7jmP4OexsF6wsvM0IYqsn13u/PN9
	 DSFd9BXRPUVF2UIHqG7RBIEDFbLwlmAwnSFRo2bFeVmVZCOYZfB6qf255es5m/LlU9
	 ht+RPyyBcY9NQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 1/1] dt-bindings: hwmon: tmp102: move ti,tmp103 to enum
 from items
Reply-To: sashiko-reviews@lists.linux.dev
To: Frank.Li@oss.nxp.com
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, linux-hwmon@vger.kernel.org, imx@lists.linux.dev, Frank.Li@kernel.org, robh@kernel.org
In-Reply-To: <20260901222249.1194299-1-Frank.Li@oss.nxp.com>
References: <20260901222249.1194299-1-Frank.Li@oss.nxp.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 01 Sep 2026 22:29:53 +0000
Message-Id: <20260901222954.487C11F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

> From: Frank Li <Frank.Li@nxp.com>
>=20
> Fix patch merge error. ti,tmp103 should be after ti,tmp102 in enum, inste=
ad
> of in items.
>=20
> Signed-off-by: Frank Li <Frank.Li@nxp.com>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260901222249.1194=
299-1-Frank.Li@oss.nxp.com?part=3D1

