Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793292216;
	b=n3F57rsvfGDD/MP/ddEAxCjHiIuroYimFVPi24mAyudLRnlMPbvwbg4wvRa7iHRb9imj
	 UtP/v0+hN1JyzZ5Hv6ifSEcVfUG07thyLF0p2HlSFE6jq3arxzrNcCq7ddTd0aUut1Kcn
	 CtkHTI4S1l0z06e8bM87IVZWKXn5pu8mXIy2M90y8p7oA3GsVSnvWQgt41yGb5ew2t1E3
	 CoK4179IORu70l/P8e0N6GtNKqiV5sD86zHNv8a6a58ZOzScM81ygWUEvgHii3Aumzr3+
	 gfDHNYoaB7SKl23n36myhRIiAFTwYAuULKc6uoiC80HTHPO0FIcgsc98HDXILqj1QsQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793292216;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=fLNVx75cMN3EyzNlZPAKW1LvFu7qtigaSdkc0VgNLQQ=;
	b=Ob3svEA8HBgGmm1Gl/DtdLDHbnBH8EANzPv2SmFmdm2AO8pOzrUggLpNL8uIE2KcEQnA
	 N6Ol21H6cRbSQThcg9mXBDuzT4p9iJBq+40WzU2kegmHjre7YBLa+zUxVnO7X9vdy1D+e
	 iRgtyIEzFC5cG4MoVAmSbe7kWOQY4e6ttM9c21IA3z3Bw/CIbWj1GILUABRY7txzLVVKf
	 uugotaxg60lgbNUpPeEnkgldYrC3PLCD36fzfxaRK/jPnXmZcgzgeKLIi/Y9OYANsurzD
	 TFST1sHuB3iShDBg0L0gTw9YUZWtSGzt+y9v2PPG25TCa3udSTqhe8K5i0gBTLRUGVA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=dfEDHDlI;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2DE41606A31A;
	Thu, 29 Oct 2026 16:43:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=dfEDHDlI
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D22B01F01816;
	Thu, 29 Oct 2026 16:43:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793292216;
	bh=fLNVx75cMN3EyzNlZPAKW1LvFu7qtigaSdkc0VgNLQQ=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=dfEDHDlIXRHZcN0hbbvsFSTw/1XURIziF2u0SBc/c5n81b1b7zieni8d+eT5JYOZs
	 1I4Wmq/7YOiiYuFXcPGYkYNAoZyIlALFzqJluMOe/SDLtCQZOjgNDWC/ju7ENNkdFC
	 s3s9ulaJ7PNfRvdJJFrrfW5tlDEKfeJU0vay7czfkWW5kByl1Z6JQzsI4IwRfgNeUE
	 kArElLb8rfc/fjCvNh6ng9CMkg6Q44FVgGuM+skpNikUQNSK8LjsKDQRBoOH+sh2vz
	 ShWAJSWTwZr4Acl/Kl6tiQGWGIewmCi4CBAcmeH5Lt7Qmw0S8QNSkBjiXz9WvOmHGc
	 YJYg5Wym9FD5g==
Message-ID: <sashiko-outbox-189670@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 1/1] PM: runtime: change stub pm_runtime_get_if_active()
 return 1 when !CONFIG_PM
Reply-To: sashiko-reviews@lists.linux.dev
To: Frank.Li@oss.nxp.com
Cc: linux-usb@vger.kernel.org, linux-hwmon@vger.kernel.org
In-Reply-To: <20261029163044.3062958-1-Frank.Li@oss.nxp.com>
References: <20261029163044.3062958-1-Frank.Li@oss.nxp.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 29 Oct 2026 16:43:35 +0000
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Post: <mailto:linux-hwmon@vger.kernel.org>
List-Help: <mailto:linux-hwmon+help@vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-hwmon+owner@vger.kernel.org>
Precedence: list

> From: Frank Li <Frank.Li@nxp.com>
>=20
> When CONFIG_PM is not enabled, all devices runtime PM state should be
> treated as active.
>=20
> __pm_runtime_resume() returns 1 (called by pm_runtime_get()).
> pm_runtime_get_if_active() is the try-and-get version of pm_runtime_get().
> stub pm_runtime_active() also returns true. So pm_runtime_get_if_active()
> should return the same value as the stub pm_runtime_get(), which is 1.
>=20
> Analysis of all callers and their behavior with old (-EINVAL) vs new (1):
>=20
> Pattern A: if (!pm_runtime_get_if_active(dev)) -- no impact
>   Both -EINVAL and 1 are non-zero, so !ret is false in both cases.
>   Callers: drivers/accel/ethosu/ethosu_perfmon.c,
> [ ... ]
>     Both succeed when CONFIG_PM is disabled; functionally equivalent.
>   drivers/hwmon/eic7700-pvt.c: call is guarded by IS_ENABLED(CONFIG_PM),
>     stub is never reached. No impact.
>=20
> Signed-off-by: Frank Li <Frank.Li@nxp.com>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261029163044.3062=
958-1-Frank.Li@oss.nxp.com?part=3D1

