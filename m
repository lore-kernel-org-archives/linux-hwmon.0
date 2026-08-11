Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ADB9E3F58E1
	for <linux-hwmon@vger.kernel.org>; Tue, 11 Aug 2026 15:58:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786463931; cv=none; b=nxmPUtFuGhVGYk/M8gMjk8KSeg6dBaKpiTptcEzfiAVnpINd0R5eq2AB8va41dtBKx1+MPiajx0WolvzANHNhETKu45S7lnKuevm5iC9emRwE9iGGqUrRp2OzlhjLeKQS38MS4Tazs7k0DFlUz0xOISBwXaoT0kPBzU/64NAwUk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786463931; c=relaxed/simple;
	bh=ocl2N53CRsVdr8KtN6hzGvgHQT1HcPvB9i7w62MO2Hc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WyjBN6qVxocJzOXtB5ZWQHeRxCx4hPowpsRnifnSYVOl+who3MiZU13aE4Y1Wt58uEtZw7kMeLByB+BsKNrwRGa4JxcEXjunMdCOKGjfe2jgGPufP5ZsAzRU7oZunSMoGDqSfu8r5/0GrkKO4A5V8QbbAFOl4HsRb8me9RzB1yY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IiPZbHAZ; arc=none smtp.client-ip=209.85.214.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IiPZbHAZ"
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-2ceab75934dso798595ad.2
        for <linux-hwmon@vger.kernel.org>; Tue, 11 Aug 2026 08:58:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786463928; x=1787068728; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=qEf+4RrEF3OjN8WAaqb4R/v6hzoKGinf4I5iTtqWIYM=;
        b=IiPZbHAZboHU8z36YhvvPaA56N07Uoca3E1lr49ZbrnWfCg+LEjtLWhFrtImFY7Bc6
         hshZlIWvlqJEdujxVrY7sURYI+YcTyiJiRg2V+xpLXv/ywQ0gfNVCTaDrqjIdcg2LSII
         hRXHD67UeTQa5tpzqNk0Z59+D7sltUeafLg9+cEH9YJLRk2qX91l7zX4UzGo8kkeRbwn
         MVh/BjHUVjsHLOtIq/WK5sWX3jLFDaDrZTgQOg20B824MQh4HsZl/9GeXJc6lmpnF7Hb
         KZ9ZYPIXIQ3CeWdN8gi3E4an8dELgf6urVBoepXm9F0N3qSPszw89CjDBgO0YyuZzWVl
         1nwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786463928; x=1787068728;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=qEf+4RrEF3OjN8WAaqb4R/v6hzoKGinf4I5iTtqWIYM=;
        b=mQnzT9ZfWYyjkmv1iQMDGwXDY/tTbTUoiRrd8bVaJQBrlloVgm0xJKmilVpMsorphQ
         neR9zcereA5D88KFHtoxmUEMp6QpO2JpgUEtOSwIp1WWUJbfg9/+wxsJ+Mb9zVtK/qjq
         WHMxI+6O58VPClAD73Y5uTyrhI6tCiMxmCH3+euyu6o8EjJsS1UHAKjrrO5xHzJC0yB2
         PEwE9h98LgRQkDZLUgPODUnz94Z04EhWku7La07+q/qkSOlCkXwgyBwbpF4Vqy202BVh
         CocyZ0IdIiozscmBE9MWJk7nBuaER8wECVU3ggKVgYMcQrxDPUsge6XXDp6KFAsLFYe8
         jpMA==
X-Gm-Message-State: AOJu0Yxd4QZQxcWItZPF1mYuf6khr/imVZYs8+NnSXbuM3VZpGOySJVz
	TjzL8JndyikmD2qEpd+rtAo/FRMpgphUVLR/CgXHoi24gnYw1r1Hoohh
X-Gm-Gg: AR+sD11uUWpx+m1Sf3n0NpsRK8ceHc1wq9QYUz4Iq+tRDz+gDn9qQAtKuM7OBS+Pppl
	pqH8Uk0XTQ0F07BOqoRj9QXlBhzj8rfyRIeJI3OjohOrz5yw3QV8dUf7vW6+KavM+vIP7K39j53
	QKzBag0myFNGDJI+cDhl0Mh9JJ+NYlYI02RgeoCBjfWC52pT1BFkkhECCFahZL+7aNq8DY4HNAA
	Zs90ffcL6O1/OxOgCrxojpRStRkbg/4Qqm6Jp88UCrGQKzVN7rhsQIRgmQFs4m1NSl9bMZp2Iqw
	B8II1QTu1iwzJSdgMjHnx3vpAK5wQSJbVMCyRYKR4qWT+bbN0tBbShkPZxTN/ztDUDkavc4Bwid
	9PDe4mQPYP3ozTQAjt5+U4/BobFtCg2/gaIJhkuZodRvG6sLmDtIA9bpcqt1GTXKBst+G62eq2q
	C3xhHv5M5UKLJHMeJR6hj/eItgBla4lXviibg1NXRC8fDa8nH70a5NbgR47AKsfGDbrygkyqtD+
	A==
X-Received: by 2002:a17:903:4b0c:b0:2c9:c991:3bf0 with SMTP id d9443c01a7336-2d3177c410bmr57534145ad.8.1786463927710;
        Tue, 11 Aug 2026 08:58:47 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2d315f2d74csm10297785ad.21.2026.08.11.08.58.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Aug 2026 08:58:47 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Tue, 11 Aug 2026 08:58:46 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: huangjia2hi@163.com
Cc: linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] hwmon: (nct6775) Add NCT5585D to list of supported
 chips
Message-ID: <2d2d1ac7-4f01-43cd-86ad-5178bbbb40c9@roeck-us.net>
References: <20260811093744.12199-1-huangjia2hi@163.com>
 <20260811093744.12199-3-huangjia2hi@163.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260811093744.12199-3-huangjia2hi@163.com>

On Tue, Aug 11, 2026 at 05:37:44PM +0800, huangjia2hi@163.com wrote:
> From: Jiazhi Huang <huangjia2hi@163.com>
> 
> NCT5585D uses the same chip ID (0xd428) as NCT6798D and is fully
> compatible with it. Tested on an ASUS PRIME H610M-D motherboard.
> 
> Signed-off-by: Jiazhi Huang <huangjia2hi@163.com>

Applied.

Thanks,
Guenter
