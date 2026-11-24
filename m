Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795542418;
	b=R7wZTWzwQXPNYqPzAuzQLPzq3RUUQsBGQqApBCbjMER2JpKNC04JfS0oSLk4aBZiKvpY
	 a0/UrdyA3BmaaSNIvmDT7C+fvZnaXyGdXTgFlOj5/WBt9zp5cRy/2X0+rY/Snmd2yN9U9
	 qRljqAYZLbnYrOLNzCixvhVpyWQJIyNi0brLn+RLNVsyU/Wbf9olM3l/clgWFlXSnWCsd
	 2oaz5ohzQDdv50R9yoSMQyKMFi6NujI3GC4jZ7iOBzmRy5O8MZh0J+cP581IadiUiLd1D
	 FSx/swqllOc6vWsdNo7aYRa0I6tutudv+u967pH6d4LqxY95u1cIGI8BsOw4TOAb4+w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795542418;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=wHKqkLt2Ndr0QlLIltlt79JiKZ6pe4bmm+0eiMlZ6As=;
	b=3tTEma8tNqE3/DiyvPG+rr/2qfXkeMOqHQsoeF5p9wM0IjZh15+Q0YL1tXj7yez97yE3
	 Aac+Pcs9QcZi2swF/0tPEmDKZk6KljlVioQAg0+hWERi3zLkt9v7vZOkEf3q+0KjLECRW
	 Za/j3jyvHblSWJ801FJuoFUFnFPh/S6oyI2n4rHxsvQ8VPkPeeMBC4WjvrC0DjI9/9pC3
	 sDyOh0oWq4VNr5JiHkmmgpJUhvd+c9/0CTGMcNM3dDT1FpihBXbmiZFF7fyUsswq9/V0Y
	 f+/YQF0PHYJx7ekipgnMO6qhiLeOC8bOMA753rkQ8ZVvDXR2AM/aEOPIc+sNw+dMoyQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=iNnItn+X;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7024606A32D
	for <linux-hwmon@vger.kernel.org>; Tue, 24 Nov 2026 17:46:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=iNnItn+X
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E3C481F000C4;
	Tue, 24 Nov 2026 17:46:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795542418;
	bh=wHKqkLt2Ndr0QlLIltlt79JiKZ6pe4bmm+0eiMlZ6As=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=iNnItn+Xrdp/5Dr1y1fNVoqU3gIUCc04E8xi46BD0S62E+tKTvcyRusj7eLyYvGkb
	 ofhoOkdgEdFK62UH5+yHz2EgKC3p7d5O4evE6KOnIcYWFaCELbB5OD6uLjKOS8XNY4
	 cNc0ug+nz/p2R7HLxFUEbm7g+USsruPCAdcK+ojNtbXgJ4AkAy21xLZJUa5bxQP+Nx
	 VGrzwAFL1wiR1H4iLoqZrS82zYBRqf4kxnnZOS/N/e62ILxRyQj9ouYqi1fVywV5Dw
	 0CFDdfgG55h23A41PieXLnpzzzEc5gVw+zDGUNxK9fpU4vNJZkU8CV4OUkPe3wFAjT
	 AlkQ/+tVB9PBQ==
Message-ID: <sashiko-outbox-231742@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v13 0/3] Add RP1 PWM controller support
Reply-To: sashiko-reviews@lists.linux.dev
To: "Andrea della Porta" <andrea.porta@suse.com>
Cc: linux-hwmon@vger.kernel.org
In-Reply-To: <20261124173658.31030-1-andrea.porta@suse.com>
References: <20261124173658.31030-1-andrea.porta@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 24 Nov 2026 17:46:57 +0000
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Post: <mailto:linux-hwmon@vger.kernel.org>
List-Help: <mailto:linux-hwmon+help@vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-hwmon+owner@vger.kernel.org>
Precedence: list

Sashiko has finished reviewing this 3-patch series:

- Patches 1 and 3: no issues found.
- Patch 2 ("pwm: rp1: Add RP1 PWM controller driver"): 1 potential issue
  (1 Medium)

A detailed review has been sent as a separate reply to patch 2.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261124173658.3103=
0-1-andrea.porta@suse.com
