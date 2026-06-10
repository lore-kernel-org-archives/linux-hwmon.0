Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E28943ADBAC;
	Wed, 10 Jun 2026 08:37:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781080665; cv=none; b=IscigrYCynT6A2829sExKEK6UPls++ok8xU4VUhWQsAz3yL74FOzDTcmM7NggopUvU9TBZI/fGj10nIe/U9WgN3QmyNYh4s090IBlevyKJgKTmsgysGvBtJGUrUWtAgFD17PIUkXv+bLx8Rz/au5SYGnwIvezkh5J93q7mNht5Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781080665; c=relaxed/simple;
	bh=tcbFhstZvDMLooVGAnAA0q6BJigRQM6AnmZcPZAetSU=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=aUNkOgVcjlMpknwKl9CX6L6olzyqyk/pz82lxk+CI/QKJ8632r4ZX9U40ZsGTrYX8tRdk/AOY8fStc8HZhLjB7O7h9fh3hbJxXouxLMYPB0nUCXRUzoL0TgoEziWKKL2I7UcYi8HxXWnDFj5pgpPMjDwexRX0kFoa9aPLQ3NclE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Bb2oL9nE; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Bb2oL9nE"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 426C61F00893;
	Wed, 10 Jun 2026 08:37:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781080663;
	bh=tcbFhstZvDMLooVGAnAA0q6BJigRQM6AnmZcPZAetSU=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Bb2oL9nEUkfth/lhqVPvd8yW4czizO6Zs5o02b8an7CfOBUPNO5pzzA5ovWkEJkjo
	 EROFu07YRPbKIrDAPJLNVWjzu3HdPnEoZpNUnPsQoMJIbl0KNqUqUELD+PgDpGkLIb
	 WCOPEuKvfOx+J1qSafam9RXV1j/udMuDukUugdhXhJnzcWwNSrmEicExquuls9BZ8L
	 guCM1caL1+0pPWtX/GagfDjEOQxWkksKjW6YnnqVgtUwf1lLvLczih8r3e06H3LyfN
	 PYnloicRppqs6Jox1tOrVQlBoxRpYSr1gVQGYzBuZFC8QvGtDBKv8sglYd4H/dAjQR
	 ZtwjQ0Wnql/DA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 3/3] arm64: dts: qcom: monaco-arduino-monza: add ina232
 power sensor
Reply-To: sashiko-reviews@lists.linux.dev
To: "Loic Poulain" <loic.poulain@oss.qualcomm.com>
Cc: linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20260610-monza-ina232-v1-3-925b0d12771b@oss.qualcomm.com>
References: <20260610-monza-ina232-v1-3-925b0d12771b@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 10 Jun 2026 08:37:42 +0000
Message-Id: <20260610083743.426C61F00893@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] The commit message incorrectly states the shunt resistor is '2Mohm'=
 (2 Mega-ohms) instead of '2mOhm' (2 milli-ohms). The device tree property =
`shunt-resistor =3D <2000>;` correctly sets the value to 2000 micro-ohms (2=
 milli-ohms), meaning this is a commit message typo.
--

commit e207629f293c0c8e295115a6f01dea08156bf3e5
Author: Loic Poulain <loic.poulain@oss.qualcomm.com>

arm64: dts: qcom: monaco-arduino-monza: add ina232 power sensor

This commit adds a TI INA232 power sensor to the Arduino Monza board's
device tree. It configures the sensor on I2C12 to measure the board supply
current using a shunt resistor.

> The Arduino Monza board has a TI INA232 current/power monitor connected
> on I2C12 at address 0x40. It is used to measure the board supply current
> through a 2Mohm shunt resistor.

[Severity: Low]
This isn't a bug, but there is a typo in the commit message. The text states
2Mohm (Mega-ohm), but the device tree property shunt-resistor =3D <2000>
configures the hardware for 2000 micro-ohms, which is 2mOhm (milli-ohm).

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260610-monza-ina2=
32-v1-0-925b0d12771b@oss.qualcomm.com?part=3D3
