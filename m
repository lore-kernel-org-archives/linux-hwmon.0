Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71325329E6C;
	Wed, 23 Sep 2026 13:12:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790169129; cv=none; b=jOZ3D5xFhHffsqMXNKi4yr3TaJrkD6erap1MD6Va5K4Rmv7Yitfx0rLnPGE8us8nZEVp1cG7lRtMORk/5j7XT/At4wFLDhQHOLTymNqOq11w9+k/o9Vxka9ytnB1fX4vbHU7g9k8SOgJ2s8TezYGkncUcVKJvNryKZa6lm+adic=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790169129; c=relaxed/simple;
	bh=kSE382dAM8r5Yjhe7kk2EyG75zBwFs4319RppI8pL3Q=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=Aj3UAsUbPf9Xm52IaCC/4XWUmWu4TNv8oCzdoC9/tJCuL6D1u6ARz+sNkA2EP9khVZLacp9xdfujuyCpSEv6s83zjAtI4OR5JR1wt2NAv5Y2UJzaiFDsBCHr/htOtNMwkdE0KWp1Vs9L3eYLHalMecOtmzZyK7YMZoCNc3sG7XQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cpIGmmys; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="cpIGmmys"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 64EB01F000FF;
	Wed, 23 Sep 2026 13:12:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790169126;
	bh=kSE382dAM8r5Yjhe7kk2EyG75zBwFs4319RppI8pL3Q=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=cpIGmmys5bkqXKBEyFuTGUWcv4Oz9eioaz63NW/NOFXiIXrpCWIeftp+TepW8Efih
	 2/gv53D1U1R58zrHuIhsQo0z7TXwQ5cD86CNjS/Q/FypKmSINUnEz8KBHqEIqXq+xN
	 ZoLO5+NnetCqO52YBcmD7Y/7AKOOWOJkY4fVO+i5vVnBUMuH7+5V6vaGMJaivMab91
	 w+ZgeUeybbjr+tIcNONU95xYeYMdqq7pevtSXEDx7RtV5cVTSzOUzjNUnET73TXusH
	 P14FSegkRO6L+z5VhmlKhxw1dyCjoVCVQ5C41uo/8Tnba1mtyNdyTPCIjT4YCMVZ5d
	 sUXHndNk0bzAQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v5 1/2] dt-bindings: hwmon: Add starfive,jhb100-pwm-fan
Reply-To: sashiko-reviews@lists.linux.dev
To: "Changhuang Liang" <changhuang.liang@starfivetech.com>
Cc: linux-hwmon@vger.kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org
In-Reply-To: <20260923130624.239499-2-changhuang.liang@starfivetech.com>
References: <20260923130624.239499-1-changhuang.liang@starfivetech.com>
 <20260923130624.239499-2-changhuang.liang@starfivetech.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 23 Sep 2026 13:12:05 +0000
Message-Id: <20260923131206.64EB01F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

> Add a binding for the StarFive JHB100 PWM fan controller. The controller
> has a hardware tachometer block with 16 tachometer inputs, while fan
> speed is controlled through 8 PWM channels supplied by an external PWM
> controller.
>=20
> One PWM channel can drive up to two fans, so each fan-N child node
> references one PWM channel and lists the tachometer inputs wired to the
> fans it drives.
>=20
> Signed-off-by: Changhuang Liang <changhuang.liang@starfivetech.com>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260923130624.2394=
99-1-changhuang.liang@starfivetech.com?part=3D1

