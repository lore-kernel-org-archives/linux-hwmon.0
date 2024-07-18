Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C75AB7407A
	for <linux-hwmon@vger.kernel.org>; Thu, 18 Jul 2024 16:40:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721320827; cv=none; b=IIZUlFk2T2uSdvW/BO7jWh0t/Wt1Svh2CZqbdMlkdlRgA58LRGgnvin425Rpf17GVobaVOSKEEDj3N/BP1GesKKppTisIUxUOCC8PRBmzG0l8U6LMh4VySZnRkRXGtPHsosD26/CHaYxfMQ+P3TIVNG9Is42VyTdZoRf4usU+c8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721320827; c=relaxed/simple;
	bh=N3/qX3qwGU/TZJkYPoMvurPeINk1WYIPIBJ9wA977ag=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NcKQ+w6haKWgY8CtFYzpfp6G3b57GVbiCVCBR7Nz29dRuMTkyBM1IlyJ977uPOxktpi87vZ2QxpJ/a5SUPW2rHzj0NwvEN4LXPNvsUOSSeeytc12GLsz4laSUCavVR/1xSs+UgR2PkOPOIcaRGlyMeeL+2WSo2VLtkZNOLwau38=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hATnhGHD; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hATnhGHD"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B2EABC116B1;
	Thu, 18 Jul 2024 16:40:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1721320827;
	bh=N3/qX3qwGU/TZJkYPoMvurPeINk1WYIPIBJ9wA977ag=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=hATnhGHD8Ohk4CfdpnCTAdgdob/gij5KvaMNYGCzRhI7vVsv4R3iZM85ZX/RXHbZy
	 Fs1d00lfl+FJ1qVSBcE1yL/22TEfUgxaQr06ihJg6jeOXEFz91GO5znRH5Jcz3LQQW
	 R6wOqTjSPMnwxVsMdXdRme6Pa4FuNtx060Sw8wTwk/9+LBDdtpfrKjrkvi+oN2c8jA
	 IBcHIzvXlNmsnWoiSvEina1OJm5+q/zWIRvCFQ+Ad2b0ja8be9KcHan+p4NbjRDSs/
	 MUTZKpCVA87HA6iGom23C7K7DHDzFZD1bGZPAfhwyxMOltNwS16l8rh+zX42b3ubQH
	 HG9WALUSoq+jg==
Date: Fri, 19 Jul 2024 00:40:24 +0800
From: Tzung-Bi Shih <tzungbi@kernel.org>
To: Guenter Roeck <linux@roeck-us.net>
Cc: Hardware Monitoring <linux-hwmon@vger.kernel.org>
Subject: Re: [PATCH 4/6] hwmon: (lm95234) Convert to with_info hwmon API
Message-ID: <ZplFeHMIKjHPiwTc@tzungbi-laptop>
References: <20240718033935.205185-1-linux@roeck-us.net>
 <20240718033935.205185-5-linux@roeck-us.net>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240718033935.205185-5-linux@roeck-us.net>

On Wed, Jul 17, 2024 at 08:39:33PM -0700, Guenter Roeck wrote:
> +static int lm95234_temp_write(struct device *dev, u32 attr, int channel, long val)
>  {
[...]
> +	case hwmon_temp_max:
> +		val = clamp_val(val, 0, channel ? 255000 : 127000);

Perhaps I am misunderstanding, but this looks weird to me.  By applying
the patch, the maximum values are:

static SENSOR_DEVICE_ATTR_RW(temp1_max, tcrit1, 0); -> 127000
static SENSOR_DEVICE_ATTR_RW(temp2_max, tcrit2, 0); -> 255000
static SENSOR_DEVICE_ATTR_RW(temp3_max, tcrit2, 1); -> 255000
static SENSOR_DEVICE_ATTR_RW(temp4_max, tcrit1, 3); -> 255000
static SENSOR_DEVICE_ATTR_RW(temp5_max, tcrit1, 4); -> 255000


However, it was originally:

static ssize_t tcrit1_store(struct device *dev, struct device_attribute *attr,
	        const char *buf, size_t count)
{
[...]
    val = DIV_ROUND_CLOSEST(clamp_val(val, 0, 255000), 1000);

static ssize_t tcrit2_store(struct device *dev, struct device_attribute *attr,
	        const char *buf, size_t count)
{
[...]
    val = DIV_ROUND_CLOSEST(clamp_val(val, 0, (index ? 255 : 127) * 1000),
		    1000);

static SENSOR_DEVICE_ATTR_RW(temp1_max, tcrit1, 0); -> 255000
static SENSOR_DEVICE_ATTR_RW(temp2_max, tcrit2, 0); -> 127000
static SENSOR_DEVICE_ATTR_RW(temp3_max, tcrit2, 1); -> 255000
static SENSOR_DEVICE_ATTR_RW(temp4_max, tcrit1, 3); -> 255000
static SENSOR_DEVICE_ATTR_RW(temp5_max, tcrit1, 4); -> 255000

> +		val = DIV_ROUND_CLOSEST(val, 1000);
> +		return regmap_write(regmap, lm95234_crit_reg(channel), val);
