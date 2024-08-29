Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 990BB1ACDF3
	for <linux-hwmon@vger.kernel.org>; Thu, 29 Aug 2024 14:53:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724943222; cv=none; b=DIwyx8HvtcBxMInOdILl1iGQvsS44YSaXfi2JViVyR0xaZkFXJSkt98T734KV26C9LP28HWAPKfrKeOc3inkdsYoSebu2KMS80rHAYZ5YiuRasr2n1f5xWynSlpPOP8MJ9dJphNsWi84JRrHjMZXnhOP9OVt8IH7Vwltn2j6Ay4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724943222; c=relaxed/simple;
	bh=3Jkj4HvTqS0blWXHKn0MLfrUweDjVycYCvAUH4Ek0C0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=d2q9jN+ONXS2pkT87LheWbh59fRTg0lzSd6T4Y/smjnGKiZe385BRZ1VtiZvDnV0fte+30MjqUGVCaopm59sf3kiT1/duJQP1Y07aTzNZNyWlz5+hGL+sWhyijLxiQzAxGsPv+KjQX/d8pGy3HFKDJ7nMH0k4K1nCPs8J2GDEIQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Q/0ykM6z; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Q/0ykM6z"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C3B01C4CEC1;
	Thu, 29 Aug 2024 14:53:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1724943222;
	bh=3Jkj4HvTqS0blWXHKn0MLfrUweDjVycYCvAUH4Ek0C0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Q/0ykM6ztfk1+ajAGx2454VG2XnCR1SdBKh1Roche0OTAsPKxalVI1MIYcdJVPVvT
	 hdvhCh5wMjzehdOGOj7Sxz4p7rDjQqWYLcekF5UHrBj6O5azB9eEcHTb1e2ns+Bybw
	 p6UyMO17wsBkrIO+anKf8ItBRhVjp2m0q3QJYtBHYyvqpDxq307DDnMK3OAvgdkAKe
	 hrij0usZv/CGb83YappuKL2JehnkXW6cNJHUJHWx70JMh/17YCZ1iYNrinTQhw/Sd+
	 Oh4Jpt+VBui72cvHDcsGr1H0wd9xSCA07nLiz/Ry1rNDxo7VErWJmHqKxP4fB+4YYG
	 0XMkUF0Hw/E0g==
Date: Thu, 29 Aug 2024 22:53:39 +0800
From: Tzung-Bi Shih <tzungbi@kernel.org>
To: Guenter Roeck <linux@roeck-us.net>
Cc: Hardware Monitoring <linux-hwmon@vger.kernel.org>
Subject: Re: [PATCH 02/11] hwmon: (ina2xx) Replace platform data with device
 properties
Message-ID: <ZtCLc86AgDs0kUqm@tzungbi-laptop>
References: <20240827153455.1344529-1-linux@roeck-us.net>
 <20240827153455.1344529-3-linux@roeck-us.net>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240827153455.1344529-3-linux@roeck-us.net>

On Tue, Aug 27, 2024 at 08:34:46AM -0700, Guenter Roeck wrote:
> There are no in-tree users of ina2xx platform data. Drop it and support
> device properties instead as alternative if it should ever be needed.
> 
> Signed-off-by: Guenter Roeck <linux@roeck-us.net>

Reviewed-by: Tzung-Bi Shih <tzungbi@kernel.org>
