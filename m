Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794219621;
	b=lB10zbf9B2RfgZ7wwbN5h9z6N9U/ED3RuQnbw4ncES9/lbOPfayaE/3O/CbSBq6dhszx
	 f10caQBFvMVYTcSWXgwSv8Ei/lk6wWaVJJmj258BOzileG5/g7W/WC1ahc/l+5amrgISC
	 IbkxEWiT6TKzkhLYCtt8WRJZKhGHCkFEnnl+qKcZymKzq+zVWfW5seDOuF2izdVAlvqZg
	 lXoHa9cRI2F8GJtJEcQex7Mp+VOcJ58fJFcbiy/7l9deB0L6CXknK38tWh5CtAqr6eQeA
	 EO9zJviTDDPjs3RldzgvxXBT9Iqiegs60DsyznEZQcLxZ2n4ATxeXsrdT4OSHMp2Qgg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794219621;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=JTG/IrO0RN3drSdoYzi2QfvicxDRb+6/NPo0I/aTXtQ=;
	b=JSNJRE72GDqZbxWduHO6I7ijeOCrZ9qwBZBlmt20RpsZ1ZYmncH2smGOCIpyAxiJR/bt
	 jSkvEtsXOZ9s7DQwjh2tGZBZ/e1WfFYvhMEjJmZD84AqeAChUN972M/e7Q16HZO4YJihY
	 kw62cPqj3o5OJrK5r3RoYsFST4gsNrS2Jt+tdtaavaVGzzi1pjLKVCAWK6OdyxV63ku5S
	 hANeauW1Lfdht/pwgo81oe3HXaeGvEdkFUVe13RIKS5LHDP7pp+XButNzV6nlVOYOd7Ec
	 ne1E0gmxwkZDpAIst94GhjnwmOas5HrIP2PyX8z35dI4mAPGvoacuzVk6IsJ9mxrFhA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=QBaaSo6i;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0F55606A32A
	for <linux-hwmon@vger.kernel.org>; Mon,  9 Nov 2026 10:20:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=QBaaSo6i
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1F1971F008A1;
	Mon,  9 Nov 2026 10:20:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794219621;
	bh=JTG/IrO0RN3drSdoYzi2QfvicxDRb+6/NPo0I/aTXtQ=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=QBaaSo6i9kvqoZeNT3TI4TwHtnau6J5n6UyJ+lsjNE5FIl7xCPWuE5CrfRtSjjHNd
	 ScoXTK6/TzO0K47mMpa8otZkZut2IfXmTF+A7VQHoZb5Qnu1xTyJVKYSmwHH5xsKFZ
	 FmD1WHqyaEsozTrhk77MWjiP+1m78xAaHxg0TfLkqaT4OfRmOeJi/4NGrZn4rhPXNG
	 t/5jO7uRUfRgLnSunYJe/K46fOOEzmwdE1QHy5fnbWN0n3wPMHpt8mw3wfH5dCR8fA
	 X2fV27qc9KAuVDn5lJ3MhaIa4/GxvXcTAuGm0mzKBOnOiyv7TPpoGaRmW+orG/tXKl
	 fWgVk2ivpfeTA==
Message-ID: <sashiko-outbox-204801@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] hwmon: (w83627ehf) Clamp fan control times before
 rounding
Reply-To: sashiko-reviews@lists.linux.dev
To: "Zhu Jun" <zhujun2@cmss.chinamobile.com>
Cc: linux-hwmon@vger.kernel.org
In-Reply-To: <20261109101657.16793-1-zhujun2@cmss.chinamobile.com>
References: <20261109101657.16793-1-zhujun2@cmss.chinamobile.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 09 Nov 2026 10:20:20 +0000
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Post: <mailto:linux-hwmon@vger.kernel.org>
List-Help: <mailto:linux-hwmon+help@vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-hwmon+owner@vger.kernel.org>
Precedence: list

> The fan time stores pass an unsigned long to step_time_to_reg(), which
> takes unsigned int. Large values can be truncated or overflow when the
> rounding adjustment is added. For example, 4294967295 ms selects
> register 1 instead of 255.
>=20
> Keep the input as unsigned long and bound it to the maximum duration
> before applying the PWM or DC mode conversion.
>=20
> Fixes: 08c79950a047 ("hwmon: Add fan speed control features to w83627ehf")

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261109101657.1679=
3-1-zhujun2@cmss.chinamobile.com?part=3D1

