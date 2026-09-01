Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 507EE3DCD90
	for <linux-hwmon@vger.kernel.org>; Tue,  1 Sep 2026 18:24:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788287060; cv=none; b=Jb/2/lOD1YmJ7+soDRmKJuFN44autWekk4J/GHCxraNfPlaCARnKuvoOIYdONvVGGWkoHOAxZbcPPSH+OXh1IKe/NNTd8g3t35pi25Ucyuip5N9++QnFCEOuT6nXSgTi6mX3VDxLLdRjtolGPysCW0beWKfBEYP535k0erA5sKc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788287060; c=relaxed/simple;
	bh=87mDdb+GyQgwyk/5G/SUxwwNgrbe0UUtKwEJBYHWQ+0=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=kmemqX74dPqmFX0u1ml9w95/A9iAfMqIJLNoPN4WcSvZb6sIdxnHEYz0h6MKfO8VvTwfyAXi86K494xt5/39pO5mC8GUw2a+2M2W87H5XXN8mBd/kj9TnIbygm0ampVLUPn+XnKsj3m7WoZzO1uFjQcQpprqQPzb90ySnT7m0tc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=DLzJuKVd; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="DLzJuKVd"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C17BB1F000E9;
	Tue,  1 Sep 2026 18:24:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788287059;
	bh=87mDdb+GyQgwyk/5G/SUxwwNgrbe0UUtKwEJBYHWQ+0=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=DLzJuKVd889hPnfD+nfxK7ybPBjnpBnQb8wwGLL7Jn3c+zyX41KMLhTF4yGqEiqqs
	 N79lEjmIBIlZ545Vr4nN0JAtT2YQ43ctXHMNXa07sqHdtxl/JuVT/mjbQkHS5aWIxc
	 eQy6JZzVk/uyXGxvKEWScFw9aocfKZc2n+HiOf13YfhZ0SG5Thjksv205nzEVCfnP6
	 dB5gEReX1tQUvD2qMBsTtu+gkWTk4qwbOjpLEXwLhc10lQF/10jEZzSnxyMLS0X9gE
	 ynIHfii16beSDT9Z+w1FpqZnJmAI2DOcI4wzwNwjpzo1YMdluN4y96eV32a5PQPw+k
	 dtkDE11VGXtuA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 2/2] hwmon: (dell-smm) Add Latitude 5420 to fan control
 whitelist
Reply-To: sashiko-reviews@lists.linux.dev
To: "Armin Wolf" <W_Armin@gmx.de>
Cc: linux-hwmon@vger.kernel.org
In-Reply-To: <20260901181849.241776-2-W_Armin@gmx.de>
References: <20260901181849.241776-1-W_Armin@gmx.de>
 <20260901181849.241776-2-W_Armin@gmx.de>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 01 Sep 2026 18:24:18 +0000
Message-Id: <20260901182418.C17BB1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

> A user reported that the Dell Latitude 5420 needs to be whitelisted
> for the special SMM calls necessary for globally enabling/disabling
> BIOS fan control.
>=20
> Reported-by: pp12313124124@gmail.com
> Closes: https://bugzilla.kernel.org/show_bug.cgi?id=3D221935
> Signed-off-by: Armin Wolf <W_Armin@gmx.de>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260901181849.2417=
76-1-W_Armin@gmx.de?part=3D2

