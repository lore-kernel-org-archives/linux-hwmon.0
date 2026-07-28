Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D212320A04
	for <linux-hwmon@vger.kernel.org>; Tue, 28 Jul 2026 15:49:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785253792; cv=none; b=h9cHzISmWa8v8YKPXBOqtGx9H4hvYoKI5n3NLD7Wh+HA0a3/hByp0ssTjeFuLPSZ9bi4mnavxQ8OrrzHunXaTqAJKmctkYXpX5y47ZYtqtZ5QolnxZDUoEXGU9Kw4zKQUiOBRteyObN+hzGy2XmcNbAvkmSXx3NF1g4y+AcrWy4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785253792; c=relaxed/simple;
	bh=q7Rfr7pvU9flOt5BGgdXDRJFODGjd4bb2GYbv7igOyE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IrFsdSzgEqBzEQlikqMT/0YD2gG56CZ5VpuSjDYv1nXc+ITqjhZZifLQhJq4G68EGaR4peA4psmbPC/2Mmo5ggCnoKEuyUlPQQuPTNZn9pAGatZeiEvkW7eAh5xB1lPv1z02lYG+iOwT4/ioptcImP0PTe302+7xMFiVwjrn4Fg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kAYMDNQ1; arc=none smtp.client-ip=209.85.210.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kAYMDNQ1"
Received: by mail-pf1-f172.google.com with SMTP id d2e1a72fcca58-848595b338cso4490026b3a.0
        for <linux-hwmon@vger.kernel.org>; Tue, 28 Jul 2026 08:49:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785253789; x=1785858589; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=id+yadgVtBxUrNMRa6lh7wn0tZuVNwAko2sybBFUr4E=;
        b=kAYMDNQ1PLt7iJQ82vBQr68MsQQgeOkOxAYf5QYrc6imE2h+Pxw5yBbLqM1Bp1EGuS
         adB2ROIUlRIgIawR7SxVh038SrJdL7I7HFQcpQnAiZdydcdOmj2B+Wkol45r7x+HFHxP
         WgYo3hLMUYch9uXOu6eXAKc5vFrWCjoBPkWhbAAJXOJPNe5LgD6sKG4Jr0OM9jHtAc4E
         es305Lm8crAMD5zcmwSuSPsI8qUIsMgFCHhvnvdlNxDjG86BLo5wMVIKbXFjyMn/iwfH
         9W757fllDLUTDpq/fwrQOL6s09GfxNHCILcqpAKQd61iayswu0iRQxrdpCEqD34DvZDu
         D72A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785253789; x=1785858589;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=id+yadgVtBxUrNMRa6lh7wn0tZuVNwAko2sybBFUr4E=;
        b=ruzgvTivfBOB6O1YB0qWuDqAsvFGvWT+uHtM/2iZiqHQotU/TLDGSinu+f77Mledp3
         BBEO6IDKQvvFMoKI/JnkMwnJBzTRJUYqTjLTKDFXft7B16jW28qVtNvuZAA9RUf3C32E
         lPSacUGJfTUYPt6MLnPJZI8g4HtiKWwzTBUm57cAFDd7MW7iq9vvlZ1p8NQM8YV8zexq
         TFUYbfhrq2/GjPt9bCY/Ep68tG0JlP/H1cif3FPFDT9+6t7PCX0q0ZqR7zWfwqnijR6g
         Ux6aRIGu9Sly7TD/tSJrFq6L+aPqXT4llDg1sIelC74A5xYiEnA530auuSeCd9G7yCRa
         anVQ==
X-Forwarded-Encrypted: i=1; AHgh+Rq5pFl6LfFhZHpRBZICB9VPlSCNtzsZSge1Z/H8UI56cBAEKUKAnby+N9A18KTt6C6pDhMN6pJYXg+VmQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YxfekDK2Q4djbCNDGfc56tk0xAzhnOjoSWwUr19TzdXVRrLHkO5
	JOETUZWwF76UjhhYAp2BSVGn6xmlzsm+n+9a8m2sTL9jNK++bYrw02A4
X-Gm-Gg: AR+sD12ySamWnKvSiUWO5VuGmcLnoqaNgSXUybppspKPvCdk8K0ub2qSMceehFz+W9a
	GOeQy9y6naUxUJHvDI3C7tkFt1OiOpj02Z3Ta6M0AFz3QQlgYT5zCtakQd69eqjUMsg4i5VmXoK
	Xff3sm4f0jsBhbz7S/S7tCPz60SS3UN8DuJv4th5sSafXYDt7LndCBJnvbFUSz6sbw6uCYLDp1E
	IPnb3NnULnSfV3xN+dyTuCimrYBF4mr2IFUXG+Wt+s6pU3UW1Sw/T6+aAVXaPD/5ZWNmmRHBWeg
	zLXBhjJKwVnL2yVMCoqg2LvbDNLfjCbQf2tUti9oqmw4m2bGJdzC1Dfd0if4foZxEnNRmJE7Yq3
	Qen/1/YAZUeyIKo8NWQpmeusbCYuZzOVd+n9nBIxyvWAU+m0f0B387qgoZ0zeMB0MSqWP3P0oOS
	X1kEsy
X-Received: by 2002:a05:6a00:3e1d:b0:84e:538:476c with SMTP id d2e1a72fcca58-84e933915f6mr3207643b3a.67.1785253789231;
        Tue, 28 Jul 2026 08:49:49 -0700 (PDT)
Received: from localhost ([118.34.230.2])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84e9fe20e35sm142647b3a.1.2026.07.28.08.49.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Jul 2026 08:49:48 -0700 (PDT)
Date: Tue, 28 Jul 2026 21:19:47 +0530
From: shaikh kamaluddin <shaikhkamal2012@gmail.com>
To: Guenter Roeck <linux@roeck-us.net>
Cc: Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>, linux-hwmon@vger.kernel.org,
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] docs: hwmon: fix spelling error
Message-ID: <amjPm6kTV0KcWNXv@acer-nitro-anv15-41>
References: <20260726065835.21012-1-shaikhkamal2012@gmail.com>
 <b263e111-4664-4b37-8e75-3da025fe6c6b@roeck-us.net>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <b263e111-4664-4b37-8e75-3da025fe6c6b@roeck-us.net>

On Mon, Jul 27, 2026 at 07:37:30AM -0700, Guenter Roeck wrote:
> On Sun, Jul 26, 2026 at 12:28:35PM +0530, shaikh.kamal wrote:
> > Fix spelling error reported by codespell:
> > 
> >   supprts -> supports (sg2042-mcu.rst)
> > 
> > No functional change.
> > 
> > Signed-off-by: shaikh.kamal <shaikhkamal2012@gmail.com>
> 
> In future patches, please mention the affected driver in the subject line.
I will take care this in future patches, 
Thanks !
> 
> Applied.
> 
> Thanks,
> Guenter
> 
> > ---
> >  Documentation/hwmon/sg2042-mcu.rst | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> > 
> > diff --git a/Documentation/hwmon/sg2042-mcu.rst b/Documentation/hwmon/sg2042-mcu.rst
> > index 077e79841d2e..431ed832d083 100644
> > --- a/Documentation/hwmon/sg2042-mcu.rst
> > +++ b/Documentation/hwmon/sg2042-mcu.rst
> > @@ -18,7 +18,7 @@ Authors:
> >  Description
> >  -----------
> >  
> > -This driver supprts hardware monitoring for onboard MCU with
> > +This driver supports hardware monitoring for onboard MCU with
> >  i2c interface.
> >  
> >  Usage Notes
