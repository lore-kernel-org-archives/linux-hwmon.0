Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793907567;
	b=dmo7mAwjH/q6HNjgC9TEuH5hfiL0uqhxdQjvJpJc81ul0sEmaVZrkay3K6QOZUTb/UHN
	 twl8R/TdKRwMaHivFVgAWxTZQwX0PG3fO2hncHHcqwC5puYkvuFh7gn0GLdtucySYXbU6
	 bFUuwwqpby5q4m7LKd3vqi55FoX6YnBWd+iJ9yn21TYf8o2jkRchpbzbvQnAOQ/hLCbiE
	 1potucJaI3rWSJabYY+21Y4WPFtnIn5B8fTkiMRl/IagWx6ifT8JCeQTzmJg4kRrST6Iq
	 ohOZ31kGMPXPzpZMMTO75He0PWXs+V6fptarmTsmaxWbaKgsbm5BR4236lTe0XuzZsQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793907567;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=OiiGmSlMt6vpmHvhgSuVTLvDpZNs6iJ2SC/cve2F8EA=;
	b=4N6OlHB/KD3lssEgvsnBIfEyqm7eHoxsLC+a3HX5jXMtH9FvS58Ophw/w9KFTGGb0GJl
	 ijo29RUujqriwcr8eWvCjxvR/mMj/FpbZKVmimHJw6HPtw5kGus38ipcysaksCsZnHhYD
	 S1BYvmZJhTX54aLN83lzBto0OCPfAz8TrokMNrDCxor8/NBmOp/xJKK3jTDLCMjm3Slwz
	 UtxwDS5rWsrqQMaDg3r7ME1jpfL7biV1XdcOg7voYXp15R3lSk+pO4sjOB8X+m3DAr3bh
	 2sJ7/UINhpIWlyIFGCIp9f9z2BQ8FDJNSepUn7uw/HRMvz7yM+suoQYTrSvsRwnhvoA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="FZ0KJ/Mq";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 692F2606D81B
	for <linux-hwmon@vger.kernel.org>; Thu,  5 Nov 2026 19:39:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=FZ0KJ/Mq
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EFD471F0089F;
	Thu,  5 Nov 2026 19:39:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793907567;
	bh=OiiGmSlMt6vpmHvhgSuVTLvDpZNs6iJ2SC/cve2F8EA=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=FZ0KJ/MqivU69juXFa1LVmR+2aH1ge/bZ2xex1lHMLMnrM/iUDSg3Km8Zeoxva6Uw
	 fpBjwe0CSal9mVupGwkosN8jqk6ez0MpUuenXrMihZRTCJi/j6vnHNRb3uFfc1nHlU
	 FirS96LgohtD0G6E9WTqa+4xgiZ/4LIKX1T9qjl/FCFwoL32WY/jWHHlGX4wsjVgit
	 Hr79P8jUk+29Aj+xy6YqDCKaKaul9uXep7wcvsotHR/CwWjjUDY4oDhprug+Km+Dg+
	 jKhuZ0KJaK1VJGLToStQ37R/CZcZrOXwlAVP+RiRo++eiAIuZzWg0TEgqwO3zsbl8I
	 KvNilJ68C0FOg==
Message-ID: <sashiko-outbox-199963@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2] hwmon: (pmbus/mp2975) Get vout fault limits
 dynamically
Reply-To: sashiko-reviews@lists.linux.dev
To: "Felix Radensky" <fradensky@nvidia.com>
Cc: linux-hwmon@vger.kernel.org
In-Reply-To: <20261105193200.1570996-1-fradensky@nvidia.com>
References: <20261105193200.1570996-1-fradensky@nvidia.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 05 Nov 2026 19:39:26 +0000
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Post: <mailto:linux-hwmon@vger.kernel.org>
List-Help: <mailto:linux-hwmon+help@vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-hwmon+owner@vger.kernel.org>
Precedence: list

> The over- and under-voltage fault limits of the tracking mode are
> relative to the voltage reference, which follows the VID/AVS requests
> issued to the device and therefore changes at runtime.
>=20
> The driver reads the voltage reference once during probe and derives the
> limits from that snapshot, which the PMBus core caches in addition. As a
> result in2_crit and in2_lcrit reflect the operating point at probe, rather
> than the thresholds the device enforces. On systems where the device
> supplies the CPU core voltage, in2_crit was reported anywhere between
> 1.15V and 1.70V across identical systems, causing false over-voltage
> reports once the CPU voltage exceeded the value latched at probe.
>=20
> Read the voltage reference and the over-voltage offset selector whenever
> a limit is requested, and mark both limits with pmbus_set_update(), so
> that the core does not cache them. The voltage reference is available on
> page 3 only. Let the core change the page, so that the page it caches
> matches the device, except for a single rail configuration, for which the
> core does not issue PAGE commands, and the page is changed directly.
>=20
> With the selector read at runtime, a device configured with an
> unsupported selector no longer fails to probe. The OVP1 threshold, which
> does not depend on the selector, is reported for it instead, with a
> warning.
>=20
> Clamp the under-voltage limit to zero, since the offset can exceed a low
> voltage reference, while a negative value would be reported as a read
> error.
>=20
> Fixes: 2c6fcbb21149 ("hwmon: (pmbus) Add support for MPS Multi-phase mp29=
75 controller")
> Signed-off-by: Felix Radensky <fradensky@nvidia.com>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261105193200.1570=
996-1-fradensky@nvidia.com?part=3D1

