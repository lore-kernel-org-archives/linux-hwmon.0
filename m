Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7206D39E17C
	for <linux-hwmon@vger.kernel.org>; Sun, 18 Oct 2026 04:56:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792299415; cv=none; b=KIMMW7dfHEgeSj5DYWReauyqLENJRfG+c8+bEyksfbI1FA+P9kdxG5WvZhBGYpPFRR4V5WKluD/o984YXNF5UuXxeqK6Shd1k6JyAXJORK2RiC6KVH27ksF922W+9u7je8StVRoJRiXHHuz6CRJ245Vx7Gog5CC6bFIHgn0IfN4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792299415; c=relaxed/simple;
	bh=DcwHl2OFUoWeVxJ1zvPrPqkdR83RzpQRUBZ/Imr9Pb0=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date; b=KjfFe9A3TxJC8xx5SthOkm/Pdg7PUgM40KtfBjxc2HJ0Eg+EQV6pp8sJy+0wW0ErQKoVXnDmAJrGpQuewdqR7lpR6GsXlqu2BwnBBoet99uWRJpFvOEKSy3sIbAJLwmSNCZhtpPmporCJSSsd+ohcAynPWxbgSG8IEkOHvKso5c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FbnyAdpE; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FbnyAdpE"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0E5121F000C4;
	Sun, 18 Oct 2026 04:56:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792299413;
	bh=DcwHl2OFUoWeVxJ1zvPrPqkdR83RzpQRUBZ/Imr9Pb0=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=FbnyAdpEOAZr0Eg8qrST64xWrZHagV0ImJYOK8OwDt9phTwL3CbPSSv8EkbONAkfE
	 I0sAI7s4n7tIJ5e2tu/hwCWmbq2ASj4z3ZW7ZI6OfrVoTMc0/1rh9CGh+iYFF62vwj
	 b3PPYdR4Y0KW2k9+C6kzzaW92RT/2GQ14FFdROzGDU19qWGM6G10apsoflYvsvILY8
	 XL+BCG6awV1knaW3L1X+dO/oNjO1A5nhzL/ySKalmYiQD9ijCy0bHegJ7ldwNI/0nN
	 QppuOAVxD+uQFUJEMn7OcCTNHswR+4CNg4HgcRJnhK1y3nIEovrnS8ScdWAiEZ838a
	 V98PeLHBhjhPg==
Message-ID: <sashiko-outbox-175942@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 1/2] dt-bindings: hwmon: pwm-fan: Reference the common
 fan schema
Reply-To: sashiko-reviews@lists.linux.dev
To: "Igor Velkov" <iav@iav.lv>
Cc: linux-hwmon@vger.kernel.org
In-Reply-To: <20261018-helios64-fan-label-v1-1-69a3f96d4efa@iav.lv>
References: <20261018-helios64-fan-label-v1-0-69a3f96d4efa@iav.lv>
 <20261018-helios64-fan-label-v1-1-69a3f96d4efa@iav.lv>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 18 Oct 2026 04:56:52 +0000
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

> From: Igor Velkov <iav@iav.lv>
>=20
> pwm-fan predates fan-common.yaml and repeats several of its properties.
> Reference the common schema, drop the duplicated properties and keep
> only the constraints specific to PWM fans.
>=20
> This also allows label, which the hwmon core exposes as the label
> attribute.
>=20
> Link: https://lore.kernel.org/r/20250106173805.GA501301-robh@kernel.org
> Assisted-by: LLM
> Signed-off-by: Igor Velkov <iav@iav.lv>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261018-helios64-f=
an-label-v1-0-69a3f96d4efa@iav.lv?part=3D1

