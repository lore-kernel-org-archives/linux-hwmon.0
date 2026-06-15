Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8980915A864;
	Mon, 15 Jun 2026 09:59:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781517551; cv=none; b=fGzx5JNEiiIAvqvJzh9TxyH7QSixZLMxR11NhY0jLC87aS1/qHkbARNxGytbOeKl5Lpm/gPN3b+jfhnQXGGiDOPpZihEXXn2OHyXZyI31ngVpcQRLRjXEFpUVrEkio9vv4nILqL+yBJYIxC0eYHvzdyudotKxqvAOVUz0DeU0CI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781517551; c=relaxed/simple;
	bh=xt8Di0C0MGzqfu3FwUA/RjdqvJN8vxF0IyotThonaJ8=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=dbhx3Aste3N+MhtrM8mtjrva3KZLADVj3bfgZqIdWmiYvt4cbbpi4hPlAbbtFHfNWXAnlEDqPPY2qjje6gl5+muP37q8XJHJ93F+yGmS45h8iyDMR6lzzIPvLm2ZbyIf1zFioei5vpWZXg1QlnqDmXSM4cYQ/6+ntu+ZJJUJNaE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=d5/lLiJb; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="d5/lLiJb"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EC4211F000E9;
	Mon, 15 Jun 2026 09:59:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781517550;
	bh=xt8Di0C0MGzqfu3FwUA/RjdqvJN8vxF0IyotThonaJ8=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=d5/lLiJbBJSyH3xaZQEltoOlZx5WIKaWsDvmL7dPM2XouBWqxbdF1hem4t9KWPeVQ
	 zj/zgHrp3mDcnhJQk26QMShQDcNW+gT9q3OnycGBnnJqeoAGR2OQmJ8zyEjA+o0Mxu
	 rsco3KG7YnPFudNT1BTG9nxGoWJ0u8AbowIjyw5/HyhVJrM0/UtCgmowR1RqFbvzIa
	 0Ljw53jSzyIROS1MwyoYtkuGoOE7w4+FcD5dyWFuEyIjuz+o3Q3V9r5FoGW51YDwHy
	 76rQZM3Y9Hg23HxW8KdTvrZtncPllp97WLjbvNGy6n3tEmR7LcnC+xEEu5oqAkJs4W
	 t+IgRRq3JASXQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 1/2] dt-bindings: hwmon: pmbus: ti,lm25066: add
 current limit properties
Reply-To: sashiko-reviews@lists.linux.dev
To: "Potin Lai" <potin.lai.pt@gmail.com>
Cc: linux-hwmon@vger.kernel.org, robh@kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org
In-Reply-To: <20260615-lm25066-cl-config-v3-1-decb4f5b0b77@gmail.com>
References: <20260615-lm25066-cl-config-v3-1-decb4f5b0b77@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 15 Jun 2026 09:59:09 +0000
Message-Id: <20260615095909.EC4211F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

> Add a 'ti,current-range' string property to configure the device's Current
> Limit (CL) behavior to "high" or "low" via the register, overriding the
> physical CL pin setting.
>=20
> This configuration is supported on LM25066, LM5064, LM5066, and LM5066i.
> LM25056 is excluded because it does not support configuring the current
> limit via the DEVICE_SETUP register (bit 2 of DEVICE_SETUP is reserved).
>=20
> The values "low" and "high" map to the respective low/high threshold
> voltages of the chips:
> - LM25066: low =3D 25 mV, high =3D 46 mV
> - LM5064, LM5066, LM5066i: low =3D 26 mV, high =3D 50 mV
>=20
> Signed-off-by: Potin Lai <potin.lai.pt@gmail.com>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260615-lm25066-cl=
-config-v3-0-decb4f5b0b77@gmail.com?part=3D1

