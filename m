Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795697600;
	b=NZRXf52oZ9EiDV7HFf5ciB9i4zzvLnoOHWts+/Sm0Xcx+KRuZ2jwnNfXo7KwJbXIfJhw
	 8MNy53+65DQRVxO8t8GT3oqtkpzhsHn5600bMFndXsuJQ12oFO1UPw2QAG7iBfQZfVa8e
	 QHcM4fy41bsUyMnM9h0FlPM6NamvbRv49/R0PS8jBovzatfi2RfNolCeLPdy2dvulmmUW
	 DDZsiaKhXUGU5vNVYC36rVxe7InAM7L3sUWoui0tZxrp1Jz2pO5vTmkRIXVFWCf1cvqVn
	 ZQna48/UJpnyVH53kR+1hy0xuwdPm+DH6ifpq0+OHWO/G/OOWhRriwIAKvs3ZHWhVNA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795697600;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=3zZTvYn5DIOxShhTjXTz7c1nEiH1jspx7f3vzfeMn+4=;
	b=lWi9/Dxi0wRvhXfMtxYYWOZK3LfzpmVYVQxiwyQKvYh5aIKdSmTzHmIBzbC36wcGssSX
	 MYyaK2Hc/106G7P8Kjr39V/2IBsm5fsyjE630gB56O9KkguhaMu1EImJKFeYqeettUSIK
	 2zuKxU1BkxhN8e/ePNj/Yn47n+tJQmFB4qfXZq9KdcGJ8oO469g3yUJdii/TbJCTQlO3D
	 El7EOL6MOGIx+ev3rbTjERc/NBLdyBE+S2id1nvsEK6eOzYObLXKmBvW2pe6SvLlD5n+X
	 m6mSz7Qr8M0mF7QZ7Ww3mzuYj8DzvPXu6yO1ekEMC4VUlBRHuHwDYhI48MT1rVSWE/A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=cUEQLsQ2;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9D93606A698
	for <linux-hwmon@vger.kernel.org>; Thu, 26 Nov 2026 12:53:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=cUEQLsQ2
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 244401F000F0;
	Thu, 26 Nov 2026 12:53:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795697600;
	bh=3zZTvYn5DIOxShhTjXTz7c1nEiH1jspx7f3vzfeMn+4=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=cUEQLsQ2p86TQs0ZpXzdhoSQUxZY0CcOq+XbDmKkqQeAuZEpaOmuWiiwdBeEQKoip
	 fxrSYHxaKst+zn30BkUh3JBfWVimd4rOsFNYulAJHRWkB/SgpjFo6gkeVyG9DWP44H
	 4WqosWrOT6VwwYPcwDkBmtXtKZgUyaIe/0VoEfwl1uqeBOrmcH4/Em/3XnuZSK3nLG
	 nwPaDwdunMYHO8vhgOlE0ruyYrp1HxxXgs7qbTgbzjTtb/r59fsrHnHn4ZIlEcukOn
	 sB8JK3alta/Sg1V9e6LLXYAs8/gcskPO9dKfg1JCgS32mvbFXKOsDSzYrJuy27Ou09
	 mC9pF9aVhzgNg==
Message-ID: <sashiko-outbox-235543@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v5 1/3] dt-bindings: arm: fsl: Add an entry for Cloos
 CBASE board
Reply-To: sashiko-reviews@lists.linux.dev
To: "Lukasz Majewski" <lukma@nabladev.com>
Cc: linux-hwmon@vger.kernel.org
In-Reply-To: <20261126124402.3015577-1-lukma@nabladev.com>
References: <20261126124402.3015577-1-lukma@nabladev.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 26 Nov 2026 12:53:19 +0000
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
- Patch 2 ("dt-bindings: hwmon: Add National/TI LM77 temperature..."): 1
  potential issue (1 Low)

A detailed review has been sent as a separate reply to patch 2.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261126124402.3015=
577-1-lukma@nabladev.com
