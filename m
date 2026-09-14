Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0049D282F03
	for <linux-hwmon@vger.kernel.org>; Mon, 14 Sep 2026 08:20:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789374020; cv=none; b=j/MFsVIe7a4VilxNeqyZc7g178Q5ukHE1wCkU9jySngNSIvvxNktcwH+O1bGu4FsJYfIcJLoZs77cDeHwp8phmZEsXmqMYQyyXrlNuIk/Bhm9Wm+AekIBduNhmnV7BwgVYYfbExes3Xu1krapZINk854BJwRBFNIgdWZuiApz6A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789374020; c=relaxed/simple;
	bh=BrmrQWvF1+9LHDwE9Y77kWNaTCkhuIyvZdLJtLoKmn4=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=XBfv37SzSYMp6fNZ00yiE/Wpb+uUf3Jxj+KV5TxlxrJuSheb1zu3meE9/+RUj7d/zttAYTup8Qb6013HECC9YuZx36IME9zYj7QPX9kLLKYGL63lX07whFGDJjxkD3NbucSfBnf8uKl5xROtv1S5M/TTTXaDGXcQkYMgNopp6hI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=evz9lzwU; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="evz9lzwU"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 46E721F0089E;
	Mon, 14 Sep 2026 08:20:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789374017;
	bh=BrmrQWvF1+9LHDwE9Y77kWNaTCkhuIyvZdLJtLoKmn4=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=evz9lzwU8mFdhCfLS4dL4ugTv3Z7sGSluvDR7kUiSXrXJWuK3xwSEb4F2ZZrJDxgY
	 yKSpaJPyZw3Lk/U5PYVEKGjYfsIEFLGNBNqH335gg1qtTrO4t6QKkZpNeQyVYEgT4B
	 Ht6kVcZEVY+cdgmAq8zuYCzBnKhnSGaE8fEFWWdPqr9h8Yat8AtJv558thrtM/c7EG
	 T2w9M+/k9Hvm+mXJhQ5qAsryLVWIC86yXtQbQS6dZpL4KqWYA7QtLLUTWOp0dDVgub
	 yG9Ev5BFq+Vfju4s5IGOT0P5tqf6zSdUUFPHUWI4Jux+uS4xEQTIRejaFN1V75LmHv
	 rCUn2SyDOYriQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2] hwmon: (dell-smm) Add Dell Precision 3650 Tower to
 fan control whitelist
Reply-To: sashiko-reviews@lists.linux.dev
To: "Patrick Pepin" <patpep@me.com>
Cc: linux-hwmon@vger.kernel.org
In-Reply-To: <20260914080955.87925-1-patpep@me.com>
References: <20260913112925.11393-1-patpep@me.com>
 <20260914080955.87925-1-patpep@me.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 14 Sep 2026 08:20:16 +0000
Message-Id: <20260914082017.46E721F0089E@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

> On the Dell Precision 3650 Tower, the EC ignores fan speed writes unless
> automatic BIOS fan control is disabled first. The I8K_FAN_30A3_31A3 SMM
> code pair works on this machine through the WMI-SMM backend: after
> writing 1 to pwm1_enable, all three fans (CPU, front, top) accept the
> three fan states and report matching RPM, and writing 2 hands control
> back to the BIOS. I8K_FAN_34A3_35A3 was tested as well and also works;
> I8K_FAN_30A3_31A3 is used since it matches recent OEM software.
>=20
> Tested on BIOS 1.48.0 with kernels 7.0.0-30 and 7.0.0-31 (Ubuntu 26.04).
>=20
> Signed-off-by: Patrick Pepin <patpep@me.com>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260914080955.8792=
5-1-patpep@me.com?part=3D1

