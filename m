Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C77053F58F7;
	Fri, 28 Aug 2026 09:57:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787911033; cv=none; b=e6j+OklMS0HNtxZs323Ds94yZ7kV+k8TNTUc6YDtyfTJHQUgX4aAUd6fdceZEtyYK80gFFizHHGFwPOqC/Oynfjzy+vnxGyEOqsV+cjKM6bz17yNnG0H7suvbF0sgYc47YKx7x82yomIh+SZUQ+EscYp6uvQ6ULFOk+xq2mBri0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787911033; c=relaxed/simple;
	bh=dVawVxsWE/YyBvRTCALCLmhzNr/B5sfgbaSRso6ZnXk=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=pceoMFK/VhVzE9oKcYHTCYOEuspt2vL+9/LD2LiDf131G/84QN1agR82cYBphfnEu+rloPAApvQ7XNxKosuVAj2ODhvYh+M2Z4e6D3qwVEY1lYqH+OCeFdVMUnQhkPKvpH2zPlShu/5exGMTk3LY6UP9dfdDfYwRZtEgPDQPi+8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=TBpfnNpg; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="TBpfnNpg"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 275731F000E9;
	Fri, 28 Aug 2026 09:57:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787911031;
	bh=RdJSn4nZRtXQLWjEcaSi12gMfi6HUMw6l++ZsQe2/VM=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=TBpfnNpgamGvIPuq4uOzgUMPSNL2VMhULw+264GaI0uLL2WANb9eJersxrat53/uB
	 HmHPRhQoWrZSgmV6HFr5AQ479HMdVEq6E2KoRvetqlnQR9i9LuUBx6f7MaetvYjTPW
	 Yreuk15WGpb5W45yljRoHJgCUwHpTZXx4KkWl/0R/+knDu2+9O5a8NZMFVLWwtc1ir
	 vQKfT+xdfdB7EusiYBWNlbAA7cFQOkOK8JyDUHaDWXGPOb4i3DtXOF9AxOUGLqX2zM
	 a6qN3AVNydPVrhFiCupRDmidfyBlwrOREd5uBG8Yfa3YCJ+1fysVo/w8S+k/cEGk//
	 3LhBI0Z9QTn1A==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2] dt-bindings: fix typos in various bindings
Reply-To: sashiko-reviews@lists.linux.dev
To: "Zhijian Han" <hanzhijian1991@gmail.com>
Cc: robh@kernel.org, linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org
In-Reply-To: <20260828095459.834657-1-hanzhijian1991@gmail.com>
References: <20260821105605.1967718-1-hanzhijian1991@gmail.com>
 <20260828095459.834657-1-hanzhijian1991@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 28 Aug 2026 09:57:10 +0000
Message-Id: <20260828095711.275731F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

> Fix spelling errors found by the kernel's scripts/spelling.txt
> and codespell in several devicetree binding documents:
>=20
>   - "curent" -> "current" in adi,ltc2991.yaml
>   - "deivce" -> "device" in zii,rave-sp-eeprom.yaml
>   - "ouput" -> "output" in delta,tn48m-gpio.yaml
>   - "redudant" -> "redundant" in trivial-devices.yaml
>=20
> Signed-off-by: Zhijian Han <hanzhijian1991@gmail.com>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260828095459.8346=
57-1-hanzhijian1991@gmail.com?part=3D1

