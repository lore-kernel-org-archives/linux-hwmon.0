Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792552152;
	b=EclWurPV0gbRZgfF5lseeZ1CnofyY5CJjQpIFx8gguL77FiSs3qRpDB9WvN/ZoHU2yMO
	 umUlpwaLMMy17E4to9dTFDD64KKk3pHkk8FL2ZgiVBW8N/XSQy1WesVzopM9UmyniJr9s
	 7y4q58IwED61E44znK8/GRebBU/atNcTOmFwL0qQR6mnylwW3Sz43p9PDWJT8cvxMFo+G
	 lgQKJiFB/568hqLl+RCo029nLOcQBAO5xiKul9d+enYSzuQaNAOVtLY87jASMZZ095M2Q
	 mRxOaffYK1OwewCfd0pcPYG2X3KkqzQC/6siLWBu+XOba6wv5dwJbEgPyfy6ENHOCng==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792552152;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=ddxx+7YTLUe4HClEE1WV1tPGcgtkyEv1jFD32PchXSc=;
	b=sglcC5rwZbbn065z8ZfZVr2i7Mw6wBEIOmQX+koC2EUd7daWcPA6CkGtDYrOgC7bzWTw
	 XGGIkXYzBaLsFO6bDzqu5BZvkF2WHnb1Szi/d4xjMwOcRIj8H+YKisTu7kqf6Za09T0Sr
	 qoPDOm1HPEywP7fTugsF+TbRvaiA8x1fLkm094aMdNFXdNMd769MB2btwlUS1AneuXvJX
	 U2Sh+tcNYy/vu5xXMS02wKjgjjj/VBb4j5VB6L4DB3DPwCpUHc73Y0Kgkm0Yut3cdn4QB
	 WJBg8i2Kx7i78AZtAlDYN9gNeNccjbGAh8SKhj40PI+GGmf14DXYmb3IEk8ahgJXrIw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=iOepge2F;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2BC97606A31A
	for <linux-hwmon@vger.kernel.org>; Wed, 21 Oct 2026 03:09:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=iOepge2F
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D73F51F000C9;
	Wed, 21 Oct 2026 03:09:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792552152;
	bh=ddxx+7YTLUe4HClEE1WV1tPGcgtkyEv1jFD32PchXSc=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=iOepge2FsJCEG0A1VsCPx/SnO3q7vnzw6gznzLY9o1iKWCmQSsPoj6LZjpPMgvije
	 QADwuOdsMID67PbRuIXny7efv8/p84JjKZ5e9Kf7RDXVqgob/7jSsBcrWMOXIN1/qI
	 kQOd4m9eMYZElCJ6dXBQMJLAvxXGjqYbo3seOt0MKisffLJRpwQ7kxd0ANYVbIpVFX
	 vHx5XeInU72dKPxAKlixeGL5+k96DKIGne6BhJsqgqVvALt7xFJGScZcsHlCkwddEV
	 t28yq+GuQfflTEyMYA/L2cL3sVPL2Rqx1kEwhFADRpkp/qJBAVspA0gv5sSYMyZPai
	 FdfseNUDYk4OQ==
Message-ID: <sashiko-outbox-179743@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 3/4] hwmon: (pmbus_core) Support relative encoding of
 vout related commands
Reply-To: sashiko-reviews@lists.linux.dev
To: "Abdurrahman Hussain" <abdurrahman@nexthop.ai>
Cc: linux-hwmon@vger.kernel.org
In-Reply-To: <20261020-hwmon-pmbus-fs1412-v4-3-27ece4e43d04@nexthop.ai>
References: <20261020-hwmon-pmbus-fs1412-v4-0-27ece4e43d04@nexthop.ai>
 <20261020-hwmon-pmbus-fs1412-v4-3-27ece4e43d04@nexthop.ai>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 21 Oct 2026 03:09:11 +0000
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Post: <mailto:linux-hwmon@vger.kernel.org>
List-Help: <mailto:linux-hwmon+help@vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-hwmon+owner@vger.kernel.org>
Precedence: list

> From: Lars Petter Mostad <lars.petter.mostad@appear.net>
>=20
> PMBus 1.3 allows for relative encoding of voltages in certain output
> voltage related commands. These commands are encoded relative to
> VOUT_COMMAND. Support this when encoding/decoding commands.
>=20
> Signed-off-by: Lars Petter Mostad <lars.petter.mostad@appear.net>
> [abdurrahman: rebased; check VOUT_MODE for 0xff before testing the
>  relative bit; use signed division and clamp the user value before
>  scaling; reject a VOUT_COMMAND that decodes to 0 or less, or above
>  INT_MAX mV, at probe and from the regulator, and scale the relative
>  limits by it without overflowing s64; update the cached VOUT_COMMAND
>  only after a successful write; decode the regulator margins with the
>  register they were read from, and in relative mode bound the output
>  voltage only by MFR_VOUT_MIN/MAX, since VOUT_MARGIN_LOW/HIGH move with
>  VOUT_COMMAND]
> Signed-off-by: Abdurrahman Hussain <abdurrahman@nexthop.ai>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261020-hwmon-pmbu=
s-fs1412-v4-0-27ece4e43d04@nexthop.ai?part=3D3

