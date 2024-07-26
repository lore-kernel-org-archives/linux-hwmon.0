Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C2EF157A5B
	for <linux-hwmon@vger.kernel.org>; Fri, 26 Jul 2024 15:20:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722007253; cv=none; b=rZGGvBtDWlse26kiEcSxWmikX6urO1NXXnOXU2oK6RMGVCWxKr/xhTY0Hrq8jqQaE3fa+wTjPQkSOY7b2XErXjgRi2F4hEr0+hGym+ZXp1Q9fsIe1Ofn1ysXIcxjQesGeYdv4Ir+MC9eqiYd0x5Kz1J/JcUvj3qAMogfe1JixrU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722007253; c=relaxed/simple;
	bh=nUHvlFwMVfIe5TXyZQxIYLWNCDW7l/MtgftiBhBxBmc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NtBb1205RBS0aDV1cfc0GTaH4wwuD/P2rVX6AdwihMuxKwdGXVLQ5sN3ZZKZxGqSa7YRe685fIAVn7TFur4u4XFJTqU6U9+8XrZg61szz0v+Rg7YSRTp/cB9kbpBKG7S/5TYWJzL+E9ksFbwJwumq6+nUOT9qP9zyKmncfGfhOM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LkB+OUAa; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LkB+OUAa"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C80BCC32782;
	Fri, 26 Jul 2024 15:20:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1722007253;
	bh=nUHvlFwMVfIe5TXyZQxIYLWNCDW7l/MtgftiBhBxBmc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=LkB+OUAaGnIOa3Qwof6IHilry2Nn9CS7UXAYIwV0ViNmUk8Ln5U+6r1oLJ/PL8zOJ
	 33irq3FAIIbzrj66tiy0RPucc/7latoY1U2TSl7sLbWS1tLPInSZnvyHcprD+qVqmD
	 v7IFXPOjsY4PIlNPQypANi1kJR1sCBHQTOL3XpBZ9EDMa6m5ju2KA+cpBNMiSJwk59
	 nMrOMVX6d8STlduH3NWotarW3LWe6F8iZ8QOxFvrOhyYtSZbnmUcM2JVFrVKA9o+F2
	 6h8txwhiIM5XA3oiqhfKX4Et1KW6163dK44aDoCtnADtbYPQYvBtRYBRMqyK68TSUT
	 OzuaZ2Rd3V+2A==
Date: Fri, 26 Jul 2024 23:20:50 +0800
From: Tzung-Bi Shih <tzungbi@kernel.org>
To: Guenter Roeck <linux@roeck-us.net>
Cc: Hardware Monitoring <linux-hwmon@vger.kernel.org>
Subject: Re: [PATCH 4/5] hwmon: (max1668) Replace chip type with number of
 channels
Message-ID: <ZqO-0kElRE9I-7cx@tzungbi-laptop>
References: <20240726004329.934763-1-linux@roeck-us.net>
 <20240726004329.934763-5-linux@roeck-us.net>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240726004329.934763-5-linux@roeck-us.net>

On Thu, Jul 25, 2024 at 05:43:28PM -0700, Guenter Roeck wrote:
> The only difference between supported chips is the number of channels.
> Drop enum chips and list the number of channels in struct i2c_device_id
> directly.
> 
> Signed-off-by: Guenter Roeck <linux@roeck-us.net>

Reviewed-by: Tzung-Bi Shih <tzungbi@kernel.org>
