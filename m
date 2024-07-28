Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12005184D
	for <linux-hwmon@vger.kernel.org>; Sun, 28 Jul 2024 04:25:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722140744; cv=none; b=EJZeJX72gSwX0aOONfYUucdXB99+plzIxNe7nCrgpwM8lEM75k7g7chsT/egWDLr0qAJ5uk6FZfzIXGD2UZ/2isPRG5R5QTUTvzg4jSf/3wSDxFOm3ySePdPWUfXAi2uXQGGlWwyvxXOPsvoqd4gsPGeBm9wHo26UJ2gbr7XBL0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722140744; c=relaxed/simple;
	bh=ylRYMuM7ZnBfX911LkGZraVPuwJvg4/KWP+Y/CMpgOg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fNSX6hiw5n15ANtkA5pYplNUNMeOOo4tgfRi/uOZDAUsG//DK4FFJjmpRjeUYJswogAaWsco0FZL41xm+F+JoE9nBcodbpArI6kQCkmuTP0h+Pj1vT9snUf83Dt84z/mLAY4Y3yrTfRPArCLQAB1bGUhZYoS37zmchzROtPxbik=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=D2vpfemx; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="D2vpfemx"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F1C87C116B1;
	Sun, 28 Jul 2024 04:25:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1722140743;
	bh=ylRYMuM7ZnBfX911LkGZraVPuwJvg4/KWP+Y/CMpgOg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=D2vpfemxXTLYQqoCwT6R0MhHgR6yBlVajfzu6aY9Ijzm7pVM9V3qFbVNi0UmOJGNX
	 u5LW+BNsi1ZX1Q8N0vUGVRf31JYd2hPefOEtbT1qLJf+bfs0RsCi2WKdKP8EoPvPVZ
	 rmcnkv0nl6TrQQvP6DV3ZHFeH8TrSz70RT+MZgZ7VjDMz8D70OOURtqGDTbiKEDnAG
	 /uC7pHK3/1nidjB/x9xpwpTDpsxyGersHuq5vzy1DreEHVKYSdk8AUMlR8co7+imTQ
	 f8Cqax2H6IlYRSBv8GP+lVHlrK4a6kQfGqU6AKeNbYQqfwWg+w46IVpjbNP9o5nSEj
	 DdWeVjz2+L2Ng==
Date: Sun, 28 Jul 2024 12:25:40 +0800
From: Tzung-Bi Shih <tzungbi@kernel.org>
To: Guenter Roeck <linux@roeck-us.net>
Cc: Hardware Monitoring <linux-hwmon@vger.kernel.org>
Subject: Re: [PATCH 1/6] hwmon: (max1619) Clamp temperature range when
 writing limits
Message-ID: <ZqXIRDZnnI2THGbC@tzungbi-laptop>
References: <20240727143820.1358225-1-linux@roeck-us.net>
 <20240727143820.1358225-2-linux@roeck-us.net>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240727143820.1358225-2-linux@roeck-us.net>

On Sat, Jul 27, 2024 at 07:38:15AM -0700, Guenter Roeck wrote:
> Module test code reports underflows when writing sensor limits.
> 
> temp2_min: Suspected underflow: [min=-77000, read 101000, written -2147483648]
> temp2_max: Suspected underflow: [min=-77000, read 101000, written -2147483648]
> temp2_crit: Suspected underflow: [min=-77000, read 101000, written -2147483648]
> 
> Clamp temperature ranges when writing limits to fix the problem.
> While at it, use sign_extend32() when reading temperatures to make
> the code easier to understand.
> 
> Signed-off-by: Guenter Roeck <linux@roeck-us.net>

Reviewed-by: Tzung-Bi Shih <tzungbi@kernel.org>
