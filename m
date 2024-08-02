Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80CE51C2BD
	for <linux-hwmon@vger.kernel.org>; Fri,  2 Aug 2024 05:11:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722575517; cv=none; b=f5PFIy4qBSt6qC58T6HZLaM/cI+9agSytp0y9t7h6Sxq/4VfFp1kX1dR4oEj6SQTFd7aPaQo+YXP4nPNTXd02CLTTjTMkpwajxAhuWsGL0xwdjvJTG7N4e1E692lbtSl5ZglylWyhf3eJt5FfKWjCqBqegeulTfFBzwLC/6j1f4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722575517; c=relaxed/simple;
	bh=TfhS0E76EwV+C8XzlJfZ9Yy9XXawgiIewIAyEJcqk1w=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jqITY8mnoxTpDiNq76o/m51a1zLXHZsxUnBTsquhV3tO95CyDsm/O2HCY7FgBVlneMB5Davz6T5nJo+JdFpnD6kfmftkRLsin6N0m9q45R60Vc1T0CsbxwrMNe/EwNgpQFHbvuMR7NrAl3Pjzfn2n9QLZZQHnzKtP5zZwk4JKGM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fODeM35A; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fODeM35A"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 82F8AC32782;
	Fri,  2 Aug 2024 05:11:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1722575517;
	bh=TfhS0E76EwV+C8XzlJfZ9Yy9XXawgiIewIAyEJcqk1w=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=fODeM35A11D9KDdBPDMQri6AP2tP2zU+9WQwdz1vY/k5KfeX9BwxXOmv6C0Ggak8x
	 7+ym8izyH4tssxWQzx9lh+OqAiz68Cg8sNCrpalVrkiN7Z1UGoJYaJtDfzm5Kv+2J3
	 SNiNrGMcx4ifibpfZVXO9oGg4xHhr8TVrrPXbwBHMlxT6HHUeu1KrqncMFgNV3z4me
	 knURgajxB3GAfho19E8xcj33xTUYIxPocXnwvr/rfobySUgdwZTxmEh9+zmdf/We0W
	 TT7oFOHOuWOZksWDN5V3zumGp8KRztBK/FaxQMceeL5jEwvhMB0vo0KWj5O4ciK5zE
	 ngNwKcIk6zPZw==
Date: Fri, 2 Aug 2024 05:11:54 +0000
From: Tzung-Bi Shih <tzungbi@kernel.org>
To: Guenter Roeck <linux@roeck-us.net>
Cc: Hardware Monitoring <linux-hwmon@vger.kernel.org>
Subject: Re: [PATCH 1/6] hwmon: (lm92) Improve auto-detection accuracy
Message-ID: <Zqxqmkuqd1K1oUlK@google.com>
References: <20240801144918.6156-1-linux@roeck-us.net>
 <20240801144918.6156-2-linux@roeck-us.net>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240801144918.6156-2-linux@roeck-us.net>

On Thu, Aug 01, 2024 at 07:49:13AM -0700, Guenter Roeck wrote:
> Checking three configuration register bits and the manufacturer ID
> register to auto-detect LM92 is a bit vague. Repeat twice on replicated
> register addresses to improve detection accuracy.  Check the manufacturer
> ID first and bail out immediately without reading the other register if
> there is a mismatch to reduce the number of i2c transfers needed in that
> case. Also explicitly test for an error from reading the configuration
> register to avoid potential situations where the returned error masked
> against 0xe0 is 0.
> 
> While at it, drop "lm92: Found National Semiconductor LM92 chip" detection
> noise.
> 
> Signed-off-by: Guenter Roeck <linux@roeck-us.net>

Reviewed-by: Tzung-Bi Shih <tzungbi@kernel.org>
