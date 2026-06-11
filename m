Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64FE5376BE8;
	Thu, 11 Jun 2026 10:05:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781172341; cv=none; b=EWoeXngTzF9aMjFmR+kR24PgT6ZpcPUkHmODGrkM7+kMoZOpbvxAZoxyN4i2/O+P+tpRwXU+0YOZovZ7yA2tB+HFkmWJrjlAf0DSc5Se+W79AScJDoCasbxy3+SZQMdq7SfCUYUfvX7YpkluEtQ+cMTM1xJaOJTwMNk0+6fKZjY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781172341; c=relaxed/simple;
	bh=shBVR2O8tMAzYFlKoZzwzpSxM4TpvdNMpAg6wuq0uLM=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=D0B95nyhvClQ15jbpWlvCdUgnuiu+ZgW2kIcO7EgRmMOZCpm+i8eA+iCDkCTLWmk6FjqSMZMEkGL46h+korZkVUjTer/zzxHz/8JbztcB2DdNVoy5stUtdYcD+o8CnSe5/qLhL80OtKPLlc6DS9/M0OsQl/WTy9I7l4SDz8A/L0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=g4sss3Su; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="g4sss3Su"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B40031F00893;
	Thu, 11 Jun 2026 10:05:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781172340;
	bh=shBVR2O8tMAzYFlKoZzwzpSxM4TpvdNMpAg6wuq0uLM=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=g4sss3SuZskN7DdvVKwex693MkEP1vq3CrpogGtFdziYZbt2OJFZLWBSWgWhk3Er5
	 9YYBlPk4RcldHlpRjwLI1Fyp0r4xqZEuH9N/aQ1LwuxzeWIu8OfSpyELaH5QvyYwG7
	 +uyp7/ffgTRKrkq6cf/B6uvB6LzCqwsjU33QrsmgKaujJvx9wdRwLstLXypKz/8CV9
	 Jj5BxdSwZtvQatSjtDSRdD7Ww9X5GnDl9kPcrjlfZTq6FqyxH1dGt7VeRlnoCSKtWa
	 qIiUNnc9ATmBRP7Pnatq/6MMR2inGaJPkAX1fFpJ6Mfxu2rfNRXWH7KzGpVygZZeW7
	 V/CE47H9Qf9Lg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 1/2] dt-bindings: hwmon: pmbus: ti,lm25066: add current
 limit properties
Reply-To: sashiko-reviews@lists.linux.dev
To: "Potin Lai" <potin.lai.pt@gmail.com>
Cc: linux-hwmon@vger.kernel.org, conor+dt@kernel.org, robh@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260611-lm25066-cl-config-v1-1-02e567bf3d91@gmail.com>
References: <20260611-lm25066-cl-config-v1-1-02e567bf3d91@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 11 Jun 2026 10:05:39 +0000
Message-Id: <20260611100539.B40031F00893@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

> Add mutually exclusive 'ti,cl-smbus-high' and 'ti,cl-smbus-low' boolean
> properties to configure the device's Current Limit (CL) behavior using
> SMBus settings instead of physical pins.
>=20
> Signed-off-by: Potin Lai <potin.lai.pt@gmail.com>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260611-lm25066-cl=
-config-v1-0-02e567bf3d91@gmail.com?part=3D1

