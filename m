Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78A1A429CC6;
	Fri, 21 Aug 2026 10:57:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787309869; cv=none; b=bDYOrVFdmPKcyzr7stkF7sUd+G3eUDbTFTxaLWb4GQeJKaQgfCT0Uk66ez5zq6b37kP/XoYjwHpBjV9AxNbKajtYhRaYtEQBAA/zJs6b23A1S/UgrUXYr2jDOstXw+jOJvaGS1zxTIZHKrdgVINlvEQ71Rdlz43YDEApxPU1eyI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787309869; c=relaxed/simple;
	bh=mGEZ9c59XKc6MA65zzGgjnrVY0unlXIrlOlwGPe/jOk=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=hOtlh5aCETHpHmdapSjevpTs27gQQTsPXXbRDbk5lyfh0kkn6RLxRmidkaWM05SCM+PUNBlOEBbs1GFQ/uTNeYzdu7zxzayd8LPje3O1iAtrzCh1ybAjxtmQFXlXU/9vVuZ53BJ3yHtI3mRNXWa6LhqefX0atUWH8JeNpJNwHic=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nHhRDOW+; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nHhRDOW+"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E6FE21F000E9;
	Fri, 21 Aug 2026 10:57:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787309868;
	bh=hov9vobm/UHCv6kswX9aQyib9/5NUFRC8YE8Q+kXPkA=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=nHhRDOW+aORRl+wvyCcoj7G1L3lkcZctmXEoQiEEbrGaywtqk//QXPV8vkGM0hCIE
	 rfgwx3x7OPzrnEw4OqwZFXSZK1YesRP/VjjyZwaKVJGpJKuv2F+EbFwm0aak2xTK6H
	 ifUsP2QN4KE4wajvNp71LWOEfIk3ta4hlPO3OkTNVzYk9J0oSl0PQkI26jDnzVmk87
	 +2eCgZ9pkeTpChwGfZVSbturVL8sFjylvEITG8c+X0iojX9ZtAZiUrmylh8V56mWIh
	 9X0DMKFNZ4apCnU54Jsz7svO3/GQiiOJLeNS4WYPsjRfDxs6HpHDjv2kI9TVe+n/7m
	 S1+JkESGAV+zA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] dt-bindings: fix typos in various bindings
Reply-To: sashiko-reviews@lists.linux.dev
To: hanzhijian <hanzhijian1991@gmail.com>
Cc: conor+dt@kernel.org, robh@kernel.org, linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260821105605.1967718-1-hanzhijian1991@gmail.com>
References: <20260821105605.1967718-1-hanzhijian1991@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 21 Aug 2026 10:57:47 +0000
Message-Id: <20260821105747.E6FE21F000E9@smtp.kernel.org>
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
> Signed-off-by: hanzhijian <hanzhijian1991@gmail.com>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260821105605.1967=
718-1-hanzhijian1991@gmail.com?part=3D1

