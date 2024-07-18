Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54EBA156CE
	for <linux-hwmon@vger.kernel.org>; Thu, 18 Jul 2024 01:29:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721266145; cv=none; b=kAd/iuFzZunQ8c+CI6nk9tz7oNXmZ+u0LjpwdNcFUS9wNKRtaQrSI5b0Yg2s275j56dw0+KotVVLPgv+cQ9fLjiIue1cu/NhynliJcUN+wxOmo/pRs3EOq6kP3fmVaijaV6KS6RRIGCfT1A0Wip62D5wUHNFHslMm7QlJlhBauo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721266145; c=relaxed/simple;
	bh=5BTBKRNkcYHADHZLhjo0ThyflLkDIXg8PH3AGsdXafQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dajL2cE/n9/tldNBaFrkcdda+1qsiEm6CqFiEz8KPv4waacJnA1j5CLsCK9bxFeU0DUFtMBUACoSoUrz4t2A2X9rpYJo0zchhCoE4y3P4+khksS2S5yRQLQoQksJxgarEIKJcikSG01Vh1bxSp+sska+AJGW1dtGRKYOlC/aHiE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=oF16zRHA; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="oF16zRHA"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8C744C2BD10;
	Thu, 18 Jul 2024 01:29:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1721266145;
	bh=5BTBKRNkcYHADHZLhjo0ThyflLkDIXg8PH3AGsdXafQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=oF16zRHAAQHcP1LXdS22pdkO1mdEE/1sStTzoUf9eXnKa5xZTPhOkee+CE1+SIBeB
	 FHM5a0YqdjGduoYI22v9HvNXY0nVW9QZLtQBxXJtT7lJao0+jaXPCn08EvCaPmwXlQ
	 xmWD9qXoBNqt7G8ww2Ne6Tyqx/tgKlNSFw+O6SmLgEXMROqpAy5gQrYU4YLe4h+I/P
	 MYNyDQWRAV/tWi3kdQh/0usVgdi8fC7tT1oyTIS46/luINx1kBaQpKbaZhMteA1M14
	 DaOTNff9zdGAdA4rwouvv6nyF51IEq+czLOOiT7n6+CDz8oUrxOZpze7a8RQwBlhl0
	 ZiYy61mopWcPQ==
Date: Thu, 18 Jul 2024 09:29:02 +0800
From: Tzung-Bi Shih <tzungbi@kernel.org>
To: Guenter Roeck <linux@roeck-us.net>
Cc: Hardware Monitoring <linux-hwmon@vger.kernel.org>
Subject: Re: [PATCH 4/6] hwmon: (tmp464) Use multi-byte regmap operations
Message-ID: <Zphv3kGeqX7LUgY0@tzungbi-laptop>
References: <20240716230050.2049534-1-linux@roeck-us.net>
 <20240716230050.2049534-5-linux@roeck-us.net>
 <ZpfIqtrclTDsTy0x@tzungbi-laptop>
 <4b195103-5f8a-4251-8612-7ec51f07bd2d@roeck-us.net>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <4b195103-5f8a-4251-8612-7ec51f07bd2d@roeck-us.net>

On Wed, Jul 17, 2024 at 07:37:10AM -0700, Guenter Roeck wrote:
> On 7/17/24 06:35, Tzung-Bi Shih wrote:
> > On Tue, Jul 16, 2024 at 04:00:48PM -0700, Guenter Roeck wrote:
> > > @@ -147,11 +147,11 @@ static int tmp464_temp_read(struct device *dev, u32 attr, int channel, long *val
> > >   {
> > [...]
> > > -	mutex_lock(&data->update_lock);
> > > -
> > >   	switch (attr) {
> > >   	case hwmon_temp_max_alarm:
> > >   		err = regmap_read(regmap, TMP464_THERM_STATUS_REG, &regval);
> > > @@ -172,26 +172,27 @@ static int tmp464_temp_read(struct device *dev, u32 attr, int channel, long *val
> > >   		 * complete. That means we have to cache the value internally
> > >   		 * for one measurement cycle and report the cached value.
> > >   		 */
> > > +		mutex_lock(&data->update_lock);
> > >   		if (!data->valid || time_after(jiffies, data->last_updated +
> > >   					       msecs_to_jiffies(data->update_interval))) {
> > >   			err = regmap_read(regmap, TMP464_REMOTE_OPEN_REG, &regval);
> > >   			if (err < 0)
> > > -				break;
> > > +				goto unlock;
> > >   			data->open_reg = regval;
> > >   			data->last_updated = jiffies;
> > >   			data->valid = true;
> > >   		}
> > >   		*val = !!(data->open_reg & BIT(channel + 7));
> > > +unlock:
> > > +		mutex_unlock(&data->update_lock);
> > >   		break;
> > 
> > I think the function can entirely drop the mutex.  Only [1] needs it.
> > 
> 
> It is needed to protect updating open_reg. Otherwise a second process
> could enter the code and read the register again, which would then return
> different (cleared) values. As result open_reg might contain the temporarily
> "cleared" values.
> 
> Process 1			Process 2
> err = regmap_read();
> data->open_reg = regval;
> 				err = regmap_read();
> 				data->open_reg = regval;
> data->last_updated = jiffies;
> ...

Ack.

Reviewed-by: Tzung-Bi Shih <tzungbi@kernel.org>
