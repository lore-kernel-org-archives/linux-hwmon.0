Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3BC13F9F58;
	Thu, 11 Jun 2026 14:09:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781186974; cv=none; b=AeweRtHw3aVQOjy1/RFQWnEN22aCOK55gRZhUdN1H3gXrXdjpdkStBffo8XdYf+JHqbcsuRvGvWPY/h4V4ChQOCv6tqA5f4S1xvjYYCtk4C7eLfXQstBHmWoeAgKB8H7OLNVNnkrOEC3L+FB0QbT6MQZzWmIUm7MjDyTUnsQK8Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781186974; c=relaxed/simple;
	bh=71ucN0TKqJLyaijhg9SUIuNwQBt7khdJrsVNHbsfcQI=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=kS8VGE6hFxP6wICmSjNyleKm/1u5xVwJwtip9Ditynon6EWrv7Yv+Op96WeKtSUpuA2seHNN39+nPgUTcHmohwPSd4HNkhZhqjHYzGGmTP0n7U7iE+F0WhmOwXGhYT+fL60THtXrX+S0SeCU9jlvd6Np0yjCx6e4mh3zE2noKpI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=V8ZDWYXl; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="V8ZDWYXl"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 29A591F00898;
	Thu, 11 Jun 2026 14:09:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781186973;
	bh=71ucN0TKqJLyaijhg9SUIuNwQBt7khdJrsVNHbsfcQI=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=V8ZDWYXll81UZdkigRYCX7zfTEZwyf9+zmEP2XDV0TKzPI6Gk1cIKr+CE4HwklwQX
	 FghpIXOlLSEsjCvrAN4rBXxPv0lxabO+ZSrN+zWKyMe0cXdSWFrcnNudAy7oxRgmEH
	 ASZdlHMx4QbqaFvt/hdJBRshjnZVMjzC83I0X2XTMJZYuJD4cgbdpn2X4nCkYGifB2
	 1jsz472m6msnmZph9zgpmmMMqDaaqKlnnxrHnstpEuCcRKw9HVA7+iSDiDUf5DToqa
	 WbtvlT9HpTfDx6s9yXoEkKmaUPFcPO8O3Fz/So/2esSoB5gGpPo7JHuUtOPoOG95F2
	 okF3mHLJFcsTg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 3/3] arm64: dts: qcom: monaco-arduino-monza: add
 ina232 power sensor
Reply-To: sashiko-reviews@lists.linux.dev
To: "Loic Poulain" <loic.poulain@oss.qualcomm.com>
Cc: devicetree@vger.kernel.org, conor+dt@kernel.org, linux-hwmon@vger.kernel.org, robh@kernel.org
In-Reply-To: <20260611-monza-ina232-v2-3-e4375ce652d0@oss.qualcomm.com>
References: <20260611-monza-ina232-v2-3-e4375ce652d0@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 11 Jun 2026 14:09:32 +0000
Message-Id: <20260611140933.29A591F00898@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

> The Arduino Monza board has a TI INA232 current/power monitor connected
> on I2C12 at address 0x40. It is used to measure the board supply current
> through a 2 milliohms shunt resistor.
>=20
> Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260611-monza-ina2=
32-v2-0-e4375ce652d0@oss.qualcomm.com?part=3D3

