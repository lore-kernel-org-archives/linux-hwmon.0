Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B84924CDA12
	for <linux-hwmon@vger.kernel.org>; Mon, 19 Oct 2026 11:48:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792410518; cv=none; b=X3ZQ9RDCMiPRIJBwgIohhMmkU5G2Yr60H8a21APTY57X8Du7i+ldkzAv2I6hgbAsW3zo9wZcPI+QOP7qtvk5kaWmzgIB5tIB0i3AJo2aNO+NyeneP+9x7uoHBurrovrKt0Mv2se4i180AljfiX5/TzfjZGHZLqmqGV7ftCorrLs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792410518; c=relaxed/simple;
	bh=9PBHGdEHlac5f75hD0X5Vn0eGyRXFg6E3LZ2HD/zV0E=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date; b=I6uZEBbJhjLyaMi3AkU6IMGgk/Q/7iikh1urOHeBRO8aKZr89jbGPokUcaHh9qZ/MN63HvKqUYyAuqLbdS2pwOEP+9ak9qqZL56NsNzWPbG9h/WPPYuUN/ytZHPVXynfmcQKpNcMt5EAzF/t8iJh4QxEJ70hMpI7l5BfuvySdM8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=C+2OCNFT; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="C+2OCNFT"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 445AC1F000C4;
	Mon, 19 Oct 2026 11:48:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792410517;
	bh=9PBHGdEHlac5f75hD0X5Vn0eGyRXFg6E3LZ2HD/zV0E=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=C+2OCNFTIX5u2juOSBkpwnW+/+wR8Q1m+kP8tPR+X+cW+1wILSL+Ot1mFGBHXQjZL
	 X0VuJc6iSJTeiKgOjL5jeCRkXboIN2SwhyETxuvbC+dMIGSbv81LMkVQSK/8Zi/bJo
	 Fh+ldHLYJa4ZUn5yuKLnQNnmlYcl//9EqNCotYJYXC4oJwXSzDdPZZOAj8tGGzRB9l
	 uBRNb1Qw16/Deyzd7uY9JkMlc2LR+kYOAUKnRnU6nFwX2KJLBWN1Xpwh9MWNIA848j
	 g41ufro0M5+VQq8ulwktxAMOyj4RQtQqF9XarMJ5lSFp9pHMhHw4eGzwnPJfrnCNkv
	 TD3cb96xaUKlA==
Message-ID: <sashiko-outbox-177050@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 3/6] peci: Add support for PECI CC 0x83 retry
 condition
Reply-To: sashiko-reviews@lists.linux.dev
To: "Changhuang Liang" <changhuang.liang@starfivetech.com>
Cc: linux-hwmon@vger.kernel.org
In-Reply-To: <20261019114502.55307-4-changhuang.liang@starfivetech.com>
References: <20261019114502.55307-1-changhuang.liang@starfivetech.com>
 <20261019114502.55307-4-changhuang.liang@starfivetech.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 19 Oct 2026 11:48:36 +0000
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

> Some PECI client devices may return completion code 0x83, this
> completion code means that a command response is in progress, which
> is not currently handled by the driver.
>=20
> Add PECI_CC_RESP_IN_PROGRESS definition and map it to -EAGAIN so that
> the request will be retried appropriately, similar to other retryable
> completion codes (0x80, 0x81, 0x82).
>=20
> Signed-off-by: Changhuang Liang <changhuang.liang@starfivetech.com>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261019114502.5530=
7-1-changhuang.liang@starfivetech.com?part=3D3

