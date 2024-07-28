Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C63E25745
	for <linux-hwmon@vger.kernel.org>; Sun, 28 Jul 2024 12:17:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722169025; cv=none; b=ahcUVEVjXFZN1uTtGGrZ4QEMGsMY0Wyzi3tU3/2TFBD7XdrLMfU3I6YCzopikrbt9Fi5w+SvCieZa5PipVr1UNixhocCssc85vvJJY2OsREPRIT9akiV1XNl5MDrvOzlzZp4xHRNl/lnh1zDXN1RrVy5dlkl9j9+RxPEPKiOmsc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722169025; c=relaxed/simple;
	bh=BLjbIOXnZ8pkh8+rYK7By90FhuBwuRNt6j7DU2WW3K0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZgAZeug57JsvgGoOtVwG5PBesyJr92bWh0wsuAn799p29lr7Am0kABwKxwlb48pXXZRZo9PCgn8ktETlm42bMY4GZ+sDj6xFOZoPAxRfrREUM4RoXMTJsop8SvRZ01V0I9EytNJupdHxjBF+UUx1S+suU4hPjRmpOqUdNT/VpyI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ctQeOTzP; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ctQeOTzP"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2CF54C116B1;
	Sun, 28 Jul 2024 12:17:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1722169024;
	bh=BLjbIOXnZ8pkh8+rYK7By90FhuBwuRNt6j7DU2WW3K0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ctQeOTzP5iB3IkCTJtaavrF5y5MQqsNJIwV6RzO1/o22Gwbnz4jYGNiXIVxHUL+3P
	 72fIAeZUi6W0NYE23SnAdUk0XmLtthqLtJuTiVBvwenwLgnKXqbgd6qZaAQAMm69p6
	 NdIT0WCiZX0ly00Cc1ekTO+1VYf9djNVAB+v4pzf7yyPTk0oDJGwb2fQpVfCIEIpvt
	 a6+OtEehxciO0FQ6w2XWMwJ8Q6zEs0U+tFSm3QF7t0AMDClKsIlT8S78FXth0h18zf
	 XkIfuEDjP9BoTDl5I/hS1bc+FsRv1W24Er0h0flP0wHGp0cmLfmwYfoCoODx+0fM8z
	 qv7i51CzTWTyw==
Date: Sun, 28 Jul 2024 20:17:01 +0800
From: Tzung-Bi Shih <tzungbi@kernel.org>
To: Guenter Roeck <linux@roeck-us.net>
Cc: Hardware Monitoring <linux-hwmon@vger.kernel.org>
Subject: Re: [PATCH 3/6] hwmon: (max1619) Convert to use regmap
Message-ID: <ZqY2vXjiJb51TVeA@tzungbi-laptop>
References: <20240727143820.1358225-1-linux@roeck-us.net>
 <20240727143820.1358225-4-linux@roeck-us.net>
 <ZqXIXfsOQ-39VMsy@tzungbi-laptop>
 <b421990b-3594-4a7a-af83-71c5f21891f5@roeck-us.net>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <b421990b-3594-4a7a-af83-71c5f21891f5@roeck-us.net>

On Sat, Jul 27, 2024 at 10:22:42PM -0700, Guenter Roeck wrote:
> On 7/27/24 21:26, Tzung-Bi Shih wrote:
> > On Sat, Jul 27, 2024 at 07:38:17AM -0700, Guenter Roeck wrote:
> > > +static int get_alarms(struct regmap *regmap)
> > > +{
> > > +	static u32 regs[2] = { MAX1619_REG_STATUS, MAX1619_REG_CONFIG };
> > > +	u8 regdata[2];
> > > +	int ret;
> > > +
> > > +	ret = regmap_multi_reg_read(regmap, regs, regdata, 2);
> > > +	if (ret)
> > > +		return ret;
> > > +
> > > +	/* OVERT status bit may be reversed */
> > > +	if (!(regdata[1] & 0x20))
> > > +		regdata[0] ^= 0x02;
> > > +
> > > +	return regdata[0] & 0x1e;
> > 
> > Why `& 0x1e`?  Original max1619_update_device() doesn't do that.
> > 
> 
> Bit 7 is the busy bit, and the other three masked bits are reserved.
> Maybe I should make that change in a separate patch. What do you think ?

Yes, please separate the change.
