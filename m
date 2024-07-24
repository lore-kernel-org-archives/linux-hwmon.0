Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4CFD1152196
	for <linux-hwmon@vger.kernel.org>; Wed, 24 Jul 2024 15:41:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721835698; cv=none; b=lapV9Cl0oBZMp0xG7vWPKQk3GHD+k5IZYtaA5/CuMkpx/tZAjkP/ugN7lWtq+rEIsR4IpqAGQZI02lnKfhZTXImsyu8awulfGoo2o7Go29e472suC8cdyiB/zPdbdIoTUQU0xHhlRs8OwWL7mLjoTGpHfApDPuuf5YF1gqbcSeM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721835698; c=relaxed/simple;
	bh=qVWRI0xBaozlTEiIOD8KZDekiXhMRP9R6b4Ext8jF+c=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Hp7aHVc5uxBAokAcyOq47+NwqWPigYYEncHDp1y+zV9YDpCTx4rGKPBWpPqk3Y1SajhJG9reaHnQign5yRPpFiib6Y0hIhsZ4m9n/F8o6fTHlYWr+vGrgQ0iaXT8Bdr2v8+PGbM+za432UwfCep8CQJ9hpiXenrYU/gZAXMRR8I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ehsEGPBA; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ehsEGPBA"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 60091C32781;
	Wed, 24 Jul 2024 15:41:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1721835697;
	bh=qVWRI0xBaozlTEiIOD8KZDekiXhMRP9R6b4Ext8jF+c=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ehsEGPBA2JoyjwUAEGaIIcDZgheX5O3NZo16RJ6apL/5ZmdBxmw5bvA1L4bnUAUk4
	 kRFXfSVWxMXiyVDOahF9GLvgnRb4ckw3cn+qhEsUvI9/TGb3Lb4/243sDqDQvX3hdf
	 o3JFlu4jqRqsO7eX62c/EhQNmqDQH4T9ddSEST7Cwo6+b+ofNNovkZOlD54UTUW+0i
	 pnqr8mUdZF79+ZM5dqxr1BWfxytCNYHB3KDhG3CdkbfzCgit3uqlxk1rVpmsvYbax6
	 1gSbSojSOYaDYXRKFIMSxwdtj/fXaQCkvGm8LwBuvYVXf09E77Yt1ov3Ag6j56jf04
	 eXqpm5wXuzsrg==
Date: Wed, 24 Jul 2024 15:41:35 +0000
From: Tzung-Bi Shih <tzungbi@kernel.org>
To: Guenter Roeck <linux@roeck-us.net>
Cc: Hardware Monitoring <linux-hwmon@vger.kernel.org>
Subject: Re: [PATCH v2 2/6] hwmon: (max6697) Drop platform data support
Message-ID: <ZqEgrzT-X8mRNPoK@google.com>
References: <20240723154447.2669995-1-linux@roeck-us.net>
 <20240723154447.2669995-3-linux@roeck-us.net>
 <ZqD7mNVlulOfeCYW@tzungbi-laptop>
 <5ffd1dae-cff3-4837-a178-540b5507ea64@roeck-us.net>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <5ffd1dae-cff3-4837-a178-540b5507ea64@roeck-us.net>

On Wed, Jul 24, 2024 at 07:25:31AM -0700, Guenter Roeck wrote:
> On 7/24/24 06:03, Tzung-Bi Shih wrote:
> > On Tue, Jul 23, 2024 at 08:44:43AM -0700, Guenter Roeck wrote:
> > > +	if (data->type != max6581) {
> > > +		if (of_property_read_bool(node, "resistance-cancellation") &&
> > > +		    chip->valid_conf & MAX6697_CONF_RESISTANCE) {
> > > +			confreg |= MAX6697_CONF_RESISTANCE;
> > > +			factor = 1;
> > > +		}
> > > +	} else {
> > > +		if (of_property_read_u32(node, "resistance-cancellation", &vals[0])) {
> > > +			if (of_property_read_bool(node, "resistance-cancellation"))
> > > +				vals[0] = 0xfe;
> > > +			else
> > > +				vals[0] = 0;
> > > +		}
> > > +
> > > +		factor = hweight8(vals[0] & 0xfe);
> > 
> > It doesn't AND with 0xfe originally.
> > 
> 
> Yes, but the original code uses the value in
> 	factor += hweight8(pdata->resistance_cancellation >> 1);
> 	ret = i2c_smbus_write_byte_data(client, MAX6581_REG_RESISTANCE,
>                                         pdata->resistance_cancellation >> 1);
> which is effectively the same. I can't just use
> 	factor = hweight8(vals[0] >> 1);
> because, unlike resistance_cancellation, val[] is an u32 array which would
> not auto-mask the upper bits.

If you are worrying about:
* MSB, it should be fine as it should only prepend 0s for right shift on
  unsigned.
* BIT(8), other `val[0] >> 1` should also share the same concern.
