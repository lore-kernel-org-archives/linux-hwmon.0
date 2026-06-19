Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D60D375F7C;
	Fri, 19 Jun 2026 10:41:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781865666; cv=none; b=ow4UQsV/xZxcbLw2k9qecjefVTuTJWszMTCbBBByuILv0tHvBnz+W3fNJUwBSWU6x0/OAZHNWFhkLX5s4sgDIf3I4/PT//C/IvCcsnlcwh+LAxCbDfWBioZrOSMdrdA04v3bmJBmAzbfn8d3uUiv8+NH6/ockfXLvSbHiJV+rwY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781865666; c=relaxed/simple;
	bh=fgt8VBRVEoSs7HqWuXZBtTuu/ZeUcdXAMXC8VAtCniI=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=H6lJ2aQjoG4/kCcZqCcrGFwN67kp5sceHGIEU/nzGZ3ME/+3cmR0PajUMtqpOIaCcHZ/pezBp3WnYhBzmzvLCdZs2CfVCVdoYxIhMe0FpLvdLtkYU/DHUOxpPv4s/XimaYlH8YmRkuRsySvlYqv5I644yZJ00kl9I7e1GjGIYV8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nxcVG09Y; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nxcVG09Y"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B90D41F000E9;
	Fri, 19 Jun 2026 10:41:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781865664;
	bh=fgt8VBRVEoSs7HqWuXZBtTuu/ZeUcdXAMXC8VAtCniI=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=nxcVG09YidvgwW9d8yY93FttoCoNUe2CSoTN3Uu7kFcdWWib0jgpdu9KH9G/e7f5K
	 D0spP7ArRFA2WgHODQcFJl21AQA5luV1r1f9xl4kn3tWYODtX7lE8Fb3Xrg5Z1aV8u
	 th7vUFz1GbuHYQQK4G6kdID9VupCQtHWKb9x6tJDndOzqCEZinKXj+NSnNrDNlj50I
	 BXjNTCy789X+kMq3bhHfJ0b5nGPVEu6li80i8uke3pJGqU80sbwjTotw1br001J0BC
	 Ai41CtLr2fm1/NMbcjkokh881bbmYqUIKnmcvQBbaC3nHrUGP6/1F+ymVgRoeZMiVB
	 F5XEA1Q0pWqSA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 3/3] hwmon: (emc1403) Add regulator support
Reply-To: sashiko-reviews@lists.linux.dev
To: "Svyatoslav Ryhel" <clamor95@gmail.com>
Cc: robh@kernel.org, devicetree@vger.kernel.org, linux-hwmon@vger.kernel.org, conor+dt@kernel.org
In-Reply-To: <20260619103153.216444-4-clamor95@gmail.com>
References: <20260619103153.216444-1-clamor95@gmail.com>
 <20260619103153.216444-4-clamor95@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 19 Jun 2026 10:41:03 +0000
Message-Id: <20260619104103.B90D41F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

> Add support for VDD power supply for this sensor. It is required on some
> devices for the sensor to start up and work properly.
>=20
> Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260619103153.2164=
44-1-clamor95@gmail.com?part=3D3

