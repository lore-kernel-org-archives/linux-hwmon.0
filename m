Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794366123;
	b=KmOsgcSlMyhNrAx0k/1kf17wJ4Nb7N0qCmWMSl448tMW7JMstJwkNNacGPbNHANQv8bg
	 Co60mdFiG5R6OWJVYKNxBEFjP3y0A3thqd4SxCHVUKx228/BswNp7wS99Om31CMvz0ElR
	 t8wu6jj4J7lUD0zytriZH/uSD71uuJRMGMIUJoWu5tfqvq32hJ1VohMlHpZg+M7adsjrF
	 DU6mnRtoB0CXRkZbyMRwUhgmSMnrqgmRt+dyddENnRuVtCZK3ffPb+bqEMu1ok+RrU4Hh
	 6tP515IuXtOJn254wuYmUoTw4ZllFRB4rnqNtY/j4h37jlK5BOp1R6DETab0IIbVjDg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794366123;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=45f9F8QBv72iR+qRuKTHK4pfoI4/bTYh4h3dlrTS0aI=;
	b=s0u/sH1MEHUQOnKA2WlJYs1H2re+Pnsp2eJsEqZ0vgY7NE+g7XKIMKE8DIdunwKUg2xU
	 xbkw3kSiaA3lUY/RfVsJ0J1V9UZqYKjPaCkt8I0k6fHxvZD5Qdx/88HXyZXF+wNIoM0Xz
	 RiJO9BOE0EBhhhOt8TU7boXE5mrjYgvR4U5BNylIhG4csHZgnO5esz3qNT2RHUzBkdoST
	 nR4EC8yAH6Va9xQ6fugnHW08f5jHv+V0TUjet21U1W03S2/Q4hho4lkSibxQJ8GH0NNAT
	 cfCrCnbALLE7AyGS9eSx84ZpRkPuzRNP4xu04J8krehWVkF9CDm5BBM7Py51tThdiVQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=dAHhU4ys;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 291BC606A31C
	for <linux-hwmon@vger.kernel.org>; Wed, 11 Nov 2026 03:02:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=dAHhU4ys
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 85A6E1F0089F;
	Wed, 11 Nov 2026 03:02:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794366122;
	bh=45f9F8QBv72iR+qRuKTHK4pfoI4/bTYh4h3dlrTS0aI=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=dAHhU4ysfIon00exn5/AdbfKLTW/lywwKZ1YvRQ4cLE9eXMYEjYdTOp4pemL1Wdl5
	 2Wq+niEsRhauE+4V3XIUwbk7/ha0SvVC0E+fO8o+eNFoTZdUrk8iGdIbEi3wxe2whR
	 FHU+IfnHNEif2/5cvyPdcNSPFr0mUxnurcwoENI3mKFSsvu4IfWxE4L+zvgVKrJoP/
	 HIp1C9NjyI8pqebq8OAwHQyQdTBgEPwfnVQCcTQbZixGNnMFzho+XvUprsYF8G53O7
	 IRl0MSkDxdbSlDajj9lGttpGsNdCzw5odoPIoapqpOJA//m/3qFbsjI6oqh4DFKfEi
	 JyrmrIQg1ztAg==
Message-ID: <sashiko-outbox-208146@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] hwmon: (nct6775) Clamp fan control times before
 rounding
Reply-To: sashiko-reviews@lists.linux.dev
To: "Zhu Jun" <zhujun2@cmss.chinamobile.com>
Cc: linux-hwmon@vger.kernel.org
In-Reply-To: <20261111024607.9712-1-zhujun2@cmss.chinamobile.com>
References: <20261111024607.9712-1-zhujun2@cmss.chinamobile.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 11 Nov 2026 03:02:02 +0000
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Post: <mailto:linux-hwmon@vger.kernel.org>
List-Help: <mailto:linux-hwmon+help@vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-hwmon+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 1 potential
issue to consider:
- [Low] hwmon: (nct6775) missing Fixes: trailer for step_time_to_reg()
  bug fix
--

commit befc95af1cfff1fb8b3fc9efb4b1e43ee7673fb9
Author: Zhu Jun <zhujun2@cmss.chinamobile.com>

> hwmon: (nct6775) Clamp fan control times before rounding
>
> store_fan_time() accepts an unsigned long, but step_time_to_reg()
> narrows it to unsigned int and adds the rounding adjustment before
> clamping. For example, 4294967295 ms wraps and selects register 1
> instead of 255 in either mode.
>
> Preserve the input width and clamp to the maximum duration for the
> selected mode before rounding.
>
> Signed-off-by: Zhu Jun <zhujun2@cmss.chinamobile.com>

[Severity: Low]
This fixes a narrowing and rounding overflow bug in step_time_to_reg().
Should this include a Fixes tag for the commit that introduced
step_time_to_reg() and store_fan_time()?

  Fixes: cdcaeceb74ff ("hwmon: (nct6775) Add support for automatic fan cont=
rol")

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261111024607.9712=
-1-zhujun2@cmss.chinamobile.com?part=3D1
