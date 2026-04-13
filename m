Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 653BB3ACEEE
	for <linux-hwmon@vger.kernel.org>; Mon, 13 Apr 2026 08:45:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.84.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776069914; cv=none; b=QXRxt+5PpywNXkxQP3nALEsXJLOz5Iyi/AhnbyTvkU0EJ3iXM7u6fkrPZ5C+BbT5fc09oDMwXLQLaAduv/7ttzsUs6hVRWOMuJZUXhC3mS1H1i6gRqQsx9QlKoWMU23FN4UCcwvKvYuKFFzyWT/bUleIbpvQJg2TvNRjyFOnbD8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776069914; c=relaxed/simple;
	bh=tmQJpknZ8K4PSRjinbsN1H/HEMJHlC8GhEtPYDeXP10=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=P39Yw8ov0KqxWV3TmHh4FGE69+3IH4bWcHxDx/NcQWhCmcBcE/Q4lKB3evuZLCcB457PgCpAcSi23ycOO57cWK1kgKtHDTwxBd2yZXPpXOYsrDaZSSRdnOZ0jDo2TWUqtDMf67VfncbnLCgceBru46BJ1jSrk02FZj8LRrb7UEw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=v4e01hq2; arc=none smtp.client-ip=185.246.84.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="v4e01hq2"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id DBF651A31E1;
	Mon, 13 Apr 2026 08:45:10 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id A7AD25FFB9;
	Mon, 13 Apr 2026 08:45:10 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 8C75A1045022E;
	Mon, 13 Apr 2026 10:45:03 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1776069909; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 in-reply-to:references; bh=OAcntNoyq2S1cVcahMpYXYXm/PDPKoqEbIewOEJeAjU=;
	b=v4e01hq22EDC4/XGzWZC0N932NKIdtmZmagCALKezEcHag8wUtTAHANpsuIN11hBq+shHX
	G5sYe6E0JaLYgooFVPt4Wqgjue55ZOv6lyofk9DSX7fgBAofgaPetE0gCl7cvGg6sX0T4K
	pyzCiinPnNqL8O2DfpF6fgx629SxxgditTjsDVR9mwYD2Ksg0F0OV0f2WCO60Lf3W4ksRk
	HFGI/cGkhSGnTxSP1BHCtY6SjHwxFOcD55x9gPJ9Zeo9bZHTRwpbyl85xh4gJWUKIEKDoq
	g2PR2rFbNcY7o+qoZP/rrr3ChCsTy1q31N1icM9ZZym74WaeI7ODM2cVf8iZzA==
Date: Mon, 13 Apr 2026 10:45:02 +0200
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Akhil R <akhilrajeev@nvidia.com>
Cc: frank.li@nxp.com, acpica-devel@lists.linux.dev, conor+dt@kernel.org,
	devicetree@vger.kernel.org, ebiggers@kernel.org, krzk+dt@kernel.org,
	lenb@kernel.org, linux-acpi@vger.kernel.org,
	linux-hwmon@vger.kernel.org, linux-i3c@lists.infradead.org,
	linux-kernel@vger.kernel.org, linux@roeck-us.net,
	miquel.raynal@bootlin.com, p.zabel@pengutronix.de,
	rafael@kernel.org, robert.moore@intel.com, robh@kernel.org,
	sakari.ailus@linux.intel.com, wsa+renesas@sang-engineering.com
Subject: Re: [PATCH v2 09/13] i3c: dw-i3c-master: Add a quirk to skip clock
 and reset
Message-ID: <2026041308450274636352@mail.local>
References: <adhkNYQW73yQ728h@lizhi-Precision-Tower-5810>
 <20260410060712.30377-1-akhilrajeev@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260410060712.30377-1-akhilrajeev@nvidia.com>
X-Last-TLS-Session-Version: TLSv1.3

On 10/04/2026 11:37:11+0530, Akhil R wrote:
> On Thu, 9 Apr 2026 22:45:09 -0400, Frank Li wrote:
> > On Thu, Apr 09, 2026 at 04:27:39PM +0530, Akhil R wrote:
> >> Some ACPI-enumerated devices like Tegra410 do not have clock and reset
> >> resources exposed via the clk/reset frameworks. Add a match data for
> > 
> > why not export fix clock at ACPI?
> > 
> >> such devices to skip acquiring clock and reset controls during probe.
> >>
> >> Move match data parsing before clock/reset acquisition so the quirk is
> >> available early enough.  When the quirk is set, fall back to reading
> >> the clock rate from the "clock-frequency" device property instead.
> > 
> > "clock-frequency" is legacy proptery.
> 
> The document ACPI on ARMv8 Servers [1] suggests not to use clock or reset
> framework at all. I also could not find any proper way to export the clock
> to the kernel from the ACPI table. The same document suggests to use only
> _DSD properties, if to pass any data to the kernel.
> 
> I can rename the property to 'default-clock-rate' if that sounds good.
> Please let me know your suggestion.
> 

"clock-frequency" is fine for ACPI

> [1]: https://www.kernel.org/doc/html/v6.1/arm64/arm-acpi.html#programmable-power-control-resources
> 
> Best Regards,
> Akhil

-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
