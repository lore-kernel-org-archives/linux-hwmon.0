Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06F7F134B6
	for <linux-hwmon@vger.kernel.org>; Tue, 23 Jul 2024 05:37:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721713076; cv=none; b=BEx6lRKPdHI2CTZAAzQp4NzeoOOG5NyrStE+lVHjIoHPCN6OyELpkWZcbbkNYD/DbXzjORDl6ZNxbpfzh5cE6xv4eFSiJSwnRD08mlA3BNjEatZFqw/F8atY35M1sMSk/LUcMfIAKwbkVMD6NlMeyhXN1d5fFpzf5HYjMiKTPaU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721713076; c=relaxed/simple;
	bh=v+4+umEltXv+ZeO/39ljelljeVUdxtTnh9HB7VChqZE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SVj2HolgoZYjdcdlxo9dy2Acn2mwlxSJkCabmGVJWGmZgqVC09a+AwBa7UWl6kCKfUg8iNlRoi1ll5KzcIE6jeJd50V9j1cmK2A9oAun6XTCrToPu8TLYBpXxKs+ufsRVuFCSD90/ZI+B+V62RVPITbNzUyEf/w0HUNbbHSWH/s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KSGrzc5/; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KSGrzc5/"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E9945C4AF09;
	Tue, 23 Jul 2024 05:37:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1721713075;
	bh=v+4+umEltXv+ZeO/39ljelljeVUdxtTnh9HB7VChqZE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=KSGrzc5/c9omvtTuhwNhves41ha1ZhS4IxAqyonohy1ZlB9CSMq4asMKQvyBIHLFv
	 J62AKKWSoftuQ80B9eea9AeT0TuWrNJXkmyEDmvKed7fneqpDp38hRYIJ4zkk+LSj4
	 02BRQf9pMTxf1CJgmIN3hAYkTvNPRAOJmm2jeEexGk8zTBfNeRhyawupdmd28K1hGs
	 raFyYg1WpYC6+IzH6a9rbiuA4FDvbTEJMZFkwogHC68hLqjU7XEe9N9zOE/gPHDuc1
	 oEOYCb5109s18FRWPcxPKyul9CUqKFTlfK/LbDUBKJ2avptC3j3im4I81VG+7WlO8v
	 QZ+OCu2Q3WqUA==
Date: Tue, 23 Jul 2024 05:37:53 +0000
From: Tzung-Bi Shih <tzungbi@kernel.org>
To: Guenter Roeck <linux@roeck-us.net>
Cc: Hardware Monitoring <linux-hwmon@vger.kernel.org>
Subject: Re: [PATCH 6/6] hwmon: (max6697) Add support for tempX_min and
 tempX_min_alarm
Message-ID: <Zp9BsWeEPcCkuq6E@google.com>
References: <20240723005204.1356501-1-linux@roeck-us.net>
 <20240723005204.1356501-7-linux@roeck-us.net>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240723005204.1356501-7-linux@roeck-us.net>

On Mon, Jul 22, 2024 at 05:52:04PM -0700, Guenter Roeck wrote:
> MAX6581 supports setting the minimum temperature as well as minimum
> temperature alarms. Add support for it.
> 
> Signed-off-by: Guenter Roeck <linux@roeck-us.net>

Reviewed-by: Tzung-Bi Shih <tzungbi@kernel.org>
