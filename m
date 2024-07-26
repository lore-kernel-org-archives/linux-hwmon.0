Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 269CC157A5B
	for <linux-hwmon@vger.kernel.org>; Fri, 26 Jul 2024 15:21:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722007263; cv=none; b=IZsnYH1yP5JDeLyrTeZBKZeOV+bZLX0m7bw2n1Fmv7lEvJqOjCs1Wd6x+n+YQ1OgKB7AFvBV35X7RXjcu/SlcCIY4gg2pm1KX/J4mkINKDvm7qyFKjp8LU4NuAddhdiJJeefhawmFnlasiLI2PpZ07vdOaa3AkqiBApVwXpSo0A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722007263; c=relaxed/simple;
	bh=5p9FsZYZ4En/3mSslEkw2ws+2r3HSave97JFu4Tiv7o=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NWaiFJN9h8nJjhWYaBSsjxRXBRn8W4Y7QPVMS2r1Io+n7HikiUb6Gjj6FbtljjRdoJDFUbrK8+eo8B/sr/Ae44uSqs9dxuKrf1T9w7Gew/FvYOm7GtibFuuN1b+xDeDiNLON2ArsrkdHjCSDdvdwlhCjN/Tuf/RNYBW6xO42xnw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=juMzT+sT; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="juMzT+sT"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1E58BC32782;
	Fri, 26 Jul 2024 15:21:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1722007262;
	bh=5p9FsZYZ4En/3mSslEkw2ws+2r3HSave97JFu4Tiv7o=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=juMzT+sTD7lmHWxuFhP/zIKP3M5jk3OcrtHDBvP1r+2t/7jS7buKmFlv5JYNP7aUx
	 T8JHg1a3W+eA3VgJA9/2aMKQ0ZYM0lfoOBzCr/+b8UkZCx5LZJj0KDvEa79Rr1Jo1g
	 4s8fx1gSeRtes60KQN/mOOHfylaffj4UZz9SlkG07v/yxn6obU5y9t5K0CcbfVcz+G
	 no63E73h+ceC/E6Iebs79OPlika1IoDGPKniKiSRCOAMBp1ALSz0/Z4FpTPMLNl8Pr
	 98yrDTO2VsDB+yYvRoASuXb+jIDCI0Qzkb8aP/amSgpE4tZ958TIGLa1y4nzeRrTKX
	 gIFjoq8uyIKxg==
Date: Fri, 26 Jul 2024 23:20:59 +0800
From: Tzung-Bi Shih <tzungbi@kernel.org>
To: Guenter Roeck <linux@roeck-us.net>
Cc: Hardware Monitoring <linux-hwmon@vger.kernel.org>
Subject: Re: [PATCH 5/5] hwmon: (max1668) Convert to use with_info hwmon API
Message-ID: <ZqO-212BImGMuGn-@tzungbi-laptop>
References: <20240726004329.934763-1-linux@roeck-us.net>
 <20240726004329.934763-6-linux@roeck-us.net>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240726004329.934763-6-linux@roeck-us.net>

On Thu, Jul 25, 2024 at 05:43:29PM -0700, Guenter Roeck wrote:
> Convert to use with_info API to simplify the code and to reduce its size.
> 
> This patch reduces object file size by approximately 25%.
> 
> Signed-off-by: Guenter Roeck <linux@roeck-us.net>

Reviewed-by: Tzung-Bi Shih <tzungbi@kernel.org>
