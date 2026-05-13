Received: from mout01.posteo.de (mout01.posteo.de [185.67.36.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 210844DC55E
	for <linux-hwmon@vger.kernel.org>; Wed, 13 May 2026 17:50:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.67.36.65
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778694634; cv=none; b=qnlu/BjOnoYwCsTbdyd6ufMS5iOHDit4l4VFlORZJrfhTf2ekTxVz5ev4wU2CFVGxEowLVaroODgkpOr368bOXO16At0wkj1vsveuYqfYdqRmgqSem9lw/IopyGFUgTmRBYqDOyVsRmQxnxBlcswye1um1CzRkxbrjicdEF9g3w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778694634; c=relaxed/simple;
	bh=edwYczmmc9Ijp4DGSiY9cCwZHmymT/Zbqii98OC1Yfg=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Xnqw3hTRsbT8E7guQEWKHTaWGpvysl1wbCE4acH+khvkpRErc51Dul9TZvg6AoxVzfeKRwCkFYK6yq6DTT00H/Pkht79hiLAsr2Z7Wb7qvIICWhm2UeVs8tOBEV46hPMl8Mh/91ZK5PcIcvqgf+IxHPCAB2q2QO0iNNPtQxllp4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=posteo.net; spf=pass smtp.mailfrom=posteo.net; dkim=pass (2048-bit key) header.d=posteo.net header.i=@posteo.net header.b=OynzPFv7; arc=none smtp.client-ip=185.67.36.65
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=posteo.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=posteo.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=posteo.net header.i=@posteo.net header.b="OynzPFv7"
Received: from submission (posteo.de [185.67.36.169]) 
	by mout01.posteo.de (Postfix) with ESMTPS id 39829240028
	for <linux-hwmon@vger.kernel.org>; Wed, 13 May 2026 19:50:30 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=posteo.net; s=2017;
	t=1778694630; bh=KDPeJu8/Dh5Kcfz4lwP9uY/C6+srG+yWSqzQzYxYnfQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:From;
	b=OynzPFv7H/ssqeJw87sFdxQUQZ6R/zSU00cxWLkswXSCF07sRw7ujFgr8i4HAi7zj
	 VwRSivFKOSchwwnuem/mMw1MasyHG1QRysRlRUvz/MyV7THJepgYtEmFuHzN6py53s
	 5XSZkYLMpmbgBH3lnW8yyQKOobIduDxjGJ/YC3tdlDbJ6vkt5aifrVcGr4o8JEOPGi
	 MX0LTbS664dNDD3eCOIeusEOlllE8kynzmlIyKpv15Wh3WorYgL/hPqH+MputcT67X
	 +Bui6criNe3cnt28y/8udH0xuO3LNymQP1blMz+c0Cxn9mDJIBPJ68Y7PFtqSi2bo0
	 U8G8oTg2Q+YQA==
Received: from customer (localhost [127.0.0.1])
	by submission (posteo.de) with ESMTPSA id 4gG1Fx2tnFz9rxP;
	Wed, 13 May 2026 19:50:29 +0200 (CEST)
Date: Wed, 13 May 2026 17:50:30 +0000
From: Wilken Gottwalt <wilken.gottwalt@posteo.net>
To: Guenter Roeck <linux@roeck-us.net>
Cc: linux-kernel@vger.kernel.org, linux-hwmon@vger.kernel.org
Subject: Re: [PATCH] hwmon: corsair-psu: fix and readd locking of command
 buffer
Message-ID: <20260513195027.028b7b63@posteo.net>
In-Reply-To: <62e02950-e31b-4faa-8b36-98bbfe898367@roeck-us.net>
References: <agR9YW7hGTJ_l7ms@monster.localdomain>
	<5f0406fa-9692-49f0-bcfe-c013f5fc7b62@roeck-us.net>
	<bde0fa1e-93a5-4819-aa19-04554c24d31c@roeck-us.net>
	<20260513162135.2893e42d@posteo.net>
	<254b59a8-182f-4ad3-8469-4f9e9511d3a5@roeck-us.net>
	<20260513175350.07900558@posteo.net>
	<62e02950-e31b-4faa-8b36-98bbfe898367@roeck-us.net>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Wed, 13 May 2026 09:42:08 -0700
Guenter Roeck <linux@roeck-us.net> wrote:

> On Wed, May 13, 2026 at 03:53:51PM +0000, Wilken Gottwalt wrote:
> > On Wed, 13 May 2026 07:58:14 -0700
> > Guenter Roeck <linux@roeck-us.net> wrote:
> > 
> ...
> > Okay, that will get a bit complex now, because I added my hack and I see
> > exactly what I assumed is happening.
> > 
> ...
> > 
> > If this does not explain the obvious issue, I have not idea how explain
> > it further. My English is limited. This is a HID driver with data gathering
> > functions running in the context of the USB-HID context. Callbacks from the
> > hwmon and the debugfs subsystem call these data gathering functions, and the
> > first function in that context, corsairpsu_request(), which can run several
> > instances in paralellel, needs the mutex.
> > 
> 
> You don't explain why the patches below are insufficient.
> 
> I used guard() to keep the changes simple, but hwmon_lock() / hwmon_unlock()
> would be similar. Please provide evidence that this does not work.
> 
> Thanks,
> Guenter
> --
> From aa3ec1484bdd619e8fa2ce569ec653d35fbf3615 Mon Sep 17 00:00:00 2001
> From: Guenter Roeck <linux@roeck-us.net>
> Date: Wed, 13 May 2026 07:14:33 -0700
> Subject: [PATCH 1/4] hwmon: Support guard() and scoped_guard for subsystem
>  locks
> 
> Add support for guard() and scoped_guard() for the hwmon subsystem lock
> to simplify its use.
> 
> Signed-off-by: Guenter Roeck <linux@roeck-us.net>
> ---
>  Documentation/hwmon/hwmon-kernel-api.rst | 7 ++++---
>  include/linux/hwmon.h                    | 2 ++
>  2 files changed, 6 insertions(+), 3 deletions(-)
> 
> diff --git a/Documentation/hwmon/hwmon-kernel-api.rst b/Documentation/hwmon/hwmon-kernel-api.rst
> index 1d7f1397a827..9fcde32a140d 100644
> --- a/Documentation/hwmon/hwmon-kernel-api.rst
> +++ b/Documentation/hwmon/hwmon-kernel-api.rst
> @@ -85,9 +85,10 @@ removal.
>  When using ``[devm_]hwmon_device_register_with_info()`` to register the
>  hardware monitoring device, accesses using the associated access functions
>  are serialised by the hardware monitoring core. If a driver needs locking
> -for other functions such as interrupt handlers or for attributes which are
> -fully implemented in the driver, hwmon_lock() and hwmon_unlock() can be used
> -to ensure that calls to those functions are serialized.
> +for other functions such as interrupt handlers, attributes which are fully
> +implemented in the driver, or debugfs functions, hwmon_lock() and hwmon_unlock()
> +can be used to ensure that calls to those functions are serialized. Those
> +functions also support guard() and scoped_guard() variants.
>  
>  Using devm_hwmon_device_register_with_info()
>  --------------------------------------------
> diff --git a/include/linux/hwmon.h b/include/linux/hwmon.h
> index 301a83afbd66..04959e044fd0 100644
> --- a/include/linux/hwmon.h
> +++ b/include/linux/hwmon.h
> @@ -495,6 +495,8 @@ char *devm_hwmon_sanitize_name(struct device *dev, const char *name);
>  void hwmon_lock(struct device *dev);
>  void hwmon_unlock(struct device *dev);
>  
> +DEFINE_GUARD(hwmon_lock, struct device *, hwmon_lock(_T), hwmon_unlock(_T))
> +
>  /**
>   * hwmon_is_bad_char - Is the char invalid in a hwmon name
>   * @ch: the char to be considered

Now I am completely confused. What is that guard() and scoped_guard() patch?
It is not part of Torvalds repo or your
git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging.git repo. Not
in branch hwmon, hwmon-next, hwmon-playground, hwmon-staging, testing, fixes
or master.
I mean, it is a bit hard to check against this, if it is not upstream. Did
you maybe forgot to push it? I really fetched everything to be on the
latest commits and grepped for "DEFINE_GUARD". The only one I see is the
one in drivers/hwmon/pmbus/pmbus.h.

greetings,
Wilken
