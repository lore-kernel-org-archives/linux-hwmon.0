Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ACDB334AB14
	for <linux-hwmon@vger.kernel.org>; Wed, 10 Jun 2026 20:50:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781124626; cv=none; b=P2NgSCoLW4caDEzGcqoUqiwtwxtER3/ecu3nd+/QjnFMgwkyKJzGZ6eSHYWmhl0F9ImteK7EMFBNvKNLMUlGmDRSD2UEcc/k7XO76gkreP76anyJHpPuUrXtSVAMsI97BwHyV162PnAxaz9LeVq9C8pyXh/Vd4IYiV/rtO8Ay8s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781124626; c=relaxed/simple;
	bh=e74V+zAIRV1HPdDMjGqlSwYx5VnRre00X2fR9TioBPc=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=iGAFkhMqjGgAMteRmlL4bX1+37yK2DZrTPtZRAFY0oI7Hm0QwRod55dFbzRImlt/mpijGf0Al9RcIptPkX0welFPY/PUujN0nvs40reucS+nc56AJQQT8V/eRFaVluKUUTDbv9F9Q5AS9z5Ar+nloNfmlVqacBcmxBnqdLoja+g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KuIEnxjG; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KuIEnxjG"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1CA621F00893;
	Wed, 10 Jun 2026 20:50:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781124625;
	bh=e74V+zAIRV1HPdDMjGqlSwYx5VnRre00X2fR9TioBPc=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=KuIEnxjGtVL5iqR40M4xmPFjWs0tT+w/sID09+VYXtdorbQG9mBKMXkINdbMbDZi2
	 9UNbecNBIZlWM6vvo7DB/Qax+nsw4GWBa2OAJmBBhvTlGLp+dkdsxchURvwSehxC2r
	 OG7QepydTQ4DFzlX6Mep6tw8VFts/VG328NRnTeE67SLYCPw87Dcbyb0InTGEyQj1a
	 92YZqusBIL0QGKmdQMWtfEsKRf4tcQxPcLhQ18T+iKA5KgeyDiVtAEgKd/7DDXIhUb
	 o6z4qbSZhDkfgYwECgD5P5YIio9Do8c2HprY85yX5RbS6xsPraylSd2eXSI6Ah+X8O
	 wC9WTGPNSmJAQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v6 9/9] modpost: Handle malformed WMI GUID strings
Reply-To: sashiko-reviews@lists.linux.dev
To: "Armin Wolf" <W_Armin@gmx.de>
Cc: linux-hwmon@vger.kernel.org
In-Reply-To: <20260610203453.816254-10-W_Armin@gmx.de>
References: <20260610203453.816254-10-W_Armin@gmx.de>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 10 Jun 2026 20:50:24 +0000
Message-Id: <20260610205025.1CA621F00893@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

> Some WMI GUIDs found inside binary MOF files contain both
> uppercase and lowercase characters. Blindly copying such
> GUIDs will prevent the associated WMI driver from loading
> automatically because the WMI GUID found inside WMI device ids
> always contains uppercase characters.
>=20
> Avoid this issue by always converting WMI GUID strings to
> uppercase. Also verify that the WMI GUID string actually looks
> like a valid GUID.
>=20
> Signed-off-by: Armin Wolf <W_Armin@gmx.de>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260610203453.8162=
54-1-W_Armin@gmx.de?part=3D9

