Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE9A1392C56
	for <linux-hwmon@vger.kernel.org>; Sun, 19 Jul 2026 14:14:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784470476; cv=none; b=M4AB4rn2X2GtwIjMOfvZmV6SO0D9pGxux7aqBL715O+SNZtZHP+yizTjLYt265Tp8bwg5y1/q/MKIt4B5ws0wvrNNfgLl9fokX2uU3vsVC+D80XnVx0CHfQnI9ifNCSDsMmGZl4d1ZbxHwUnGHNB3a9Xa2FL/yxpqI2AHeSbz1E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784470476; c=relaxed/simple;
	bh=iTQ5eVC5My/1IKpLKukvD3LDaaYCKw7mpA7nlNUh9/o=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HlfwnCGKP11GFZq6tUfBaS3lFOj7MXwntZTtauC3I30yxlcelcPqW67JqHwjaPT9uq5bWDlrxX3l3kmgbRN1cg1K9Ue9/JV2sEwsSKYbQF1w/3k4wm3iuic6LyzKRm+siSHmuc4J7jOx4QzgZ42DsO/nQF4ERuZZQKpGAVWGLBY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ofaSbsUZ; arc=none smtp.client-ip=209.85.214.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ofaSbsUZ"
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-2cc7e86e7aeso64328275ad.2
        for <linux-hwmon@vger.kernel.org>; Sun, 19 Jul 2026 07:14:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784470475; x=1785075275; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=n2N8PaB89BjBFQQirHGUwSYMiI3hFQ88ZPhMpFSl/mk=;
        b=ofaSbsUZskCV0QyXTNJMNSjaYBggDYG//HM+yNQFvZ+XRKm4ABs963G19r3vgfNK1e
         C6QBxaEeR9fJXEhpg99JKxSt9+OhI/RWUwKnOcOKWOMJcD/wmihv8Md22IUCUBplWv3c
         CZJVxSZRvHfDK6NcefqOGsUkFL7uRoemHjrOsmo6VWWRUiIgqJWL7QfJ4Ut36qLA3HAn
         zTixyNcdKw2DI7gaVqfvg1QNFqGCceDk1JDKSb0J9TkNrJ8xRO/3YumvB4qW+Pp8fUBA
         wtoNZx4VOfTzZ9S3dgoFi1YmQdNNkLhJvwcGSsnCNXg3C7vsk8mY/2Bc9KrpMyw6GVRk
         lzjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784470475; x=1785075275;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=n2N8PaB89BjBFQQirHGUwSYMiI3hFQ88ZPhMpFSl/mk=;
        b=hSvU8K5tLqGjO/jnWsRLp5unXEUwDTniuzQtvnElfeh5I1Z9Iw9wmvll959hT3xzpO
         ULsUaNUn+CWF31d2GA3W+wXqMnsg8l2mvhQgYidCbBQCms4OJQCXQcRxs/Lojst55IAp
         m23GHAD5b6+9o6WR55VMfUQCn/iEO3I6hYTz4gevRrx0HF69W0nw9lcRdoAIFBWMlhRl
         kyRX7+OgOzDVWTr+ea7KgvkwQJyJ87+x32zN0oA7e0TLH1/sSy9LHAGcEmrDKBElmlv8
         kLcrvNE0GgcoETkdLCg4yb+o0Rw+psG8je8JLhUYBINo/FrxqjczB21Gz2oQAhSTWF+J
         D6DQ==
X-Gm-Message-State: AOJu0YwneSypf4zXxv7DnBM/dcM1KO85bnZru4QGdE57EP1nlwZXsnGd
	2w0PJ0MHp0m+2jW95qHMqLRMqz1+N77p1C6qHG5F4S1BhMnLhqTg8wk92g78ew==
X-Gm-Gg: AfdE7clc2X42z9qrBj4ZJ6E3RCgMM+sdSCZKxDmsqn4m6d9d14xZizxPY+k2L+uDkEL
	LnFj06DcW8Y//+tOFOLLhPvvSBch665UX5cFlOGZdUy0pDke+FslDRkNKKUBIPNHaYGwnpOyf/O
	yHqAJXfrMS/i+G/AdVUdliT13NShIF0b4yLypHPVz69pGfY5GunWaKIvxOFhwA3QwXhtrBYNPZ4
	Qwi79PxU+joWtPNbTgNH7ELhVlLFIWGtbL+DnCbHtxjHiwvcCXGrlw7TJmixqlxxxSu5/6mdDna
	s3vQbQHFKeq93GNC1MinnM8jVWKX7g/PwVu7o0Z4iOyVlk3+DzjUM5uiUoggDB7gCntk+fOV8xm
	kUmAKcw143jJHb+Wb6s6lfCS7fhUl6VIDEWzBA0/rdg51W9yLicPAiI/2K9SY94b+OMSPB57QlW
	QaM7qO3W4HWosNU9wQyy1qQZfzJg==
X-Received: by 2002:a17:903:11c9:b0:2cc:86a9:ec06 with SMTP id d9443c01a7336-2cf349da279mr110800255ad.37.1784470474948;
        Sun, 19 Jul 2026 07:14:34 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2cf346db036sm41586785ad.46.2026.07.19.07.14.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 19 Jul 2026 07:14:34 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Sun, 19 Jul 2026 07:14:33 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Eugene Shalygin <eugene.shalygin@gmail.com>
Cc: "open list:ASUS EC HARDWARE MONITOR DRIVER" <linux-hwmon@vger.kernel.org>,
	open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v3 1/1] hwmon: (asus-ec-sensors) add missed handle for
 ENOMEM
Message-ID: <d8e47230-70be-4567-b37c-eee6a4ad64aa@roeck-us.net>
References: <20260712130602.1256700-1-eugene.shalygin@gmail.com>
 <20260712130602.1256700-2-eugene.shalygin@gmail.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260712130602.1256700-2-eugene.shalygin@gmail.com>

On Sun, Jul 12, 2026 at 03:05:05PM +0200, Eugene Shalygin wrote:
> Add missing return value check in the setup function.
> 
> Signed-off-by: Eugene Shalygin <eugene.shalygin@gmail.com>
> 
> Fixes: d0ddfd241e57 ("hwmon: (asus-ec-sensors) add driver for ASUS EC")

For the future: No empty line between tags, please, and Fixes: comes first.

Applied.

Thanks,
Guenter
