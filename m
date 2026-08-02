Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [212.27.42.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9F4F75809
	for <linux-hwmon@vger.kernel.org>; Sun,  2 Aug 2026 14:18:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.27.42.1
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785680314; cv=none; b=bRYMVrisLLCtEPsSl6H79kW77rbL7MnyiVy4YBxTW5ZBcwJnmwDhSosiA7qFHpe53hX3ryYRu0kiZDS+A0XGV61lVaexCSUcU0YofCPh/WolzNnMKs2mppvR9+QoF8aa7Nh5BxYcGHd/AjSekydYi0iVWU4TuVsTI24i6QCOyA0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785680314; c=relaxed/simple;
	bh=cRMSEGDzapZ0f2eE5BraP0PC6AwLhWyA7IuovOWX96Y=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TPU2uDcW+45ckviQDW8nAACvGxmBqRoJi3G/QOGpYTvBy1S9Thzu1yHgrMLcC+by9WV/KLnDX2k2dfOsYDA4ETrGYZemX5+EvUycDpKR4AlvHb3BsiyM/tziVTOcB5E+ZH1hekADPaEbaB46A4lxAySciaBMzT7M6Oz0D1dH0dQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=free.fr; spf=pass smtp.mailfrom=free.fr; dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr header.b=K8pjw7X9; arc=none smtp.client-ip=212.27.42.1
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=free.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=free.fr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr header.b="K8pjw7X9"
Received: from L30177.local (unknown [81.201.198.134])
	(Authenticated sender: vjardin@free.fr)
	by smtp1-g21.free.fr (Postfix) with ESMTPSA id D901DB00548;
	Sun,  2 Aug 2026 16:18:22 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
	s=smtp-20201208; t=1785680304;
	bh=cRMSEGDzapZ0f2eE5BraP0PC6AwLhWyA7IuovOWX96Y=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=K8pjw7X9haLTyF4AmYWVc58rKRj1V1cg3Ye+BDX4kxDAgGMsxggGslbtg5HCmeO1F
	 7QHx+/1Xdqbt5GwC8jDqrdwJ/LSwM6i0PdbNlfz4M73FinZ79SeBbtxAmzRpmXL8nK
	 gulbyw9Lii9g65ZbNb1zIjvt6Mls8/+7mnoceRyd5dPf+w6+8INtTCOScfPSJJNICw
	 5qWaKJoi9WK2B9IFuaPMWCeewzn3K89yILfkr//E1D9wiw4YeLdvo9CLUhLN0JqAgE
	 S6Zjx+d8zJWFanuqa/L9Jfe7ZMCUJOgaj7KJz9+MpascIAEZGdngWWlF3J4ESxgZsd
	 51/XWdZra9jlw==
Date: Sun, 2 Aug 2026 16:18:21 +0200
From: Vincent Jardin <vjardin@free.fr>
To: Guenter Roeck <linux@roeck-us.net>
Cc: Hardware Monitoring <linux-hwmon@vger.kernel.org>
Subject: Re: [RFT PATCH] hwmon: (pmbus) Fix type confusion in notification
 logic
Message-ID: <am9RrapJinQ-eKDF@L30177.local>
References: <20260723211336.3046042-1-linux@roeck-us.net>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260723211336.3046042-1-linux@roeck-us.net>

Hi Guenter,

> However, data->group.attrs can contain other types like struct
> pmbus_samples_reg or struct pmbus_sensor, which only embed a base
> struct device_attribute.
> 
> If da is a struct pmbus_samples_reg, dev_attr is the last member. Casting
> it to struct sensor_device_attribute and reading the index field appears
> to access memory past the end of the allocation, which might trigger a
> slab-out-of-bounds read.
> 
> Additionally, if da is a struct pmbus_sensor, casting it causes the index
> field to overlap with the page, phase, and reg fields. Could this produce
> a garbage mask on little-endian systems that spuriously matches the target
> reg, page, and flags during an alert?
> 
> Fix the problem by using struct sensor_device_attr in struct pmbus_sensor
> and struct pmbus_label. Since those attributes never trigger a
> notification, set the value of attr->index to -1 for them. Use this value
> to distinguish from boolean attributes which _can_ trigger a notification
> and use the index field to encode mask, page, and register values.
> 
> Fixes: f469bde9afd1 ("hwmon: (pmbus/core) Notify hwmon events")
> Cc: Vincent Jardin <vjardin@free.fr>
> Signed-off-by: Guenter Roeck <linux@roeck-us.net>
> ---
> RFT: Build-tested only

I tested on my board today but I did cherry pick the the 5 commits from:
  https://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging.git/log/?h=hwmon-next
	hwmon: (pmbus) Fix type confusion in notification logic <-- this RFT
	hwmon: (pmbus/mpq8646) Gate the writes
	hwmon: (pmbus) Add MPQ8646 driver
	dt-bindings: hwmon: pmbus: add MPS MPQ8646
	hwmon: (pmbus/core) export pmbus_check_and_notify_faults()

Beside testing it with the attributes and boolean alarms of the MPQ8646, I did
test it with the board's PSU that is another PMBUus device and exposes some attributes
and boolean alarms too.

Both were OK.

Tested-by: Vincent Jardin <vjardin@free.fr>

best regards,
  Vincent
