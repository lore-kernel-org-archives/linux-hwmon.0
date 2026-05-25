Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3707137F758
	for <linux-hwmon@vger.kernel.org>; Mon, 25 May 2026 13:19:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779715149; cv=none; b=Bp/uJ4C63QEIRkd6HbEnBg5JVEu5fNb1Npo3dpJKj64NxC3NrhB+PKzzxh4UJwgJabLuyYMtKgVuAyd01L+8tPaDhuOn+wbzKKfddrrEJFthe+HIo/ziTuImgZ5mYP21Cox7FTa6TvvhQOq6HKn2dNYiiCjjKkDCFhndZPyFSCw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779715149; c=relaxed/simple;
	bh=IY21/DJtmN/RO8GaSEndVkQHdffOG1zGVaOrIEDP1cY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=r0KmcT9rncJ77+hfg7XzfB8sZDLPG4BXx2XwJSyPQray5yAHrMM6x2PIA2iqyXl7hcJpmGpMrIFxBrLII+UDpPsaTA5XFYAyaWRmcjtY4wbILzyXDfkHr+VMWKE2TWzrCU/drTyBL/dkozXfqgbyv4ERaU6B5hKS7Di/YvsJDOw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LxX618MB; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LxX618MB"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D5F701F000E9
	for <linux-hwmon@vger.kernel.org>; Mon, 25 May 2026 13:19:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779715147;
	bh=IY21/DJtmN/RO8GaSEndVkQHdffOG1zGVaOrIEDP1cY=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=LxX618MBWXXWkk9+r2DC0bEGdlpJhEjoRYQwjWxuJhQNVZPWB0Xsw7rvpTO+5K6Dv
	 POysXlTl6jMEkcNbISbL7Wx1YMg/KvQSWHeUr2bJcihz20DAKekVzV/27pqLdqPU5L
	 yEdH8LHC2vBSFOXX7x2q87kpJQ4fipusdYFAg2h8pDIzK1i46FxU9jtq2qEzvAVEH1
	 QYMKbR8CCESDSIcGrzjBOpJAt8hYQxgZIIASWnZJFIjuP1Hu/SGYe2tIwE0/E6OMdB
	 9qSjphBu/O3Zhy8q+JNTzHT4+ji+D29JgFAdMiUmn1X/67+T4Xx61aK5D71sCguD+I
	 dEmQ5Z1WG+hFg==
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-5a858881ad2so12075987e87.3
        for <linux-hwmon@vger.kernel.org>; Mon, 25 May 2026 06:19:07 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ8QC6yc9WsvAC5iltSzLNjSvXxagOvtNZGQ3kvAq/R5zWN/dWHkhf8oKLZYjlBu4rStLTTQMSp8HYLxmQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz3M/rUaXprNr61rkFVh/jP8pu9B/cPTHl0Y0tDRgnHr6T8xjcF
	73a8NFkfPrfbA/uyyQ5vF0Wp00samZmoAZsidiRRSKHozziGt4xMRjqhm3PAJ6oAZVWKh6pFgMR
	wpfVbnJ6k+gG70Il93ImhbWAN8y6MSu8=
X-Received: by 2002:a05:6512:2303:b0:5a1:b83:c7cf with SMTP id
 2adb3069b0e04-5aa323713f1mr5620188e87.25.1779715146655; Mon, 25 May 2026
 06:19:06 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260522044855.1772639-4-o.rempel@pengutronix.de> <20260522055524.C86311F000E9@smtp.kernel.org>
In-Reply-To: <20260522055524.C86311F000E9@smtp.kernel.org>
From: Linus Walleij <linusw@kernel.org>
Date: Mon, 25 May 2026 15:18:53 +0200
X-Gmail-Original-Message-ID: <CAD++jLmGLWGSJ0pdYhYQMzMFZeKT_+Pd6iQgHLeVY1dfZpe6hA@mail.gmail.com>
X-Gm-Features: AVHnY4JwmVskF7xv3RdUZ3nSURmC-AFu1N5B1VE_RAAGudnabmcZImFY0JWnWkk
Message-ID: <CAD++jLmGLWGSJ0pdYhYQMzMFZeKT_+Pd6iQgHLeVY1dfZpe6hA@mail.gmail.com>
Subject: Re: [PATCH v14 3/6] pinctrl: core: Make pin group callbacks optional
 for pin-only drivers
To: sashiko-reviews@lists.linux.dev
Cc: Oleksij Rempel <o.rempel@pengutronix.de>, devicetree@vger.kernel.org, 
	linux-hwmon@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, May 22, 2026 at 7:55=E2=80=AFAM <sashiko-bot@kernel.org> wrote:

> [Severity: High]
> This is a pre-existing issue, but does pinconf_groups_show() need to hold
> pctldev->mutex while iterating through pin groups?

It is inappropriate to mark bugs pertaining to pinconf_groups_show()
as "Severity: High", this function is only called from debug code
and requires CONFIG_DEBUGFS to be enabled which is something
a production system should not do nor expect to work in all cases,
so adjust your training weights accordingly.

Yours,
Linus Walleij
