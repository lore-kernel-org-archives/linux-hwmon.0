Received: from mail-oo1-f47.google.com (mail-oo1-f47.google.com [209.85.161.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA7AD139CEE
	for <linux-hwmon@vger.kernel.org>; Tue, 23 Jul 2024 14:16:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721744168; cv=none; b=UmuQ4O3dCvAaSwRAFl86RilbY92eA5TRx8ImAFs8Zguy+RGpgSEiNC7Sa+Gf7Es6iWwGW4nFWTVQI6LqjJjDOtYferYSAReEfei9/jV21sK2okUlc+zD7KiF8HjIjzIS8oAzkG6Q9h5Xl/dbg+OXUrjj9/YHobCWm3/anAzdZUs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721744168; c=relaxed/simple;
	bh=s+YRsmSrxFsHoMNyKgmlJknml3IJ4SY22agYFQHRe1Y=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rB9qr++ell421yzuGPRFH73ZyJymwF7ekE20qmvxj8eTPtQJTZCDpZThgYwAw6p5vTzh90K8o0wAr8RVLX3EeAFH/D22ZKOnlXT6Xhh13S/tYq4hn5YLrzpn8AVPSBYGf20A7D08Xe/4mknVmovKu+oYprZPJf1vnyZ6cFOGBKw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nF3W3ggX; arc=none smtp.client-ip=209.85.161.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nF3W3ggX"
Received: by mail-oo1-f47.google.com with SMTP id 006d021491bc7-5ce74defe42so3072719eaf.0
        for <linux-hwmon@vger.kernel.org>; Tue, 23 Jul 2024 07:16:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1721744165; x=1722348965; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=OEe2GVRxxFt1E4rFGlP0+LIT3yyxqIeLFXM2WhSUMZ4=;
        b=nF3W3ggX0xps0z+S2AjepqcytZeYeJijLrOkFP+Ee1q+tvzjLS3ISCIwKp4lAEzmys
         zvobSAaUTg55mn3jNtNqY5km43u2ALEEKDtjnqMeocyha+f6lhbYjK+g1QUcxw6tTJsE
         mUlzndJJ9ni57z13fbQEzK2Ht0JosS7ej/3Fa28SOiHDOnATRYWQUUg5xhxFCCH5HjVb
         6VCayt85HYnGo6onuZ3Z6bk8RfyV/J+Eh0cz9zWnpXnwalj8JXGsm5CuHxh2qGO42S/F
         G3ZnJuWl056VUIz/LbshVeJIXoL8YHp8+dIVcngvZ6+dpzka6aK9C1IEDC6gvxl9+wUk
         e7nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721744165; x=1722348965;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OEe2GVRxxFt1E4rFGlP0+LIT3yyxqIeLFXM2WhSUMZ4=;
        b=fLBNxarjKl95g6NnnrnLht9MUscTg1V271YNbalm216Ilb+HSDvT7eyUmQIcEbzWAq
         9xZ2WYvAyMf/f111s5XgL3OjYudCw0KHabHkdcojWs0CEVnTmmDMBCTAqI1iO9m61F9C
         iZTuwHlWi/Kjsv1mEymVHtkZjeG2JA6UJ8tXpq5cITI9GQWgmxeQ8e4b7qF/vIJgXQDp
         O4fuI+oPyAZzMEppecP9sLbTq153rHYHLU02cdb65vWl2I9GOZC7fQGbB0qnEz9euzji
         LsGxzihBNXu8l7WW1Z9KxYOl6CvC+7hB8ms/FfriokrkbvL0C0GYdDnT0qLS9uo8eK0d
         9wvw==
X-Gm-Message-State: AOJu0YwJ5ZqK39+WddQQbInibv2YOvTjVGxRlqCFyVTSjiFYaalo1oie
	Z5sY3mDSeFaRhtrttUIfRum5/hwceX+4yDOrdoguMLIIX5IhlACTYTU2Yg==
X-Google-Smtp-Source: AGHT+IEUnhihu0QnPscleJ1d9DiVxuym9QZiWS/4+Se0PxPAQoGCIdQ3xDgzqqh7vf1Yov8g6DEXTg==
X-Received: by 2002:a05:6359:4109:b0:1aa:b9f2:a0cf with SMTP id e5c5f4694b2df-1acc5b333d4mr1151380655d.17.1721744165281;
        Tue, 23 Jul 2024 07:16:05 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-70d1b14a2a4sm4422226b3a.177.2024.07.23.07.16.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Jul 2024 07:16:04 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Tue, 23 Jul 2024 07:16:03 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Tzung-Bi Shih <tzungbi@kernel.org>
Cc: Hardware Monitoring <linux-hwmon@vger.kernel.org>
Subject: Re: [PATCH 1/6] hwmon: (max6697) Reorder include files
Message-ID: <5e1d73c0-46c1-4b98-a955-95c3da65060b@roeck-us.net>
References: <20240723005204.1356501-1-linux@roeck-us.net>
 <20240723005204.1356501-2-linux@roeck-us.net>
 <Zp9Bc-2YOFnfheIi@google.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Zp9Bc-2YOFnfheIi@google.com>

On Tue, Jul 23, 2024 at 05:36:51AM +0000, Tzung-Bi Shih wrote:
> On Mon, Jul 22, 2024 at 05:51:59PM -0700, Guenter Roeck wrote:
> > +#include <linux/init.h>
> > +#include <linux/jiffies.h>
> > +#include <linux/i2c.h>
> 
> #include <linux/i2c.h>
> #include <linux/init.h>
> #include <linux/jiffies.h>

Oops. Guess I need to go back to elementary school.

Thanks, fixed.

Guenter
