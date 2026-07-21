Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3A083E3C76;
	Tue, 21 Jul 2026 10:05:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784628318; cv=none; b=Lmuf3xOkjrJU3QT8hDR8YS1nWWgnG5C9MRatzWfdF/fCb6It4gTAJtmryTlRs4/uZ6yM6fbc0/ygEldzaXno/N7RyOT2/7UKWz6HOFqKaJewMWqra4g4ItuLtRbdgsV4FXUgohKquL4FslkZBl6JvuaBrK7W90pBbxM6bXfrB3g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784628318; c=relaxed/simple;
	bh=dI5W+ZCWok/cE+i8yJjLtEe7MHE5KtVrkeu2/X5fMnQ=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=qrU5N1b3C0jvW3+tcBUVN2q5jijr8SLrYhlO1Ie9iPaRPTCDCxrokB3epgZ7e1yfHTDOz76OAkjGxz/IgZ5i39lQQT7fNTIfVPMk7pY/WhEpgP2HD51+GRVQGjgAOmzsp4WtkFOjvjD0mXeOoiNBVfh6YBRqPk+VhScISDqw9LI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fKL+Kzoc; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fKL+Kzoc"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 762101F00A3A;
	Tue, 21 Jul 2026 10:05:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784628316;
	bh=dI5W+ZCWok/cE+i8yJjLtEe7MHE5KtVrkeu2/X5fMnQ=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=fKL+KzocBoGXIzHYnO4oP+gjhmn6c2nLNr6/9GOWq00lEXxWoC+meT2DXAv2d3bn1
	 D8B0TI+4aRUm2lqoIVyDO5d+66EUf708V8U1YcsbYlJ8Km6BMAtxRPNYocR+BUD6k3
	 4wESEcB2caGj/dqXZtS/afp1n7F39koXCwDgc9O74+nklTurPuCkKlEHZjoC2QCKV5
	 V96HxEtoEPF005NxWhN4S79Wlnr6DJTH9R8TE6bTOFTxT/3rDUa7SCqqnXGE19VWPf
	 lYOZnj6SxWPXb8kiwKqzYTQYq6GQAuWmwcTurMU2CSyxi5Qzbd9T0giSla7GIznsow
	 t/yKVTtFBHu8g==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 2/3] hwmon: (emc1403) Convert to use OF bindings
Reply-To: sashiko-reviews@lists.linux.dev
To: "Svyatoslav Ryhel" <clamor95@gmail.com>
Cc: robh@kernel.org, conor+dt@kernel.org, linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260721095935.439174-3-clamor95@gmail.com>
References: <20260721095935.439174-1-clamor95@gmail.com>
 <20260721095935.439174-3-clamor95@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 21 Jul 2026 10:05:16 +0000
Message-Id: <20260721100516.762101F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

> From: Jonas Schw=C3=B6bel <jonasschwoebel@yahoo.de>
>=20
> Add OF match compatible table to be able to use this driver with Device
> Trees.
>=20
> Signed-off-by: Jonas Schw=C3=B6bel <jonasschwoebel@yahoo.de>
> Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260721095935.4391=
74-1-clamor95@gmail.com?part=3D2

