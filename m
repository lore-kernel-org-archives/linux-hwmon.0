Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C07B386423
	for <linux-hwmon@vger.kernel.org>; Wed, 16 Sep 2026 15:00:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789570842; cv=none; b=l3g36Q97bdbkFip0D3XyZViQF4sCIsH+uNeoSzTEhIupV/oqWIMC2dK6OglMPMYR9P6HboKS1W4WLBl+pPvnkQGxgna0hCmE9SrrKhgBcr/WM5osbdwT7d/ZVmrisSGu1QFkI7Wwu8BIJM2GaSoblJbJAyR2jpiys6Vclo3FX/I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789570842; c=relaxed/simple;
	bh=uU04HW0rlwbhgWn7yH5GWNie4AC/PYWKfZPU/6xM78M=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=B+O8u+72j+bRMHPma1eFT5JrDCFmy4Kzt7MuaTPeEvPdlTdsNP09k42O1h86pAH4uBzayFD7Ebs+GwlWwRFScAQqy99+DDGW/flXaFAUmTlDQ6exw3F8jTyeZzNri7YDceYVBG08e+18ZEzn/wv3kRjbQNcPrvE2cGc3HJqUh18=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ldLV0S2T; arc=none smtp.client-ip=209.85.210.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ldLV0S2T"
Received: by mail-pf1-f179.google.com with SMTP id d2e1a72fcca58-86ec25cf7ecso2155035b3a.1
        for <linux-hwmon@vger.kernel.org>; Wed, 16 Sep 2026 08:00:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789570841; x=1790175641; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=UxeLBpawt5FLZ4rmHBRsuTB8sPX9iH6xiZFrfBJ+a50=;
        b=ldLV0S2TDPBfm9mP7nDUmw2J+2ypLJo1/qe+fdBmPnhXWhk86x72csVvvfdxm0CPAW
         64X+yKOPIUfv0jsRUYvlcgSvcqHVGPbAAqHH3UH9F90ql3HzBSu7KjzzXR/RRdhoujtX
         rJTYS4GSltXm47eeny1tRdPsWccdgIpkCbNVUwva6gS+1+QlCvOXoNHfeM+YjrWin6Ku
         V4sm0FtMRhly4syPid4ov9y0fSM/T5U/2vkRF4OouB3r6m+ARZ0rmNWO5m+WSGIUX44B
         a/dv6ZVCfAz2RL0OfBdcUSo0o3t3SP/7+Dw3O3CP0zVRh17+xrFClwOL+0hVOXhH47w/
         7r+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789570841; x=1790175641;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=UxeLBpawt5FLZ4rmHBRsuTB8sPX9iH6xiZFrfBJ+a50=;
        b=Y9LWKDwgW+CLQNuZmzwJxvq9NxO4CbC02ViTOvZUxdOvLhLeaSpxKHw41iyIFdf4hz
         YC58rKWfyYRwGjRkWk6R2Y9KUtCHjtbbWm+B9tb0y6h043xHA0rAY3qkLCxFxKV1Irp4
         Ukx3gd8tPz0K+LLM47JWRzk/leJide5//EDtlJTFgXkfjGwmZGrjK+3WCvjLCHOrNrGP
         Neo9AnB/g5kVBBLEmvwE6DK60Eh/XnIXBeTSCxqc9s102U5RaOZhsSUbCgS8KK+mU810
         3h/aHQjqO1eRPI68Q51MrG9ul4ddk1ypu+KiVau5KZHzovF1GZ3dmIgAXUEZOPY2q6G1
         79rg==
X-Forwarded-Encrypted: i=1; AKwUvBxqyIwm0FNR9MekRa3VI4QrobtlLkWw9r2VBeIBUpmTVbwHBhUkEHIdjadRHdC/FmbpuwsUc/ZhNCx2ZA==@vger.kernel.org
X-Gm-Message-State: AFuF++nk+TFWWeRnsFBEKhcP67x8SVRnkiqdDzPjy0kzIfEMowH6Nq+w
	n3igQliJ70MGovNN7q1IzIJGMAAHrD/TX/JCEYCK2b5EPQbOi1Lq8f0F
X-Gm-Gg: AYBFou1mzOpvVjRifpLw7ocV3s2b1VhceEULxojhix72y543xG/I3FoxPB3DErbjW3w
	nWaxbQDzQoNYXLdMnyWMfSLyBZuNTPM7+OIa4KpGSu5jyJZOn0KioVueIMD71bS17C+sHCmdPan
	0yTOGiWnOgyVM3k4pryhPuCJUBep0sDjBfm1MT2UZ3LSjtAivL/CJYQxPoRgo193Hu4hPtlmsga
	F5uJajIj7c+oISAMYaTswWeEn56INlGyXgHyhiJgacv2F7LsxUTOrXx9YoUe1Xh0/ctRgQFb7aU
	SEU/o2BlirAKXfWOk4pdYh0B/W4vvBBxZ7dyFIwo9e3f1IPcxnRDPzEUIibClirdBNHaQp3jg/D
	Eh5QrLNxVJX/wGL6HNw+CdAClGrLVxCO+irZu+DoNU4qSbwK2y1twQqUQMKrM5YKDmRCuS6KB/m
	NIaSD0iMXI3PSetxCZeoAnGSLGVcCnySOmO1sg/qWOa6MfjdhgB8hTGPLFyH+TVvCA+1P4pPuH+
	KDV7t+K6cx8
X-Received: by 2002:a05:6a00:414f:b0:842:3c77:5996 with SMTP id d2e1a72fcca58-8708981c156mr10606570b3a.1.1789570840509;
        Wed, 16 Sep 2026 08:00:40 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cc50abb30a3sm1719789a12.28.2026.09.16.08.00.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Sep 2026 08:00:40 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Wed, 16 Sep 2026 08:00:39 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Pawel Zalewski <pzalewski@thegoodpenguin.co.uk>
Cc: Luca Tettamanti <kronos.it@gmail.com>,
	Cosmo Chou <cosmo.chou@quantatw.com>, linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] hwmon: use named initializers for acpi_device_id
Message-ID: <2b837c9b-791a-4465-ad7e-8d9c7329d41f@roeck-us.net>
References: <20260915-acpi-hwmon-v2-1-39d17c748eb6@thegoodpenguin.co.uk>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260915-acpi-hwmon-v2-1-39d17c748eb6@thegoodpenguin.co.uk>

On Tue, Sep 15, 2026 at 02:48:20PM +0100, Pawel Zalewski wrote:
> Use a designated initializer for the acpi_device_id fields which makes the
> code more readable and consistent with how lists are initialized in the
> rest of the kernel code base. Also drop explicitly setting fields to 0
> where it is redundant.
> 
> Unify the list terminator to have a single space between the brackets and
> no trailing comma.
> 
> Signed-off-by: Pawel Zalewski <pzalewski@thegoodpenguin.co.uk>

Applied.

Thanks,
Guenter
