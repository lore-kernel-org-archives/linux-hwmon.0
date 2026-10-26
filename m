Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792973847;
	b=2CwZSZi1aa0xI48dY5qFwyMQTK9gCIkn9tsw98TMCcd0MHCgHwYd6EmYz4tTpnllO4sI
	 5uhYDsE7AkfwMPLGgPufZhmLYuvAZIh5JF8d1OEmfG+s75Ut0QJGtcKxCyMkoOcjCPnlN
	 KONCOZ3gn4Z3LTkxF3SQ68pkbUDnx452HjA81AIFemLTpTbLegurxcBiQznq7jqIS+vlC
	 MPstgNBVKMj5juukMQA7m5jtx2uTlEvTRGG78tPjVax7ev2adpmS+dGiyJEGNvVNIzK7i
	 e5XFtMNTqkJxN7BrqRap9u+b5kbZ/UTkqAt8FfIQhlhNb4Oj1sy8eeWADlqNMIr+DVQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792973847;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Sender:Date:From:To:Cc:
	 Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To;
	bh=LPTdpqzsQ7lCEGZ4cwq1P1wG3qp/qnOV8StpunplMto=;
	b=UM5njCgLzRneh/BeOG0qj+kUFd5+BjC0aE+X+OpbFGHUUF6OTf2HZQBOoP7GEgQDX0gc
	 h6hxPn5awUr67fY5vmbofv54fgP8jNxucwHmoK+IamoIzVTHpO1K3fCoCkLb+fX5CkYoL
	 bfzjC8mFDMwN8/6e8rMs+hsoU9bhyJVvAVclS08K89MXvs6c1bj2x5r9Ul4aB9oA0q0Hx
	 4Nur7iio9ZXfBSBwqAzo5rLSjmWeVw0/V95jWXrCWHoqzf2b5h+h7vSwMVzlQgaObkZd3
	 G3AgVfXb1ZO+68nRkzjb0ZSq3hyC0rpoveXZlgSy07T0+VLW3ftJfdbd+MDN0L+D66Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=roeck-us.net;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=nZPqyslh;
	arc=none smtp.remote-ip=209.85.216.43
Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D3A8606A31B
	for <linux-hwmon@vger.kernel.org>; Mon, 26 Oct 2026 00:17:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9D3A8606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=nZPqyslh
Received: by mail-pj1-f43.google.com with SMTP id 98e67ed59e1d1-3ab98332238so1263773a91.3
        for <linux-hwmon@vger.kernel.org>; Sun, 25 Oct 2026 17:17:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792973846; x=1793578646; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=LPTdpqzsQ7lCEGZ4cwq1P1wG3qp/qnOV8StpunplMto=;
        b=nZPqyslhbzKokYUQ5Gd1QVVdXwOKB8xjLeyBBFK0bS09nHL/PokKpSPRjVYB/vseCM
         793pUVViXjlFQUd/kA0jvXOrUswTqcutxj/4yTjqvOvdlQk+OatQXEkA8mcVrbsXN/N9
         b63dMgzZU0XlGlNif2NqzBSEB+TSOaqQCULrmaB/Zye2vVHThhsa+8qhQFGd8H31hDiz
         RYoe6io1uU0XKCZ8Rt2pjFEogOXtpcMiTRbJxmlCwYUZgojyriChLay4GJku9/GQi+an
         GaBotTBVrT9WwbwdB5ytAeuH/djdrnSJf14OnJTF9LUxSDQynCek6oL5JnbloqDkeU8P
         gujw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792973846; x=1793578646;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=LPTdpqzsQ7lCEGZ4cwq1P1wG3qp/qnOV8StpunplMto=;
        b=yoNFlUQj8ORZfXFGzmyLvxW7/GKWs78p/Nhcho2vbDMIm8BE+8EwK0CtJ3agTKsfOl
         ZXVwjJYQXm4RqLPKe3RxtSCM+M3ocHZCtqtM4qQD5uXnst/X0QFfVo4h6KQStcM1HsUO
         wrL1wTAogxws23b0okpxR4BWhok2fj+MDjxPgbfJ62yE9yuHs/kkRxvjMFypcfyyb3Zo
         FNnWnH1PDanlV6jWZwKF3QxccNSH3UDR0msMaPDbj3nZE6JWeu/DzDpL09IrCw9MVPtu
         X7ev+g7y9WWPXbamcJBZ3WnK8JrQXItgCXriZ8uQ2RKwQgJaH89InkfQmj4zKiPZEUHB
         Gu7A==
X-Gm-Message-State: AFq9FYKfTnjHuvZqN2X8oLYh7UUaoNIShmJeAZxAgAh/PzSCz6QtHjzx
	bX7q8mbpjdM+kKnso+7lSgWbSSt7c+hMNahOBQtH+rtkbM0DM+/sx3Mj
X-Gm-Gg: AYBFou1+6aKDZLimeRzCNyNbIvyXHXKrD4Z5PXgfoIpKliJqVRNlSsLcgO26p1kga83
	6BXS2CVpSE86GfIQ6Ir6BNiyWsj5CpgaVHedou4XXD+F0lvBPIeMMHD3i1VE0E7kkxt4tkGoPL2
	79q6+rdKUrF5jCvvSFlwKf4For6WVWnel2F0Wk6Po9MF1WByOSVLQVr5LJMzGXiNtRslS0epZUN
	BRwLnjfJDZlRz1IsF0ZUAIA80ZTwCSs0DJgYDUII1S7cQ1aC8osHdNhj9fXX/758Qq8qDg9cn9k
	ICVnEKnbZcW8QDuqkzOeuo1TAfOTFVac2tfvdfS+EMGBSFmUpvJvUrUIjf31EanERIi9pefKAKZ
	Exg7Vx/LI0vHehAfcTNGNWjKqIK5CQ4RO4P0MzbXOfOyFp/s07Ze8tw0p2DovEDDdVtxvc2ciI+
	mEkmV4cRAIc8PID4Pf3FuVDQhM39pMQUu8d9Mmdx0Eeiyp1kH3X4htqwGB7JxkLA4Yy1tO5kyLm
	khGw6aPX1bolViUC95EUkYzZFnWmVDsBPMSZm2OS3dWr65JyqBINcMe9MpK4NXECEb90g==
X-Received: by 2002:a17:90b:35c2:b0:3ac:a521:960 with SMTP id 98e67ed59e1d1-3adea07d5c8mr4463949a91.1.1792973845866;
        Sun, 25 Oct 2026 17:17:25 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3adebe8f0b2sm5963064a91.8.2026.10.25.17.17.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 Oct 2026 17:17:25 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Sun, 25 Oct 2026 17:17:24 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: pocj8ur4in <pocj8ur4in@gmail.com>
Cc: linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] hwmon: (lm87) Propagate analog output write errors
Message-ID: <74e00272-306d-4d83-b6f6-10059ad3a91f@roeck-us.net>
References: <20261025150800.49041-1-pocj8ur4in@gmail.com>
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Post: <mailto:linux-hwmon@vger.kernel.org>
List-Help: <mailto:linux-hwmon+help@vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-hwmon+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261025150800.49041-1-pocj8ur4in@gmail.com>

On Mon, Oct 26, 2026 at 12:08:00AM +0900, pocj8ur4in wrote:
> From: "Baek Kyu, Kim" <pocj8ur4in@gmail.com>
> 
> The aout_output store path updates its cached value before writing the
> register and ignores the SMBus result. A rejected write therefore returns
> a successful byte count and reports the requested value until the cache
> expires. With a cached 980 mV, a rejected write of 1960 mV returned 5 and
> read back as 1960 mV although the register still held 980 mV.
> 
> Check the write result and update the cache only after success. Return the
> bus error to the sysfs caller.
> 
> Signed-off-by: Baek Kyu, Kim <pocj8ur4in@gmail.com>

NACK, for a simple reason:

This driver has 23 instances of unchecked I2C writes. This patch fixes
_one_ of them. I am not going to waste my time reviewing 23 separate
patches, each of them fixing one instance of an unchecked write, plus
another set of patches fixing all the unchecked read operations.

Guenter
