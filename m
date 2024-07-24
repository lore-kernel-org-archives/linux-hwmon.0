Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 053F7158A27
	for <linux-hwmon@vger.kernel.org>; Wed, 24 Jul 2024 13:03:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721826204; cv=none; b=H4c4SC2OpuKSUOQIJ2H8y22TH+4Eg0Z5UtoHsRdQyXmPqbbgYyzhwQNtTGou+N4o5y1YwmIDM3FGVlyhy5ZH0//hTdpiOPRe9PlXduqIaTeJhV14dL/0ERyt6VGfWeNSJjLRsGEqxLq4xbJ1zRvuhsWvF87Irx0m6+a9D2p+7UY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721826204; c=relaxed/simple;
	bh=p88CXbJyvRwKuRtjtTIV5TRfa5OmrEw95z+Uync/rMs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZMoFNYB6vsiYFiPts3yQCMiTWRT9FD0fLwFQMRUW1OaK5MBLpnFkfY9i9tqBCXI/O9t7RXa/39k5N5kt8e6UcE16UzADZWUvS0CQhX/PJxZZnS6N5HGnS3xPL0538o+dRNStcpd0/R2WxsQGyi5JY+fDm8vsmrWoy8rhVFHnM0Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=epkLbL5F; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="epkLbL5F"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F0F4FC32782;
	Wed, 24 Jul 2024 13:03:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1721826203;
	bh=p88CXbJyvRwKuRtjtTIV5TRfa5OmrEw95z+Uync/rMs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=epkLbL5FcdFuvEemSE2HbiDtSE/L6SSagADK+95zbHyxLzPPWuGiMaMvz8J6JsL+A
	 j0G7O5Fa4e90V8aXRtpUPT+Vb1kKDgoOLG+ii8qaO3RIjtUyps343ZtbwN8FNMScPc
	 ZgnALgvlEj2MZ0HkQcSOppxnYf8pcqPeH4Mn2ZFBt9orcUR9tQxAQL/1PAuePjCvMc
	 pzqL1YDv6bfPtgfj+Rc8w/exjBqp7aiMNtTnEdXwmka5YMZBuImxtwAgvqQ0oJOue5
	 3ZAby8hwEMqz0/uuTA/3Gy2VOHD9uuGyVC9CJYhnoKXpc40aW9czQv+222FiLK2HqQ
	 FG37DuMz7qAgw==
Date: Wed, 24 Jul 2024 21:03:20 +0800
From: Tzung-Bi Shih <tzungbi@kernel.org>
To: Guenter Roeck <linux@roeck-us.net>
Cc: Hardware Monitoring <linux-hwmon@vger.kernel.org>
Subject: Re: [PATCH v2 2/6] hwmon: (max6697) Drop platform data support
Message-ID: <ZqD7mNVlulOfeCYW@tzungbi-laptop>
References: <20240723154447.2669995-1-linux@roeck-us.net>
 <20240723154447.2669995-3-linux@roeck-us.net>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240723154447.2669995-3-linux@roeck-us.net>

On Tue, Jul 23, 2024 at 08:44:43AM -0700, Guenter Roeck wrote:
> +	if (data->type != max6581) {
> +		if (of_property_read_bool(node, "resistance-cancellation") &&
> +		    chip->valid_conf & MAX6697_CONF_RESISTANCE) {
> +			confreg |= MAX6697_CONF_RESISTANCE;
> +			factor = 1;
> +		}
> +	} else {
> +		if (of_property_read_u32(node, "resistance-cancellation", &vals[0])) {
> +			if (of_property_read_bool(node, "resistance-cancellation"))
> +				vals[0] = 0xfe;
> +			else
> +				vals[0] = 0;
> +		}
> +
> +		factor = hweight8(vals[0] & 0xfe);

It doesn't AND with 0xfe originally.
