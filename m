Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 533D21B250C
	for <linux-hwmon@vger.kernel.org>; Thu, 29 Aug 2024 14:54:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724943259; cv=none; b=USgKrGLdCr2EosLC+TAtdyWFEtEdivs7CqZDsr/UG086aLxQQBU4avKtZq3jzP/33B+JH3/+urYJuywuQqHt6noFFrkyEPQ+gdKBxsT6d/6UCKmg0kfer57iTGa+3MqNMTfgV8O0wMfkQbbZs7w/dMmNMRU/95oCsKiZyovatiQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724943259; c=relaxed/simple;
	bh=J9LbG+bmGpglVQv9JUr+99bejhZNKJSvOJXJf7xE7ac=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=f3f3UnADdZzuFg2K3L1zenk9FIDluCcf1fTRfgLmyWysAZq/lGW03Y3mLswxaBnO3QUzK4x6Dv+xDT9P2QCwD2YJ1JFN+zESYSPfd25sKxsUmpw+XXZHwiRE/hREhuJo3Z6ueDj/ECnK07jpoRVI3Kq4Ib9covZXmJ0apMfS25c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=u7+EqNMJ; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="u7+EqNMJ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2B1C1C4CEC1;
	Thu, 29 Aug 2024 14:54:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1724943258;
	bh=J9LbG+bmGpglVQv9JUr+99bejhZNKJSvOJXJf7xE7ac=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=u7+EqNMJAfFHIyMOW2TurWx2VhM+BLJGkZYciG+i/Y325mvTfoTyRETp/7v9+Gzr0
	 jnMUx3oUjkcC7ovf9qhqvw6F0cbi1Xq9EpEHLd0QvnKB2LOrU3qP2mm9cb4Sp8afDJ
	 6FnoOcU++W+udgm2GzX5YoOzaMebtqV5YRcs8SA9JdBHuYGZ7d70VvohciEWHz3dhc
	 dEFSYzSlZnIvAQCRJehh6xgvQdjDzxA4oMXa+KunAobfv5AuxaDyrcot0cwDLeW4Go
	 qAhmFlQHroF+Cz7L+M49fpkC1KTJOgL3G7RQNy1Yuuw/aX3MtGNsyZWNR7aFsXhvRZ
	 CtKbtXbpxLqzg==
Date: Thu, 29 Aug 2024 22:54:16 +0800
From: Tzung-Bi Shih <tzungbi@kernel.org>
To: Guenter Roeck <linux@roeck-us.net>
Cc: Hardware Monitoring <linux-hwmon@vger.kernel.org>
Subject: Re: [PATCH 05/11] hwmon: (ina2xx) Use local regmap pointer if used
 more than once
Message-ID: <ZtCLmI1_NHPsHXD5@tzungbi-laptop>
References: <20240827153455.1344529-1-linux@roeck-us.net>
 <20240827153455.1344529-6-linux@roeck-us.net>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240827153455.1344529-6-linux@roeck-us.net>

On Tue, Aug 27, 2024 at 08:34:49AM -0700, Guenter Roeck wrote:
> If regmap is accessed more than once in a function, declare and used
> local regmap variable.
> 
> While at it, drop low value debug messages.
> 
> Signed-off-by: Guenter Roeck <linux@roeck-us.net>

Reviewed-by: Tzung-Bi Shih <tzungbi@kernel.org>
