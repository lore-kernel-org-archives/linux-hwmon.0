Received: from mail-dl1-f52.google.com (mail-dl1-f52.google.com [74.125.82.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37B80382F18
	for <linux-hwmon@vger.kernel.org>; Sat,  2 May 2026 18:18:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777745931; cv=none; b=ZyJOI/WhVKPO6+5LOsBGDCpDnxozYO/7kRQjkpD7IIAYUeJJRPLNMfJ8wCPkteNlbfkkGUooSvCQauQ72SCKlaCp4/iVZPjnmE7SdcEd8CnqllIpRWWMiwc0wzQPP0ND1dpQ8jwHhnT3zDQcjvdtu8LKz2ehrBdIYrvXEFL5qpg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777745931; c=relaxed/simple;
	bh=PK6r+Eva0NvTNWERpP0GymF1K0yBMZ+u7Lg7qibQU7U=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=J52mAf/WIwzbiG9b0KDh8d8MBY/AjYtGJPYl5HwjoU92dF2is+YP4gBSI+tIzLET+asFkRzm/c0iVYt+fmGY7r6jab0xy4etfzgVdSmULTNGbRvurRJbMfWgfD4t4gcu673rRk9+VDsEtm+JdkGzKPNohTlLR81rCIZSu+HCWRg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=k8Wpz5Wy; arc=none smtp.client-ip=74.125.82.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="k8Wpz5Wy"
Received: by mail-dl1-f52.google.com with SMTP id a92af1059eb24-12c45281a06so4493351c88.1
        for <linux-hwmon@vger.kernel.org>; Sat, 02 May 2026 11:18:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777745929; x=1778350729; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=erTrquHndAR6fm4dGyR5mDtQyP+8IvuuMWeUEh+RyEM=;
        b=k8Wpz5Wy83adLPvSPS9AVeCFTRZJfVsVcH17XAFfUjMnNTt/AoGGW7raf+HJL8XIOA
         WJgbsEaSpVLX5gN/j1wDeVi8+SVWtqoJ2ZI8lQsJ79nVZxaGmKwf1kFxuAuc/5V9IJOa
         3C4x3D4LmACZWaZUFUvOuRCDcERcjzE6TBJy6pOSw5fowNduX9nwCH+rnXXwf9qMtKAo
         mAzxXMfytcoy0WaKPb0GZ4BpiXNe4rWdYTZjhXuBknnlCQNaT1c8pQs8dMO6YmqgbAxA
         50dnE4wPcsYR6xaPYoRiEwMnc89+t2jADfn72KhanYO84LFzrevi+iiSfiFak/tZtCvA
         OveQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777745929; x=1778350729;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=erTrquHndAR6fm4dGyR5mDtQyP+8IvuuMWeUEh+RyEM=;
        b=pjyhF/QGof8Ey/P9CLQzHwya2Kq3OloSbo0UelXyaZVKy0FKiJzNAbwUJlIXp85Ktp
         KNtjcqscXnzhOv+uBEE1nOPguqNt8Z4m/uAt/fCvk9mBoRIReNl7m9/+pgs9jhxSoqx1
         REq7+6a1LAfZbvLa06DUqxvh0HSDvWFlcoTDbne9gVGwAG51MMFrs1YfG/ga85+fVybH
         CEp3cpFNPVlNs6LRLC2zX2SzRAwaKR6Sklk2ffpFBUOxoZ9vo0yDmBSbuBKhJk0gEim1
         XNjzwPLWAymBrTyr93Oj8HGZuS9bVFbyS8mjFyK7BaE/ZEClx1ppH/R/n5FmrLc2I1e7
         Fidg==
X-Gm-Message-State: AOJu0YwghWpz/B8u1cvTjCiqYssG5jHUe98LLgHYAEcK6ROrbYma1Ojp
	I3rDambhlXJ3xlIiL+a0XlAbmddUpWoMi4rLY9B5MhLp1onWQz5nj5jr
X-Gm-Gg: AeBDiesVhrg+Z+KwtFPqNsB01tV4tywEB5hhKwfeNVDop9kBGFdrZQILs7B4tJl3RSF
	tCbKHxhT+uIQ4kWSuHJ8BhiAlhRxF6w7fL9UkGhlFKCkmlac0w3nGKPYYa1qKUvkKqlM7MPLP7n
	WD4LPZ4xzloV6+1vKXJrmIcCdRzPrhEg7KZd/Z0dvKSc+kMkpfkbx3QvqOsta3dzYcc34PBjecT
	iCzXE1BNgUNd4opkXug2bhB4Phhp/LgzjVXtSEB+Ks0ObrrWoqr2gPBAQ17xdi0gt0VxYujAl2H
	A34N2T9MVaFw/gqU4fzYxugJnSPNRNqmsvNZZJ6oeV9iXfGIEZT4842z9AsrrV5ct8283EbfLWJ
	s4i5GRVCux54fg8ms/EhRERtptmVUIwITznKX2+Vs/58lKeVNr1SDkIrTPG2OrdJIqgLcM9OKZP
	UreAKBc294MUfa4+nU8554BKps6a4q2WEuRlCpWjGhwVorrTY=
X-Received: by 2002:a05:7300:5712:b0:2de:aafb:feff with SMTP id 5a478bee46e88-2efb8b96397mr1520586eec.2.1777745929317;
        Sat, 02 May 2026 11:18:49 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2ee3889d5f0sm9431102eec.2.2026.05.02.11.18.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 02 May 2026 11:18:48 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Sat, 2 May 2026 11:18:47 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Tabrez Ahmed <tabreztalks@gmail.com>
Cc: linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org,
	david.laight.linux@gmail.com, me@brighamcampbell.com,
	shuah@kernel.org
Subject: Re: [PATCH v6 2/3] hwmon: (ads7871) Convert to
 hwmon_device_register_with_info
Message-ID: <73c5caaf-c725-441c-b01f-979b18c3cf7a@roeck-us.net>
References: <20260502020844.110038-1-tabreztalks@gmail.com>
 <20260502020844.110038-3-tabreztalks@gmail.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260502020844.110038-3-tabreztalks@gmail.com>

On Sat, May 02, 2026 at 07:38:43AM +0530, Tabrez Ahmed wrote:
> Convert the ads7871 driver from the legacy hwmon_device_register() to the
> modern hwmon_device_register_with_info() API. This migration simplifies
> the driver by using the structured hwmon_channel_info approach and
> prepares the codebase for the transition to a shared DMA-safe buffer.
> While at it, fix checkpatch violations.
> 
> Signed-off-by: Tabrez Ahmed <tabreztalks@gmail.com>

Applied.

Thanks,
Guenter
