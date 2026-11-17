Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794939491;
	b=NYrO3EJ2avEgKwxn4lVCsSmUvNLAf/JeoSI9PBARwP/vMidyMQ37S4MzQhPptFGbvl4T
	 vZTsuLM4Ofvg8vwjrj4h9uj0Wdt8rvyMverkBSDpA72HOdra2qJoDuWDsvS009ClHT+ll
	 rW8pwzsjtGpIcyeGI9TlHozYiryjBAsC/duyloUyh8qADF3D6ltyAM4i++KlXvVMsx58q
	 7g+8vB+xJBl6wSzj0dHTtAIpym58j2Ag/OUYYqPEKENVZ0zXsAVJOi7oEmvp4GPL6KgfV
	 JoXjnmC1P9JJiTaKKCMvlSzXHga/O4PGrAek7KxaKJDpkCplDTCiIWZEgMueDzhI9mA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794939491;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=WSC9Y8q4dS4w4pkVMLwRTiJYfOin0fU1gGKgf0Fs4P4=;
	b=WFedkNfNgQg7L4DswPCNFjc2/sRfucXZyN7lGOJFPPNefi4Sb6bVKcpr5/k+/mdDufKE
	 5OIf1Sv4IUPadpTvhDsF4RZlqX4yw+R6E6er7Ziu8srjBiSG/KCog4dnY69iPocRjOtX7
	 lyS8FQXoNbUD9gYWnzqcJ7SKis+Pl3OtB6OqKhf7z2yYNQabAqHh906JjlkRx9kHRlrMh
	 z1L2GF6XUwkHZE9xkg1H2XVWKQKZHvZxAW7t8xLNjzurNepHavSL0Ou5qa9/Jy28YBVc/
	 CCrSUwW9LDJy3lYydqLhpzuFkzu6ALr2O3eFye2cAKSGjXGBw/Y+I5q3X6vYbkRvRIA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=TpAeF1vQ;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E12C5606A31C
	for <linux-hwmon@vger.kernel.org>; Tue, 17 Nov 2026 18:18:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=TpAeF1vQ
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 964A61F000C4;
	Tue, 17 Nov 2026 18:18:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794939490;
	bh=WSC9Y8q4dS4w4pkVMLwRTiJYfOin0fU1gGKgf0Fs4P4=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=TpAeF1vQLknR6J7p3gzqQxRiQdCTxlVeYuJ4oaxA7V7XuoQIRUo1EM1doNxrYBb37
	 BqtzEz/qAdaqloC5oBBEdcsuGoNzrGqFzVJLQ2vBkZ9eF873YEepa/YKkxlLSf+OGe
	 H681twE8RgZ2GAVw94h0abRi1lEKCZgLa/MdIrv4ZWZ2gZfP8osqSGK7XjwhH/QgXD
	 kAnaE1uqlYjMv5mD/PAx3xLXRCACgzkLpU7+zddik+J6/hQRN43EcVXCJIOb2C/iDV
	 Mle8Y48TPzoGc3FFRJd8qwcPACGgiIS9INu8Uuq6Py2PwnvYATMmRuMrQJ4f16p3GY
	 79U3mp5rDRRIQ==
Message-ID: <sashiko-outbox-219327@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 5/7] alpha: marvel: register a platform device for
 the environmental sensors
Reply-To: sashiko-reviews@lists.linux.dev
To: "Matt Turner" <mattst88@gmail.com>
Cc: linux-hwmon@vger.kernel.org
In-Reply-To: <20261117-marvel-env-v3-5-0edc370fdca9@gmail.com>
References: <20261117-marvel-env-v3-0-0edc370fdca9@gmail.com>
 <20261117-marvel-env-v3-5-0edc370fdca9@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 17 Nov 2026 18:18:10 +0000
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Post: <mailto:linux-hwmon@vger.kernel.org>
List-Help: <mailto:linux-hwmon+help@vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-hwmon+owner@vger.kernel.org>
Precedence: list

> Register a "marvel_env" platform device on Marvel systems booted from
> SRM, for the hwmon driver to bind to.
>=20
> Reviewed-by: Magnus Lindholm <linmag7@gmail.com>
> Signed-off-by: Matt Turner <mattst88@gmail.com>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261117-marvel-env=
-v3-0-0edc370fdca9@gmail.com?part=3D5

