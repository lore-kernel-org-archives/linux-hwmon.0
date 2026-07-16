Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AADD12E738F
	for <linux-hwmon@vger.kernel.org>; Thu, 16 Jul 2026 08:38:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784191127; cv=none; b=kyZkOhuDGwyvQ2XlM8r0wJ+dni1hYROneeAI09twQzldUYLbppRiuMwSV/e1+TTV9JG9TOg/hOL4aeCvns38zEBaXPsJi+DkKzQWYgtd9iWK+or8u+YiTEDuAH0e/a1TdB03c1WfQiEgWk/3DBvsTw0cYxSZrQzDEp4aw9eNrQU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784191127; c=relaxed/simple;
	bh=NS/KPKd3v0AbVTHrPjIaq66H74fGVfugzLYbBviqRNY=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=lPitU4juPJ/3S/F2VU1nXwAT52U6jeUPVbHwWsrV9l64Z75FxG3Bxtn7BdD6AnPTLMgtbdqRGbx+AOpzAv+eQydqb9pHVdSzq/LQBa01RF6DQv4aywv9v9LD6PyCrfcCJqlhwcCIuV17cFYvfb//jxv+u1mbOX7N+MzD/ePPPbE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=BV2NZrye; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="BV2NZrye"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 322011F000E9;
	Thu, 16 Jul 2026 08:38:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784191126;
	bh=NS/KPKd3v0AbVTHrPjIaq66H74fGVfugzLYbBviqRNY=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=BV2NZryeDgpa6ljICWsgbANZWe1ofb1k8x89VIwsdbghdsnMql1UYs59KNBSSkFzA
	 eji6PeIrP03VUwyOFHPNij4RNrU8J6dO5SGvRUWo+AK78jWEoxAXv4KkQQexWkSCYa
	 5K7vrgb9j+MsLSiJSp+nSMQIpDDNvlQ55UTtE64+IawEt/d/fKE6GmLFrjiHWsHWdt
	 gtq6gUkMnSTggBsApJw+zCswDBysLzO+GNTJF68QBMHIyAeM7R0Sl6DJDkBvfq8v5t
	 NDF42ppyEL414vWJl7eQmIoVNFZgXlWKTuAUTrEM4Kt9n1AOOD/KxiPaiG9B7xZ2H9
	 tj5Wv8DU4KEkQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 1/3] hwmon: (pmbus/max34440): block unsupported VIN and
 IIN limit registers
Reply-To: sashiko-reviews@lists.linux.dev
To: "Alexis Czezar Torreno" <alexisczezar.torreno@analog.com>
Cc: linux-hwmon@vger.kernel.org
In-Reply-To: <20260716-max34451_fixes-v1-1-a941b27eaecb@analog.com>
References: <20260716-max34451_fixes-v1-0-a941b27eaecb@analog.com>
 <20260716-max34451_fixes-v1-1-a941b27eaecb@analog.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 16 Jul 2026 08:38:45 +0000
Message-Id: <20260716083846.322011F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

> MAX34451 and ADPM chips do not support standard PMBus VIN/IIN limit
> registers, manufacturer specific min/max registers, or undercurrent
> or undertemperature fault limits. STATUS_BYTE and STATUS_OTHER are also
> not available. Accessing these non-existent registers during driver
> initialization triggers a CML error and asserts ALERT. Handled by
> blocking these functions during read/write.
>=20
> Fixes: 7a001dbab4ad ("hwmon: (pmbus/max34440) Add support for MAX34451.")
> Fixes: 629cf8f6c23a ("hwmon: (pmbus/max34440) Add support for ADPM12160")
> Fixes: 2e0b52f1ae88 ("hwmon: (pmbus/max34440): add support adpm12200")
> Fixes: 479bfeba2eb6 ("hwmon: (pmbus/max34440): add support adpm12250")
> Tested-by: Alexis Czezar Torreno <alexisczezar.torreno@analog.com>
> Signed-off-by: Alexis Czezar Torreno <alexisczezar.torreno@analog.com>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260716-max34451_f=
ixes-v1-0-a941b27eaecb@analog.com?part=3D1

