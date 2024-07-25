Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6810D139B
	for <linux-hwmon@vger.kernel.org>; Thu, 25 Jul 2024 00:54:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721868855; cv=none; b=uNkdqL9V80JlKAeVE55WdyhiBgb4QNEn2cccinmaZnp28DgPWaEmZ4X0rFXtFLoiVmwQB5zlssd5n7QB/2CZBlrDlrIJyYuWc7OCQo/mgjE0X3vezuN5IcDeikBhEc4Fc4R14RHBIZA7vll+C+9h1deTd+RVlaqpg4wlYDK4wmQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721868855; c=relaxed/simple;
	bh=q4ycLm1lVjoeGsE4IlI82D0nkGNURpOgnz7D0pmQUTY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BMVk6NzmTAjcnqdApIwNkhTV3alPDsYwQyBzYnHHYQxgitpI9HqN0VUdw8gBm7UCk/i1s2mgpCwWiwoVQqQ2as5eIGGqBwXQ1qK64Go7L0Ai7pC4nt49iM3oD9CgbZ2k0TmCIzhID94tW9Wu5RU30UByR19pHVMViCKKBQHDPWM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=pdSbojW4; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="pdSbojW4"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7D1EFC32781;
	Thu, 25 Jul 2024 00:54:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1721868855;
	bh=q4ycLm1lVjoeGsE4IlI82D0nkGNURpOgnz7D0pmQUTY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=pdSbojW4ZbLcKcq0cR8/3hhto3lQZaWl9kfNG7MabJ6aYcjC2qmRf6OvKKh14nNCA
	 t1x9QhR7D/P/47mFlGe903UTgJHoMB/+9fNt6n7kDaTB51eY0b9E+lqF2E1q9GBc8d
	 LDIX6HCkYK8kTlOt9PbUUSnTkfEgkufRIvbVOIu7CC3oNtpAx8088uWDCc4EL9dUj6
	 BfvepNIjauBHKZmm6Op1Wi44/jEvYYhlYWVO8X0vcuWCyLwApyymZfsoBmRlVi43g2
	 M3Ew0416/EvK6nhCnHWd9O15HbaZDdtQMpxUIwpjnXaMyzZVnbvHomvCCQrxil7Rgj
	 dosLgU373t3YA==
Date: Thu, 25 Jul 2024 00:54:12 +0000
From: Tzung-Bi Shih <tzungbi@kernel.org>
To: Guenter Roeck <linux@roeck-us.net>
Cc: Hardware Monitoring <linux-hwmon@vger.kernel.org>
Subject: Re: [PATCH v2 2/6] hwmon: (max6697) Drop platform data support
Message-ID: <ZqGiNLzO_lqunuZi@google.com>
References: <20240723154447.2669995-1-linux@roeck-us.net>
 <20240723154447.2669995-3-linux@roeck-us.net>
 <ZqD7mNVlulOfeCYW@tzungbi-laptop>
 <5ffd1dae-cff3-4837-a178-540b5507ea64@roeck-us.net>
 <ZqEgrzT-X8mRNPoK@google.com>
 <ef251040-2b7d-407d-b8fb-c558617fa5df@roeck-us.net>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ef251040-2b7d-407d-b8fb-c558617fa5df@roeck-us.net>

On Wed, Jul 24, 2024 at 10:40:20AM -0700, Guenter Roeck wrote:
> On 7/24/24 08:41, Tzung-Bi Shih wrote:
> > On Wed, Jul 24, 2024 at 07:25:31AM -0700, Guenter Roeck wrote:
> > > On 7/24/24 06:03, Tzung-Bi Shih wrote:
> > > > On Tue, Jul 23, 2024 at 08:44:43AM -0700, Guenter Roeck wrote:
> > > > > +	if (data->type != max6581) {
> > > > > +		if (of_property_read_bool(node, "resistance-cancellation") &&
> > > > > +		    chip->valid_conf & MAX6697_CONF_RESISTANCE) {
> > > > > +			confreg |= MAX6697_CONF_RESISTANCE;
> > > > > +			factor = 1;
> > > > > +		}
> > > > > +	} else {
> > > > > +		if (of_property_read_u32(node, "resistance-cancellation", &vals[0])) {
> > > > > +			if (of_property_read_bool(node, "resistance-cancellation"))
> > > > > +				vals[0] = 0xfe;
> > > > > +			else
> > > > > +				vals[0] = 0;
> > > > > +		}
> > > > > +
> > > > > +		factor = hweight8(vals[0] & 0xfe);
> > > > 
> > > > It doesn't AND with 0xfe originally.
> > > > 
> > > 
> > > Yes, but the original code uses the value in
> > > 	factor += hweight8(pdata->resistance_cancellation >> 1);
> > > 	ret = i2c_smbus_write_byte_data(client, MAX6581_REG_RESISTANCE,
> > >                                          pdata->resistance_cancellation >> 1);
> > > which is effectively the same. I can't just use
> > > 	factor = hweight8(vals[0] >> 1);
> > > because, unlike resistance_cancellation, val[] is an u32 array which would
> > > not auto-mask the upper bits.
> > 
> > If you are worrying about:
> > * MSB, it should be fine as it should only prepend 0s for right shift on
> >    unsigned.
> > * BIT(8), other `val[0] >> 1` should also share the same concern.
> 
> BIT(8) is the concern. Yes, you are correct, I'll change the code to
> 
> 	val[0] &= 0xfe;
> 	factor = hweight8(vals[0]);
> 	...

With that,
Reviewed-by: Tzung-Bi Shih <tzungbi@kernel.org>

Note: there is another `vals[0] >> 1` for MAX6581_REG_IDEALITY_SELECT.
