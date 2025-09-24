Received: from mail-pg1-f170.google.com (mail-pg1-f170.google.com [209.85.215.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E55FC21D3D2
	for <linux-hwmon@vger.kernel.org>; Wed, 24 Sep 2025 14:46:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758725198; cv=none; b=FLjdal5mJTMcKOwyxqMHA/2ksRmkb5OuPQUEm1yERmmbVU7kOy3V9BHjOKhuqAg4Thorwl//QRwERdx+eAEamPGEVuLfgM8183zqEn/UkXiQnRdKeq1szyOdU60Mhg4Ffv26xapZzex5KxRpMTZ1EqDwUf9PT8RUYEa2tCEhHKY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758725198; c=relaxed/simple;
	bh=/b6rzqpITIsdOkOWf3TX2gnpE429NTbrry3tVkD53A8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TuWd1Tyt9nLIE71fqg8Jlcn/NpNrhedCVGkN+2MG8VhchWafIenxeecKpm3OLFw3IWRH0zHPEm/nO07XP5ZBwfqf23pcYvnn9LIhiHje5FwIbRpnIkOO3dAyclIAcBaGCvkSHK9ApK95Eh1sZkEfyG6/uNHGAZOBuqPy/fTRVgo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MY8XANff; arc=none smtp.client-ip=209.85.215.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MY8XANff"
Received: by mail-pg1-f170.google.com with SMTP id 41be03b00d2f7-b55562f3130so2203333a12.2
        for <linux-hwmon@vger.kernel.org>; Wed, 24 Sep 2025 07:46:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758725196; x=1759329996; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=a9ouh23wKH8Hov1aS4+sRdnO60nkd+0PEUnBljYhGHw=;
        b=MY8XANffHXUemkf4q3A8Uz7joHyzO920Nxpf1jIadlT67WOxpBkc/Fg8kfsMt0WwtS
         FkzQbXdodiDdFqQLvoyBDgbCyPTANQmi5kceyujKTn2BjMduuld6GzGVaxZMSZ9ZgH4M
         lBp+/dwC1hVd1CB4r1craSQMSIHR63uer6Eo/FcdF7hV/44AaaINF9sXP7VccLzfgt1I
         e6FmtB+UTtXJ8qg9KYDH0MbamT3gGrx//Hx2Jk1Ze7VYHwv8ZplvwlPe6sHunyzoEKwG
         0lVmZa2fDnCdE2KUqIrbzfzurm4pjYmtNwUro1nwY4LRgWSuvYCDm9pJa1Z9eXBPyvkn
         9OmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758725196; x=1759329996;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=a9ouh23wKH8Hov1aS4+sRdnO60nkd+0PEUnBljYhGHw=;
        b=oPrZchLzjms19zXnWRoOfK02yOkv95bTsPW/6fYQpMHz6OT17z/EJhbACTQ4LXaAn7
         h6jFI7e66N5NASqbCzgIw5hMXgGxQQ8z6u1rOq98eY88zMDqBPFBE/MGN353XRGj9fOl
         7sWYJfSTWKBXrx2N7LBogNBPIWrqUPfRl3z2Rm7cM27oxYTvhEsS0Hy/yOjXVjEi8zEz
         Hjg3mH2HvypVn57dHBeYMij4K9QIfOCyFhZr5pLlUm9123zmDVz9XTVEMSamTAvfDlfz
         QEzv7QjigexeYK/7p+Nlijsrk47pgjKRY76rJO4GNSJFXBMW7+6Tbsjw98g3rsgW9UQH
         L/3g==
X-Forwarded-Encrypted: i=1; AJvYcCVvA9OtT5ZUtH4rYuIbeSuUh3Oxhsj8EmzQtOpzoQOO1wfDS12+QrktvyTF8HTYEiGKMNz69KA/mnlhIA==@vger.kernel.org
X-Gm-Message-State: AOJu0YyckbXNuS4MdPxfctmqQDc7JPFCF5Fwv0AgAYpQBHvPMEzH6nyD
	yFIoiZEWehTrl/AQq48aM5dH3O8UdH3BGS9oeo2RGFHAm4XcozIxwpzR
X-Gm-Gg: ASbGncsUKkVK6aiJ9sd6hzH96FGvLAdgnVj8p0qf3esItjAtIhSUuWMY8MRPvqWq8z6
	rguqwOxGMZmdgSw9ympPJMczNmIlFBaTrHjIs3pPpDBZhumAXuhDKiTc1Lh1yYKU6EHEi6wSE//
	ZmWOXmlaBN0ZJSkDru63FfzEKwin8oNKSRh5OWlsctYyX0REcItX0dQlN0RaFKWt4KaEIRAAxAA
	OF481sCDQi1WHxRqTcZtsEOzSqdd0WP1+e71M9y3jfI+gfmabqim8cyimFJiipP8sciBSLPjK1d
	t574VJ+RQkS6K+uoV5MNB6EUzmiUBhVdEMN2+0A5mAjTEcm26O1mo0ojBAaNXys56oQKr9MsUSM
	mFhuwy2DBEzUOCOE4im8CwHPNQstVRN3E2Kc=
X-Google-Smtp-Source: AGHT+IHqSoeyuuO2C2WGsp9Xf1TZsjA6w4VP4HE3ZfihkrSmGZv0rK5DAquxViezbQIaAuFaSLgifA==
X-Received: by 2002:a17:902:e951:b0:25c:76f1:b024 with SMTP id d9443c01a7336-27cc24e015cmr72459785ad.25.1758725196096;
        Wed, 24 Sep 2025 07:46:36 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3341bdd3a0dsm2660014a91.24.2025.09.24.07.46.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Sep 2025 07:46:35 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Wed, 24 Sep 2025 07:46:34 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Armin Wolf <W_Armin@gmx.de>
Cc: pali@kernel.org, linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/4] hwmon: (dell-smm) Remove Dell Precision 490 custom
 config data
Message-ID: <a9a60505-97ef-4f50-9da9-6caccbccbf66@roeck-us.net>
References: <20250917181036.10972-1-W_Armin@gmx.de>
 <20250917181036.10972-2-W_Armin@gmx.de>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250917181036.10972-2-W_Armin@gmx.de>

On Wed, Sep 17, 2025 at 08:10:33PM +0200, Armin Wolf wrote:
> It turns out the second fan on the Dell Precision 490 does not
> really support I8K_FAN_TURBO. Setting the fan state to 3 enables
> automatic fan control, just like on the other two fans.
> The reason why this was misinterpreted as turbo mode was that
> the second fan normally spins faster in automatic mode than
> in the previous fan states. Yet when in state 3, the fan speed
> reacts to heat exposure, exposing the automatic mode setting.
> 
> Link: https://github.com/lm-sensors/lm-sensors/pull/383
> Signed-off-by: Armin Wolf <W_Armin@gmx.de>

Applied.
Guenter
