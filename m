Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA4A7568FB0
	for <linux-hwmon@vger.kernel.org>; Wed, 14 Oct 2026 18:22:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792002154; cv=none; b=m6XwdI461bT750CVk/5GUPZ8NKBPi+JHvKMR79uWDmoCbF4ygOwY30/tbnt0OkxncKE+xSeRYROY2VPGHWl7MUTayjHP65810fZzv1njFlLCW2oOAPmUaxqt64F5iSSdiCeCOV7uS1hlux+ncBKc6vaXW9oG32+BJ6F9LKd3exs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792002154; c=relaxed/simple;
	bh=fKsqm2zWgO9L0tLso+p7n6vFXdsa0j84JTMIFvMEJ/g=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date; b=T0yTu0xsZohV4I3OEvtqUFhqntFq3GO4hDFigC/qpFaRhnIhm0g3qEz3Lf3WahTfO0CwTC1Cr/CYOOqCCeqmkgTJ6Yb4Hv3O5bqp7pkh4l0GjW5SoFfIcsYbU/GyMMYBOO416QV6jnPPFhiy0lSn+49+milDWDArL1QbSeVI+Pc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=GNP0hV3S; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="GNP0hV3S"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 016641F000C4;
	Wed, 14 Oct 2026 18:22:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792002152;
	bh=fKsqm2zWgO9L0tLso+p7n6vFXdsa0j84JTMIFvMEJ/g=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=GNP0hV3STa5jdMaeJxj6F84Nwvi9PqUwpmlqRh6CeXP2BYbhAi2ZCpxPNnA9UGQcD
	 LJIvCcoThW1XzeB3RzsLff+kIeMtwCKD+g9E15/LtaLBm0WpYK3V1mqULLpZh9ZqZ7
	 3lgnerPVti54vNlVs83bhqvKsVl4Zph3kNbz7zA6v77MyQ+uzwAGNyFhNENIhjEwMj
	 LRgcOFKkza9pAExWzirXuvrY0KJuEeO2265af0lg9z+iIFJniVi9Xad9XmpEpWh+fr
	 4xszxAWecHFOYP5lt6SV9TSgMc8+9ghpBZ0YGuY6DpLnLrQ/YIXjG6fdkrV/QBuA9h
	 i7whh/tC1cMRg==
Message-ID: <sashiko-outbox-171691@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 05/11] hwmon: chipcap2: fix IRQ teardown ordering
Reply-To: sashiko-reviews@lists.linux.dev
To: "Javier Carrasco" <javier.carrasco.cruz@gmail.com>
Cc: linux-hwmon@vger.kernel.org
In-Reply-To: <20261014-chipcap2_locks-v3-5-27ebfc2c5b9e@gmail.com>
References: <20261014-chipcap2_locks-v3-0-27ebfc2c5b9e@gmail.com>
 <20261014-chipcap2_locks-v3-5-27ebfc2c5b9e@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 14 Oct 2026 18:22:31 +0000
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

> The threaded IRQs are currently requested before the hwmon device
> is registered. Since devres releases resources in reverse order,
> the hwmon device is unregistered before the IRQs are freed during
> driver teardown. An IRQ may therefore still run after the hwmon
> device has been released and access the stale data->hwmon pointer.
>=20
> Separate IRQ discovery from IRQ registration so that the IRQ numbers
> and alarm visibility flags are initialized before registering the
> hwmon device while the IRQs are released before the hwmon device
> during devres cleanup.
>=20
> Fixes: 3af350929e75 ("hwmon: Add support for Amphenol ChipCap 2")
> Cc: stable@vger.kernel.org
> Signed-off-by: Javier Carrasco <javier.carrasco.cruz@gmail.com>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261014-chipcap2_l=
ocks-v3-0-27ebfc2c5b9e@gmail.com?part=3D5

