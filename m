Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794678298;
	b=1uEtkKuHbxk74uvsGR8caPG4+tmttO/mB+EU6FwgPRQTIyADhUj45m9025OSS5V5bImM
	 VRjm/lF7wj+7frxo3MEO1ehVQQ/aqwqBv7FSxSGjEKPCByEu0CD2n1G0KN8wsex9zcsIh
	 5wVDiq+bk7Z8wIaAmYkTla/26m3f1Kzr4vpql+YMYPLzBn1hRn3Sa8MkEOuoIl/1PqRYR
	 lH7zaOg6HRNjwk+ggfMOt6wNGPw4Fu9b5yxtj04bZ/LkLuJX8jsd/G2mR1qpU1hTw6jyE
	 HBp6aNydeAe1oDUsc6CC3Kfcqn+zTDiGSmkoWydKPQZJrpE3AgKTLJGeUlZDNGtKFDg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794678298;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=qXp31bazNP4y32g83J5KzrKVIrwqh2bDdCM2dbOJXvE=;
	b=rWWhJnAK2a/R7g+zOV6jN0IBOIMPtrOJRXAIXeYToBJnkJNHkhp2fQKNMzee5cAG0oZ9
	 32DbYV4XFNKtz7XKw37+aLE9kua6QH17olnjyd2RQzXjBXcZMxLaulL3XeU2AUsKB/s5w
	 Iw6ogEqfizl/doIJ0DFox9D9FGjX4sBJh8ueXvqvECSXWbmQBqL3Oeou24yD1SL+6XtwD
	 M7/nb83swa95G8+B4A2IV7RhOIw5UQXdTnjNeeaOws+juHHZGIUCTT1EKtz+BrpOTkV82
	 D7+7EthSAr9nDXFKfUh1TJ+xV7C0J6qJB+BtrrUo5TjhLAAFsZb1crQ4v+Cg++p+bCw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="Pt1Sgne/";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA49B606A32E
	for <linux-hwmon@vger.kernel.org>; Sat, 14 Nov 2026 17:44:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Pt1Sgne/
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5620F1F000C4;
	Sat, 14 Nov 2026 17:44:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794678297;
	bh=qXp31bazNP4y32g83J5KzrKVIrwqh2bDdCM2dbOJXvE=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Pt1Sgne/4K7bYohwkgF0MviZ8+Iiuuoj0x9NZ/12EOzWh9pHaON+dExvMPtR6HW7h
	 r+YRn2O+AJLvq8RSRKMHPFF4lodS/rfZwQBuztPIT1XrU+ZsoY6AiWfH8iXO8bAEU4
	 coDudC1cZ3X7b7tuA8F37+QcO5k/nIC0Tza9KJCTM7+bRBrgh1aetbAMhzBOBEJ1fi
	 +dEeO1l10GaSebcLGkHFwDD+cwlZW9oYBOAJItca7cs4UqDSHB7wrtzbmmyoaOfJjN
	 ttHBa0CIGB8k3jQnPYlw85n/QmknMM+fE1pVCRNDv2KjJWxn1N6RrAIRxt689c+fOR
	 ruYWeDGVyHfYg==
Message-ID: <sashiko-outbox-214852@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 4/7] alpha: marvel: register a platform device for the
 environmental sensors
Reply-To: sashiko-reviews@lists.linux.dev
To: "Matt Turner" <mattst88@gmail.com>
Cc: linux-hwmon@vger.kernel.org
In-Reply-To: <20261114-marvel-env-v1-4-890328e4b7e5@gmail.com>
References: <20261114-marvel-env-v1-0-890328e4b7e5@gmail.com>
 <20261114-marvel-env-v1-4-890328e4b7e5@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 14 Nov 2026 17:44:56 +0000
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
> Assisted-by: Claude:claude-opus-5-5
> Signed-off-by: Matt Turner <mattst88@gmail.com>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261114-marvel-env=
-v1-0-890328e4b7e5@gmail.com?part=3D4

