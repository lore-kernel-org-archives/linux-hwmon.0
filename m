Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE83622318
	for <linux-hwmon@vger.kernel.org>; Sat, 13 Jul 2024 15:22:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720884169; cv=none; b=bP/csOh/dibXAe4RWDNTUMB16Hg3CFzZzl83SdUIvNFy4O/twCOLcNC56+pFHseppdivZyhN8fqfmRhAUkuNtaCHpaJ8z0Q3EPWYBklwzoLpSFm4kkq/NvKvEqRW6lz1dU/eFBHVi+niMT1lWlfjq2qULrjvNQvNz54PYgRmAO0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720884169; c=relaxed/simple;
	bh=yiYaGfn4AHJzZY9FELJtb1H8CJRRhBaubh+Op3l3QMw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DxwLF2Sl30ERhk/JLuzd23+De1G7lbU8oaTfv20RP+ciu8/wO54wxHYjIRYCBbUrghhKBM48nRWdljTMPp0OxkcULIJd95xvRYFZ3TTeCBd/5SOw5KkRuuUpnY4CxXQSSEMvySHDQfVXwB2IH9sALIWirmAy2SQiNrI5pvbp5uo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=k4L42GR5; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="k4L42GR5"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 71418C32781;
	Sat, 13 Jul 2024 15:22:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1720884169;
	bh=yiYaGfn4AHJzZY9FELJtb1H8CJRRhBaubh+Op3l3QMw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=k4L42GR5fbGhqHl+9FZAENcM58dGmzXPoEdX+u/7NHhJq660ERJLg3hTeUTwCIchj
	 woKW1eSq8G4cGlkohBgAB97/wNeRs1hUDmwfAGNvJQOTQffKSanz7L+oaobL4WnERz
	 DctJvMz70yhlQJZgMdpQtFNg4N7jHA42jkkpDxaiUcZfBTk7mX3jBHhjrZBTTgfNHE
	 A4AvICEToGhI9S//bMEn7uB7KaQl2A09ma71Tg032aBDXRMBsRzPly8A0gFdSr8alY
	 aOMSlfBucZmNEFP3XgAMACMjsje9vdvKalr71aAnU25k8cMDWoPM8fqquRHI6KIeKr
	 qyJph1+GI8TCw==
Date: Sat, 13 Jul 2024 23:22:45 +0800
From: Tzung-Bi Shih <tzungbi@kernel.org>
To: Guenter Roeck <linux@roeck-us.net>
Cc: Hardware Monitoring <linux-hwmon@vger.kernel.org>
Subject: Re: [PATCH] hwmon: Remove obsolete adm1021 and max6642 drivers
Message-ID: <ZpKbxZf6TOqid1cP@tzungbi-laptop>
References: <20240712173548.3556699-1-linux@roeck-us.net>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240712173548.3556699-1-linux@roeck-us.net>

On Fri, Jul 12, 2024 at 10:35:48AM -0700, Guenter Roeck wrote:
> diff --git a/drivers/hwmon/adm1021.c b/drivers/hwmon/adm1021.c
[...]
> -static const struct i2c_device_id adm1021_id[] = {
> -	{ "adm1021", adm1021 },
> -	{ "adm1023", adm1023 },
> -	{ "max1617", max1617 },
> -	{ "max1617a", max1617a },

The device ID "max1617a" only in Documentation/hwmon/lm90.rst but not in
drivers/hwmon/lm90.c which results in max1617a is no longer supported after
applying the patch.
