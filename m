Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46B3671B39
	for <linux-hwmon@vger.kernel.org>; Sun, 28 Apr 2024 17:33:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714325595; cv=none; b=QAy6SIzUU2VQMTszk5zfi6KbfDTL2FAVXZnUswEsQf/0IziLBoGJbex0q0sOeA3xcjjzZSb/5H+vjDOp2P4FgXfoaNEh7BGErcD0iULOYIpNChQbN2TmybzgHfu5eaVbRS0BYC5+e9Rx8WRl5ki4xQowoFSgfzcFK1hiTBrRJtM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714325595; c=relaxed/simple;
	bh=De2nh2d6lPwa293ZPY3vEBgTqHdBrAuf5F4DsFYY0yA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YhHeOlsLveFqlUKgd88oj/kSIHH/6+cBr0man4f25RxeEBXzOnkQluTHETwmyoiI0MZp47WVW5Yfvv6SSUjgMlUTW2TakE3Xu3b4dVsWQ9L6xeKCPm7YXCmek3RuO+JEZPYI8k86HHowP07o6cLRdXtbHRGws/h3Q4gt7FOiZjc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=K2MdOvg4; arc=none smtp.client-ip=209.85.214.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="K2MdOvg4"
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-1e3ca546d40so31111255ad.3
        for <linux-hwmon@vger.kernel.org>; Sun, 28 Apr 2024 10:33:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1714325593; x=1714930393; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3Pb4bHWXMugcDY20lT5c+KNBtidrr/j0cUbrjDCutII=;
        b=K2MdOvg4E4wFvhqEAqf4Pz9NNRG/+554jQl0ozEcBV17AdDypymi68C/jF+Rai7RL1
         AgMWtCo4TTYKMDq/DY1HaLMA2hffalG+ItYf0WAyr3Ox355m/cEIIGlin4zX6zxvSkq/
         nYR2QxXnEajblenE+CWEb6dAfyDQd9pLL4nKm1FviuH1rAP7ouRaic6Zt/vUMFmkLF1F
         fiSuhPh0vKovApPC+8WWNuVMDJYCxUgyo3HSdGzC/DP/t0MWZicsTzmtLORE/DN/KAQ5
         czeNXmiwbEZKdwFxux+X7akiTakdBR8uTe5XwQtKytoSMCcyp5LhOIXFezuNt02imdye
         A5lA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714325593; x=1714930393;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3Pb4bHWXMugcDY20lT5c+KNBtidrr/j0cUbrjDCutII=;
        b=W4YMq28C1u1e+YQkT08MXBNyKRfSVqBirNMb+G0U65+KSPQk+z2YOvp4Uj1lO63oum
         djRak/3H/1JzoA18hMrLOkkR+3I1nZwATDiBWQwchKIbHoiJizqWKlnqH0jukJVf2vKJ
         FI5oguqWHZUVwpVgSPnggQkwFvSMSJDzMkyBM7+WYi2T5kAmgFYbokTe6ngYtXlps+Lk
         zoxc2/bPG66QSHzrnNBANUrX7JdyvYLBAzb25dHu3dqxEJDCvk8I1ZrdXlbeCome1jdA
         JyDlpABp3tTOiITV7MZ5PRjH2WEFHe7i86A8YMCDtZOCi6DUHJ/98hzoD1VSEcMrhzgZ
         9cCg==
X-Forwarded-Encrypted: i=1; AJvYcCXjY/4GMusep3YaQLerjolex434CprMLgP3o/NzwILGHDcmrXdP40lDn2iR4jDzBWjqrOKPFxKFcEB88MZmsDSxQtBqnzBXmq2Sn4o=
X-Gm-Message-State: AOJu0YxRgCm/TR3tz9IjCIcXecw9z8B0KNMo/Wa4w1IHqKhWROSD6/zW
	xuuUcFD4nMoRPFRuGLt3vUGyfW642LsRt7SRXrH/xWqji0NxBKbODQds+w==
X-Google-Smtp-Source: AGHT+IH9H5pUL1lwVMHTR/An6KTOy7p/Yvn6J/l6Am4d4CfmwHuKLkCiB/xSp2UzhNJNBB0f1QDLUg==
X-Received: by 2002:a17:903:230a:b0:1eb:22fb:6793 with SMTP id d10-20020a170903230a00b001eb22fb6793mr7547898plh.39.1714325593511;
        Sun, 28 Apr 2024 10:33:13 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id l18-20020a170903005200b001e85cf937ffsm18671348pla.101.2024.04.28.10.33.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 28 Apr 2024 10:33:13 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Sun, 28 Apr 2024 10:33:12 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Frank Crawford <frank@crawford.emu.id.au>
Cc: Jean Delvare <jdelvare@suse.com>, linux-hwmon@vger.kernel.org
Subject: Re: [PATCH v3 3/4] hwmon (it87): Test for chipset before entering
 configuration mode
Message-ID: <2fd2449f-89a5-47fe-8d4c-349a2bb1eb9f@roeck-us.net>
References: <20240428060653.2425296-1-frank@crawford.emu.id.au>
 <20240428060653.2425296-4-frank@crawford.emu.id.au>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240428060653.2425296-4-frank@crawford.emu.id.au>

On Sun, Apr 28, 2024 at 04:06:35PM +1000, Frank Crawford wrote:
> Major part of the change for the new method to avoid chipset issues.
> 
> The actual update does the following:
> 
> 1) Lock the memory, but does not perform a SIO entry (previously it
> would have performed an SIO entry).
> 
> 2) Attempt to read the chipID.  This should be safe no matter which
> chip we have.
> 
> 3) If step (2) fails, then perform SIO entry and retry chipID read.  For
> older chips and on failure it acts similarly to prior to this patch.
> 
> 4) Set the sio_data->type, similar to previously.
> 
> 5) If we have not performed an SIO entry, and this is not a chip type
> with the NOCONF feature, then it will perform an SIO entry at this
> point.
> 
> 6) Proceed with setup as prior to this patch.
> 
> 7) Any following access to the SIO registers will invoke the SIO entry
> and SIO exit steps unless it is a chip with the NOCONF feature set.
> This was set up in the previous patches in this patchset.
> 
> 8) Update to the exit based on if it had performed a SIO entry or not.
> 
> Signed-off-by: Frank Crawford <frank@crawford.emu.id.au>

Ah, checkpatch is useful.

> + * ChipIDs 0x8733, 0x8695 (early ID for IT87952E) and 0x8790 are intialised
                                                                    ^^^^^^^^^^

No need to resend, but please run checkpatch on future patches.

Thanks,
Guenter
