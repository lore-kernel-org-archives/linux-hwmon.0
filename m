Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793530218;
	b=0e8HOjDq/bW9AJrYSbio2JcxNys4mVdXf1xFZjLoYEA0YLMi6/XCK7n2maoQHSbH/hdP
	 tyq3bpQNFym/dYxXiclSn7sMhTDXSTvUtpyDHzxGWvg6uEei/uu0G+ZzOFbgtPcuN7MzC
	 5X3cnU/Q0431q0xJXo/9YXJbiP6/GS1WaHR447pie1STz5AHEU0PjQe1mPlU24vBSz7qf
	 YUVvOVz0hdPMmModWRLVX1TLfV2FTt92SkPHOXDWze2M9GbIdEXM64VAbENS1QWlntJRT
	 /qTLZ3TONh5P/LhtV+22wqJJNK4kIW9u0tJy4utwXZmao+5uvWQzXK1Ug/LrUWGK8fA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793530218;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=8xKIiS52Rtuhil62mUMxNuAMfqOKFbMrtFSnTT5/FyU=;
	b=uEKJhLX9lOXFE+E3Xy0fHCIP+IKI1mZsFo0wM6KrP9HU3ngbrZpxmlfLikVgpRizdccF
	 3+aC6NWn0gHaJS7jWQUrP9dotvzT5Q6ZujquYRl6bpa5n7ZKs/0f4/6/bnrdQnYfA7piC
	 Pr+k5R6ROwwDhpR8obp2IfQGFZWFNsLtVHS3aYdUtidgGQ3VQNm9taBtOT2d4KHKLlMMr
	 XQM/vupSoYWaXhUTR1NirvcleKQuxQJzpPR8sN+gSkSa7JKZYiSURIuIx+Kp6WDiHl7UC
	 WiI16RUaIctZ21adXDShmFbLprs90FF3OyDzBN462vnSSkmTy1BZbsNIipYT/ax+7DQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=WIncAOpK;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 536DB606A324
	for <linux-hwmon@vger.kernel.org>; Sun,  1 Nov 2026 10:50:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=WIncAOpK
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CD64C1F000C1;
	Sun,  1 Nov 2026 10:50:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793530218;
	bh=8xKIiS52Rtuhil62mUMxNuAMfqOKFbMrtFSnTT5/FyU=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=WIncAOpKjAS9ecOk9yseQpd9s3aQlp7st9B/oVpO/ZNEKkUrrizauWiVV9fzzcRbh
	 NBmM+kxuCIgNoFHo9yKVd2HI0RDdQlh/QP2O7T5NGykcTGq3cW2AFsM3h7aQsYe4yH
	 aVkn81VBQor3NXBRpYwwT3R1gT5W0QNX6WVP1GkJjGUo5yxsiJwmlx89nGQd8kvrGH
	 YLYIdhdCvduEdJBeXFZj8mHgFynODLLtOvlEm8KBobJ60OyNB1+TczO3EGKTIbuX4V
	 2DmB3kWodeV36SyJh4Lfq46b5ndYY/aINI86DBN3SV6hUi33/QF+uUrtBGBEFb4R0Z
	 XWt9PvS/s6QAQ==
Message-ID: <sashiko-outbox-192366@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 2/7] Documentation: ABI: document the ASUS custom fan
 curve attributes
Reply-To: sashiko-reviews@lists.linux.dev
To: "Bartu Alev" <bartualev@gmail.com>
Cc: linux-hwmon@vger.kernel.org
In-Reply-To: <20261101-asus-fan-floors-v4-v1-2-b8d1c31a99a9@gmail.com>
References: <20261101-asus-fan-floors-v4-v1-0-b8d1c31a99a9@gmail.com>
 <20261101-asus-fan-floors-v4-v1-2-b8d1c31a99a9@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 01 Nov 2026 10:50:17 +0000
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Post: <mailto:linux-hwmon@vger.kernel.org>
List-Help: <mailto:linux-hwmon+help@vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-hwmon+owner@vger.kernel.org>
Precedence: list

> asus-wmi has exposed custom fan curve attributes since 5.17 for CPU
> and GPU fans, and since 6.6 for the mid fan, but the sysfs ABI was
> never documented.  Document the existing attributes before adding the
> firmware fan floor tables.
>=20
> This includes several embedded controller quirks: point Z is limited
> to the temperature decade [30 + 10 * (Z - 1), 39 + 10 * (Z - 1)]
> degrees Celsius, the EC clamps uploaded thresholds to that decade
> while reads return the raw byte written, fan speeds step without
> interpolation, and downward transitions use 5 degrees Celsius of
> hysteresis.
>=20
> Signed-off-by: Bartu Alev <bartualev@gmail.com>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261101-asus-fan-f=
loors-v4-v1-0-b8d1c31a99a9@gmail.com?part=3D2

