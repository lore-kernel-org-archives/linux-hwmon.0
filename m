Received: from todd.t-8ch.de (todd.t-8ch.de [159.69.126.157])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B561336EC9;
	Fri, 10 Apr 2026 05:29:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.69.126.157
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775798985; cv=none; b=FsYrz5PhB+wJccxeKrFv8V9CxzU/6FA2q7UO1l/y1MqkTTSpvs6E/113YrEGJBV0auAinarQgSuKFy3JaD5XH9kPgsT0Le3d8VHQm921T2Gut2Lqb1n+AEKUbsWowETPEoX9ra2vxi0fGtoaMEXtQf1KplLJhYmYFMsx13Yh0sY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775798985; c=relaxed/simple;
	bh=+oy0zjljrMWYy3QPVRU0MICEsWKdZ7pizlfep0IPRU0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IxzeeMTHCcbpXV6CufzRrpCcXGaNImmA8nGbsLYUmqaEs9X1xe5c4I3z0r9yJFOaY20wcOVAa3O5NzQsLEKCj7ix4sffjPMR/aoGwtebQHt44mDHXSH3HzihN4e6MZHoYXEQuhbkm6OQflJ4iYr8KFgMm85mivTDphrwnYCrExA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net; spf=pass smtp.mailfrom=weissschuh.net; dkim=pass (1024-bit key) header.d=weissschuh.net header.i=@weissschuh.net header.b=lOcxj4mq; arc=none smtp.client-ip=159.69.126.157
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=weissschuh.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=weissschuh.net header.i=@weissschuh.net header.b="lOcxj4mq"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=weissschuh.net;
	s=mail; t=1775798975;
	bh=+oy0zjljrMWYy3QPVRU0MICEsWKdZ7pizlfep0IPRU0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=lOcxj4mqZ1Benw2z4oX5l8CSEupGL7Jq1ZUzWqqGRc2510RepUl4jYqdKYbE43bmU
	 HDMbzHvxCCJB7uBekadmi/YEYlHrBSsoRNo2n5qfwBknBm6XMVPDYHgvdqqaP+PpAV
	 8kwsNzgG/Xm8FJ3NjK8QU7gnZiQsrZ74TJJ7omsI=
Date: Fri, 10 Apr 2026 07:29:34 +0200
From: Thomas =?utf-8?Q?Wei=C3=9Fschuh?= <linux@weissschuh.net>
To: "Pradhan, Sanman" <sanman.pradhan@hpe.com>
Cc: "linux-hwmon@vger.kernel.org" <linux-hwmon@vger.kernel.org>, 
	"linux@roeck-us.net" <linux@roeck-us.net>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
	Sanman Pradhan <psanman@juniper.net>
Subject: Re: [PATCH v4 0/2] hwmon: (powerz) Fix disconnect and signal
 handling bugs
Message-ID: <2ba06e4e-67c2-4d73-866a-a534ec25ac4d@t-8ch.de>
References: <20260410002521.422645-1-sanman.pradhan@hpe.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260410002521.422645-1-sanman.pradhan@hpe.com>

Hi Sanman,

On 2026-04-10 00:25:29+0000, Pradhan, Sanman wrote:
> Fix two independent bugs in the powerz USB hwmon driver:
> 
> 1. Use-after-free: After USB disconnect frees the URB, a subsequent
>    sysfs read can dereference the freed pointer.
> 2. Missing usb_kill_urb() on signal: When
>    wait_for_completion_interruptible_timeout() is interrupted by a
>    signal, the in-flight URB is not cancelled.
> 
> Changes since v3:
> - Patch 1/2: Split from combined patch, reword commit message,
>   drop unnecessary usb_set_intfdata(NULL) calls.
> - Patch 2/2: Split from combined patch, use long type for wait
>   return value, split into separate signal/timeout checks.
> 
> Sanman Pradhan (2):
>   hwmon: (powerz) Fix use-after-free on USB disconnect
>   hwmon: (powerz) Fix missing usb_kill_urb() on signal interrupt

Thanks! For the series:

Acked-by: Thomas Weißschuh <linux@weissschuh.net>

FYI, the cacheline issue reported by Sashiko should be fixed by this:
https://lore.kernel.org/lkml/20260408-powerz-cacheline-alias-v1-1-1254891be0dd@weissschuh.net/


Thomas
