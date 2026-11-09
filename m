Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794217164;
	b=kRXNsKNvvPDrFIfHbw9ar5mrObXclsyacY5ArWNgza283Bw/C1scAc7HS9lPi0atB8Ru
	 xodIw4i8CmXlZnuzq7j2FhXfq2QGugLl9kLKw0V+OqPFZrjEYmisXJisi35MOmA1I0uAU
	 J/IsOPvTL40p7YRQ7gLXfCgbMR/jA/5/OWRbN6Zl5+ES1CQMKZSuu1VOVAIx+nrh4DEDm
	 GlClgS8KZrXrjycKbQskAyg3rH16UGTwWuKO/M84TZs4ALy07ctl1S88dSNrlG5aeZdWt
	 Dkl7F9PnYNZnZZP9YD1w1oddHMR8THK/FFg1Jng/P8yGw8zpAVk5BagmOqQRvfmKYQA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794217164;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=icWykywII9oemXg7oD9o6VopRPwOD9JPNUy/sxajsh4=;
	b=dcI0lBSHL3CTI3wF+FLSW+OdgP8CCTcsx8nEDkHp5GCT6EoGHeIQpCatPJ++3Dzxeeap
	 3FmF40GMmQ8UXEVVHqM9FFpmbF1Ci60Gs8b9PVPou6NYXxr9sNSuIroKJTfsFil/FF+aM
	 MSXYHuQ+jZkpeGpGUmdxKmSv7RFSwnpJP1V54aAGWrBrXpfuKTZf6JLthALmZY55fwCy0
	 Pu5i1lWYRUR6yr7VjnDag8Zo2xiiwghgpWPZDLb/qWSCj58pwUl48pKIRbwszWx/lLLxO
	 oRW8X+Mm0gW9nQjTa93q/8jNwg8pZvH/T3Lke05SdVfaa8pFIgXRVl5giY3HSDQfpyw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Tp6CrdSF;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 812FA606A31C
	for <linux-hwmon@vger.kernel.org>; Mon,  9 Nov 2026 09:39:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Tp6CrdSF
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E3B061F0089F;
	Mon,  9 Nov 2026 09:39:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794217164;
	bh=icWykywII9oemXg7oD9o6VopRPwOD9JPNUy/sxajsh4=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Tp6CrdSFsFyHTGDvR1VsYXDFsL7uNvMH8enRrsUYgSEp5wA2uJFX9ZYoEZkehUm+j
	 9AFswWoyrTrWO4Qsp50tzlLCKTRTeV695U3cbq7lABfV3+XaaZ5RPC7mLfIhNJ+bLv
	 +R6U5fd6/fVC1J8eQvESUSvqPTvj49M7FbfumpiGFsw7eOSBax9bpROA5db/l/tSBY
	 hJAEiLZp/APe5DEAVgYa7u03uax+8Dtqkj00zX9GbP7WeOiQeD1wpph2IiZlwv3FKp
	 k68nqBgIF2g2/Nr43nK8HqVLISp5lX971DXjIra0OQp1qjMJW8k/P8vUTmSQVnfFhp
	 MedO5WHCr7d9w==
Message-ID: <sashiko-outbox-204727@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] hwmon: (w83793) Prevent underflow when removing voltage
 offsets
Reply-To: sashiko-reviews@lists.linux.dev
To: "Zhu Jun" <zhujun2@cmss.chinamobile.com>
Cc: linux-hwmon@vger.kernel.org
In-Reply-To: <20261109093132.5347-1-zhujun2@cmss.chinamobile.com>
References: <20261109093132.5347-1-zhujun2@cmss.chinamobile.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 09 Nov 2026 09:39:23 +0000
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Post: <mailto:linux-hwmon@vger.kernel.org>
List-Help: <mailto:linux-hwmon+help@vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-hwmon+owner@vger.kernel.org>
Precedence: list

> From: zhujun <zhujun2@cmss.chinamobile.com>
>=20
> The 5VDD and 5VSB limit conversion subtracts the voltage offset from an
> unsigned value. A requested limit below the offset wraps and is clamped
> to 255. For example, writing zero to in7_min selects the highest limit
> instead of the lowest.
>=20
> Limit the subtraction to the converted input so that values below the
> offset select register zero.
>=20
> Fixes: ddca933bd554 ("hwmon/w83793: Remove the description of AMDSI and u=
pdate the voltage formula")

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261109093132.5347=
-1-zhujun2@cmss.chinamobile.com?part=3D1

