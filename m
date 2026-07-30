Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1F9C379988
	for <linux-hwmon@vger.kernel.org>; Thu, 30 Jul 2026 15:10:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785424206; cv=none; b=TiV1lokJzPUyGQM+UVq5UmPPM6P9I9PwhrtBLBKYT/lCpJvHAXiPFcLjZn06YsmxkYV+ADRKBOiiyf6oFC5kgOzr/+f7zlJbO+l7540gE+wqx7y2iqZPbmMpfR6FBRHG7KpoAU3iK0K6CXnfAvsePW1P9Nh3sJZQwNTarRkXeBc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785424206; c=relaxed/simple;
	bh=3Tulr0H8+8FTlGndYbs/IeDq/a+6CpmYcGG+STF+Ecs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qAFPQl41nYJpZ7hLL2xrKfAHjBoQUcJQ8//meQEPkl4DzaWvIjJZ57vJSZ3FT7FHaVKf6T8NuVhLO/c2eJkwW6PqEqvWK31FCtL57deMjTkcyz+M05E4dnDQbrBwV7XvxDa0cZLCnauLRIHgFRJ875/j/Hz+60EFjbhM95mGzPE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=f4SuUaml; arc=none smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="f4SuUaml"
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-2d02b4c3601so19522015ad.3
        for <linux-hwmon@vger.kernel.org>; Thu, 30 Jul 2026 08:10:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785424204; x=1786029004; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=AkzlOkggSNYc/vqr7fewCChydraR8A+jJdFaaTb0bd4=;
        b=f4SuUaml0PHHiK/VKZaCiyAmKgB+p6w5lD2mXoSGKfZxBQVzvQP2Qki7iZe8BwGt0Z
         3wrMAQ/Ge0cEt3zUTKwdpIOTUZjFwv5CtphkHFDldAd5UXiAk2YyzsKdJd6Y1l8LU05n
         +xVdbQHS5+mhW1bhKpTheBRlB1D3UoUFVfHkBT1iGR5V1qZh+/CNofwatgs6cD8yxgqf
         FnIVPn4oS7mUd4MV6W1X5nLiZywoc3g7zRX3CXSOUhm9Gd23PNwgU63q2r+DM1lInw4U
         MpscPzFmpb8Xs+qYt3R3YsqrM0vMRq7U43ykKebENms1PY4GrMWltacnAI+DW9fpEorb
         sc9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785424204; x=1786029004;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=AkzlOkggSNYc/vqr7fewCChydraR8A+jJdFaaTb0bd4=;
        b=cDBGmfeZsw5HR+dwsvGMuA/bAtqIHMADQ+cJPxjFEptbIoD38g52Px9cvRwButtMq5
         Occ96khnz65/tzvaIkSMyDnnmzhFFAgobu96f13w0/trevzcgSR5RTUPTByKg9T/KUbZ
         4CxZ5bt5douT1lOTfWFSxPsqnNYz5ZP4MseoIiBIRu/bvKEd+r0upWLa2J2uajnclFTX
         FJTjEisUc2/V7rAgeDl8CaAhIsW/c/ls1hScPYY7ubi1k7xlMGgM69nOWKExahqc2Qiu
         9KVLKvIjIZXj7lZvJ2Rqf6tkBUG1d/zv7pCeC6qb8VFiA9I2czG+j5sNPZ1kVeS0SyvP
         nl1g==
X-Forwarded-Encrypted: i=1; AHgh+RqdLcGDV+GkY0ponrhfnL0cLMFxjQ2KjU6qIJTCVDInkAwoy/s9FVQfS35pH6kYTmGxhF4oTfVKrE1iPg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz8nvh71V6MPG9TgpOzIipVftsn9j3PoaAX7vVaPolKwuLmXzpk
	69eWTl0fARkrVyEcUqztCHnfqapGe0s9zxpSHHfl7hKxsg0BA/8icDsp
X-Gm-Gg: AR+sD10q+p5TP0+0ruug5o2fSJLvaftaeVt/w4xl7j5dOfkwTPnJmztmro4Zjabz6Ou
	QCCRyf3K4yg8MFBzAoXnhflgG+eX2WIEZ6fkaD37IspLsNhSC+jQWrvq+YGALOqzz1thEGAekPg
	iU8rjm48qwdhaJ9KQlYRaz7VD1/kz9dGwtbVIr+mXItHyM+YRcWP8eg7zjb/aZM9k1hTDiq9wfy
	deUF2N1K8Tw3zW0uWMP0zDTwbzxEHu/95zR+IV6KGhPvjJD2Rp0/v8y7afbGO63GOC6hR6kwQVs
	93quSoVXEuy12AwANoAoyht0YholehLTgNeWXV/sCJuLQBbatnFay47itqaie+bM/4h30VETU7F
	xzKNPhCIdBXmLRB4+SoccBq8xKYp4Bjchr5ziHxrc4nUiJFgZ4lkrQYpt1ZHt78eLUv+JniYuCu
	QNdVIw+r17+lUBhAawSDPIeKt/NEtnfAES2/oMVL9eqtHXnpbJ9ZngvZtUtXnUtOTZvBSOuAyam
	CHVs8+L4Z/7
X-Received: by 2002:a17:902:dacd:b0:2ca:9d5a:8b6c with SMTP id d9443c01a7336-2d035b98770mr29125755ad.5.1785424204004;
        Thu, 30 Jul 2026 08:10:04 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2d022bfbe23sm27880685ad.63.2026.07.30.08.10.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Jul 2026 08:10:03 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Thu, 30 Jul 2026 08:10:02 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Flaviu Nistor <flaviu.nistor@gmail.com>
Cc: Jean Delvare <jdelvare@suse.com>, linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3] hwmon: (lm90) Switch channel parsing to fwnode APIs
Message-ID: <222ac6ae-a6f4-492b-a0c6-68ac0081a275@roeck-us.net>
References: <20260730091409.10544-1-flaviu.nistor@gmail.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260730091409.10544-1-flaviu.nistor@gmail.com>

On Thu, Jul 30, 2026 at 12:14:09PM +0300, Flaviu Nistor wrote:
> Replace OF property handling with fwnode in the probe function to read
> the channels properties, improving the driver compatibility since this
> method is not limited to Device Tree only.
> Add also the needed headers for explicit include and clean up related
> function naming.
> 
> Signed-off-by: Flaviu Nistor <flaviu.nistor@gmail.com>

Applied.

Thanks,
Guenter
