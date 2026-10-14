Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 462F3559CB5
	for <linux-hwmon@vger.kernel.org>; Wed, 14 Oct 2026 18:35:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792002924; cv=none; b=kp1tuGEH1VIQcXeqXMs9TuMZ95+rm240XRfseqIgUdqnhMUDNnSJ/cUA7zsB/Yvhde/wwtyJiU3+tYE8VRQPNyGPAMj+hzovoC3QvEqjcHH6dEegDkaQsg8ICN+fFR6s3xQBnL66G8KAw0w7bs3S9AB7PFUvRIS+yLVNbB2qB/E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792002924; c=relaxed/simple;
	bh=BBC8q9mToDWe1hCTY2B0ewKlP9H3ubsmvL7o8NdJb5s=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date; b=d4Hebeh0h1lBBJwEq9kf6NIFLxfbNOdJxr3XY3jIoNGw1A7j7OZrjbxLVGt72N0e6FnQPhZgdJG+sRt3eWA19iwhMON7U6OMrpJblL21mkSfzHYzIIbm/EiZX3oZ/JOR6rNBnkPQT7N2HRCVBxnVHF9RFc0iSNLgEp4Hi7NdDxw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=h0GxRmZM; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="h0GxRmZM"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 94B1D1F000C4;
	Wed, 14 Oct 2026 18:35:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792002921;
	bh=BBC8q9mToDWe1hCTY2B0ewKlP9H3ubsmvL7o8NdJb5s=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=h0GxRmZMPhpzDnDcwvQwLcjZHpvG9rGnxEhltFUHBNQjD4MiSs10n3rxQSMWtHHak
	 Pb7QkLLans7kQcwSDzwmasZIbJj54SkWHzzC2bjd/ER0gqLTupLtFCNsYE3wkTUlkx
	 BGvMOTpYe2/BRN1wr2bvCSY7KF8FAfTqkw4U3zTstR3OtRj2B5597iByiusPnKnOBK
	 1fsf3+hdp0DKwH24wHK/MZyKv7mrrAv0hB/0CLmmfKf0XZ61hgbT60ydK41UclPnaS
	 dWHFMmzzIBoDhyJWkqmWfGgmeui/0lCdJvBg0X6nNy3XAa/8bT7g2hOweWAno7XXYg
	 Mmw2PcFe2mQyA==
Message-ID: <sashiko-outbox-171711@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 10/11] hwmon: chipcap2: serialize access to the alarm
 indicators
Reply-To: sashiko-reviews@lists.linux.dev
To: "Javier Carrasco" <javier.carrasco.cruz@gmail.com>
Cc: linux-hwmon@vger.kernel.org
In-Reply-To: <20261014-chipcap2_locks-v3-10-27ebfc2c5b9e@gmail.com>
References: <20261014-chipcap2_locks-v3-0-27ebfc2c5b9e@gmail.com>
 <20261014-chipcap2_locks-v3-10-27ebfc2c5b9e@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 14 Oct 2026 18:35:21 +0000
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

> low_alarm and high_alarm are accessed from the threaded interrupt
> handlers and from sysfs without any locking, which can lead to lost
> alarms.
>=20
> Add a mutex to serialize the access to the alarm indicators and to
> process_irqs, which the handlers use to decide whether an interrupt
> belongs to an ongoing operation.
>=20
> Fixes: 3af350929e75 ("hwmon: Add support for Amphenol ChipCap 2")
> Cc: stable@vger.kernel.org
> Signed-off-by: Javier Carrasco <javier.carrasco.cruz@gmail.com>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261014-chipcap2_l=
ocks-v3-0-27ebfc2c5b9e@gmail.com?part=3D10

