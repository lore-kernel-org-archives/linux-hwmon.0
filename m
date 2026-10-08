Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72C1A3AEF4C;
	Thu,  8 Oct 2026 11:51:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791460298; cv=none; b=CWyX4YdoOkN+ny/tdxk8/cn6lnfsFiwKb3S2aAlu14sSDvvGUd1dKjokfBECFueojQeJGuTNoObcL1lu/8M5tWo5705wnNxeUzbsOIMh6nd2MjX4cxFsvrjtn4vZVpUiHxp/T97u+Rl2WOMsxx+nS0wHniNR3hR2n8a9pomKTlU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791460298; c=relaxed/simple;
	bh=EWYHRSudcxqUJnQUoAh+0tjtwUWTSVHYs//jTXMBfpc=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date; b=mGKrm/EIcCtEAvwHoZQ1VAvGK7sVjnUWutDgxHoGHHUVUGOszXz6bkY20XO/hb6MWHXe0QiJhCO4fwUUE6ARRHxaLHG0mwVoBjbuQOsg1Jq5RJLHqb9drF/CN006SIVtSCuKCx7ydce6ZstRpJOL8wldc0+8F/yAUNagrPyqNbI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cPtCwXPm; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="cPtCwXPm"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CE3C91F000FF;
	Thu,  8 Oct 2026 11:51:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791460297;
	bh=EWYHRSudcxqUJnQUoAh+0tjtwUWTSVHYs//jTXMBfpc=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=cPtCwXPm6Jgo7iwcKbAomEPslM75rzBxDwkNDR+LWD3pQimLd2XesawgmHaxemAgb
	 rnPCv9xIvBULkAIcAwlw/Mixvu5NOYqal14jV2yMoaEQZhuHkR4hm0XSSZnUOoS+Ss
	 JxSiomXwgrb+aqyP7Jc6mb4lYYvgzs4oaMFrEz0CnaDbsQYq/qPfyYhXCYzS+iFrlR
	 /KhsFJwjil6vX7HH+DcQsguSwb65X6hX13I5g/MsSB/kksyycvP0+4ZVxgjgZLjfW4
	 YjdJvwYBGQ24YAAc5150oHMp4KZrzVH4BVnRbpRbgaELmuPtGCIXFedb6T/nY9RWjA
	 HVpV2lttNS+og==
Message-ID: <sashiko-outbox-164109@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 3/6] peci: Add support for PECI CC 0x83 retry
 condition
Reply-To: sashiko-reviews@lists.linux.dev
To: "Changhuang Liang" <changhuang.liang@starfivetech.com>
Cc: linux-hwmon@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20261008100623.7085-4-changhuang.liang@starfivetech.com>
References: <20261008100623.7085-1-changhuang.liang@starfivetech.com>
 <20261008100623.7085-4-changhuang.liang@starfivetech.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 08 Oct 2026 11:51:36 +0000
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

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261008100623.7085=
-1-changhuang.liang@starfivetech.com?part=3D3

