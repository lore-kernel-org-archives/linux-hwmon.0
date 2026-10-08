Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C013B3E9C29;
	Thu,  8 Oct 2026 11:45:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791459943; cv=none; b=kXYAGuYtp/Zf0cUUPljtdGa+AKZxqtn2iTJ9uuFbs92xZdutl0m1JE6xSYlBIpH/WkFc1bHVLAHWQ+pCeudmhlRdzvoR/qECJToXrPkNGqsOfbP9GrGaO/xeHMl/KiQf38vtPXhj5XO9ypVfvSDGZHWLhn5XJgkJX5xXKWGvAcA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791459943; c=relaxed/simple;
	bh=7EEQFvlAGmOtu0HQHcl8cbhgxaDudJ0ablK+tuJQxfM=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date; b=VL95eK+G52ZkKbyCR0EC79eNW7m3t+NE+HGFEAk1dX9YHKhhF0d4NWyFJ/jAI47NIT+0b8wh55i/1Qg6y0C95woIywzpU+lTCFgoZrHuc1y7BW3kR62MpdXJxlEAY0EiyXuHGAd8SeJy4DVcUhfeJhczMw3bT4QDKebqHIfDpWw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=RPPKOwX0; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="RPPKOwX0"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 145971F000FF;
	Thu,  8 Oct 2026 11:45:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791459942;
	bh=7EEQFvlAGmOtu0HQHcl8cbhgxaDudJ0ablK+tuJQxfM=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=RPPKOwX0rBIt+ESdOp5MW8Tj3/VvL1Iyeh4KB+ztDICpnXhn9g1gmWfoW8GUBLkJw
	 J6GvSuHg5NJHAarHg9uP2Y02vtokAZpxCMoPelS29KpjQL9rKonslzcrZFybsCpufX
	 gq7rjmYbQ4/ozwhCiG4i5updqy7UhAVPN0pHwbUP53UceauglQ0QXUt0eE4Dip71j3
	 5CnKc066D+Ny1TgZodU1kWEpyWk0n8ZzZxiCkyEwBDl2GEds+YSs6akec9eEGys/Re
	 k07EAHVzidyR0DYGHWNEG7X1fK5Ewo1HN1pMjBB9Qp1jaRddnOByhGJi5J+8TBjfIF
	 emm63WjYHzSzA==
Message-ID: <sashiko-outbox-164101@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 1/6] dt-bindings: peci: Add StarFive JHB100 PECI
 controller
Reply-To: sashiko-reviews@lists.linux.dev
To: "Changhuang Liang" <changhuang.liang@starfivetech.com>
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org, linux-hwmon@vger.kernel.org
In-Reply-To: <20261008100623.7085-2-changhuang.liang@starfivetech.com>
References: <20261008100623.7085-1-changhuang.liang@starfivetech.com>
 <20261008100623.7085-2-changhuang.liang@starfivetech.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 08 Oct 2026 11:45:41 +0000
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

> Add device tree bindings for the Platform Environment Control Interface
> (PECI) controller found on StarFive JHB100 SoC.
>=20
> Co-developed-by: Mason Huo <mason.huo@starfivetech.com>
> Signed-off-by: Mason Huo <mason.huo@starfivetech.com>
> Signed-off-by: Changhuang Liang <changhuang.liang@starfivetech.com>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261008100623.7085=
-1-changhuang.liang@starfivetech.com?part=3D1

