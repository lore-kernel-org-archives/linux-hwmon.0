Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4F5637D131;
	Thu, 20 Aug 2026 15:03:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787238198; cv=none; b=lPaJ5v45J4/CO7h0Is0zIQaR76b8/l63Smb7+D8bsX5xRGaYd5bE3ULNaZ6HRKFJ8vh2rowJ/ymfLLptRu/mWWpvbx7K42Igc9HnI1LTePkz9yjPUZk6h9KKp3ebrbcaFr1pwbUojffRMLy/i+JGHiLPO1hdUF4GTlzxcl1BlHg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787238198; c=relaxed/simple;
	bh=J0b4NviHPPygrtdKIxdpxfydyH40sTBXH1QbvF5UB/A=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=rfv8o+g0qZiMqJ4WYtFCHHT2kRcPM/p1mVzf4SwJW1QqpCZpww6ZXhkuy4dKlP176H8mbaiXQHqXhtBwZQpqXCxNGqWIbhfb4a/bR/5O593scabDAgpXJwBqaVY3QoflqnEpTw4qYQsugHxhza+7OgElyGfR1v02wH0ZzPit0o8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=MQQt1MgY; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="MQQt1MgY"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DBB831F000E9;
	Thu, 20 Aug 2026 15:03:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787238197;
	bh=J0b4NviHPPygrtdKIxdpxfydyH40sTBXH1QbvF5UB/A=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=MQQt1MgYEFiQwredEPuMDEnPtbKGpR4hIxb9Q7ai2y+HqS6esfoQxLlXp6XRmxiYm
	 tJiab9e7mYWIbBYYUw3ax84zUsRT2gtRriiJoNsVuQITBVz9JkBj9WuuGtvurRd/Wm
	 l2k05MzUVyEgNMQ4S4qgQCokjs9VHVyAJjfMDRiY+lIaoXboXe2V/EKIKDFtje4IKZ
	 bqbhyU+kKJKir6yuGOhcnDeaL0pwbYqOeYkJRm7DOToxakP6wVfpVODDe2daUNZgJg
	 KvBqSaZ+VtdNtwniu2svTd1cVCjjceeVvUeTIKJ+rVa0JKOq80a1LZSbtds2dKAmfz
	 6OJSzZfTJ0g2w==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 1/2] dt-bindings: trivial-devices: Add Sensirion STS4x
 series
Reply-To: sashiko-reviews@lists.linux.dev
To: "Alessandro Zini" <alessandro.zini@siemens.com>
Cc: conor+dt@kernel.org, robh@kernel.org, devicetree@vger.kernel.org, linux-hwmon@vger.kernel.org
In-Reply-To: <20260820145946.35468-2-alessandro.zini@siemens.com>
References: <20260820145946.35468-1-alessandro.zini@siemens.com>
 <20260820145946.35468-2-alessandro.zini@siemens.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 20 Aug 2026 15:03:16 +0000
Message-Id: <20260820150316.DBB831F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

> Add "sensirion,sts40" as compatible for the Sensirion STS4x/STS4xA
> series of digital temperature sensors.
>=20
> Link: https://sensirion.com/resource/datasheet/sts4x
> Signed-off-by: Alessandro Zini <alessandro.zini@siemens.com>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260820145946.3546=
8-1-alessandro.zini@siemens.com?part=3D1

