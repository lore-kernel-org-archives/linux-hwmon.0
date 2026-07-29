Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C06ED3254A0;
	Wed, 29 Jul 2026 22:01:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785362484; cv=none; b=CBHAuYxriJOdb+0CA7xJqwQzDl8nYoqIafoYeXt4R7+E4jzVeomAi0Gbgn9gq1CdrOr8WQirayvWw8hPZQPdLCPcdSe2ng0U3F9EiSi9hsszBGVD33VpBIpS3gCebxsCFLvua7RI/6/TkX+TkS1UEphUbpymO64rTXOZDSetRzY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785362484; c=relaxed/simple;
	bh=jyoocS/CcNk2zXf8zgs43LrH5dljyX5KhUDPtTmXPR0=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=VPeFdx0016nM09ewb3ddlEmf5vwzjP0cgWqDQgLvvg6nxTSGEfe7PfnfGCiKi4SroSi1smr4TaozWxTC0tdhvZylhm21Auj0P8yG3lsIgJwB2t7rRo/2hqgH1Hr6miS04Whs/T+FxYPNdmq4Gw+BgJxcmKscCCRRbNCVchxsDmw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bEwMM2P/; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bEwMM2P/"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2A1151F000E9;
	Wed, 29 Jul 2026 22:01:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785362483;
	bh=jyoocS/CcNk2zXf8zgs43LrH5dljyX5KhUDPtTmXPR0=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=bEwMM2P/DGCO/44D32haj43TdbX0GxA/0z+zbouNMUl+QtLpIOdHqYJPDGPM+2rDa
	 mEfiQ72l72racNJM3jvVXP7aClkQYmgmVOyaN2UXW65Aw3pCG2ATdEwN5M67Dokp+3
	 xr0blMZWjweq1MhmB1ftjllnA/t8RbGkT4+vXLBPdooOIisoWSJoFV1UckvdaxiQ9J
	 Gd74+BSi2/pOe0sPcn3OrchQ5PeuHAmY5RYYPWKVhgp5773q+UI3ie99rZc11UQK8M
	 ZO1nX9PBe2imNK1uSTv+nCWUgQKNSi+T5A98Xc8ZT/X2XcWTyFH9IDcII20MhX+u30
	 jlKg/+tqglomA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v6 1/4] hwmon: (pmbus/core) export
 pmbus_check_and_notify_faults()
Reply-To: sashiko-reviews@lists.linux.dev
To: "Vincent Jardin" <vjardin@free.fr>
Cc: linux-hwmon@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260729-mpq8646_v0-v6-1-98848151cdb4@free.fr>
References: <20260729-mpq8646_v0-v6-0-98848151cdb4@free.fr>
 <20260729-mpq8646_v0-v6-1-98848151cdb4@free.fr>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 29 Jul 2026 22:01:22 +0000
Message-Id: <20260729220123.2A1151F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

> From: Vincent Jardin <vjardin@free.fr>
>=20
> Factor of pmbus_fault_handler() into an exported helper so
> drivers can notify sequence from a polling work item on boards
> for which the chip's SMBALERT# pin is not wired to the
> CPU. The interrupt handler becomes a thin wrapper.
>=20
> Like the SMBALERT# path, the helper notifies and then clears the
> latched faults unconditionally, so a polling caller inherits exactly
> the interrupt semantics.
>=20
> Signed-off-by: Vincent Jardin <vjardin@free.fr>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260729-mpq8646_v0=
-v6-0-98848151cdb4@free.fr?part=3D1

