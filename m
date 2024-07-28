Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19CD3184D
	for <linux-hwmon@vger.kernel.org>; Sun, 28 Jul 2024 04:26:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722140787; cv=none; b=AFLE/HUQJrstzPTR5Gi3qtmooUkCFAWHXqd2MWi900KcV6OFUUwT9axrvgUyhjWVY2oNPnDbhrpNsPtQmQr2SZRHrdboedG3CAuQatE/O3DN1QFVFM4WvHiyrSe+pU+NkLtqen4wWZaA4Seu1Q2NbKGTnFRojnJqIeFydpfarNo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722140787; c=relaxed/simple;
	bh=37nL65mWK6AZtWf+AmTvvoTJzq42LpxOYV08Dlx5mg0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=iLzYaM/nE2vjTaZBKvxbLXXGiYhWnLmpo12MRR9AtmTv7p2Y9+qx59rdQiTeQ3aHN5quIrzLJD8aUj3zLuxIubfLDLaikpm2HvSYfD5fko+dd4XLE8uzt3qV5I+5t4dIAj/37ZefqVxRFzHLbfpndXSeMfS/7e51KQW4UjwkeXo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=M4OxgnGr; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="M4OxgnGr"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4B7C4C116B1;
	Sun, 28 Jul 2024 04:26:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1722140786;
	bh=37nL65mWK6AZtWf+AmTvvoTJzq42LpxOYV08Dlx5mg0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=M4OxgnGrg+MT4JVLvIcYDdxmmT+jDAjR8BucMk5DOiKZTmBzv86HAXsZapde43GAH
	 t6StyEvh++gGEl3rJ1D5m6d968SbI7MCOradiAKEYTykuhKedbDfvkkrlb1sW0Kwyg
	 QHlXE/o1Orned86Xv0TuvTOn/qx2TnnWt8KALWAuBJNSximtznjDBujajfglCutfFq
	 BTlx42ZXWVE5dbVAzv9/goLJxG2cn92SiLxeEPavbUEeYlYf75loGoQ2RVMlN6lDOv
	 EIUxzjcPHd32iZlFxIop6hMDzx44qqbb8VkubIZdNs6zpB5ckWEnB1rnnRcT30SfV6
	 PbBRWBFt+v0Vw==
Date: Sun, 28 Jul 2024 12:26:24 +0800
From: Tzung-Bi Shih <tzungbi@kernel.org>
To: Guenter Roeck <linux@roeck-us.net>
Cc: Hardware Monitoring <linux-hwmon@vger.kernel.org>
Subject: Re: [PATCH 5/6] hwmon: (max1619) Add support for update_interval
 attribute
Message-ID: <ZqXIcMw1dVOFv2m_@tzungbi-laptop>
References: <20240727143820.1358225-1-linux@roeck-us.net>
 <20240727143820.1358225-6-linux@roeck-us.net>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240727143820.1358225-6-linux@roeck-us.net>

On Sat, Jul 27, 2024 at 07:38:19AM -0700, Guenter Roeck wrote:
> The chip supports reading and writing the conversion rate.
> Add support for the update_interval sysfs attribute.
> 
> Signed-off-by: Guenter Roeck <linux@roeck-us.net>

Reviewed-by: Tzung-Bi Shih <tzungbi@kernel.org>
