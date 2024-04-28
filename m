Received: from mail-oa1-f54.google.com (mail-oa1-f54.google.com [209.85.160.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7185C7317F
	for <linux-hwmon@vger.kernel.org>; Sun, 28 Apr 2024 17:30:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714325425; cv=none; b=b20aNx3wXBcy/nWkKDsLrncrrDUbr/86zXo61WqLdtBOZRbnZjxW5DHYWnDw8HbBkr935f5qePdY4EO6K8eLVmoQ467qtbDYI9vZloR2Ga3aj9/MvAA7uORFWzVFE3nkYm7uKVY6SvXiXQbSsYQjc0MNkReuOGtArImWN5GDlLE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714325425; c=relaxed/simple;
	bh=n2jWXXyP36hVuKNqv6KSjbejnGJgRvWmzeLSsRwt4RQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qtDmXChK9L8a0hCZqRxmIvBdvxEMH0VKZVJwLk6ZMuVvdREwuUlyvjjM5QTBjrtzNWTwcmv6jonUrnBaQ0vxNwWVM5U8pn9P5DB/7PP6WVBaQer+WC02wcT6ORs+8akw6vfHUulrKX3CQom7cyqTZqVo4+1fyCmsTjA7u/YSSC8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JVowtuZ5; arc=none smtp.client-ip=209.85.160.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JVowtuZ5"
Received: by mail-oa1-f54.google.com with SMTP id 586e51a60fabf-23335730db1so1915259fac.2
        for <linux-hwmon@vger.kernel.org>; Sun, 28 Apr 2024 10:30:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1714325422; x=1714930222; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pIATWBu741zmxd4H46gXktwwbZZhHofsPjFVSo9k6zo=;
        b=JVowtuZ54FKADY/CWFxHmbXKF8onJZpafZky/bM6l3/p7ndblRFNbDEoQkNk4KY3NM
         pa+PolbdUVZtl0gWOJb/sbsiFOUtuZUB1/ZLgpImNemcq3HoMAtLtlu53iqu/zqdkpn2
         qT16fq+poxZmd9EjEUWiPEIGfYl9LWGTJwVxZlVnO1E5L2Nhkatgx06DTYap7e8hY2Nh
         6jkXnJyxQACk4UuPLVV1BWGP3ot7+xNWXr5uo3zRVal8gRTVoPi4fXl5b1S4VCDdsqCs
         zI3jdK1iAPSHJ/ppRNsGc+fhzsrMGh1vWOsFuyNTOc3Jv3Izd79tAAYdUmNtpFEZVUPG
         BFzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714325422; x=1714930222;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pIATWBu741zmxd4H46gXktwwbZZhHofsPjFVSo9k6zo=;
        b=crARtBT9HhV2Fpzywmli7iBnDYc0+dHzFpA3uBqPL9ccx5CCFCN0WgUc1bfQrk2l7L
         HvrXwIjmBHtg8tjsj28I9eO1Swn/sKmsi6zD646jwKedfPTjZASF8x+pXJSfC/JtRM7v
         unrsir1KPUFyfYW5w3TkcpHMGP7bwRsJt0iZcfivjgwW/MQpR9N20vHfY5WjKOzRWRDG
         foRToyprtfItCN+Ir48B8i0J+vY/0Hp171UTmE3XiwKNsd87KBRaL3ddlScZ4UB/bz/B
         FubWhfgBZxm6IIeGQPHBmLLyfp8YhqUBPzgaIJO2FFeMrdNNE4/p1vS96+dNXn6eRmNt
         DuVg==
X-Forwarded-Encrypted: i=1; AJvYcCWTOQIki75Vp8r1PMV3IGjsMq+CwVnfj52raBN4Uqf5/U5i4RRrbq9TXmv7CAIzsX58DDshPrqiM5E5nPuZbqphsYMYq1TdTBVIrW0=
X-Gm-Message-State: AOJu0YywibgySkEjBB69jAEPEzY4LLeV3qToRsEGOItlEd5VBDyN24RW
	+QwE9bAZuuFpXxdaiq0WqaQ19KwRNKRlFvdRUD7M74RYzETsCSOo
X-Google-Smtp-Source: AGHT+IEZZUTsSYZIpAZoExZrZwsx6FZHIh5gnXBtyY03qQkK2JhivWMKIXmAVvo2IHTRu+FGVlpAEA==
X-Received: by 2002:a05:6870:8091:b0:22e:ce2e:4506 with SMTP id q17-20020a056870809100b0022ece2e4506mr5683338oab.37.1714325422408;
        Sun, 28 Apr 2024 10:30:22 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id ca15-20020a056a02068f00b005ff58ee59b8sm10681407pgb.44.2024.04.28.10.30.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 28 Apr 2024 10:30:21 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Sun, 28 Apr 2024 10:30:21 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Frank Crawford <frank@crawford.emu.id.au>
Cc: Jean Delvare <jdelvare@suse.com>, linux-hwmon@vger.kernel.org
Subject: Re: [PATCH v3 1/4] hwmon (it87): Rename FEAT_CONF_NOEXIT to
 FEAT_NOCONF as more descriptive of requirement
Message-ID: <bd76092b-e2ff-44e2-9003-98978a0ed13c@roeck-us.net>
References: <20240428060653.2425296-1-frank@crawford.emu.id.au>
 <20240428060653.2425296-2-frank@crawford.emu.id.au>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240428060653.2425296-2-frank@crawford.emu.id.au>

On Sun, Apr 28, 2024 at 04:06:33PM +1000, Frank Crawford wrote:
> Rename previous definitions to match the new information that they are
> preinitialised as enabled and should not receive codes to enter or exit
> configuration mode.
> 
> Signed-off-by: Frank Crawford <frank@crawford.emu.id.au>

Applied.

Guenter
