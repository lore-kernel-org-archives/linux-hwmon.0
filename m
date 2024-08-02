Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC543208D7
	for <linux-hwmon@vger.kernel.org>; Fri,  2 Aug 2024 05:12:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722575561; cv=none; b=NNQE+5h4dDihAAjheK+64c5PVOIsuWuyzCmqpwUBK0DOOAFYBnoc8d/2ObUJXlMyESJeNZnSI70RcsANmmqSl5HmJlqnPIU+RIpS0aqzVLuk1DwR4FdTKiom8yo9YA3RUqiITNsKK46WBtg0NjHJRBHQFYDevyVby69Trvm5OIg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722575561; c=relaxed/simple;
	bh=2wYcZzDjNmeHBT4vsGb1ZCNPNBDOR+XIT7JGbgU7tr8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NsrLQQsLY275mGpEs7juR3snSgdji6f/7lyE4K+xd+U+VsVpzlZAAEIZMEJ4edLTvofmtOEu28RDB/mOZuKcJWcwQThAFmMFMmH6ZBSuV5c+tqBUKgwLNl4cj759cI2cNDdhisswWaPrOrbCGdWFxlAX57lNW7/GZiKNU8WAjms=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=K9//P66E; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="K9//P66E"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1E3DDC32782;
	Fri,  2 Aug 2024 05:12:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1722575561;
	bh=2wYcZzDjNmeHBT4vsGb1ZCNPNBDOR+XIT7JGbgU7tr8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=K9//P66E8JrNYVSioxKaWtQ4sXVchl0Oa652Y1jUVhTikvWtbY9UqP4086jFim2Ad
	 pQIcJmCSk++9J9yfgBblHW25t7B5+llJc2QNojWZIsKgrE3xwqcxnptiGD9OgcThOk
	 pL3hRs+5wnvNMUNzKzBjmceiF/R8ySbWk6eDRf2Vp5HfTnbwHh1ITBtk/b/5EmhkO2
	 raAEoveDa50XFVJrcToecNcSDjd/HIN00V+PdMGrnD+ypjTKC+uq3QJu5D3BVwmuNf
	 laB1xQX9xp7WbbnfHJ3P97B/PUGJsAGTCbXPWNsBh3ggJtZuOFVs+RAZVj0x8B/FGZ
	 uWFp8zlH+jWLQ==
Date: Fri, 2 Aug 2024 05:12:39 +0000
From: Tzung-Bi Shih <tzungbi@kernel.org>
To: Guenter Roeck <linux@roeck-us.net>
Cc: Hardware Monitoring <linux-hwmon@vger.kernel.org>
Subject: Re: [PATCH 6/6] hwmon: (lm92) Update documentation
Message-ID: <Zqxqx8bZkYOtzUub@google.com>
References: <20240801144918.6156-1-linux@roeck-us.net>
 <20240801144918.6156-7-linux@roeck-us.net>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240801144918.6156-7-linux@roeck-us.net>

On Thu, Aug 01, 2024 at 07:49:18AM -0700, Guenter Roeck wrote:
> Update datasheet references. Replace misleading 'force parameter needed'
> with 'must be instantiated explicitly'. Explain the reason for the missing
> auto-detection. Mention all supported chips in Kconfig.
> 
> Signed-off-by: Guenter Roeck <linux@roeck-us.net>

Reviewed-by: Tzung-Bi Shih <tzungbi@kernel.org>
