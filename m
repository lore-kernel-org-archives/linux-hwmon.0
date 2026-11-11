Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794386312;
	b=fX1hQNb2rdkvqnaqeS+pIcSAWlql51O6X1K9xae0UNTUHs8GDy0wsTMz+rZ6mC3IueQg
	 12dP1rp8XxkIH7etkMwZBAazhVS9vvicOyEEkebCM9Oyv/qYG/aCDG0h75UprEzJyDP2Z
	 4ujnrQhSpQvTutrIFRZ8eFCSO5lysmpg/tGzvbn0gw0GaT/AtQZ3xBs+iAE6Wj4FauAe+
	 EGu+eq9iEDGyuz9paATwfF09cftOzv26L0tGbv9+FCiYRxzWeeRqUnVAyPZLNxZC8hAJM
	 Ov9bVOpX7PuST+9T5MOg3320jjUWbhv88w9tisT2EFDldxSQOFR/+tzLpXAN/WDn1lg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794386312;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=46agaqDt6GybEG4aEuIjc++dePQBxFfFpTaStH2BwMw=;
	b=jF9lC/9lWkSHABkC7MwySUVscwVtSIRhdhDnKdTH7J7gpnhNuWw9QZ+A+aQOBVTWV/o1
	 42RzTPLVCxBpAwj4oxxdixQN4a3ZNZcZLoy4h171R6doJ4mAlGoOdb0yWBx3e+KANJ9xJ
	 KDB5ujhDbpsdn6hQzyZniez6zaT5sYD3pNpo1QVoCI7b4OiePd48SReMVHV76bexAR61v
	 ugsPpOWRq3Kj1TB/OMFF1aPOL8qT4ZUSZU8xHGp6h6EEBwy8IEt2Ao/qROwZpYDLp8VBv
	 Tjrh5MFiImqjrcoxunR4R/JR10IkFwB5zBxqOKTX+Q6GQAJ1h7UAvxIu94eD1VK1vgA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="ZsDLdS/Z";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88B21606A31C
	for <linux-hwmon@vger.kernel.org>; Wed, 11 Nov 2026 08:38:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ZsDLdS/Z
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 25F381F00A06;
	Wed, 11 Nov 2026 08:38:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794386312;
	bh=46agaqDt6GybEG4aEuIjc++dePQBxFfFpTaStH2BwMw=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=ZsDLdS/Z9vXULVjeZfVFmL8Biwyns6lgIBYlLVBnlwGmN4ZsFdKbpubTHYQWEh8Sh
	 IvOoTZCQIcIVPrEcilXMVYgk2U7SqUPAsO0miNRJb1SwSrdsr+lVgzrPPMTonKgPCH
	 kCZecXunHUpVhyRWhG3h4ZDZKM1qpCf/Ll37vLmLz39dZqsOYXi7oW42JwGrUlQ5ur
	 VMP35bvMaiRR1Ao/ucJpG/CKo5kbbMzwIAhLHYhryp3c2bwkBkqHgtHv192jwm+YVV
	 Gyyr6f3IumnFViDNdmbrHOIU/GseFocQ0CNbHFNnKthvujdsJW6BTZsZN/FawdJEH/
	 q1SyCvB0xy/fw==
Message-ID: <sashiko-outbox-208623@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 7/7] hwmon: (nct6683) Scale the +5V and +12V inputs
 of the ASRock B850 Steel Legend WiFi
Reply-To: sashiko-reviews@lists.linux.dev
To: "Johan Dahlin" <jdahlin@gmail.com>
Cc: linux-hwmon@vger.kernel.org
In-Reply-To: <20261111082838.1418051-8-jdahlin@gmail.com>
References: <20261111082838.1418051-1-jdahlin@gmail.com>
 <20261111082838.1418051-8-jdahlin@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 11 Nov 2026 08:38:31 +0000
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Post: <mailto:linux-hwmon@vger.kernel.org>
List-Help: <mailto:linux-hwmon+help@vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-hwmon+owner@vger.kernel.org>
Precedence: list

> The +5V and +12V rails reach the chip through resistor dividers, so they
> read as 1.70 V and 2.03 V while the UEFI setup shows 5.04 V and 12.19 V.
>=20
> Let the sensor table carry a divider ratio and apply it when reading the
> input, with ratios of 3 and 6 on this board. sysfs-interface.rst asks for
> such conversions in user space because dividers differ between boards.
> Here the board is identified by its customer ID, so the ratios are fixed.
>=20
> Signed-off-by: Johan Dahlin <jdahlin@gmail.com>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261111082838.1418=
051-1-jdahlin@gmail.com?part=3D7

