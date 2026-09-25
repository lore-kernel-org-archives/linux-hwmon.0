Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC41149DB8D;
	Fri, 25 Sep 2026 13:06:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790341616; cv=none; b=CDINq4hKg2JHh8fSs7D+Y2F/xLdN+EujqvEmv+SanxOruZHT9bTjVDdH5x/q96EPJJVgNDgTbVyYofyyxBsZz1+FzENcHZi+6cNiMDfAFAHrcclwXFOmGeCOIfIqo78xx+m3lAQQoNPpsfyPQtf6aj4o7nbKoZH4kfXDaDsXsQU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790341616; c=relaxed/simple;
	bh=oIr3KPdMNnlz8FeLHazRsNWMMFqBw0VgTMa0PhL8Cuk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=b0AXBW4Q88rSsCcCPbEO6FW1tvcyJe5rZjESpRTeW0VsDnwBZ3ezqIKII4N+0jTHeN3TH+4TOujDVa4A/pjekp/xvizXi2Y6e0+mSlxkPbtEl10j4BHqNmmnD6Ph43FG2+EHKzwlRCbG/d+6uOR73px4EYit/pRka/SdStIlvF4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=RPGETY43; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="RPGETY43"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BCEF21F000FF;
	Fri, 25 Sep 2026 13:06:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790341614;
	bh=UuEiudtFZaUQYnaNOodb7Jda4VXpTSORWOacwuLmv9c=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=RPGETY43Wv0o24mgk7BFYpS4/dkBeuuAOHUSOIZS8msT/25ShDQWTroQFvXSkJOqh
	 X3wmrl8b6D5wFsl98tFQQdp34Bfjcr4cANlm9RTs/yPFs04Dzvx6XLm1kJ2sPP4hbj
	 NuIRdj46A74AcKwu29EKpUaO+sNvKJAWfqhCTB7dqoOU7AlzcySD4VJw7GpZPDRzwK
	 9q3gA3M9rKvMF0TwHtbOm8IFWJawtoMyPNPfM0qpJhdVj8u6SV8Lxmdm2ENOtaOiu1
	 tt8+1VO2coXM2nDLAKJGqsC2Ntz4dYuR0Twza0pcgXk8tenhhB1qQ8ONYncW6YtxUq
	 TtZ3RcmngvtJQ==
Date: Fri, 25 Sep 2026 15:06:51 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Colin Huang <u8813345@gmail.com>
Cc: Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Magnus Damm <magnus.damm@gmail.com>, 
	Grant Peltier <grant.peltier.jg@renesas.com>, linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org, colin.huang2@amd.com
Subject: Re: [PATCH v3 2/2] hwmon: (pmbus/isl68137): Add Renesas RAA229639
 and RAA229640
Message-ID: <20260925-hysterical-otter-of-courage-bc6ab0@quoll>
References: <20260921-add-raa229639-and-raa229640-v3-0-b104ee8a70b2@gmail.com>
 <20260921-add-raa229639-and-raa229640-v3-2-b104ee8a70b2@gmail.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260921-add-raa229639-and-raa229640-v3-2-b104ee8a70b2@gmail.com>

On Mon, Sep 21, 2026 at 03:16:36PM +0800, Colin Huang wrote:
> Add support for the Renesas RAA229639 and RAA229640 PMBus
> voltage regulator devices.
> 
> Both devices are supported by the existing raa_dmpvr2_2rail_nontc
> driver variant, so no functional changes are required beyond
> adding the corresponding device IDs and OF match entries.
> 
> Signed-off-by: Colin Huang <u8813345@gmail.com>
> ---
>  drivers/hwmon/pmbus/isl68137.c | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/drivers/hwmon/pmbus/isl68137.c b/drivers/hwmon/pmbus/isl68137.c
> index 2f7f825bfb69..15b4e3f15f11 100644
> --- a/drivers/hwmon/pmbus/isl68137.c
> +++ b/drivers/hwmon/pmbus/isl68137.c
> @@ -456,6 +456,8 @@ static const struct i2c_device_id raa_dmpvr_id[] = {
>  	{ .name = "raa229004", .driver_data = raa_dmpvr2_2rail },
>  	{ .name = "raa229141", .driver_data = raa_dmpvr2_2rail_pmbus },
>  	{ .name = "raa229621", .driver_data = raa_dmpvr2_2rail },
> +	{ .name = "raa229639", .driver_data = raa_dmpvr2_2rail_nontc },
> +	{ .name = "raa229640", .driver_data = raa_dmpvr2_2rail_nontc },

The entire point of fallback is to avoid this change. Why do you need
this?

Best regards,
Krzysztof

