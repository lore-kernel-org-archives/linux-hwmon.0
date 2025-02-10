Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2119D1CA84
	for <linux-hwmon@vger.kernel.org>; Mon, 10 Feb 2025 02:22:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739154131; cv=none; b=F/OQXnC2xSTxuFSIIaW1vELEe3ISSf4LFE/tq0o1aOipGIuT/z24p59bkl8I7WgTeeNM43V5bmZlxYusv08NzQCgl7+kyFM43g/G97Ky3x/xFzipl8NDprYeQtufFMsJoZTG2XreK78RMmhVCDjYYa6dB+2HF75xfiWktimFgoU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739154131; c=relaxed/simple;
	bh=LVjjkuYSrz4fivka0EFtZbRtlQ8awI+4GyTcC0pzj8I=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=asg34HZeNnmVnm60AyprocmQkAd//Uy8Lom4Nfq6NJ14vE60eOvBtE9p3gbrVtdac1Jy9vLxQC3iHs4pcpSTIvTs3GOScqcb37p4hBqF9XX5LZbSvML9clRY0pK1sTybC/SHSc+QcLTpwzBP9L/lH3yTT5rNPba3qT75dzoPUMY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=g/KiWi2l; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="g/KiWi2l"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BC951C4CEDD;
	Mon, 10 Feb 2025 02:22:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739154130;
	bh=LVjjkuYSrz4fivka0EFtZbRtlQ8awI+4GyTcC0pzj8I=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=g/KiWi2lMvPXKumeKZI2HQyMFsx6tMpNLE0BDlYv9UZjeETJvOKvIkekTYOAEiJWc
	 31Etz91TpxiVEUGCw0Z7/xMB8DWrCSY1dhHfPIxQQSQ/AQuyd/AdMEQgaI2Lyk39Hc
	 1/NFwwcgt+yfAeP8kWkgFsTCzKkC/rQYwDwVNOAZ9tbxMpGvAyc7clyix9wtT6T8hc
	 m4fhyV3/OTEJQR5y3xHhg2MNd9o/lxUHdMRm3k02pM2BA/AtpLe2EwSsPxYdMl4T/h
	 40hkXkIuSWkcLxHW4oJG7KS+maOeg1gWq3XIait4KzZkPQ5Xl379K4aaLRZllwREFB
	 caC67nPaXhb7A==
Date: Mon, 10 Feb 2025 02:22:07 +0000
From: Tzung-Bi Shih <tzungbi@kernel.org>
To: Guenter Roeck <linux@roeck-us.net>
Cc: linux-hwmon@vger.kernel.org,
	Wolfram Sang <wsa+renesas@sang-engineering.com>
Subject: Re: [PATCH 4/8] hwmon: (pmbus/core) Make debugfs code unconditional
Message-ID: <Z6liz_SvA0iXFL2x@google.com>
References: <20250209012617.944499-1-linux@roeck-us.net>
 <20250209012617.944499-5-linux@roeck-us.net>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250209012617.944499-5-linux@roeck-us.net>

On Sat, Feb 08, 2025 at 05:26:13PM -0800, Guenter Roeck wrote:
> Drop contitionals around debugfs code to compile it unconditionally.
> In practice it will be optimized away by the compiler if CONFIG_DEBUG_FS
> is not enabled, so the code size is not affected by this change.
> 
> Also silently ignore errors if debugfs initialization fails.
> 
> Signed-off-by: Guenter Roeck <linux@roeck-us.net>

Reviewed-by: Tzung-Bi Shih <tzungbi@kernel.org>
