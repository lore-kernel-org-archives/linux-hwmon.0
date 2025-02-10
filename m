Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A84D14885B
	for <linux-hwmon@vger.kernel.org>; Mon, 10 Feb 2025 05:34:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739165652; cv=none; b=JRZSc4Uw049ArgLRQG7tma6HLhnBwHmXfW2iz+EMmHw/uahAX71XRBiDztnJ6wihwbpmXSVlJc0XqjSLDl4GyhcKxopnOFONpzEs+Y25Y1y6m7c0j+bXeUAlBBlNdpwuT8MiyT/o1wnAXCUmf0jFNYvGocmBGLXd5hdsjD3xJHU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739165652; c=relaxed/simple;
	bh=JQ411L+KDHPrptu9aoUoUNzyd5PAlMc10WX9i4gcl74=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CGVixCo+EOvuhf6lNNpoEsLufO0I3tDCojrVrew2Q/1AJLV+XpA2YmcNMGTD6v10YDL8WwMNwJQc0a87q/EBswQSp60a25lHSgMKMG3e2AbsatvONEdrQuSZyjWJVYCOg+Z6psIO51TL9vd1vqZahhLvJmKkvac59N7EJT/mWt8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JMAgwxnV; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JMAgwxnV"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F2CFFC4CED1;
	Mon, 10 Feb 2025 05:34:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739165651;
	bh=JQ411L+KDHPrptu9aoUoUNzyd5PAlMc10WX9i4gcl74=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=JMAgwxnVgPnLkYPoEY33UwGJOasX0PA4vJBBAjTC6GI+cnH+3ENTRjxuJ56G1nExv
	 xAGWe0MOW7XqTtYARetn5b9O1k6cFeTd8LeI7i89H6GxHXydoCG40xXxpVYhVEC2Mh
	 KGwAk1Fw1MG2m0dpnmB1MKBHX6cPaO1ca0ODxkdjr6gLE19gIy2lEQP3kyI+5dODW+
	 n4lO0NiY0bUseZDmwldurpi2PLBcbK9x2i/HV1ZeIOs/EjhF1+lwkXBTR0iYQaM5dc
	 pEWSE2aKwvN1/mmyTMK+H0a2HDxrWYPFxs5J5AYmpyO9PAbmmEMIXakiq/zZjn8wqJ
	 krDoc1YWu7ETQ==
Date: Mon, 10 Feb 2025 05:34:08 +0000
From: Tzung-Bi Shih <tzungbi@kernel.org>
To: Guenter Roeck <linux@roeck-us.net>
Cc: linux-hwmon@vger.kernel.org,
	Wolfram Sang <wsa+renesas@sang-engineering.com>
Subject: Re: [PATCH 8/8] hwmon: (pmbus/core) Report content of CAPABILITY
 register in debugfs
Message-ID: <Z6mP0Mb-2kqumjHh@google.com>
References: <20250210040024.2296208-1-linux@roeck-us.net>
 <20250210040024.2296208-2-linux@roeck-us.net>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250210040024.2296208-2-linux@roeck-us.net>

On Sun, Feb 09, 2025 at 08:00:24PM -0800, Guenter Roeck wrote:
> @@ -3585,6 +3585,15 @@ static void pmbus_init_debugfs(struct i2c_client *client,
>  	 * assume that values of the following registers are the same for all
>  	 * pages and report values only for page 0.
>  	 */
> +	if (!(data->flags & PMBUS_NO_CAPABILITY) &&
> +	    pmbus_check_byte_register(client, 0, PMBUS_CAPABILITY)) {
> +		entries[idx].client = client;
> +		entries[idx].page = 0;
> +		entries[idx].reg = PMBUS_CAPABILITY;
> +		debugfs_create_file("capability", 0444, debugfs,
> +				    &entries[idx++],
> +				    &pmbus_debugfs_ops);
> +	}
>  	if (pmbus_check_byte_register(client, 0, PMBUS_REVISION)) {
>  		entries[idx].client = client;
>  		entries[idx].page = 0;

New device-specific entry.  The allocation size [1] should also change
accordingly: s/7/8/.

[1]: https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/drivers/hwmon/pmbus/pmbus_core.c?id=a64dcfb451e254085a7daee5fe51bf22959d52d3#n3537
