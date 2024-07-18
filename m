Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 698BF7407A
	for <linux-hwmon@vger.kernel.org>; Thu, 18 Jul 2024 16:39:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721320799; cv=none; b=rLBfiHK80sPxcDFxWNswT5sp8cKeLwtJPE0VKqr0ITcwetSM06Shim/4sBNZz6QY+K/7xCFaHlDAKG57oEXwiYtrlQ0k6zCZXe2sDoAEOaqwSVltMGP43CEBeBNKWJ45+GkyxQ3A+wjFIuzgDnAcIJWOhbRKTD6CP7tO62ybnE8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721320799; c=relaxed/simple;
	bh=iGmFjtzOHX6iRsaFZDkdKCvn+Vgt+s4eksfCgR0iCBM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UMPqhvK2DATvMUkIGKX4HrGqRjs4CRjPQ+CH86QDahWsz4e/jMPpaIGPitWgOytOlXe4//hhbD+icQfBSslagasdHcvMwbu3wO7ES9IsEjOhk248IT/KmHuA4d9997UHTR6tMUN13wQ1HQuobnNk7XDnFd6mzZyWedBMyO8PtPI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=XhuezsW3; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="XhuezsW3"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 438D8C116B1;
	Thu, 18 Jul 2024 16:39:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1721320798;
	bh=iGmFjtzOHX6iRsaFZDkdKCvn+Vgt+s4eksfCgR0iCBM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=XhuezsW3OP87bMnBedTiP9hCN4N73FmBUmXYgT7DLo4u3TTgDr+jcqBabXRIjjyBD
	 Nzy6F07o9rEuXrvHngZhYANIct0lmlpC1Y6kQANU1ogo2XbRt0Y/zjhOEVb5dDu9mN
	 8f4HqYVP6JHWtyTyfRg7lbVbDvlMhD1plF4aO2xSR0EZoj0vXYC1vXYdxqrW5W111t
	 VIjq4BuzL8CBtjfRvxYN1XNYse2B/RmmQdO14fZpDwOapmLBet+0H98Iiy+xqPFdI0
	 nX8/oTUJcEFobriYf2QHl25wIUD1NavEuSudrhqA5W6YE2vhHOLr5FILtlMVUWT2jZ
	 +QrKLe9q9OQTQ==
Date: Fri, 19 Jul 2024 00:39:55 +0800
From: Tzung-Bi Shih <tzungbi@kernel.org>
To: Guenter Roeck <linux@roeck-us.net>
Cc: Hardware Monitoring <linux-hwmon@vger.kernel.org>
Subject: Re: [PATCH 2/6] hwmon: (lm95234) Use find_closest to find matching
 update interval
Message-ID: <ZplFW4rL5qhxbT0M@tzungbi-laptop>
References: <20240718033935.205185-1-linux@roeck-us.net>
 <20240718033935.205185-3-linux@roeck-us.net>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240718033935.205185-3-linux@roeck-us.net>

On Wed, Jul 17, 2024 at 08:39:31PM -0700, Guenter Roeck wrote:
> @@ -471,10 +472,7 @@ static ssize_t update_interval_store(struct device *dev,
>  	if (ret < 0)
>  		return ret;
>  
> -	for (regval = 0; regval < 3; regval++) {
> -		if (val <= update_intervals[regval])
> -			break;
> -	}
> +	regval = find_closest(val, update_intervals, ARRAY_SIZE(update_intervals));

The behavior changed.

static u16 update_intervals[] = { 143, 364, 1000, 2500 };

If val = 144,
* Originally, regval = 1.
* After applying the patch, regval = 0.
