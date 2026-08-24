Received: from smtp2-g21.free.fr (smtp2-g21.free.fr [212.27.42.2])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E8E939479F;
	Mon, 24 Aug 2026 22:09:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.27.42.2
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787609365; cv=none; b=L8lM5M7SIYu+sinx5Z6Ma8agiUgBF3gsOF+lU2bD0KrN0/HGg77qxnc8uQ4S/SrTExWuO7Dhmyfl69iRRQNz63UKGig1IGoL0srCcrTlc8g0j0d8IjAtF/xKnLDGr+t/M13npaviF95235wTDfvQA5mugA3ZxO4iwDYW5IirNpg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787609365; c=relaxed/simple;
	bh=sWz6hlKCZ3oN6pn4Ad0oYGOeLu7OCQmrvxiWfD0t7R8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TyLSKekeNMaHHvyA8AoRXQt2hxhR30UgmR0B4JHvzuAgutmZxwbXTPAf3dGspBgQfjoN145ivme4RlwRQR+uI88bomUfztHVoVackcj5fVpkUUseVenX6sfl6K0Xrg1F9PpQW5Jo0DyzbFmaB6GdqQKTfKfGBdcQQRhXt5/9U+A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=free.fr; spf=pass smtp.mailfrom=free.fr; dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr header.b=O6pkfoP5; arc=none smtp.client-ip=212.27.42.2
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=free.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=free.fr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr header.b="O6pkfoP5"
Received: from L30177.local (unknown [IPv6:2a01:e0a:ac2:22b0:9a6:acd5:d8dc:dcdb])
	(Authenticated sender: vjardin@free.fr)
	by smtp2-g21.free.fr (Postfix) with ESMTPSA id 6714C2003C3;
	Tue, 25 Aug 2026 00:09:16 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
	s=smtp-20201208; t=1787609360;
	bh=sWz6hlKCZ3oN6pn4Ad0oYGOeLu7OCQmrvxiWfD0t7R8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=O6pkfoP58l9Xv39H+FDKPJMp2bY0IpEEG3Jdq/Y8fEwENV7BBdhSN29PlEZKd+SB7
	 tCMRfoLay+EUs4JhjW5PjCSrGeuJL5SNZ8BChn42RIIsHNu1wO8DGW+UKy89aR91Sy
	 MGK2t7Ae75Zfm7CPlJr+AZk6B0VbMdRRKCBPIMZGXsOQexzonQ9V7KbLmv2znH/Blp
	 cMn74OpslD15lUlQB2OHF2uVXl/+nDMkQ0XBDbAr91rFkWGVxAUmvKQTOoZt+MQjB6
	 l3neEbE1WaOIaV3UcMzgBfqPwhNA4WW1M7F5fWmoAlKzs9jMgjxRKVcWeT0obGXxF2
	 c79+SGIzETI2w==
Date: Tue, 25 Aug 2026 00:09:14 +0200
From: Vincent Jardin <vjardin@free.fr>
To: sashiko-reviews@lists.linux.dev
Cc: linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org,
	conor+dt@kernel.org, robh@kernel.org
Subject: Re: [PATCH] dt-bindings: hwmon: ti,tmp401: add vcc-supply and
 #thermal-sensor-cells
Message-ID: <aozBCv7L_Hk81Rx8@L30177.local>
References: <20260824-for-upstream-dt-tmp401-vcc-tsc-v1-1-ecb5ef7898bd@free.fr>
 <20260824155758.CD2F11F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260824155758.CD2F11F000E9@smtp.kernel.org>

Hi Bot,

Le 24/08/26 15:57, sashiko-bot@kernel.org a écrit :
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [Medium] The commit message contains a major factual error: it justifies adding the `vcc-supply` property by claiming it is fetched by `lm90_probe()` in `drivers/hwmon/lm90.c`, but the `ti,tmp401` and `ti,tmp411` devices are actually backed by `drivers/hwmon/tmp401.c`, which completely lacks regulator support.

You have the points.

The vcc-supply justification in the commit message is wrong assuption for
this device.

v2 will drop vcc-supply and it will keep only #thermal-sensor-cells.

The #thermal-sensor-cells topics is better explained in v2.

Thanks for the review,
  Vincent
