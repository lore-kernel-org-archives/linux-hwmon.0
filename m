Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9C9419ABCB
	for <linux-hwmon@vger.kernel.org>; Fri, 30 Aug 2024 12:30:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725021028; cv=none; b=uOugRp5U41z83Ous7LKUnMSf1zVAM7NMQ1s634yHxuyk661NlG7Uy+U+ilrF4iRNWK/ljDheuoaxfE7kUcMcguE6VYnapnfnfdvswt9fwLHUxVHANQezrihs8WKEoxpUXPZurDXALIQ7Tc7E1TW5SWdkTWRoH8ksNo1k3BEGHgc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725021028; c=relaxed/simple;
	bh=C8ND5SYDNfn/kc2M3dToNh+m2cBYqoS/yi15y8S9qC4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tUIfkwYQFWQ1BMhMd9CTO28q8kCjEfF3wUvcaRD+/BVOPB8b4vJ1+SVlTkWG6Db+MmJuALzmXTKcFKz21Yv7ZGl53WM+5JiGgW7lYsc4Ljt91K2IQz7EU6b2WAzsxbQxb1IvkohL0kSCyVlN51FzRK2pA9BPN0fAnQVTJpUbfHI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hakFvs0y; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hakFvs0y"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AFA91C4CEC2;
	Fri, 30 Aug 2024 12:30:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1725021028;
	bh=C8ND5SYDNfn/kc2M3dToNh+m2cBYqoS/yi15y8S9qC4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=hakFvs0yDbyWmmvTyEvy/hp9zONHmf7LsfBPvlr76iNWE0hxM1fI4qFYDwPbUc5cS
	 KJD/x1EEp+Q5ebgZI3w/Myu1wsPQdrKAUiUG6Kp1dweNEHuQAacGS2yQ+vuhLT5hkS
	 FC9Swf95TCCNiNMAPpRwgZwKPyiBnoeBJDp4Hp7fDoHbodBrkp6WbzNUXUcqVmmUBi
	 cON7o47hXux/pKWqtesbAi6cG9yBretCbXN2M8YGtjpd/bnwZNHvvy6vVMMi/VO9ae
	 5PAEln8oBPpuZZjOtPVvCyENvV21VBhrxKan1InvCSMwX8STtBvndScAWqLBtMYoGm
	 s/QcY+kEvy/YQ==
Date: Fri, 30 Aug 2024 20:30:24 +0800
From: Tzung-Bi Shih <tzungbi@kernel.org>
To: Guenter Roeck <linux@roeck-us.net>
Cc: Hardware Monitoring <linux-hwmon@vger.kernel.org>
Subject: Re: [PATCH v2 12/14] hwmon: (ina2xx) Pass register to alert limit
 write functions
Message-ID: <ZtG7YCXRA_eGp3p_@tzungbi-laptop>
References: <20240830010554.1462861-1-linux@roeck-us.net>
 <20240830010554.1462861-13-linux@roeck-us.net>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240830010554.1462861-13-linux@roeck-us.net>

On Thu, Aug 29, 2024 at 06:05:52PM -0700, Guenter Roeck wrote:
> Pass the to-be-limited register to alert functions and use it to determine
> conversion from limit to register value.
> 
> Signed-off-by: Guenter Roeck <linux@roeck-us.net>

Reviewed-by: Tzung-Bi Shih <tzungbi@kernel.org>
