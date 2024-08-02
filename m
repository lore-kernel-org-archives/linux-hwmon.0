Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 775BF1C2BD
	for <linux-hwmon@vger.kernel.org>; Fri,  2 Aug 2024 05:12:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722575544; cv=none; b=ZQf46nxLgt9dxpI00Di7SwMwJjfrOz/o5FfdBCd0TtGv9CcUKg8agHZ8XOFc/0/nC7HTPVCReKmQ0OiuH1yNhqBeE3aCVc1dgO972ULZIywF5pzJ5GKTrbvXBZSWNrJ0GGN8Xd3LYnq3fjJGAQq9QglCZLz+6zI7hGiAbG4szno=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722575544; c=relaxed/simple;
	bh=hh1m91j5OKNdENtOoeL6PmwiBwBYt4H7Oc8De1PnScE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CgDq+0IL+0OdcP3+/T8jPIJj042oCpRIzHC6ZzJUcFq3jWOT4T3u4BkrspStEf/WgV8LPSthSWz9iJoSHyZrVPY91AN6Xzxo8N6toq51MXHImCf9gOYhUIWeeAJ7j0ahU2vLmtFCA8+ke4h2lgHZTNBjD+KJxU9eaWhrV0Ao7Jc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=O70vq6q6; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="O70vq6q6"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7DFD6C32782;
	Fri,  2 Aug 2024 05:12:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1722575544;
	bh=hh1m91j5OKNdENtOoeL6PmwiBwBYt4H7Oc8De1PnScE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=O70vq6q62H1qUQHOsDK76G5rHz5eQUZNcZXkIjccDqLU1SFuz99PDAyxXRF3DdIUW
	 jN5C5vdgc889O9EojuzrWsopVjj0r07nYzNg8t9g7J5mDEALIyK6/Ojg9jKrsWDl1E
	 yLjzwT2gZjuqGOESxHc9ahxgTcpfmoRaPe4cisoJ3BTgSuWnRTmj401VLvAOZcTuV1
	 FFL+l8wvOgu/Cr1C9UULqwA6MR1hhKjUyR9I1Bdb5eXqTE5eLcemcAlNEk03Ay9ew9
	 XAMABh6y0vqwg7ZF6/rzdIqioU4FDYlinJTrYtKrV7nxW3b/yMH0SdGbu/e2/nBhr/
	 WrMPwrxEb9gjA==
Date: Fri, 2 Aug 2024 05:12:21 +0000
From: Tzung-Bi Shih <tzungbi@kernel.org>
To: Guenter Roeck <linux@roeck-us.net>
Cc: Hardware Monitoring <linux-hwmon@vger.kernel.org>
Subject: Re: [PATCH 4/6] hwmon: (lm92) Convert to use regmap
Message-ID: <ZqxqtVKrI0Iub8Gg@google.com>
References: <20240801144918.6156-1-linux@roeck-us.net>
 <20240801144918.6156-5-linux@roeck-us.net>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240801144918.6156-5-linux@roeck-us.net>

On Thu, Aug 01, 2024 at 07:49:16AM -0700, Guenter Roeck wrote:
> Use regmap for local caching and for multi-byte operations to be able
> to use regmap API functions and to reduce the need for locking in the
> driver.
> 
> Signed-off-by: Guenter Roeck <linux@roeck-us.net>

Reviewed-by: Tzung-Bi Shih <tzungbi@kernel.org>
