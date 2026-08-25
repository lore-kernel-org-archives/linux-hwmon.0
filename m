Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 069502E7393
	for <linux-hwmon@vger.kernel.org>; Tue, 25 Aug 2026 07:11:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787641877; cv=none; b=Em6LgZIExIeTi6Z3OyozgaGZgt27+4+/+Rc7ivFDFokx+MmMy9WZIrJjy07OiPU0Sd0A84U/LtHYwJWXB0Xf9/4u45h5fUAQmWS7knP9GjrsvOAjIA9Y2gGrRDnSfKwUC12O8RSX5woJTBw4UlniYdGwN/FXoxkTqMYcIwql/tk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787641877; c=relaxed/simple;
	bh=8+3s3nsE/pfe6f5S+knnSYi3R0UCEz6fCShkT4VYp7k=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=Do+uTI+zOM66qS+tY6vlNVtU8O3WdrOzSFPE1XC5HCA0mYBXHFpm6EP58ZPkQo8YApHWZCg92tSvqFop+Dixbn5z2lDukBbX2WJugY0QUE9P8wDYlBOFI7Y0BBdY5NPDYkdc+AdcNze0vTrpsc/34X+xXTRqoMAil22ssTbXjtA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nvJNnPm0; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nvJNnPm0"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 86CC31F000E9;
	Tue, 25 Aug 2026 07:11:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787641875;
	bh=8+3s3nsE/pfe6f5S+knnSYi3R0UCEz6fCShkT4VYp7k=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=nvJNnPm0Zg+bUHRK3H18Cty4GVUSgr0jBewe0kTjfwwFQbfq7MiKvLTUe5T5OchpE
	 ZJY3PZ9/JdWJK0RpcmORgv3zZa5fA0ydgi6NHhSYwRPL8IO9CWTMHe6WBsO/t/fFdv
	 loyN331mLw+CckyuIg+JjLggz34w04Qi9PfrVev6zpuZA/utvKzh54cSv0feXtgdCW
	 LtxWD7ldULYvZ0qXewHZvjN/QvhbKTxwE4LV5Ztsw68TlN94e842oWYrvvAZovmyIB
	 fAYwOc+DOXlHVsJVIlMLGeLkAFggt5kqPrQWPYXotdIx/FFKgGkr5XczoP3d8FOYqM
	 6GC4cnIfJKx+Q==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] hwmon: (pmbus) Clear generic status alarms with
 CLEAR_FAULTS
Reply-To: sashiko-reviews@lists.linux.dev
To: "Vishnu Razdan" <vrazdan@openai.com>
Cc: linux-hwmon@vger.kernel.org
In-Reply-To: <20260824-vrazdan-pmbus-status-word-b4-v1-1-2606ecd0c029@openai.com>
References: <20260824-vrazdan-pmbus-status-word-b4-v1-1-2606ecd0c029@openai.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 25 Aug 2026 07:11:15 +0000
Message-Id: <20260825071115.86CC31F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

> From: Vishnu Razdan <vrazdan@openai.com>
>=20
> Some hwmon alarms fall back to STATUS_WORD summary bits when no
> individual limit alarm is available. On PMBus 1.2 and newer devices,
> pmbus_get_boolean() acknowledges these alarms with the same byte-data
> write used for detailed status registers. For example, PB_STATUS_INPUT
> is 0x2000, so it is truncated to zero when passed to
> _pmbus_write_byte_data(). The resulting write cannot acknowledge the
> input alarm.
>=20
> PMBus 1.3 Part II, sections 10.2.4 and 10.2.5, excludes ordinary
> STATUS_BYTE and STATUS_WORD summary bits from individual clearing.
> Their summary bits clear when the underlying status bits clear, so
> changing this to a word-data write would not fix the generic input
> alarm either.
>=20
> Use the existing page CLEAR_FAULTS path for generic STATUS_WORD
> alarms, including devices whose status accessor uses STATUS_BYTE.
> Keep individual byte writes for detailed status registers on PMBus
> 1.2 and newer devices. As with the existing older-device fallback,
> CLEAR_FAULTS can clear other latched status; an active condition can
> reassert its status.
>=20
> Fixes: 35f165f08950 ("hwmon: (pmbus) Clear pmbus fault/warning bits after=
 read")
> Cc: stable@vger.kernel.org
> Assisted-by: LLM
> Signed-off-by: Vishnu Razdan <vrazdan@openai.com>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260824-vrazdan-pm=
bus-status-word-b4-v1-1-2606ecd0c029@openai.com?part=3D1

