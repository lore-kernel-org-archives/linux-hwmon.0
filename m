Received: from mail-pj2-f13.google.com (mail-pj2-f13.google.com [74.125.227.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81AAC372EE4
	for <linux-hwmon@vger.kernel.org>; Wed, 16 Sep 2026 15:05:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789571110; cv=none; b=on2ymlyARlGqPXDSZUB3Edh7RAXF2/ZnVO5AEYJ6cobvSGs46EwohpQ8zy/V2cxQ+u2au7a+DoQiVWTi6mR1kRZOmjadVngvmrRxIERu0j68vDMCH+9fA01BoIuGpQTQo0abpdeFtU7G8+1Yl7RKGLm2LBfTXkZbcxQdaP5XVjU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789571110; c=relaxed/simple;
	bh=UGH2BzlDTaQAN3ngnFgegpzeVSHQi2yZ8hlwGyKZ2nA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dpacFATv6esXxPePU4nqq7b6auuhPQUI86ecrNpL6kStuvdfJUt9U9HvRG2ynLUZMzTFW1xm/hnRxf2GsnUtXrj6Gp9BIGkEklFclnW+kH8FIFH8We7jtbYz9GpGMCfLqTcaL41JrMn7WdDbRHEBoONivtoedN77qEt36kNcRSY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gvnJhKQC; arc=none smtp.client-ip=74.125.227.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gvnJhKQC"
Received: by mail-pj2-f13.google.com with SMTP id 98e67ed59e1d1-39d654f02baso849647a91.3
        for <linux-hwmon@vger.kernel.org>; Wed, 16 Sep 2026 08:05:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789571109; x=1790175909; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=DSGg7k4lXbnMmb+PSQkP+q66W4gnIscXzR3JqjEjm5M=;
        b=gvnJhKQCi1EL9sFh4P9gym2zHyPis5esjYqD7qh0arnMbgGUyAJOX9LuuXZSw/K5dL
         BO+qburCP4ZYAFa1DvbI9OZFmWApaA2w8oenGpkiwvRQ4b1ka1egAqVSukimP99uk1FH
         RHBmez8qc1YbM3AJjP4zpM2RpSVnnUK+Yw5+nVWWmuF7uxi6els2EAcEOLaCb+i5e2ru
         dqUd/XrfuMh6hKlZsiMDSDIUy7ihAjl2JlrkKD74cNggvjeYsrSwJhvfpat/mkd23AB8
         wFlp+/rsTYEsSEnjNVGmpvd/Th4cwJgarj3b1G4Sk9WKD8GCUqS8lfepxTty6TtlXbK7
         uxmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789571109; x=1790175909;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=DSGg7k4lXbnMmb+PSQkP+q66W4gnIscXzR3JqjEjm5M=;
        b=nsI0CvndjBAqVcfEHA3KwqD844zG2T6onpejLtzsGNXerWxlidT1ZOqsBZFlTuAvpI
         ubG2d67VyHKa73YA7Q2XWJ4Av9PcmvRlfWWGjkv8ZTWRtsAitFPVLyA/lOnKklsarx1n
         gUItzoWjGP660rQYD1t5PloB2FSJptgsgu3UZBwUcc5st9O0B2dcQlcDtDT4wJu5Mx/x
         84BdNod4UiT7z07RiB/GqhhIDhXmc12QSiSj8PyrzlOdMZa+caMmPBvVoO42pFwxW8i6
         6ShVUJlRzniGyquX1aYyundtvn5215q7AqvWFxGz6YpVB9r1xjuSP4lZerxfFqjfS2/O
         2lZA==
X-Forwarded-Encrypted: i=1; AKwUvBxxO6zjv4y8gHLUurslZduiRjgrcO02u6Y2Np5FAryPc4pLkki6uouQQTykOrzOhO5HSakzmm21FXKzJA==@vger.kernel.org
X-Gm-Message-State: AFuF++mPAXeef96jQZPcCoPn5LesZOhRQ9vHL/Ar1siU2gemMRleoLTv
	dQpn43LxofIxVSUn0cMdazenj4wnMmpGHykN5r9G7SAsq90BrSWXtTFzwhrKDniR
X-Gm-Gg: AYBFou0/kn25CFYC9gax6W8liz8g1bRKyLmEUN9fEqtqX4UjWmqNk9oQbZtQuS3N/5i
	jPhUUfaFeClChOiOpqedEtb3EMWX6o6Nh62OpQq0lCpxeChzXtTH0D9pxp6Qm2e7B3kIDOAiyhA
	YvI6Y0SEHFgutkiX9pJ7KjpvOppk88w/X7IgUhZfEbGYeMq+bXwJ6VHzs6Pe7LknpfnEc+Szdkh
	cZs8wclBr2lhxOXV73w2VuqTJPTedFbrKIOtWV1dpHujMwR+PAA35LdShPGvlAIdEbSdmATLb93
	g1k9u54GlpsA9+nUtiIoqidnAeOrim6hn7/NFYzbGtaXagAcdZUPG1vU+F6d6JpWNKEEjFB9yI9
	asBdNl7RWPBBsFpimtzxC+8Coxo1wid8WZMB/yolwYusYJZodYBHAPh8MW0fecN8Y68udx4yZsV
	Q6xebhu+XSseRtW4hPs/+0o52y8v6VDXVunonLg2xVcFzFjwhK+INxk8J5DT771h6eArz1oHPkU
	Lz+yd8xg9VH
X-Received: by 2002:a17:90b:4ad0:b0:39e:3559:12df with SMTP id 98e67ed59e1d1-39e35592079mr119891a91.1.1789571108738;
        Wed, 16 Sep 2026 08:05:08 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39e1bb9f395sm5935562a91.8.2026.09.16.08.05.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Sep 2026 08:05:08 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Wed, 16 Sep 2026 08:05:07 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Cong Nguyen <congnt264@gmail.com>
Cc: Simon Guinot <sguinot@lacie.com>, linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] hwmon: (gpio-fan) fix use-after-free of alarm_work on
 unbind
Message-ID: <9ff67a19-204a-49f8-98ea-0ed839ff02a5@roeck-us.net>
References: <20260915035409.4177780-1-congnt264@gmail.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260915035409.4177780-1-congnt264@gmail.com>

On Tue, Sep 15, 2026 at 10:54:09AM +0700, Cong Nguyen wrote:
> fan_alarm_irq_handler() schedules alarm_work, but nothing ever cancels
> it. free_irq() (via devm) only waits for an in-progress IRQ handler,
> not queued work -- a pending alarm_work can run after fan_data is
> devm-freed, dereferencing it in fan_alarm_notify().
> 
> Cancel it via a devm action registered before devm_request_irq(), so
> teardown frees the IRQ first, then cancels whatever's already queued.
> Guenter pointed out cancel_work_sync() still leaves a window if
> something schedules the work again after it's canceled; use
> disable_work_sync() instead, which permanently disables it too.
> 
> Fixes: d6fe1360f42e ("hwmon: add generic GPIO fan driver")
> Reported-by: Sashiko AI review <sashiko-bot@kernel.org>
> Link: https://lore.kernel.org/r/20260830152150.27F5F1F000E9@smtp.kernel.org
> Cc: stable@vger.kernel.org
> Assisted-by: Claude:claude-opus-4
> Signed-off-by: Cong Nguyen <congnt264@gmail.com>

Turns out this was already fixed with upstream commit a2471ed17b0e ("hwmon:
(gpio-fan) Fix use-after-free in alarm work").

Guenter
