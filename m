Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792814522;
	b=4YGuHR8bLGbyqXfb3/z4koyHVOas734PwXgVF1k6383p+X8N/0Dd9FnxQ+3HAcLnyuPA
	 VRWvo7ChvvVuuyEN1PJUfktYRWP/jju8TAsnRydSF7m/29JjaXfkhtLT0en/FlJuTghub
	 xDtqcdz8x/2VwPWvCa9m//vMuy3IreEsunl7n8SEImP6b6sC1gPelhWFnRMABiUMpTKkr
	 d8Aes8a5itrYCko4lTjGc6HDj/UM9Vk6lwlblYbrm7Bba/t2rG6n+IEJ9NEEUlf6dFMfo
	 5fm2q6SBGhlBhromrX7aabWTTjautlQXtSmr2YfuwmpSaksZsDUhWLTSHOEG4K+TKbg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792814522;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=ZDKEEEvuAo8CIav6T2KOpHFsjwYhj5eVHdx3ifHk80A=;
	b=G+7lqDdq+kDvAfccndLAmc60QAht8hAh/wcq952bSWOFZRJexfsLflnf0lBj8lQG12o3
	 4tzjyn6Fyixle7SlMv22lYL9YEoW55PRG8Y6Vr9JzJ4VbcmoFXlQ7/de/QTq7SOhjVuw3
	 yZS9Q1A4thgez2ojhXcT3YGWe11AjnkSP9ZXMfBRe6QQMqeU1vTt6GUdqYC+88ZZSVqOF
	 AukGV2VmKfC4Ok1iar8RK7GrUhzcf+0+UkUnjG3TptIfvf7vFnPJZrDXAOChUXYNxlvsp
	 sQA/OCAll5eCNfOW10W8IR/NwLyl3tIKqD442ey6WOG0JTLV5nxXSu86zMxgjyh3ztA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=MeicwKyQ;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB45C606A31A
	for <linux-hwmon@vger.kernel.org>; Sat, 24 Oct 2026 04:02:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=MeicwKyQ
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 329261F01825;
	Sat, 24 Oct 2026 04:02:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792814521;
	bh=ZDKEEEvuAo8CIav6T2KOpHFsjwYhj5eVHdx3ifHk80A=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=MeicwKyQDMyRfxq+lWC0jMNilRvJ3oeVpP5g1TjgEgKVe7Q+GWkOhf9nKZ4mTq6+N
	 JLQoQdZkzVGjzt/tYIfp5AKEtIe++SMNrxwaBBeIFTlDxJYYUsKP2EeD8b622SbTp/
	 EtQhnL1v096wR03m0bANUbgyoiIndE1j9d9AXWIiPFKYeziqAtO8HnrIDo6wMq3lcA
	 hwRWSoqpW/AHC/gLKFJddSPpzDsRVQUqil/XdPvWsI9y4CNuNXK8mKA6Qy9l+sFQMw
	 o+9kiivS0WxPFPvyTAeeKi7Xy56Z/xQ+L5pmfrpMjizzCR/T0rQbwBBvDKejk1/T0V
	 M+0YOEw92krDA==
Message-ID: <sashiko-outbox-183536@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2] hwmon: (dell-smm) Add Dell Pro Micro Plus QBM1250 to
 fan control whitelist
Reply-To: sashiko-reviews@lists.linux.dev
To: "Armin Wolf" <W_Armin@gmx.de>
Cc: linux-hwmon@vger.kernel.org
In-Reply-To: <20261024035735.6810-1-W_Armin@gmx.de>
References: <20261024035735.6810-1-W_Armin@gmx.de>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 24 Oct 2026 04:02:00 +0000
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Post: <mailto:linux-hwmon@vger.kernel.org>
List-Help: <mailto:linux-hwmon+help@vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-hwmon+owner@vger.kernel.org>
Precedence: list

> A user reported that the Dell Pro Micro Plus QBM1250 needs to be
> whitelisted for the special SMM calls necessary for globally
> enabling/disabling BIOS fan control.
>=20
> Acked-by: Pali Roh=C3=A1r <pali@kernel.org>
> Closes: https://github.com/Wer-Wolf/i8kutils/issues/20
> Co-developed-by: Sergei <serjo32.games@gmail.com>
> Signed-off-by: Sergei <serjo32.games@gmail.com>
> Signed-off-by: Armin Wolf <W_Armin@gmx.de>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261024035735.6810=
-1-W_Armin@gmx.de?part=3D1

