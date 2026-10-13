Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BFCDE5013B0
	for <linux-hwmon@vger.kernel.org>; Tue, 13 Oct 2026 13:03:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791896594; cv=none; b=QwP0TCtyG4rJj5f+RF3pS8sB2+lVTRjDTm44bv5LWjv2/kRLX9pX3eCxMgQfBz3mYolTy+cL4kFwa6SpI53LtI5uBdT9Psnf5VNAMqYVy53Zpt1Xk8GJa5QCBCokYCO4wsXgVOWCBRuObWJfY1hcaN3/MWrLLmjzGzIP33Np2TE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791896594; c=relaxed/simple;
	bh=08X+A+aTfJlnWIYOJAjGNjKjrxGnuHJUUJJYGx2gA7A=;
	h=Message-ID:From:Subject:To:In-Reply-To:References:Content-Type:
	 Date; b=ebS3KKNC8DQEKgdIAFDhgVnELLvPP/i7qPR7lULcloMDQPZlT6d+I9XxtssTFklEMG+PJldgCbksSb9d8qMX+tGj74TIzLf/+hG0h+d2DD+z6PM8kHr5Iu0KtfCwjmCHArnrjFAKNfFpVNI/T/Xdlj7P9C1LQ9/uj4I7lp4Xu0Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=MetAKyiS; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="MetAKyiS"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 36F731F000FF;
	Tue, 13 Oct 2026 13:03:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791896593;
	bh=08X+A+aTfJlnWIYOJAjGNjKjrxGnuHJUUJJYGx2gA7A=;
	h=From:Subject:Reply-To:To:In-Reply-To:References:Date;
	b=MetAKyiSYLNp6KpacD1lijHGyGbLJKbap9/vZ3QBrtKJ36Hhyuo6L8Qf7dOpVuQDn
	 /vrxAqDhZSXBSmJXdc3aLmcRE/8nmmrFPsOWgBHDs4NHpYmd3sj8RVweS8CkUGdfva
	 6eGmCofmEUuG0ycJVRSl5JJGcjusZ+EgIjOUkv/F2OOw3lbA3pd3rdAg+5U7qBq0Ra
	 L5HtCp3Kxiqo0P7i5EjG9L4hQt4Zw9KLqIV0SbFkqUSAsudpVkdUfBTszeL4/rY+An
	 gu0dbwCe8RX0GwvCgB0R/UZdhW95CyW4E6JHPe0VA4dX3R6e4fotQ9OrMdpiz2XN2D
	 W99rMSZ23GSZg==
Message-ID: <sashiko-outbox-169769@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 1/6] dt-bindings: hwmon: sparx5: add LAN969x fan
 controller
Reply-To: sashiko-reviews@lists.linux.dev
To: "Robert Marko" <robert.marko@sartura.hr>, linux-hwmon@vger.kernel.org
In-Reply-To: <20261013125735.1542349-1-robert.marko@sartura.hr>
References: <20261013125735.1542349-1-robert.marko@sartura.hr>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 13 Oct 2026 13:03:12 +0000
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

> LAN969x integrates a PWM fan controller with a tachometer input in
> addition to the Sparx5-compatible temperature sensor. Add a LAN969x
> hardware-monitor compatible and describe the second register region.
>=20
> Describe the fan as a child node using a two-cell PWM specifier for the
> period and standard polarity flags. The child also carries the optional
> tachometer pulses-per-revolution and thermal cooling properties.
>=20
> Keep the existing microchip,lan9691-temp compatible for device tree ABI
> compatibility.
>=20
> Signed-off-by: Robert Marko <robert.marko@sartura.hr>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261013125735.1542=
349-1-robert.marko@sartura.hr?part=3D1

