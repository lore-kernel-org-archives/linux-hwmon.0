Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C898636124
	for <linux-hwmon@vger.kernel.org>; Sun, 28 Jul 2024 12:17:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722169033; cv=none; b=LREraaer0edgiueiOQ/FfokH34eAaSjASUpcahoPYhx42tmo4jaKDgZyWvx7s4QBoknMfDrPoJEWr+FH3yHeLxdTtnvcUmor4iMaCOztAn+1sZRAN+nrGYpINz+KjVTx8/u5E0lVA9vz6Ye8ICkJUQfHFvueIVXrrwV9kA7S4JQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722169033; c=relaxed/simple;
	bh=WGZp5svto0C6JU6uI8AUm3qwBYFcSQ7+28Pf3POBiRw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=orVQc+zUdEQW2+sHqs4jF61XRH28Du7fxKTFE/8R+/O54I8VqJjNUzPKELmmY6keNjPA6Z7r1PCIkj1MW2vtlD3dld0DE4XvzOa8Cxg77Yqa6Z9bYX2QAMFNwVEM/Tx9IktDWad8QstY4O0uh7bWGoPoxLbUaXH03HmeSAFe4aI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nnjR1OjR; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nnjR1OjR"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C3D60C116B1;
	Sun, 28 Jul 2024 12:17:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1722169033;
	bh=WGZp5svto0C6JU6uI8AUm3qwBYFcSQ7+28Pf3POBiRw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=nnjR1OjRfBBcHOJM7B0pymd6vaxd4G0WZgJTi9p+88omawSuHiksJO2lnz5RylCkk
	 G6gKcMr+I+zxHnB1ptNwNAeEea0v6Cm/vcBCJUryH5yVs6tgQz+tRu7vTzypiLwRIM
	 5akuluXQUpR27uZ9+rPCYZF1QwJ2wAS7WRcW2N11lSt4focLJCARMHiF7PKkIMNX0Z
	 RHM2y9anK0f1Bakl4GDE8a+Oo1RuO+M+RUuttuGOQOCuj+A+aWgEoobZAr7aR/1Ubd
	 4xWngL/gA0ebrcApVK1cLtQFa6SRrEcT05WjUiKwYcwVQ7vc7CbvQB0ql5fgl2Ammp
	 ivNOz3MNrQdQg==
Date: Sun, 28 Jul 2024 20:17:10 +0800
From: Tzung-Bi Shih <tzungbi@kernel.org>
To: Guenter Roeck <linux@roeck-us.net>
Cc: Hardware Monitoring <linux-hwmon@vger.kernel.org>,
	Jean Delvare <jdelvare@suse.com>
Subject: Re: [PATCH] hwmon: (max6697) Document discrepancy in overtemperature
 status bit values
Message-ID: <ZqY2xgkvdOgWKN4s@tzungbi-laptop>
References: <20240727202007.1656841-1-linux@roeck-us.net>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240727202007.1656841-1-linux@roeck-us.net>

On Sat, Jul 27, 2024 at 01:20:07PM -0700, Guenter Roeck wrote:
> In the MAX6581 datasheet Revision 0 to 3, the local channel overtemperature
> status is reported in bit 6 of register 0x45, and the overtemperature
> status for remote channel 7 is reported in bit 7. In Revision 4 and later,
> the local channel overtemperature status is reported in bit 7, and the
> remote channel 7 overtemperature status is reported in bit 6. A real
> chip was found to match the functionality documented in Revision 4 and
> later.
> 
> The code was fixed with commit 1ea3fd1eb986 ("hwmon: (max6697) Fix swapped
> temp{1,8} critical alarms"). At that time it looked like this was an
> original bug. It only turned out later that the problem was the result of
> incorrect information in the chip datasheet.
> 
> Document the discrepancy to avoid confusion caused by old versions of the
> datasheet.
> 
> Cc: Tzung-Bi Shih <tzungbi@kernel.org>
> Signed-off-by: Guenter Roeck <linux@roeck-us.net>

Reviewed-by: Tzung-Bi Shih <tzungbi@kernel.org>
