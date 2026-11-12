Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794517451;
	b=RUnEWFpsuX/bCY5rWLlv8zxu9GiApXQR9sAlw+BgaK3pMViDYv0gEeiBuE4339ivWo9n
	 kgCrs04G5xJJkM3C5FeoVkwdmkxcJB07v48pwb2Yp6aicbYt+eWW8OmFKNe48mNKIZFnV
	 g7SBNpWdFpk0UcKvjH8nl0ow0A9gcTBA0EKJIJWx6QNJz0NbHnJ7FH+o8lP1Lg/6bV8rJ
	 sokQ6glF0z2XB94f2ingqnm55sUTca0pW2uoGabYmZfHzB+spTSUgbtRha9fBQbzBI2nK
	 xJ0e91z1fJ9cbTe0NFVxbTLoFEv8Lla+b4TzoIMDPhS3MMI42JFHxZVDtrUHp0VoHEQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794517451;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=TG0Rgtuq/44dT3474Xd0xd7+ekmPUoNiB0HjVtlEiIc=;
	b=okU3GDogjqjuw6YJxTBek0BO7yrD6aaU1B4B3I0U0bvfYvm1snG6n8ls5wbyoLzrvYeD
	 HKZMAFMoY4AytHojEi4Htw0Imki4NCa8oq+C3YYmT+AGej71NzmevplH3DkYcoC7msZBA
	 inVX+mIZJjxaHjuxRYZ2AH/lpiWWXpOCa/MgjE+YdriTvJI7mdnjcXhRuU1EfIPWdSUmG
	 GiPQZTAoc5EHS9m+oLV0qN0ddNmRwsM7bGD+dn74aXe93ZMLsx2Gv4ZYfWr2nUubR4TZM
	 EwoGHX+76YJPd9IrnlYsC5y9tKy2cgyzNdH/kvP/ENW1s0RzWDVVeHQIWWAQF9C9jDQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=iO3wf9xm;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D391606A31C
	for <linux-hwmon@vger.kernel.org>; Thu, 12 Nov 2026 21:04:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=iO3wf9xm
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DD88B1F000C4;
	Thu, 12 Nov 2026 21:04:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794517451;
	bh=TG0Rgtuq/44dT3474Xd0xd7+ekmPUoNiB0HjVtlEiIc=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=iO3wf9xmDzkKJULoEXYnwstkBZUCDOgd39qeHE803UdxksycOey/M3kmhetvv9vaR
	 5bGiPWSNJyu+Mz5H2cNA3XhaK9SBrkAwDmmOhf20RGY2vcOH7tElg5Of6qUPOgmmml
	 jjVVUWeltPMEKmXqGrhoBnF42olxziqlNtO9ma4dH+Kt6CQ/UvWlqPUv652GN57P+r
	 0ayCif/VQZoSjIL//7YujtGQTV8VlGWETqW5RFHQFgQJFZI8wqoJCnmMWSbpBKtNXr
	 YEmsTVJknCKUAOsYsYeFtcsMIsA3VR3NhAtTQhk58zqOekp852rfrIbr6Qz72MGEPI
	 07JrdO3nD2k2A==
Message-ID: <sashiko-outbox-211842@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 1/2] hwmon: sy7636a: read the temperature only while
 the rails are on
Reply-To: sashiko-reviews@lists.linux.dev
To: "Pablo Mazzini" <pmazzini@gmail.com>
Cc: linux-hwmon@vger.kernel.org
In-Reply-To: <20261112205228.42630-2-pmazzini@gmail.com>
References: <20261112205228.42630-1-pmazzini@gmail.com>
 <20261112205228.42630-2-pmazzini@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 12 Nov 2026 21:04:09 +0000
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Post: <mailto:linux-hwmon@vger.kernel.org>
List-Help: <mailto:linux-hwmon+help@vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-hwmon+owner@vger.kernel.org>
Precedence: list

> The driver enables VCOM at probe, which keeps the panel's high voltage
> rails on for good. Read the temperature only while the rails are on, when
> the chip samples it, and return -ENODATA otherwise. Read power good with
> it in one transfer, so the value can not be from before the first sample
> or after the rails went off.
>=20
> Signed-off-by: Pablo Mazzini <pmazzini@gmail.com>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261112205228.4263=
0-1-pmazzini@gmail.com?part=3D1

