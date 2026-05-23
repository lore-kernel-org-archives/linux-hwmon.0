Received: from mailgate02.uberspace.is (mailgate02.uberspace.is [185.26.156.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C97832744F
	for <linux-hwmon@vger.kernel.org>; Sat, 23 May 2026 13:31:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.26.156.114
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779543092; cv=none; b=dNNOeiVGiW4IO8H4Ozevkr/ecNTojVyBqAiVy6cFk/cKgr63+ucFVPNnYdYevXK67mRgCFpkgwfpVuV4qzan96qecOQQScQDzsVqK5hZkvKs3pjNA7IXZxXj1y2i2Sg2B3WnYdj7x/8fCU3qfYHiIaeRtlZskYpYZR3SH+PgfGY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779543092; c=relaxed/simple;
	bh=WwaxjtG7zBE3bT0wZIIUx8b+q9S0BMVzQiEYFu/twUs=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=sMdeWDqXiawPas9QR6WbRTBARk3YjZ0ONWTcSsAm2RnNqD6+bEDKrI2T2N/5h5GyAptisOUWSZB30DY8rDc44mX7u4Je8BciuEv2Ih8TLAKdtnyu6qF6KMLYdfKU0eRmc85lhP6xy/9A9JC0vBEMNmT9jOn6IFkuK5CNf0lQm/k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=jhbruhn.de; spf=pass smtp.mailfrom=jhbruhn.de; dkim=pass (4096-bit key) header.d=jhbruhn.de header.i=@jhbruhn.de header.b=1+jqBPoV; arc=none smtp.client-ip=185.26.156.114
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=jhbruhn.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=jhbruhn.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key) header.d=jhbruhn.de header.i=@jhbruhn.de header.b="1+jqBPoV"
Received: from boethin.uberspace.de (boethin.uberspace.de [185.26.156.96])
	by mailgate02.uberspace.is (Postfix) with ESMTPS id F387717F74A
	for <linux-hwmon@vger.kernel.org>; Sat, 23 May 2026 15:31:27 +0200 (CEST)
Received: (qmail 8609 invoked by uid 990); 23 May 2026 13:31:27 -0000
Authentication-Results: boethin.uberspace.de;
	auth=pass (plain)
Received: from unknown (HELO unknown) (::1)
	by boethin.uberspace.de (Haraka/3.1.1) with ESMTPSA; Sat, 23 May 2026 15:31:27 +0200
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sat, 23 May 2026 15:31:27 +0200
Message-Id: <DIQ3DKCXEORM.1IXZ4DV1K1D8Z@jhbruhn.de>
Cc: <linux-hwmon@vger.kernel.org>
Subject: Re: [PATCH v2] hwmon: (lm63) expose PWM frequency and LUT
 hysteresis as writable
From: "Jan-Henrik Bruhn" <hi@jhbruhn.de>
To: "Guenter Roeck" <linux@roeck-us.net>, <sashiko-reviews@lists.linux.dev>,
 "Jan-Henrik Bruhn" <kernel@jhbruhn.de>
X-Mailer: aerc 0.20.0
References: <20260522202250.3184791-1-kernel@jhbruhn.de>
 <20260522205930.3E2EF1F000E9@smtp.kernel.org>
 <DIPYQFU4CSI6.23E8KAFNAQ859@jhbruhn.de>
 <580689d4-a969-4f4e-8d06-cfffe809500e@roeck-us.net>
In-Reply-To: <580689d4-a969-4f4e-8d06-cfffe809500e@roeck-us.net>
X-Rspamd-Bar: --
X-Rspamd-Report: MIME_GOOD(-0.1) MV_CASE(0.5) BAYES_HAM(-2.998278)
X-Rspamd-Score: -2.598278
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
	d=jhbruhn.de; s=uberspace;
	h=from:to:cc:subject:date;
	bh=WwaxjtG7zBE3bT0wZIIUx8b+q9S0BMVzQiEYFu/twUs=;
	b=1+jqBPoVIAkxV5J+GcWNqpyPigVFy0UYZx0RCEf+avUtvN7HKUhkRLGrNA5/qtHdptSDSHsN5j
	N0ynZjd3Qitnm/ZOC79G6ZJqYBzD46e+4CAOKiBNxXtqGp2AWFBcDAkecAR5SFtIPVJs4aTvocHf
	WDdglg+vAleQSx09QkZ+Snd7ZfAnCMvtExGmWqqF6o7xBhrsdlyP+ui7yyWW8Byok6AUmiMcA6UW
	xZBOdYxT1CfihpPjCr0O0FgOCnGv1934x52CrYbO85h84BKYACeSyn8dzyrX/ipQ+GQPoNN5+5s0
	cJoudg/3Bl2VkDoG4awDYOUhVPokwsKVo5ze0WmvRBlW4INy+UMB6tzEjEC6qtyLofBUk9Rbd7zs
	aUq8UWtOChFwmWkvJZ9QiP66loAwMbPp11LgP2G4mCg63vJIlDJXEsNJD3cHYRVwpAak7rMfxcwu
	HqqB/uKMzVfWh8zOuCam8bVG3LYGbM+PljXYnCCLkjfiQ9+lWPCkECfWEQ8FMos6I80R72Xr7UAr
	XwE9XYHTOPyMp1aJHwH5MZD9J4QCyIbX9hJgQOfejQeSDMBMOFrUyOG3ZjmuJRWfUejWqGbmFfEz
	837idEFy9b5DY/z8gdE3vPM3m04MHuE2qKcvDrArjbhLRH87kKj6KlXQ2SOR2FpKFGWiTO+f53X6
	o=

> You keep telling me that the existence of bugs in the driver warrants
> introducing new bugs. Sorry, this is unacceptable. I won't expect you to =
fix
> existing bugs, but I will not accept introducing new ones.

Understood, v4 will fix this bug with an atomic snapshot using the mutex.

Jan-Henrik
