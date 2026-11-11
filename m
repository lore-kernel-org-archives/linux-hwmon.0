Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794380674;
	b=M7niAFdu4QWcMmJYdBNHc1uknHzPH4UzoUNhmnHEnCzDcFaGR1MzdlMHmnnubOAL57dl
	 D3oREXjdJdNu13CVYYNS0sslyajyF4Td5m8vIBLW8R+1f9Bi20Z9EvTKO2FDiarandsFX
	 WPwjoHWaybBb35Ap6RTZ/RNhzaEp8R+/B/Cm/264OHbDUpDJeiFDClYvhJZ2VNkIDYWTi
	 9Aa5HYOdVx2b21+rSHynWLa/4GnPbXwyHxuZvmrq6n2qXcOdwmiCAVV7FFGlYBFLIBVL8
	 86uRWcEysz7GZhh8Wr/qdzlGtfupURVpfoGiIltFdZQ6VFnpHl+4Et/YQ+aU5P48zTA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794380674;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=ypvKNbFpGMN50c47FhfzuvWScLeL7g5eWwtfWwwA3mo=;
	b=WPS5qbsrnvEAja1ncdfAXa+m8bO1CLJsBzoUBYM1nm2B3xJd4q+tgKFBzlDQv8cnD5pE
	 8WQrmuqQxYekvcb/IkqGsQwcZcKKZx2T4YlkmbeAx56CI/S9ERKsAnSOkRgFce7gtdMDO
	 zOeCJpfBAZVwQDOlM6f7QuysMkfDVQa/Vyml1whLojugAb1e1qbw3KL9BKDOL4mQp2nSQ
	 bTKFXaCTT+KeJYdBKKg+dhQ5n6nuskrLQ97GGYUbd9H0y0SJpQx22PSuHMXE/TFnM7tKp
	 loLqx81SrSKRyZTYRD8akCBkmNnPuDOy0uajz1X5+47j7fHQyxNKnkOiKBWyTym64Sg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ogjCcx+6;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B634B606A320
	for <linux-hwmon@vger.kernel.org>; Wed, 11 Nov 2026 07:04:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ogjCcx+6
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 20E501F00A05;
	Wed, 11 Nov 2026 07:04:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794380674;
	bh=ypvKNbFpGMN50c47FhfzuvWScLeL7g5eWwtfWwwA3mo=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=ogjCcx+68ggdenV0LxC21JJHTXsXsiZImYXQa+2ms/DhdbSymClkyOgCseqt2DQyZ
	 //cUoMV5rwFKElIFu8rRXxIDUcTXIuw60eSiQPzS/GbuMH7zCCaQzH8JI2m8GC5p8v
	 abhW8BQiBxj3ssbYEFWgKpFB7mbt/HtaQzqjayuEYrkRgOyg8bEMhiNaB+XASJEze9
	 5Ek9NNXQU9Z//xQnd+xsmBso7V3yYpfSWPHvgcF7qChoqhp88YwfeO1fr/ZyqY0GbD
	 N+qBpP7Z0lcppn+RVf10sE8dIfMFv/iPx4RL1gIJ8IU0bJlSj1S4/ma00cTNV25jSV
	 Ncrmkd69pQ5XA==
Message-ID: <sashiko-outbox-208487@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] hwmon: (w83791d) Clamp voltage limits before rounding
Reply-To: sashiko-reviews@lists.linux.dev
To: "Zhu Jun" <zhujun2@cmss.chinamobile.com>
Cc: linux-hwmon@vger.kernel.org
In-Reply-To: <20261111065313.17748-1-zhujun2@cmss.chinamobile.com>
References: <20261111065313.17748-1-zhujun2@cmss.chinamobile.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 11 Nov 2026 07:04:33 +0000
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Post: <mailto:linux-hwmon@vger.kernel.org>
List-Help: <mailto:linux-hwmon+help@vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-hwmon+owner@vger.kernel.org>
Precedence: list

> IN_TO_REG() adds the rounding adjustment before checking the register
> range. For an unsigned sysfs input such as ULONG_MAX, this addition
> wraps and selects zero instead of the maximum voltage limit.
>=20
> Clamp the millivolt value to the representable range before rounding to
> 16 mV register units.
>=20
> Fixes: 9873964d6eb2 ("[PATCH] HWMON: w83791d: New hardware monitoring dri=
ver for the Winbond W83791D")
> Signed-off-by: Zhu Jun <zhujun2@cmss.chinamobile.com>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261111065313.1774=
8-1-zhujun2@cmss.chinamobile.com?part=3D1

