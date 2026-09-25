Received: from mail-pz2-f43.google.com (mail-pz2-f43.google.com [74.125.228.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA2613515D5
	for <linux-hwmon@vger.kernel.org>; Fri, 25 Sep 2026 14:00:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790344831; cv=none; b=ehIoXjQcQmGLLypLy8BtVM8gWFCfLdqkcS+cPBhhoztPKJRE3Uxb0cyczttTTvEqinJ95h2Ayljuf9b30XGxLMmYriLsah/pqlspbsQkqzTFDel5Y77TA+2n5MD7caOjYiNUHCMWLklCKCO81Om5yj45WZ41k+zd3Kgy+oLqRWg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790344831; c=relaxed/simple;
	bh=2H8He1fIaWEIMN/Us026LinmPPPSEuu9arhpUonNLWM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Q2Xdu5OebifGfms1pCiYQL+TYCViXVVRZIH1bHDOsMVB/bvkjjYMkqeTAT+nCgQhdjkAnK9oOImiirvj76bxoa9Ih2OF1tlT27EnYkQwtsCGdE9w4t06ZOraCottIhRaAKpLMT/ogj6dmW6RUrPLulSSvhVJ2Hm58bJ0PKxBy4g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OsHGSbSE; arc=none smtp.client-ip=74.125.228.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OsHGSbSE"
Received: by mail-pz2-f43.google.com with SMTP id 41be03b00d2f7-cc433d52421so343133a12.3
        for <linux-hwmon@vger.kernel.org>; Fri, 25 Sep 2026 07:00:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790344829; x=1790949629; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=UIT8Wz/kXm8JbJjsdHOy8KnROa55AifnObjuh2CsK/E=;
        b=OsHGSbSE/Dou2eSCRNoobq56lEr11LbsgaP9FoCGLna+XbV2fW4izGkhG3xCZTLgq+
         2zSnPq3TFs30vLyvpLxCSRWRYXYzr94TKF0c/7tW30Q304wiQixBI8jVx6qTUw1YBIYK
         +HVVqeDYcagxtgYkCvhn/rQnt9+PQ1hYj5iBu+O2woZq9pVqDrnaU+TaRqzya4/FKAZB
         F4kBIQp3/ucRWYotdfy4xfvcgnb2DZ0Jj8EYIiVEm6YrxNus1YAfNoOb/O6gK0sqxRJd
         YUVGIsHJ/I34Ldc4Ssr5/YKh+1Ew28UCz+zZ2pEKbqKYg4lrmTl+VdeSJ0h5GK+oH/Tr
         kAjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790344829; x=1790949629;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=UIT8Wz/kXm8JbJjsdHOy8KnROa55AifnObjuh2CsK/E=;
        b=sSe8jycHHloD0Eeq5r57gysfFVnuOoRuyQXyLn2bRVSts4lVsermjQCpkR2C8OIs6r
         brwAE0pxRDNJJvoNYakkM2RqN19lnYAaaWWkBLFoKyHWVN870kgEUmZH+vxPaPbkecIi
         3km0CxDZU2/AQt5tvxZDFZP04mxtZBSmKbeWoF0isfTXURdINmvyxhmAOXloy5hlrU3k
         xSr9sOUawLd7CraKAvYN5TzQWPlUixiWhDatiHuZ6q7fmf1Nk9MSLuzFI4iG1b7IpTma
         GMMIF05bXhMyZn2Q5AKWwbYn/BFfhfRpo+8sSRtiXo/gOlS/gtZpp+J2FClr2gYlcjMe
         lJLQ==
X-Gm-Message-State: AFuF++nCx2UfHAHf2sS525ohdPY4oCrUKcQBLvAZ2Eszb5nKcUwK5S4I
	ockgrZBFU/yVBtmNZTucYweq3b7WkSZwqknbbbMGM6cPB6YqGF8Vt3Ct
X-Gm-Gg: AYBFou1f0mQyHvObI1cV+CEyc5xk9pYGzNt94Jy9jr7tDRveozxUFMc1KjftrTBpBv3
	IdTsLspKv+tacEr0pW9vJIHXM2BSxU30qbLAjuV2imjZt9Rx2nxZ+H6P+mS/KGTonxNWu1bG0wD
	3HsdHFVAD94w7pH7XjMfWwQZFJsW8ohyeGfAKXHhgSDy+m5G+XVQGvDdkbjZpxYz94ZBwUqm+6f
	FU2cM2de3Um/Od3ugiWiPYHJOaNws373A4Ld4zgJbjKEzGjw4ZMF0XykpVpEGjGjq9mttYEwdNx
	/btb9/nuOwJnYHWwX1J1/KZg1rDFdFVRGILJjeACIb4sqpn8ZQTvTCw56m5MDLzJurgk8NLBQsI
	zZlhvG/P1opPVjDl1sGWnKFm8mjS5QFvdmF2ag1dbGPbvaaDtr8aNUzLG+Fqs/X/tWTppvo2sjz
	DvnTaKloeMdICYUN+t3CfU619rAPwPcfyylaxwPC+4r9Nmjzg9ZI8SkHitmdwzWljcVmE1vHqBg
	p2k6qUfXTnKjF0LnbaZesE=
X-Received: by 2002:a05:6a21:6e86:b0:3d1:39e9:b269 with SMTP id adf61e73a8af0-3de0e713a13mr5286119637.4.1790344828912;
        Fri, 25 Sep 2026 07:00:28 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-87feb57e56csm1193045b3a.48.2026.09.25.07.00.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Sep 2026 07:00:28 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Fri, 25 Sep 2026 07:00:27 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: ashish yadav <ashishyadav78@gmail.com>
Cc: linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Ashish Yadav <ashish.yadav@infineon.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Subject: Re: [PATCH 0/2] Add support for Infineon Digital Multi-phase
Message-ID: <6d6d168d-acad-4ba0-b0e4-214dd07822d3@roeck-us.net>
References: <20260921065702.93196-1-Ashish.Yadav@infineon.com>
 <CAJKbuCZ1733m5UKXNwOV-3WBYNOFbgUA7QUfhAY51yskv6z-Aw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAJKbuCZ1733m5UKXNwOV-3WBYNOFbgUA7QUfhAY51yskv6z-Aw@mail.gmail.com>

On Fri, Sep 25, 2026 at 12:01:28PM +0530, ashish yadav wrote:
> Hi Guenter,
> 
> I hope you are doing well.
> When you have a moment, could you please look into the patch to add
> support for the XDPE1A2G7C voltage regulator?
> I would highly appreciate your review, feedback, or any guidance on
> next steps when your schedule allows.
> Thank you very much for your time and continued support.
> 

Please do not top post. Also, I was waiting for DT patch approval.
Besides that, I do have a paid day job, unlike this one that isn't paid.
If you had bothered, you could have checked the status of this series at
https://patchwork.kernel.org/project/linux-hwmon/list/. This e-mail is just
noise adding more to my work load without any benefit for anyone, including
you.

Guenter
