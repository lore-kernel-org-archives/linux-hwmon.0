Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85A8E382374
	for <linux-hwmon@vger.kernel.org>; Tue,  9 Jun 2026 20:52:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781038341; cv=none; b=PpntJvWxzBJ9G/TWbGlvwxT+A5IPCRFO5M0sO4XWP5WCTu4zpUzQ1MVMsJsPzTNo5tUI6eEMzyNLcrRTUeXLvAfBVofnqP/0q3Pmx3dTOC0858UNc6wgcAV3IUbLt1gsElNLcJVFvLA9BsYocY0GexJ6lB5Tx9x506p4qgfGkvA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781038341; c=relaxed/simple;
	bh=QuEeBa+wbqYa0B6U12VFToTuGukpNf8dRdb/S/MFtXU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mjeYSdaeRAHql2eDWiM0i+naLNwucLjYnG6vhAN3fL+sn6euwRe0yWF5/0E0pJQX3NcV+jHAC6dW46iRYtdpG8KEqy8Ec99gwp5JoUVJqRQOwjWSMhTEdzUSn1oCNKLa+NYngUVdsqvl5QKcSQ5Q62jpe3sIN7CEFUt+hXsiAMI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Gb6Z31Di; arc=none smtp.client-ip=209.85.210.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Gb6Z31Di"
Received: by mail-pf1-f175.google.com with SMTP id d2e1a72fcca58-8424b00710aso3755015b3a.0
        for <linux-hwmon@vger.kernel.org>; Tue, 09 Jun 2026 13:52:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781038340; x=1781643140; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:sender
         :from:to:cc:subject:date:message-id:reply-to;
        bh=loC7SSrXc6ZQAZOnLHFVy77pgXEW+A5qr9azR6ZFnAo=;
        b=Gb6Z31DitKnGC8LPy3MmVpBTZwxQ+cjCKUK4tszgE+XBMNJishJ4L2IJ+dOhadeQEk
         67oJqeWG5bPXGw1aHfXFKcdSRFnxxIwZ7b/oobYC7ysoHnN2AoQy9eK/yLWNG0yuF2SC
         FvbudBGGGMMWxwup3IoOuthdf5yRvVqslvx+DBU4GOtMythe6iPU46lwULQKY30/0sS0
         gr1jnM98SIKD27XTAP6KB/b2HaWw3NIbc5UpIoJoKqNgmjipBq3NSsfQPvuDagL2f2uk
         7+cyoX1f77FDa6pMJQTlmWgmQX6hrL7VeLkrdIbrE7FmOhjPulPlsyNdVpzb3E6yBeQ+
         IBFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781038340; x=1781643140;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:sender
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=loC7SSrXc6ZQAZOnLHFVy77pgXEW+A5qr9azR6ZFnAo=;
        b=M+ZjM24lr4WM0wy9ufq+HTJRXibNu0CSqdy3cvXinHCHUqKaNGenPwAfTzwCpWcQS2
         F8/QpU5c/MeBRChWf9f/349a4ygTVVrZDG2LOqetZRnaL9h+v7W5SfaozHr8pnDuJiRD
         k4L+nPvSf7e0S5A80qS+HrP7npo3QOdl2uP+F5tCU9ZL03Q0fB/Zj6cwsqdZ8Rqj7R1A
         WKnRc2zVVfFAvWdLzyvq/M0Uc7S56U/KfblEFPFsh/kpcmwGH437CZfdVbDEPfbMfzfH
         UMeambOebFDtY+ejrvFanHYbWEfbzpDsUeYJVnX1DFb6Puu9eAxWxPsMyJMO3d1tBSCp
         hcWg==
X-Forwarded-Encrypted: i=1; AFNElJ80HCvEATIPEjCLEEemHvApc1e/9CXl3qXZa4c0XPtNFqEtEr36VesPqk2YR+ZpFzqzEG5y+DDj3UiXeg==@vger.kernel.org
X-Gm-Message-State: AOJu0YyNjnRAparqUSZYCoPvmPlmi18UfPPXOfLT77Eg0M2xXVkAHH9/
	XY/b6SuKpDvh0YkWTgkrMEb3mTTkbIsl+zw8LF/vWZJcBjmbS3ADn6F7
X-Gm-Gg: Acq92OG8F1oiUCIGAodl5fo2aWFenpn9M0sicSgssGpDvJZZ6MIP3vJEow/akIbmlKd
	Pv/xuuXmpebgm0pX4eAW7Rv0n0MZiLJ+SyV8iiNo2Zzf9KUCIyqt9EszkSaP5IqKtLmivDY6pel
	fKiakoHMCRgAsLRGz5/XEgPQ/QghsYZiisXs0fIQc0egW6AMVfIA37GuFQcImwMiSJhonE2gVTQ
	dtc60G/zQrFPIOJoW88GCTR0EuQi9D/nWId5M9+MkOq3Ur/4Q20i59g06Jyk8RwrueYDki3lwb4
	2OybnRypsKnA21G9AUjM88ZqZrJnfiEUbo3P6E6gLFlsdV7uFGJyj6ZzmHkHS7vdEG/RnmPoaa7
	7FZglirdbe8eba6n/aELY8GAkeCWrW4bOdabdX3ex25Q49XC87NS/ZdyYJK9Ydg24uaxeA0owdw
	JojNsFFx2elm1sYphdJFzWi6klkean7xi/TBg14/yDNArvQ6o=
X-Received: by 2002:a05:6a00:813:b0:842:55b6:f5a1 with SMTP id d2e1a72fcca58-842b0d8a604mr21446917b3a.6.1781038339820;
        Tue, 09 Jun 2026 13:52:19 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84282378986sm22879033b3a.22.2026.06.09.13.52.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Jun 2026 13:52:19 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Tue, 9 Jun 2026 13:52:18 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Thomas =?iso-8859-1?Q?Wei=DFschuh?= <linux@weissschuh.net>
Cc: Benson Leung <bleung@chromium.org>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Guenter Roeck <groeck@chromium.org>,
	chrome-platform@lists.linux.dev, linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/5] hwmon: (cros_ec) Split out
 cros_ec_hwmon_get_thermal_config()
Message-ID: <2839056c-0827-42ed-9475-e84bed8d18a5@roeck-us.net>
References: <20260529-cros_ec-hwmon-fan-curve-v1-0-da6792b3830f@weissschuh.net>
 <20260529-cros_ec-hwmon-fan-curve-v1-3-da6792b3830f@weissschuh.net>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260529-cros_ec-hwmon-fan-curve-v1-3-da6792b3830f@weissschuh.net>

On Fri, May 29, 2026 at 10:31:54PM +0200, Thomas Weiﬂschuh wrote:
> Some upcoming changes require access to the raw
> 'struct ec_thermal_config'.
> 
> Split out the logic to get it from the EC into a new helper.
> 
> Signed-off-by: Thomas Weiﬂschuh <linux@weissschuh.net>

Applied.

Thanks,
Guenter
