Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792512777;
	b=5nvkz8C0J35k2F8ieiGEcn9jbiN+tLnmmIFCbeVLIgvrG/u4+V8J4ujdPhg2bCW2tqqs
	 ET0IYNI8qHQoOMa3RyRRmn2gpJYg7IN/St8AiKVtXSPYPRuuiQDz7hv2IlkoWiG09BGUt
	 b2E8VVh9xsY/pW/lJwCUGLeUr5RbIxctp0VBKQOq88SbacAcwGlMrSsD+/BrFa6bmysuB
	 LUjVlxI64JhQwODeU2GjjGmPcQYGMbY7zl8e4iNxZe/Y9KbGMTTPBHcWvZOQaXcbjsh6y
	 6jfPPHMQuzYb5o4wFpQfBhgmK0CZEKa3VrTN5zSS6MlqXZbwTGbxS2zfwfSZ8zMFsvQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792512777;
	h=Received:Message-ID:From:Subject:Reply-To:To:Cc:In-Reply-To:
	 References:Content-Type:Content-Transfer-Encoding:Date;
	bh=T6lh4qOUizRi4hAS+WoC8Y77zbnIuOg1SB3/LDsshAU=;
	b=ERw91jAXhCMtX6dHWrryq/+xPpoUWLDKnBZDTn5YoGWI5mN4RZYv4HckplHfLCF+V5fG
	 P+MT7g/oAUCUa1h9z4e4TovB+XDH9bRQeysHO2+MYsE+k7QqsYeK9GBj1flWAyR7EQTez
	 6pw2Ur7THL7wV+jiKrDHI5oh9t6+oMsdcPp5j2OBhJTUm1vGuJkBOnN65+mSfg7SI/W5/
	 2H2GIrbXBRIi0Ta/wmYPrYpG3gQTB0wEy6TBouxI+sdfdNvbvuubAr5+u6pBsDCdRyJ2/
	 4v8d4G/T8pAW3F6d1pVsJdcl1fMizreoXhGQa9QgP7pAy+2+Q4fLCAr22Orl7WAea/g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E7D8606A31B
	for <linux-hwmon@vger.kernel.org>; Tue, 20 Oct 2026 16:12:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A33501F000C4;
	Tue, 20 Oct 2026 16:12:56 +0000 (UTC)
Message-ID: <sashiko-outbox-179334@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] hwmon: (corsair-cpro) Cache fan target only after a
 successful command
Reply-To: sashiko-reviews@lists.linux.dev
To: =?utf-8?b?QmFlayBLeXUsIEtpbQ==?= <pocj8ur4in@gmail.com>
Cc: linux-hwmon@vger.kernel.org
In-Reply-To: <20261020160941.36787-1-pocj8ur4in@gmail.com>
References: <20261020160941.36787-1-pocj8ur4in@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 20 Oct 2026 16:12:26 +0000
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Post: <mailto:linux-hwmon@vger.kernel.org>
List-Help: <mailto:linux-hwmon+help@vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-hwmon+owner@vger.kernel.org>
Precedence: list

> set_target() updates the cached fan target before sending the command.
> If the command fails, subsequent fanN_target reads report the failed
> request instead of the previous value. For example, after successfully
> setting 1200 RPM, a rejected request for 1800 RPM returns an error but
> leaves fanN_target reporting 1800. A failed request also replaces
> -ENODATA when no target has been successfully set.
>=20
> Update the target cache under the existing mutex only after
> send_usb_cmd() succeeds, as set_pwm() already does when invalidating
> the target. Preserve the previous cached value and return the original
> error on failure.
>=20
> Fixes: 40c3a4454225 ("hwmon: add Corsair Commander Pro driver")
> Signed-off-by: Baek Kyu, Kim <pocj8ur4in@gmail.com>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261020160941.3678=
7-1-pocj8ur4in@gmail.com?part=3D1

