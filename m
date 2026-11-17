Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794884968;
	b=hmKmnMlr43ztljA1GmipX9Wc9/8xN6xVih1HAL8SQgB2VaIO3mR/kn8R2nn3deZ8N8Gq
	 z/tNrEWp1V5Bbw0eHYczb7dJE8HBxD5pn6ER+IrXUqL7rImPouaLHHlKMRz8U0RVLmoyz
	 k2KJgsCQHEv8Xc7ntvqCgkz+p59mkTIvpSZIPvioEWlXQeqgj91bTtXCW7lfSTXcpVngG
	 HslxfwEYqslLWqlzQ9lya3r+EzpPwZav+QeNX3Mf2t7KPh8SHSHgKalRNhyFGxE3tFOby
	 1rVO8jG1Ee1HXenTw92BcVkNQKXbCMyerff9WgtsdiOT17yiIOeS2AEOkE3iyqfaLFA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794884968;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=/b5hxteJX4KFh/lwPnTuWxbP20IbYNqXs7D2XxLlPJc=;
	b=cqkHae8GOqpeEhk6tjur1Mkyo3Var0xYGvXvTAio48M/2NJazQPOTh3N7/tq6HRYQbEJ
	 eswDDF98XKl6kEQkzpNEh+d66XnmsRw0bz9iob5JOwqpV61MiKDH4qdPXetwTIyhm0Lek
	 yDTLyrl9bF2bHzwmBooNWkyyJlBbv5AdvEFnPwH/x54iuXlwYjnCPe7n6aAO+DcQ9vJu5
	 FNW0yx6LFoETHIye3+7uD98bHCFaD2U0UV35TR8mQlH2N4vv8MEDSCNOa/VG17OvWJdOa
	 xyaga9SpAVvVQdqKsr8v1iNmqfgHHBsOKde+KR2mx5D8n4mdtGq+SJAGCfFShkzWzUw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=RLinLdrK;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7FCA6606A31C
	for <linux-hwmon@vger.kernel.org>; Tue, 17 Nov 2026 03:09:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=RLinLdrK
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3DEAF1F000C4;
	Tue, 17 Nov 2026 03:09:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794884968;
	bh=/b5hxteJX4KFh/lwPnTuWxbP20IbYNqXs7D2XxLlPJc=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=RLinLdrK5ft3cvR3VyCPptkuJAF8ZEuQQkui9wFi1D6wXbVy4zdjMJ81vj71ulDzQ
	 rbRBs1zIKM+lz56G5YxZjTynw48clR744E6Zjgj3XfkQapy+hZtBpahrldKajgSxue
	 wYha3hJ1YOirBbM+CbI0TO8EqGhSrAr7TJl4vWzrE+p6pMtTZXLulQyoop18NaYDTx
	 /UXprPwqzxYpOPGLiJxFSeqqFNrxvqpcidZycJKnqZtjdWJq6s7g9PEdkMAB5p3Rwd
	 h077tgVPHT35tze9FeAfZxsXna0bzcGq7yd/USbj1bjNEsSy12lJiHbaK83pBVo1/6
	 ldEi97/nJ16Iw==
Message-ID: <sashiko-outbox-218126@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 6/7] hwmon: Add driver for Marvel AlphaServer
 environmental sensors
Reply-To: sashiko-reviews@lists.linux.dev
To: "Matt Turner" <mattst88@gmail.com>
Cc: linux-hwmon@vger.kernel.org
In-Reply-To: <20261116-marvel-env-v2-6-ef614eb2e7f1@gmail.com>
References: <20261116-marvel-env-v2-0-ef614eb2e7f1@gmail.com>
 <20261116-marvel-env-v2-6-ef614eb2e7f1@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 17 Nov 2026 03:09:27 +0000
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Post: <mailto:linux-hwmon@vger.kernel.org>
List-Help: <mailto:linux-hwmon+help@vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-hwmon+owner@vger.kernel.org>
Precedence: list

> The management firmware of the Marvel (EV7) AlphaServers, the GS1280,
> ES80 and ES47, monitors temperatures, fans, voltages and power supplies.
> The SRM console describes each sensor as a packet in a power and
> environment node of its config tree (GCT), and fills in the readings
> when asked to refresh the node. The packet layout was taken from Tru64
> UNIX.
>=20
> The firmware gives each temperature, fan and voltage sensor a warning
> limit and a failure limit, and reports the sensor in the warning or
> failure state once its reading reaches one. Neither state means that the
> sensor is broken: a temperature past its failure limit is too high, not
> faulty. Power supplies are either working or failed, with the cause
> (AC, POK, overtemperature, fan) logged by the firmware.
>=20
> Export the sensors through hwmon. A temperature's warning and failure
> [ ... ]
>=20
> The console callback lives in core_marvel.o, which generic kernels
> built with ALPHA_LEGACY_START_ADDRESS leave out.
>=20
> Signed-off-by: Matt Turner <mattst88@gmail.com>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261116-marvel-env=
-v2-0-ef614eb2e7f1@gmail.com?part=3D6

