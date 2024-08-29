Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 306BF1AE05A
	for <linux-hwmon@vger.kernel.org>; Thu, 29 Aug 2024 14:54:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724943249; cv=none; b=Vlwz/SmqN7M3tDrbLK4rENa1XAtYOhZ/pzAGC/ZfU499Uvtltgo6iN3FAAoNTwP0XOmZuTwtbt3qc5rglvaDUOKezJ9Ba9g7526zSNk3tA6y08gVfl7QQBlLyQt7lM1kq++OaPXo4Cb96by0v31NxWQiLybu+qE2Nb9XZikHv/Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724943249; c=relaxed/simple;
	bh=3qhIiwFT+QjjCHQKOpj5qDpotFVxzxEbZgmiVtn+4q8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CJ0djUU5UEudUWYungOuiEDgl9NoWzxu8xR2iBNGFSdtfbFXV0dcvQ7o8scEFOuyyV7Jq0hWPeFnljtN8tbHtsFz/3Aaa26mXrghH8uPmKplVhk9OJzar6zkFmpT6hB13hKTPtspmaHofFU3QbFYH9NI+Mwg8nA7+/k3QcptBIE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=qheXs+9P; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="qheXs+9P"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6DCE6C4CEC1;
	Thu, 29 Aug 2024 14:54:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1724943249;
	bh=3qhIiwFT+QjjCHQKOpj5qDpotFVxzxEbZgmiVtn+4q8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=qheXs+9PEQxirg5n/vBCPL6EbPRLHjK7bCjiuedl0l1mhkrXnZhtrHhANcWokHVE+
	 Sh/wlpYF96oz75M/z13uO1h/zGg2khNw+bmfLG5Sc3z9Yn50lAgKIE9dgOBiC/GX9c
	 xDs2iChU3GS147r5h9s9tLlDrUjhyMbsrevjSsC/XvoHcYrlNABEuVeHwQyhKDWg09
	 TpWTq49Ge+5uWXxfuaIrGWBpUXixuY2V/Yrv/SPOORw31vjd5Q5r7b+rUhRoA3L8QD
	 mbJI+OA8sTjkNkgJnkhH+dlONs2qxp0NQ9wyP+fzeZidHvzBA3gRV2b2RH4Kw9droq
	 Ei5VYO7pL12dg==
Date: Thu, 29 Aug 2024 22:54:06 +0800
From: Tzung-Bi Shih <tzungbi@kernel.org>
To: Guenter Roeck <linux@roeck-us.net>
Cc: Hardware Monitoring <linux-hwmon@vger.kernel.org>
Subject: Re: [PATCH 04/11] hwmon: (ina2xx) Mark regmap_config as const
Message-ID: <ZtCLji0GiNhoA5PB@tzungbi-laptop>
References: <20240827153455.1344529-1-linux@roeck-us.net>
 <20240827153455.1344529-5-linux@roeck-us.net>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240827153455.1344529-5-linux@roeck-us.net>

On Tue, Aug 27, 2024 at 08:34:48AM -0700, Guenter Roeck wrote:
> Doing so reveals a potential problem in the driver: If both supported
> chips are present in a single system, the maximum number of registers
> may race when devic es are instantiated since max_registers is updated
                     ^

> in the probe function. Solve the problem by setting .max_registers to the
> maximum register address of all supported chips. This does not make a
> practical difference while fixing the potential race condition and reducing
> code complexity.

It also makes regmap could access out-of-boundary (e.g. [1]).  Is it harmless?

[1]: https://elixir.bootlin.com/linux/v6.10/source/drivers/base/regmap/regmap-debugfs.c#L441
