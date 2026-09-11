Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F6E930649C
	for <linux-hwmon@vger.kernel.org>; Fri, 11 Sep 2026 00:55:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789088146; cv=none; b=E7Uhb3UkN2I+cR/l+14uOH29BLo0s/6YmlOElPn1885yJ8MstdZHY3KdDGGabcp+kPqLclyAci6noM8dsa33r/n/2GPTPYXGQSELNjntgctbN9TnBxqRLDVJYhFPQhMQqCowJRqBJARk2JhL0zfsqqBHKG8G3HKtY2iplDf/ayo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789088146; c=relaxed/simple;
	bh=kQWpc3BV+U9JUEReCtGuwJXKFGM1uWH1U0sMLM6Pdcc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hG7xkL7Hu/Y+dxaIRzNXp17D1xwvFvK+CVpu6OcmIXOIMYvZKw97tYJSGgLuPsnx5cDp26qBnuTSMYDLGJr5yEYXayDevt8s2W+iveiQsi1uJVtMsTQX685u9hGeJtonSawhjeZXytGuPwJxyRoM5dN+j/o865MNPe9Bb6iHmCw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JLOEP7dw; arc=none smtp.client-ip=209.85.210.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JLOEP7dw"
Received: by mail-pf1-f181.google.com with SMTP id d2e1a72fcca58-8520161fdb9so368909b3a.3
        for <linux-hwmon@vger.kernel.org>; Thu, 10 Sep 2026 17:55:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789088144; x=1789692944; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=M8L8TbJZToCP2k41SeR8S++Lennpcrk/WxA9QKMKSdM=;
        b=JLOEP7dwPdT9A4akfGf74DcuSKrE6mXkflVWY95Hv4VnlXqUTcMYg4IPbNhryibEpg
         qIxTvlnQbyk1hwEzRjeUUlfKmKatkSPhZWlrbqVfvBHBA8zK9S+J7FtnI7jJ5nHIv3wD
         BU6ULdGw7Cs3thAq2W5CUDnfUzxhbQi2G6Etk3j7QglfeJzQdyGSd/XaNZf/XA2pPHzH
         mUvfN6mni2nnb/9/VeRVdpiQpnxmo5AG+CYAbL/pirX44QkGYmAFoBsd2Vc14gOT/ZE5
         gSQzEP10rH/dkZfhcQ+vsEXk493bP2is/OKFle0stkHDqlaJ5f55o1sC+3QmhSOUfe9A
         7f6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789088144; x=1789692944;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=M8L8TbJZToCP2k41SeR8S++Lennpcrk/WxA9QKMKSdM=;
        b=r41VwjD/6UQIPn7rH2n20Rd64s77SaRrnkYlhAHPEVxFU+rXF5hsXYQiFjues7cLM4
         +HiOzhQwjCnZ2KkKV/PRRPrZF/fUUszBxvEN7yBimRP1GTAr8pdUDswzeEPjxVMI8Dew
         p/CYdv3l7Plqy7ROwhRihQTiJ++wbBs1VAcZvKHy5m+mBJgQxPLvN+xWj2jx9VJPcFSN
         WAIXJnfcUFdRrUzGwCOe4bBZEFtsdXinvawC5kOl+eQMnqwlGOhkgdIAGE6eYrVTDJc8
         a38pvrCx7veJ7iY7nxMMFBDy5ARX2vSy3re+a9A4TUXisnOH3lwdzEOojrkhXqj4atPz
         ccUA==
X-Gm-Message-State: AFuF++kedfqzDJje3doUhWI3mifsAY3H9jqlX/kPPnQDD6Df848QSFOn
	snzgvE7aXc2Y+Nmu3Dd+GduFwalYY2OrbjQktCURG19ZXk971+kufpEO
X-Gm-Gg: AYBFou2syZBnDxH7/I37RlImtIVHZA51fNy3gybu4GUbb/Z8cziIE+THCnmediD1vY5
	Ho3UwUbHLD0Q+5Pv5vDzEUdemS20XlKP1+9YKSqnkwImOzKR0juUOhxCJTIu68T/RU6clB5/dq+
	A5i9v6Tdi7tnfjaXjSr1KTLw4XiZAZ9HKE3+9RUK2sY5/GfmVkO+yEIkRkWwcPzBwD6KZ6bEUVy
	wg45xtSvfzVMlKNzbPFRQKcptvkrizIL9rADQk6i61Ph+JdKRN6vSIOZk7wZseaDHbU+Tx2LZaC
	5/56wleEZUinLnVFunf11ex/CcT3YiZM6Xs3zVxGZH8SVRbfL9v+Wsp1J6CmQ9Dms5mbMDshaur
	fKPvUpqi+IPecz0t9ImhwKT3IrEKqz0n+oSYses/CihYlvGGYfiNsFh91SNq5H4QzoMjHqSb5+W
	g9oUQE1EWYxDjBDqamutIfwutJGSGFPFbFJSQ5J25kVU7UekPxLX3N0Xt7oS8lw5gyZT8WzoDOH
	9hD/WsYBO8P
X-Received: by 2002:a05:6a21:a96:b0:3d3:afeb:880 with SMTP id adf61e73a8af0-3daed895710mr2723199637.28.1789088143739;
        Thu, 10 Sep 2026 17:55:43 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33ba4fb3ddasm1469131eec.30.2026.09.10.17.55.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Sep 2026 17:55:43 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Thu, 10 Sep 2026 17:55:42 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Aureo Serrano de Souza <aureo.serrano@arctic.de>
Cc: linux-hwmon@vger.kernel.org, linux@weissschuh.net,
	arctic.it.hk@arctic.de, corbet@lwn.net, skhan@linuxfoundation.org,
	rdunlap@infradead.org, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/3] hwmon: arctic_fan_controller: default PWM cache to
 MCU 40%
Message-ID: <ecc9ba0f-03cd-444d-8b47-f0e8719089fd@roeck-us.net>
References: <20260910050401.279868-1-aureo.serrano@arctic.de>
 <20260910050401.279868-2-aureo.serrano@arctic.de>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260910050401.279868-2-aureo.serrano@arctic.de>

On Thu, Sep 10, 2026 at 01:03:59PM +0800, Aureo Serrano de Souza wrote:
> The device has no GET_REPORT and every OUT report carries all 10
> channels, so the cache has to start at some value. Starting at 0
> means the first sysfs write to a single channel also sends 0% on
> the other nine.
> 
> The MCU factory default is 40%. Initialize pwm_duty[] to 102 (40%
> on the 0-255 sysfs scale) at probe and on reset-resume. Any initial
> cache can be stale if the module is reloaded without a device
> reset. 40% matches the hardware after power-on or power-loss
> resume, and a first single-channel write leaves the fans running
> at a safe speed.
> 
> PWM is still not taken from periodic IN reports: the device is
> manual-only and the host cache stays authoritative after the first
> successful write.
> 
> Signed-off-by: Aureo Serrano de Souza <aureo.serrano@arctic.de>

Applied.

Thanks,
Guenter
