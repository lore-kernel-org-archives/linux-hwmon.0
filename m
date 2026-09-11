Received: from mail-pz2-f12.google.com (mail-pz2-f12.google.com [74.125.228.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C9B2296BBC
	for <linux-hwmon@vger.kernel.org>; Fri, 11 Sep 2026 00:48:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789087708; cv=none; b=meNxVTguwBx6Wzzsk1qOpAgpNvDXnMHoLsH4yAgP4Pl/Gk33Rloi0oOSfyL4Uxsv+iWiSIgvqd/muN5RKNC3ati5mfA8r8ZLDLv1kmkDcllihMDJDZmKF6uY7zsDo6Q3nC1qe9jpeHWG3u88qDOET7Jp0Vr/UR9KX0CdZBX72Gk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789087708; c=relaxed/simple;
	bh=5QUvirxnBbcXVaWpIRvOp+xlEii7ODtudQKqtm0wib0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dIqQ06goEP+3xBc/YKqc2rEaLRQis/rcgEk2pVmRF0z9bHjIsbUQIKD2mxRwZmuAsB3CIPRLro7pSYHXLGhNnMSO1xeKUQHmo/nS0VFdgOVBmjl6exZPeRgVdXDGQJ8dG5ptbdeRFlIPlN7TlI28AT3xhV5VPwn4n8YLL+zfwX0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=aJho2FDY; arc=none smtp.client-ip=74.125.228.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aJho2FDY"
Received: by mail-pz2-f12.google.com with SMTP id d2e1a72fcca58-85469e25400so205961b3a.0
        for <linux-hwmon@vger.kernel.org>; Thu, 10 Sep 2026 17:48:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789087707; x=1789692507; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:sender:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/DPZA7vd5t7QEIfkeBG49EyEomkUElo6uwu/PYojC2Q=;
        b=aJho2FDY2tzTby88iGJ/KVr7BTYNH1Q+/t62XSgv7r83qZVfWl5ZCBNgRyRczdH58A
         +WRub4aNILLkgSTbL88JjYo9u5d0i6aZcjhiyjvARMxaKTcdRi+Kou1mCxVJzt2MYuPB
         I65MJ1VKkskyJQY9FPqprhleM81oVeudFzw2waUQdh9c/vZyydcT+Uolc+u5LQXBDUUj
         87J6EtjVdnZYShaSMkbVNlkblvQ23TYpf+7CkOMuP6lsz4NsXNU33oE4GNkajct+AYeU
         LHFqbEpLLNaVghsYCtimt7IPx0k6fhuiB7pqJbKF2jNcsZ3Y5IptqWnRZjv2VC8pojSj
         Sn3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789087707; x=1789692507;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:sender:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/DPZA7vd5t7QEIfkeBG49EyEomkUElo6uwu/PYojC2Q=;
        b=UPCDIz6ETm02jh9HZAatQ4yvqvOg1+pa7eyLXukmxbg9s99D7c5bVpG9Fify3gzYdQ
         Tfy3BRFGoijBCF34Fx+A+hCOrXp7r0/14PXzEgXYTwq+KerGujyhmwfxHXqpI69Vm/Xd
         xXT/fn3SYcgS9Z+yEdtd3YElYiwL+vtViJSkvPkRMSKn/1pa7zSSHBf0UOlsciNxR/ek
         gy3i8LA2tpebbcZAHcGCSZ7pJHHzSqiOmhxGXOBu5/Z7KCaX6jvVttNEtFPUK4m5T+cR
         TmII4cczrdvmxca4IMIN68E9JIjgyH3A30HeZqVOJ3niyaKAuBohbsGY1j95d4SmIjN3
         MEMA==
X-Forwarded-Encrypted: i=1; AKwUvBx2cYgq+7D2AZLKrCjB5kb0bCIUyrjK7fp6Yt9iRbb+3iJPabXI1lsBOda5OZo8P4BtpxXx1H9OyEFH7A==@vger.kernel.org
X-Gm-Message-State: AFuF++mD+N3GGmf3O/NrCxUIi2AWCND+nnJkyWjSurD7chN4lqs6vRuP
	O3Ki79YYzruQpOlGZgCOFqV5uz3ZGDPZIk6rU8RB07skoju2cZOon8H2
X-Gm-Gg: AYBFou3Sl9skS+wqgI/hY8VY4Re9gRtQ0eL5i7/3T4htlyv20Zf4uFVmG4NwlmGOWtE
	Fhoc6oXzVH2F5drOzJu0yYwkEQ7L/vLxypAmiskBb4oUkx1eId6rhrpKjeTAIX41XbyUkTqeBrZ
	M9WQ00wQ1U4Kovuku6Ias6MWwf+KvTol+SdcDsC2I/7MwQVsEojqTHxjsj2KLwxLIUjj5+1QTdU
	X/My1cD5ZFrEIPSQun/D+DMjc7cGnSXUlaYNoy4XvvjndCAzAWBchzNJ0TRjb5/vaCXTvSJ6ym+
	Lm5DtTzhz2MPPpeLZB9bzr3X109YxGmc8sSRrmuCveyL7uXZzV33U1LZhigWriaJxqR6m/7uHSu
	/8eGelEDxo71gnwGbBJJnkt6w376csWdQAnKfKfiLwnBMOqw5DyRgwazZEsEz/Y/zb2t+/TsGhx
	6c6kTU/YIt6h34DAcZINZD6UoAyTNwn1cPTvqaIYmsfCqGV8XSclZ3lblEtcH/zgGxWWp4pDKlg
	H8i0gZeAhYG
X-Received: by 2002:a05:6a20:b08d:b0:3cc:3d08:da3e with SMTP id adf61e73a8af0-3daed217b76mr3313536637.2.1789087706544;
        Thu, 10 Sep 2026 17:48:26 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-143659a9a06sm2164759c88.0.2026.09.10.17.48.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Sep 2026 17:48:25 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Thu, 10 Sep 2026 17:48:24 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Rong Zhang <i@rong.moe>
Cc: Clemens Ladisch <clemens@ladisch.de>, Gabriel Ford <gabriel@gford.dev>,
	Mario Limonciello <mario.limonciello@amd.com>,
	linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] hwmon: (k10temp) Fix model id range of Zen5 Turin
Message-ID: <0bf3bb99-a37f-4d8e-9ee2-1346240c89f0@roeck-us.net>
References: <20260911-k10temp-fix-zen5-epyc-v1-1-643f5a248ae1@rong.moe>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260911-k10temp-fix-zen5-epyc-v1-1-643f5a248ae1@rong.moe>

On Fri, Sep 11, 2026 at 02:39:25AM +0800, Rong Zhang wrote:
> Model 20h-2Fh are mobile processors with single CCD. For example, model
> 24h is Strix Point, i.e., Ryzen AI 7 (PRO) (H/HX) 360/365/370.
> 
> Including mobile processors in the model id range of Zen5 Turin
> processors leads to bogus reporting:
> 
>   k10temp-pci-00c3
>   Adapter: PCI adapter
>   Tctl:         +54.1°C
>   Tccd4:       +148.6°C
>   Tccd6:       +148.4°C
>   Tccd7:       +149.1°C
>   Tccd8:       +149.2°C
>   Tccd9:       +149.2°C
>   Tccd12:      +149.1°C
>   Tccd14:       +22.0°C
>   Tccd15:       +22.0°C
>   Tccd16:       +22.0°C
> 
> Fix it by removing the said range.
> 
> Fixes: 8440d5aca227 ("hwmon: (k10temp) Add per-CCD temperature monitoring for Zen5 Turin")
> Signed-off-by: Rong Zhang <i@rong.moe>
> Reviewed-by: Mario Limonciello (AMD) <superm1@kernel.org>

Ok, I assume this is authoritative.

Applied.

Thanks,
Guenter
