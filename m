Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A2A1ECC
	for <linux-hwmon@vger.kernel.org>; Fri, 19 Jul 2024 00:52:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721350360; cv=none; b=cR2Dfw/W5Jp4eEbvE0X7rgZ2QPVU8JH0+9oqTqBZmad0pcBnt9o2kmJgZJC70tDDKHJ1RXSwAFTevZ2yYRbwibKIwQUaVeDfZ2uHC42Bc1u79ndwpKS2CbTTMkD1NlRvvjgeX63s3Wz6Bl3scLDxBmFjwvlKpKRwAqV0NOZsxvI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721350360; c=relaxed/simple;
	bh=MZ68SnrVUQyFllWO+PQszu6Z2QS7KsMYLY2ui4hnd8g=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YVe2A6G2+IFXdRE58SKSF8cIjDMTk2EbsLlCkrnreXVF82dNts3oEDt/TmDFvOTY6eWxYmMiZboGSR28hFJ8NQsCXyfrmS3Nt7AQt0YRxiBRKJgQY0QKyqE8CeigZjppBIVIQV3NVwBia8F7tgo5W0GX38jfs6j2Ashe9Mch1Lk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=haHUVYzZ; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="haHUVYzZ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8E7A4C116B1;
	Fri, 19 Jul 2024 00:52:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1721350360;
	bh=MZ68SnrVUQyFllWO+PQszu6Z2QS7KsMYLY2ui4hnd8g=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=haHUVYzZs3yhIEDkgi893B5ji5d1xMQ5a8PNeOytezWLv91R0zzoKZ4Ocijs6A7Ws
	 g2V98Sf94peu7tMNZvriSKg/YwrHjRhm+MrPZVGYGtcqnRVy6zXhlyM9Vtw87Rw6BZ
	 Jl+0e1iRB6ghbwoz2zuX8MvjNugqDi9g2AMpfqAW+EYRrXJXT9RT9skTiZHE1ygiVp
	 uuGNr+FGaB/zJ88quLRq4jzleodpWpa5oN5+7Dgv7H91O1mS2i+FNesnO4UTwZ+768
	 4S9vjgSjFyKHwCFfJaFwV9CSAIDAWVUpA03fOczV9D50dbwuncup2Vc+ZXwVoYDbeO
	 3VmHkdyPm1iVQ==
Date: Fri, 19 Jul 2024 00:52:37 +0000
From: Tzung-Bi Shih <tzungbi@kernel.org>
To: Guenter Roeck <linux@roeck-us.net>
Cc: Hardware Monitoring <linux-hwmon@vger.kernel.org>
Subject: Re: [PATCH 2/6] hwmon: (lm95234) Use find_closest to find matching
 update interval
Message-ID: <Zpm41WyZ_i5PhHK_@google.com>
References: <20240718033935.205185-1-linux@roeck-us.net>
 <20240718033935.205185-3-linux@roeck-us.net>
 <ZplFW4rL5qhxbT0M@tzungbi-laptop>
 <c241f1cf-7388-4021-86c3-45fce9df9e0f@roeck-us.net>
 <1242332a-b979-4284-9af4-1b76c9fb41ef@roeck-us.net>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1242332a-b979-4284-9af4-1b76c9fb41ef@roeck-us.net>

On Thu, Jul 18, 2024 at 10:53:19AM -0700, Guenter Roeck wrote:
> On 7/18/24 10:48, Guenter Roeck wrote:
> > On 7/18/24 09:39, Tzung-Bi Shih wrote:
> > > On Wed, Jul 17, 2024 at 08:39:31PM -0700, Guenter Roeck wrote:
> > > > @@ -471,10 +472,7 @@ static ssize_t update_interval_store(struct device *dev,
> > > >       if (ret < 0)
> > > >           return ret;
> > > > -    for (regval = 0; regval < 3; regval++) {
> > > > -        if (val <= update_intervals[regval])
> > > > -            break;
> > > > -    }
> > > > +    regval = find_closest(val, update_intervals, ARRAY_SIZE(update_intervals));
> > > 
> > > The behavior changed.
> > > 
> > > static u16 update_intervals[] = { 143, 364, 1000, 2500 };
> > > 
> > > If val = 144,
> > > * Originally, regval = 1.
> > > * After applying the patch, regval = 0.
> > > 
> > 
> > 
> > Yes, find_closest() rounds the value instead of using the lower match.
> > That was intentional. I'll add an explicit note to the commit message.
> > 
> 
> I added this to the commit message:
> 
>     Since find_closest() uses rounding to find the best match, the resulting
>     update interval will now reflect the update interval that is closest to
>     the requested value, not the value that is lower or equal to the requested
>     value.

With that,
Reviewed-by: Tzung-Bi Shih <tzungbi@kernel.org>
