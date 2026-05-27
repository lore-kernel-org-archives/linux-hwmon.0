Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B6D5401497
	for <linux-hwmon@vger.kernel.org>; Wed, 27 May 2026 15:26:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779895566; cv=none; b=m+iv6034HGxVYnRhPYy6nc6A03cp2mzNDQQGx1+AqhnLBdaJeTgO7hbzJtHVqMj0vAN1HHO1o9w3ggyAzf7Qlf3RNQX/PQlUfaOTfWqP50LBbiuCJ/zukB4vbBKK5ukSlleUDSSAZiZ/TNdSRpyVmd0JwgD8B2deRkMESkUM1dM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779895566; c=relaxed/simple;
	bh=gUrHKoT49iWJYQ/Im6+4orVRiIF4pb+IMyDE5gj5KfQ=;
	h=From:Subject:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=KMBq47W0WnMpNFS+0nyEUnhFcVqiYdUMBqQACyAl1/2xrb04G13C/61jydbhwSpuAK197O5mGeqOaCS0UhdnK1ce7PZeYCpkvblMKqAeR5davEY5smu5kziVMXk+cb2x+yAvi8h+bfXNGhziNzH6qIkYgoMweCmY3R++RfGW1hQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KsPItdzY; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KsPItdzY"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7CCA71F000E9
	for <linux-hwmon@vger.kernel.org>; Wed, 27 May 2026 15:26:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779895563;
	bh=gUrHKoT49iWJYQ/Im6+4orVRiIF4pb+IMyDE5gj5KfQ=;
	h=From:Subject:Reply-To:Cc:In-Reply-To:References:Date;
	b=KsPItdzYxRxaZsE5CPtnqWoDuFZFX0lIrBJ0MevhnlB0U1qK7Cfu1KqGM4dis7W1F
	 72Rb33K9WFeCC5hmma83mIFxgqnWx+JCzPlfmQjzMCIXqDU1aIZJ1weya3f/aomxv/
	 njfPV6qDRKVLinaCZkiSJu8v3YgEgMGF7yqE1jt7hKdqopDfM69xgWsz/yK0vkzElP
	 6Y4y00cwzxn16u8gAbjBScygNfP8EL2tbp6Pqh0S5LCfP9n+a9LQ3sPhLNqklKsHlu
	 89v4NUDXCUcZrW0POcax5xZz/G6fdsUIvAUHG6NKmzxSMmUvuDYlbO8ity4kyRlF9S
	 etbjSo9/G6Y2w==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v1 1/2] hwmon: cros_ec: Drop unused assignment of
 platform_device_id driver data
Reply-To: sashiko-reviews@lists.linux.dev
Cc: linux-hwmon@vger.kernel.org
In-Reply-To: <972c9998054c7944f63266819d6fb08b36edb5c5.1779894738.git.u.kleine-koenig@baylibre.com>
References: <972c9998054c7944f63266819d6fb08b36edb5c5.1779894738.git.u.kleine-koenig@baylibre.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 27 May 2026 15:26:02 +0000
Message-Id: <20260527152603.7CCA71F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

> The driver explicitly set the .driver_data member of struct
> platform_device_id to zero without relying on that value. Drop this
> unused assignments.
>=20
> While touching this array unify spacing and use named initializers for
> .name.
>=20
> Signed-off-by: Uwe Kleine-K=C3=B6nig (The Capable Hub) <u.kleine-koenig@b=
aylibre.com>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/cover.1779894738.gi=
t.u.kleine-koenig@baylibre.com?part=3D1

