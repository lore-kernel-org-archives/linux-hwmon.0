Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A04381DFFC
	for <linux-hwmon@vger.kernel.org>; Sun, 13 Oct 2024 15:22:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728832924; cv=none; b=qrlMmxyGWbJCJwak9dQlXD8Yexni+hMb3AU7W1PPuafzoYtJnkebYTFPoUknsXM5TOwynKMwf8404M0xOWVnyFkkDFs40cQHpHtF8t2kCMNcdZ1BY1cVs41KpgyUx6+FOoJZOJuHVUTIdaXqLF2mhWc8bAPYIeqkEJsuVGIAs/8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728832924; c=relaxed/simple;
	bh=dK3JzNA2GQOPAaTNsmbjepXaw6zSlC9Qa/37I8M8pyM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LqeYBUml8S8r+8W6aZxfpd+9zKUehMErAizzmBWfoXN7lE9HjbJja3AIY5eJZna9qkNygbuY8f5Mu64ZRA19VtGJK+qJ24hypqM3vxhT+oMIFwYJI6UcpGCHuzK0OQUB6sDsROKAF9NhV3IVi10VoUZ7urNJAi5qhYkjReKC5Yg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=hqtE28TR; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="hqtE28TR"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BD6CFC4CEC5;
	Sun, 13 Oct 2024 15:22:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1728832924;
	bh=dK3JzNA2GQOPAaTNsmbjepXaw6zSlC9Qa/37I8M8pyM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=hqtE28TROI+CLhw4OTRt+pG78Ku/vDxTvWdtqh/jOYFCVXzsLosv27eL9atvKst9G
	 FktripkVpdLp8YEa/r68LtY+M5Pmj/zLtmxISf0Iy22rGTlmO7vRRRvyOY2fhEUUWv
	 +vFnenflNEPgNcmP72gcDJAI4FvS+Hwmwfk9UL0s=
Date: Sun, 13 Oct 2024 17:22:00 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Akshay Gupta <akshay.gupta@amd.com>
Cc: linux-hwmon@vger.kernel.org, inux-kernel@vger.kernel.org,
	linux@roeck-us.net, arnd@arndb.de, naveenkrishna.chatradhi@amd.com
Subject: Re: [PATCH v4 4/9] misc: amd-sbi: Add support for AMD_SBI IOCTL
Message-ID: <2024101329-suitor-humpback-21ca@gregkh>
References: <20240912070810.1644621-1-akshay.gupta@amd.com>
 <20240912070810.1644621-5-akshay.gupta@amd.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240912070810.1644621-5-akshay.gupta@amd.com>

On Thu, Sep 12, 2024 at 07:08:05AM +0000, Akshay Gupta wrote:
> +	switch (msg.cmd) {
> +	case 0 ... 0x999:
> +		/* Mailbox protocol */
> +		ret = rmi_mailbox_xfer(data, &msg);
> +		break;
> +	default:
> +		pr_err("Command:0x%x not recognized\n", msg.cmd);

You now just allowed userspace to spam the kernel logs for no good
reason :(

Also, always use dev_*() calls in a driver, not pr_*() ones, as then you
will know exactly what driver/device is sending out the message.

> +		break;

And you returned the wrong error code if this happens :(

greg k-h
