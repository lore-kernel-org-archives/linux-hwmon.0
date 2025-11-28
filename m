Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A053123C4F4
	for <linux-hwmon@vger.kernel.org>; Fri, 28 Nov 2025 16:36:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764347803; cv=none; b=T9r24YEv7fgB2crSLXHzzimew+cj+II8nFJuwreMJiy5BBNcB1xjwOBgkOlNrjzo7To9798CnEz7TXMY33NNvQMohbz8rC1gDZpEzs7gALRHSDJL74HmHMujGqdCn/8PPjBieMk5l2QSqD/sj1jPk0ElTnSwVHfmZvZrTiTO2CA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764347803; c=relaxed/simple;
	bh=kr6XAX3GH731cjzi4VKnV2LtQU3uss0kHe5M8FyBSFU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Ut6fv68C/m1fDXGXbhUFvQ2GyHrINJVWgKY1zLc8D4K8J2rP/8NhqWrFnd2eOE7CQk4n1UweHGx5HpwUH7OG4qn6w5Qv45WF4rjH8Crsn6z5bjr19TKFCqHvXVQwq4gkBxyZJWqnFLCMvYIPRdiD1bJdYwanVqRfn6SYOMW4ric=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=S6QZuUNH; arc=none smtp.client-ip=209.85.210.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="S6QZuUNH"
Received: by mail-pf1-f175.google.com with SMTP id d2e1a72fcca58-7ba55660769so1765547b3a.1
        for <linux-hwmon@vger.kernel.org>; Fri, 28 Nov 2025 08:36:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764347800; x=1764952600; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jbNHKya0E2lKJwlLyC2FOZsBy0/KISJRow+SYNbETeQ=;
        b=S6QZuUNH05x8dMVLUFDVVU+AvVTOw9c1G12h9gQdwBB21OTYvyJEbHCOVhKXEb0ZSm
         QpBLMYsTWHVl2+mFViMdoi70u3A5Gtw7vFCV/8L8SsVx8BK4LJbjl+uXS4HgiiFo0AZX
         lC5lvFE6BYlK4gtL7w7hF9MdmveX8TpJ26sHP5AseIEhhXrW5vttNBRjNCPs4h4e8Hnv
         cCdBizhMWQ7hzIs0NHxnDC5Z7BVtLjn7mF+68N8Q4lJp2RLonojFBpKD9wrO0ZfQp1vk
         jDBZx30tsO5NX3S5XzSeY3+VOkpbbzH2h3EuhsIK1ZteYe61/p6nwfmqVBzoZYAWxEyJ
         paQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764347800; x=1764952600;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=jbNHKya0E2lKJwlLyC2FOZsBy0/KISJRow+SYNbETeQ=;
        b=ifU73DfCJelnMefaAmHJbBGrhyF6ZCcvPMW4rNAbKGUXlvqavUdRZBPg8XMeRaSc1/
         8iMS5z/VvIqH3xiw83LdvC4Tv8CXxarI0WqoZdjOnxQRpMdhqi9sK3giQCa0q9wEPUT6
         BBKryPekqzoZadl4qE1ptU7V8PzA1Hg7SuVTwCMYskMpfa/JI2YE5X9cgmT+2jCCks3E
         ZmrvWLpqa0v0ecfuS7JHuJL3WW6SsPJnSL3LoepizLnf8h639/+NksznmKwCPG6HMnc7
         FG/oN+WhnSGjVIM1EGkgzOAGCE4HEQT/gACsEa6r6ynGUEsv6Lfe2q4H1HXhbCcKkoQD
         64tg==
X-Gm-Message-State: AOJu0YweAYUxVt2zJl1WlbLsGMYF0I4g1kUsp1jTFUVx1BTvQVsgiHsd
	a+RvJXQNG+YzboyyQWC56R9TbUbRgMG+MfFRSzIAsTZrW6uczG9HkW2L
X-Gm-Gg: ASbGnctXxdUMiucNUQsIOtD7RarH409DFqNuHyONCdD+Y6r9i+RkAq0oD9VRqXj6+8H
	kGmXE31Wp/9OkwEz3CxxrAk1aacFeecL84A6oTWG3djl4vuCkYFPf6uZ4LsZcJkmbnpK4PPUHiX
	tPbj6aZv5+FkTJUp5MYE58zau6Kiq/FtHWg3YT74yVmKKSB1HopBCbJykRXH07Nx6nvplrDDa/I
	vVxn+G+XGa6dCZNSBMIWsfndiufIdE2gvsmWWX/s+BbpFwNSwuRybluled+fZh6+cLu/6Ij/JDM
	jzuQFC+nz5Ax1OKaZXbmifjraAdLgFDKT1RkNbQA8KYesKVI7axFpdbmD6LSFoE1xYrgwal8ZGF
	fOevi8+yiAFZeYn8QVAK/NBI1IAr9KIt9/4BHaI3TjKiYIcFlDfNgJoJ1KVyafB3miiW7D7+Aiv
	EW+0/hT/gIJzEMa81HSBqJVDo=
X-Google-Smtp-Source: AGHT+IHDO0GdukXZKQcUx5DsNAW5rrV9c26FtcSfU7VQ9695O3cefK8NgHmf3K1rDez2TgCnIGzh3A==
X-Received: by 2002:a05:7022:671f:b0:119:e56b:91f2 with SMTP id a92af1059eb24-11c9d870411mr18511999c88.35.1764347799759;
        Fri, 28 Nov 2025 08:36:39 -0800 (PST)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-11dcb057cb0sm22692911c88.9.2025.11.28.08.36.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Nov 2025 08:36:39 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Fri, 28 Nov 2025 08:36:38 -0800
From: Guenter Roeck <linux@roeck-us.net>
To: Gui-Dong Han <hanguidong02@gmail.com>
Cc: linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: Re: [PATCH] hwmon: (max16065) Use local variable to avoid TOCTOU
Message-ID: <2fc6a617-3537-4c13-a8cb-1fbb79817319@roeck-us.net>
References: <20251128124709.3876-1-hanguidong02@gmail.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251128124709.3876-1-hanguidong02@gmail.com>

On Fri, Nov 28, 2025 at 08:47:09PM +0800, Gui-Dong Han wrote:
> In max16065_current_show, data->curr_sense is read twice: once for the
> error check and again for the calculation. Since
> i2c_smbus_read_byte_data returns negative error codes on failure, if the
> data changes to an error code between the check and the use, ADC_TO_CURR
> results in an incorrect calculation.
> 
> Read data->curr_sense into a local variable to ensure consistency. Note
> that data->curr_gain is constant and safe to access directly.
> 
> This aligns max16065_current_show with max16065_input_show, which
> already uses a local variable for the same reason.
> 
> Link: https://lore.kernel.org/all/CALbr=LYJ_ehtp53HXEVkSpYoub+XYSTU8Rg=o1xxMJ8=5z8B-g@mail.gmail.com/
> Fixes: f5bae2642e3d ("hwmon: Driver for MAX16065 System Manager and compatibles")
> Cc: stable@vger.kernel.org
> Signed-off-by: Gui-Dong Han <hanguidong02@gmail.com>

Applied.

Thanks,
Guenter
