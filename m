Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DBC58F49
	for <linux-hwmon@vger.kernel.org>; Mon, 10 Feb 2025 05:33:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739165633; cv=none; b=YoQiGbQQwKFC+fCkNDdKntxK8v1OngR3vRPS5BNXmTc3kPDIuLM0EDPwrewfHeOCqoxCUE1jyFrWrIBwlfZsHOzVV11KsDTiA3YTLt1dI8qkLU6ReI/mCk9/ESgEqjyjte+Dp+I5optlaw2HappV5xVsKD4ijNIRIoHpr/TsHLo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739165633; c=relaxed/simple;
	bh=29S7i7s9iaOuTDHXbg7EdMTuhxv6j0lQk/sq13qUKMs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=g/K6ZWM2E2uiSXDvxwamc+wu9LCoHhrirIBg/hUrIs4GJX8mrQ2B8fblwC/eVhmmZuVzQM+0ctPXUpybjfX1cT0v+FEkHEbwGgBuBRtlz2EY9wsk8/wtX0Z8+y8NkfDUjHNSsNTxLneBEnJtlxPUUMOMle8XMpnfr96W2RjWdbc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=X++yJXbb; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="X++yJXbb"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F0390C4CEE4;
	Mon, 10 Feb 2025 05:33:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739165632;
	bh=29S7i7s9iaOuTDHXbg7EdMTuhxv6j0lQk/sq13qUKMs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=X++yJXbbdvfZ1opVjp7ApJxw78xCt6qYQ3jVxUWUZvBfbADAgIm1A4XN2zlJIZu69
	 BgM2DbqYhB6NCosxyjIHX5SBscn469mjKCk3ckS60RSgx4ywyAL4dyHFEf8NBwy6WO
	 7z/zfNMmkUsbDRzGwBgRLJ3QyeXQFD6NEzsEP+Cbda9KJmcMvO7SXO8i3FnoLX67py
	 QLXyKCa4hASpxtCwQp4r86A84hVyxhS7rw6F1c6noIcS4nJ5zDPDwMHfx+EvYUgYiC
	 f09fp5ITYPh0eGzQtV3G6atez8sytWNR7dId57qSIJcWXFRT/hoewVV/Ws85qDTmxA
	 ShL+/HVKW1Cww==
Date: Mon, 10 Feb 2025 05:33:49 +0000
From: Tzung-Bi Shih <tzungbi@kernel.org>
To: Guenter Roeck <linux@roeck-us.net>
Cc: linux-hwmon@vger.kernel.org,
	Wolfram Sang <wsa+renesas@sang-engineering.com>
Subject: Re: [PATCH 7/8] hwmon: (pmbus/core) Optimize debugfs status
 attribute initialization
Message-ID: <Z6mPveKYm-8qzORh@google.com>
References: <20250210040024.2296208-1-linux@roeck-us.net>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250210040024.2296208-1-linux@roeck-us.net>

On Sun, Feb 09, 2025 at 08:00:23PM -0800, Guenter Roeck wrote:
> Define debugfs attributes used to access status registers in a data
> structure and loop through it instead of creating debugfs files
> one by one. This reduces code size and simplifies adding additional
> attributes if needed.
> 
> Signed-off-by: Guenter Roeck <linux@roeck-us.net>

Reviewed-by: Tzung-Bi Shih <tzungbi@kernel.org>
