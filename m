Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 696191CA84
	for <linux-hwmon@vger.kernel.org>; Mon, 10 Feb 2025 02:22:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739154142; cv=none; b=i+5rV7XFfDoWPXpxySgpT7BJmC0SNWBYoXetFKXGyMsXq2WSzbTnpVpM6vTNSnkEZygoBy4Aczyfb3dy3+Bx459uYilxoOGghYpvsMomhVP6s2K4wIUnLeI1nNaNx6KBkZtK7gQaQvcuq3BebkYd9R0kXryVoKjdJ1jHQ6FIym0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739154142; c=relaxed/simple;
	bh=KFVKYDVEQU1IVchWjnpR/LUeRbMkbIe0eenUzxCT9xY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YitP1ccoXVTHZCK7FzBPo+G2ZF91XWyvX18sW8Wc+iXqNqPLeT10L13fvULL+z6OFaxb+SYKFXSyLudG0U0y5NN+MQlSC8etYdg3EhT1l99fADshm0+ZiZH0co/SLZCyjv10Lm4oxSLOHU+4NSfcQ2/B3bM0feGp7Ujkc++tQ+g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=b0/TCwIh; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="b0/TCwIh"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 25E67C4CEDD;
	Mon, 10 Feb 2025 02:22:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739154141;
	bh=KFVKYDVEQU1IVchWjnpR/LUeRbMkbIe0eenUzxCT9xY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=b0/TCwIhk5TILZAV3phTZ4fnh/A+uO+GRXsGkeZ98L4L4QNoJ04a2xTBjeyd4ALz9
	 bK3to1mB6KS6Xl3O9ttb3J1kdIaRE4WFZW50s9WcldIkEOD0HWkWz8L6Z7ZC4JYRVh
	 adgtG4BY+Y2YIumgOwCdclrGCzNuoAI1basqqpDDSz1Cuer/uZMRBVN2mb4YR5kDuC
	 aE2beWsqmXIgYrlXa/dANSgcvF2Zh2LVFnvUdmeSKJeA//WK7lrrkJMi5iCWW60fl2
	 aiL+1K9jbBcr1AA5Uk2e0i02SESeunJlTSmtLy6P69r4PEACQo69HRf0uQr4jOzCrC
	 ckxm+C9j/jeEg==
Date: Mon, 10 Feb 2025 02:22:19 +0000
From: Tzung-Bi Shih <tzungbi@kernel.org>
To: Guenter Roeck <linux@roeck-us.net>
Cc: linux-hwmon@vger.kernel.org,
	Wolfram Sang <wsa+renesas@sang-engineering.com>
Subject: Re: [PATCH 5/8] hwmon: (pmbus/core) Declare regulator notification
 function as void
Message-ID: <Z6li22nUy1wweMH7@google.com>
References: <20250209012617.944499-1-linux@roeck-us.net>
 <20250209012617.944499-6-linux@roeck-us.net>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250209012617.944499-6-linux@roeck-us.net>

On Sat, Feb 08, 2025 at 05:26:14PM -0800, Guenter Roeck wrote:
> The regulator notification function never returns an error.
> Declare it as void.
> 
> While at it, fix its indentation.
> 
> No functional change.
> 
> Signed-off-by: Guenter Roeck <linux@roeck-us.net>

Reviewed-by: Tzung-Bi Shih <tzungbi@kernel.org>
