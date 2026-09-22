Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C5593B7B7F;
	Tue, 22 Sep 2026 17:04:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790096651; cv=none; b=FO02kwCbVHJ3FAHSskb/CZ+lc2Y3SzU0zre2ePF/xsA4nrYXwX84linjBfU26yIHA/ZJGoEjMESil69bmTNhDKyIxsOOuACydHNYuQsO8rVe8VlUgED9OUa8bQKfhKuIBTVVp7fP5dw05XAO/7ArtLGKecOEcVED+6WvEEnQvMc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790096651; c=relaxed/simple;
	bh=mntoBo1IvmIWBXBmbCTQ3MqCjRb8vaD3DnXCe4gw5r4=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=T86oa1yjAM+EjuAZQTqFPfAhDzuvzYF6VbfABJdUXqGhXsDhBZJnHroGd3UbJBzSjFA0MKICNBR8AWTDbPYevaZm1I16UhxN5wv6w6ZfTCyrpy2z7cw/kIDDZR/To2eAbmNdjm+vsEwv+apSSxJfkKnVpfbQ9XDfhIFkTj1QUtQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Acm7e69C; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Acm7e69C"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D43F11F000FF;
	Tue, 22 Sep 2026 17:04:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790096650;
	bh=mntoBo1IvmIWBXBmbCTQ3MqCjRb8vaD3DnXCe4gw5r4=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Acm7e69CBJz7wmArOH317OhATnzQ4NOD9bKbVoAF8XJ0jplOoS77ljaOURgdAgSWh
	 EmJUNuBsUkzR/f5dugE8u5X2rXUEGcPLwbZ1jYNdUOqbzyRzGZf46RfgfxQduaB4+L
	 FGJHx4eHkQzBUanvxOcA9y2vVZpLSUClG6yWpo3NGkvB3wDBK0SAl3GgSBiaFuzeGh
	 tBgw/3uGLgBZpMz9k4TdHVFuHT05IEJtcVP/GumIe23WtIc7h2J1aTMfd4TC0ZJcON
	 kiPMLHIJrLZS6wuO6kAYauN4gVCgpKhpX0N3yRgR7Xvti47PzQ1MErkYbNcKlhpvSK
	 BLy0dyLrWfuBQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 1/3] dt-bindings: embedded-controller: add Lenovo
 Yoga Slim 7x Gen 11 EC
Reply-To: sashiko-reviews@lists.linux.dev
To: "Oleg Keri" <okerixx@gmail.com>
Cc: devicetree@vger.kernel.org, linux-hwmon@vger.kernel.org, conor+dt@kernel.org, robh@kernel.org
In-Reply-To: <20260922165737.260443-2-okerixx@gmail.com>
References: <20260922165737.260443-1-okerixx@gmail.com>
 <20260922165737.260443-2-okerixx@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 22 Sep 2026 17:04:09 +0000
Message-Id: <20260922170409.D43F11F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

> Document the Compal embedded controller found on the Lenovo Yoga Slim 7x
> Gen 11, a Qualcomm Snapdragon X2 Elite (glymur) laptop. It sits on I2C at
> address 0x70 and is distinct from the Qualcomm reference EC that the
> reference designs place at 0x76.
>=20
> Signed-off-by: Oleg Keri <okerixx@gmail.com>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260922165737.2604=
43-1-okerixx@gmail.com?part=3D1

