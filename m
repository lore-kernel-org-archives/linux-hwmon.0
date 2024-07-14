Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6BA061758D
	for <linux-hwmon@vger.kernel.org>; Sun, 14 Jul 2024 07:06:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720940785; cv=none; b=B6IN5VnaL2egT4XTNz1xqp6mM5t7xZ2YoGXMGOU9yV0JYS7UBFzdQP00bSQBtymjLWDSWRgkVim5CseTZcL2z5f9pBShXU6iw3D1mef9ZBmXd9XMOYKvXCDxXlXeowr0zeUlidpHxKstDlRRhHuYKkQLrHi3A+FdF8LaQi3Fv20=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720940785; c=relaxed/simple;
	bh=Y0gr5FDtQs9/DdQtuNzL2/qcRzy+o/RFxgc+FDcw88c=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PSAz8MyOPi9sxzcguwznY09DzYnp728W/0VbmwxOdx65GreETcAkf1GpOzJLLX3cMQTL7bmy0r3zww1EllD/2TxaCOjZkjAi9d0tqZ0i33i62fYJmJhr0UkSTLFoBmv9BhSGQtB3KtbE/LFJIicV4kXlomePmfnudtB+6OTIp0o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=sWTwat6A; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="sWTwat6A"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 95FB6C116B1;
	Sun, 14 Jul 2024 07:06:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1720940784;
	bh=Y0gr5FDtQs9/DdQtuNzL2/qcRzy+o/RFxgc+FDcw88c=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=sWTwat6A/XM4kGxmE/yHf9ptHieeZp2m9j3AEks7fZMWlNdrMpivdhP/htnn8sBxg
	 5OekUq5ohiJlFJWInGjtB7g0FYtpVJQvQckmJNFeI49VsecJAQxaOuCspEh5n5Oyaj
	 iTCX1twCaj+TsBGGy5WSj09tdVmVo0z4HfZhpXBrqFKI8xzR5od3hDAyWz+r2PYtNd
	 m9g4/rn+CE421hQSy5GHgrXEJy8/CUkecoO8dY6Y0c46sSNeYl3wbUXhzFykwxnunj
	 qLV+OI5HSUTQhfNiNL69Ziuj6F96hzcBCOeLRUg/igrJjz0xbdvytxWuZR+bt2n6rM
	 L93USHKZKqMgw==
Date: Sun, 14 Jul 2024 15:06:20 +0800
From: Tzung-Bi Shih <tzungbi@kernel.org>
To: Guenter Roeck <linux@roeck-us.net>
Cc: Hardware Monitoring <linux-hwmon@vger.kernel.org>
Subject: Re: [PATCH] hwmon: Remove obsolete adm1021 and max6642 drivers
Message-ID: <ZpN47C2Zey-eX1o6@tzungbi-laptop>
References: <20240712173548.3556699-1-linux@roeck-us.net>
 <ZpKbxZf6TOqid1cP@tzungbi-laptop>
 <e263f50e-ffc7-4208-b1a5-960be94569dd@roeck-us.net>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <e263f50e-ffc7-4208-b1a5-960be94569dd@roeck-us.net>

On Sat, Jul 13, 2024 at 11:53:00AM -0700, Guenter Roeck wrote:
> On 7/13/24 08:22, Tzung-Bi Shih wrote:
> > On Fri, Jul 12, 2024 at 10:35:48AM -0700, Guenter Roeck wrote:
> > > diff --git a/drivers/hwmon/adm1021.c b/drivers/hwmon/adm1021.c
> > [...]
> > > -static const struct i2c_device_id adm1021_id[] = {
> > > -	{ "adm1021", adm1021 },
> > > -	{ "adm1023", adm1023 },
> > > -	{ "max1617", max1617 },
> > > -	{ "max1617a", max1617a },
> > 
> > The device ID "max1617a" only in Documentation/hwmon/lm90.rst but not in
> > drivers/hwmon/lm90.c which results in max1617a is no longer supported after
> > applying the patch.
> > 
> 
> Thanks for noticing. It is an oversight, really. The chip is the same.
> max1617a is even mentioned in the lm90 documentation.
> The chip is detected and supported as "max1617" in the lm90 driver.
> Here are the notes from that driver.
> 
>  * Note: Multiple chips with different markings labeled as
>  * "MAX1617" (no "A") were observed to report manufacturer ID
>  * 0x4d and device ID 0x01. It is unknown if other variants of
>  * MAX1617/MAX617A with different behavior exist. The detection
>  * code below works for those chips.

Ack.

Reviewed-by: Tzung-Bi Shih <tzungbi@kernel.org>

> Either case, all configurations enabling the adm1021 driver also enable the
> lm90 driver, and that in turn prevents the adm1021 driver from being built.
> Effectively that means that the adm1021 driver hasn't been built for a long
> time.

Curious about how this happens: is there a way for telling build system that
we prefer lm90 to adm1021?
