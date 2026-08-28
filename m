Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B7B8374A15
	for <linux-hwmon@vger.kernel.org>; Fri, 28 Aug 2026 15:59:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787932797; cv=none; b=Z31xweEjkEd8QxlV2Hoi27f6M4VANzclrrjymDrCGqDog2vhdHRhPnTr8CSIwgNjhVjc8HyfqFzOou1sx7YA/r2BtHE4Yqz8Uvkujaj3wdE78wzp6KduBVeW2PN6DL57/OMM9WFA5E2nghdhGGWjXDy1velHXiLO/kkIiv22siw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787932797; c=relaxed/simple;
	bh=c8Ep/ag34C91Q4xe5vZf7F6Vyd5bRxB8vKk9J4+36pk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SINjxzz+5alwcXOia9bQqpJyN4PjDfOZUt5CjGR9HIjDo1V+H0wrSWImB/IiN5XLL4qteQBL78+Z6h42LvCKN4zk3sofNCNxWBIKfqZAUtrQlXgfUS1JSr3SN+oaanQwmKtQgnXL+DnCpXtG0HxJxmN1jyjagzXYy4ndrRpuVg4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=clcYvKd8; arc=none smtp.client-ip=209.85.214.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="clcYvKd8"
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-2ce98cb8165so11760785ad.1
        for <linux-hwmon@vger.kernel.org>; Fri, 28 Aug 2026 08:59:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787932796; x=1788537596; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=cr7C0zQrIkhunpo8t3KyB70o8NQ/OZIdfj8LBPlxSYU=;
        b=clcYvKd8azPLzMfcoJdwtOCFOCGOY+QXwDUiLuRCrd+1iCA+W/M2yFLK1gVguFNVKd
         uOte6Gb6CBZetpvRACBDyUGlE9jqADaSQep7n9uu8e8ueFjJXczblTtKhwnJO9BAjrzN
         vKXuqQJeLnJB91Egt4sOUhbmk+cdOrLeoHQb+jeMDyobsRGhJzNZj2FvH5u9b5OvKook
         cOlky/gzQkuEeAod6H/TLATpu1S5pgvfXOOK/2LrPtwpg43Q9+8wQv9Qy9AcKBlo/zp0
         j018jpq+TlYa0ZPsrlOrW3P4FtRqApitSXarxDDAtkw7sWcTOLri/lCv6herlMUzHdRM
         4VfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787932796; x=1788537596;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=cr7C0zQrIkhunpo8t3KyB70o8NQ/OZIdfj8LBPlxSYU=;
        b=BpeY1EZKyogtmJ4y4WWepRplbTys3HAwCqoFjbnfQZWY+X505XcqQKf+Q5I0GEmn2l
         4ZXQ0hPpuVAwfTUOoHXzg4xkufYM2Ilt+94Qj1nn1r/TQeR0hhHq7XF2MhZ6nJMS5pO8
         OYgf6a7zIBrsjqe4Q0nBeRPs0lygMcNmk6+tS65ax719pyS7j0evhQA0SkAqVpgG+hKd
         0udPPx4ujSTigcIO9TufVqIPqqPQjJa0e+ofOtRk2S+1jDvxU1cqWq1mUSLdlkmD9Izo
         cvp/iStsQ12iT1g3DlQa0l5+TpwsoeHqR6WaXaMtqI8hjeiU4eQzLWvEpzRahvMztLrw
         b2gw==
X-Gm-Message-State: AFuF++kREw1z7TVQx91gk0A3HtIEf5FlKFxaInXfvrJWoyqxYjLADZVE
	Paxy0NnBZTJWXsFt8al3+7hxA4ZIMGZBn/rWYcRk3ETaUJ/TWULi9Jc/
X-Gm-Gg: AR+sD103RkUEl1KjGKDD4u0vc1lBAEspXY5gUDyG6kghAZHX/Smc2wMkhegH1JKyMPI
	qGzZxFXzdJtbWCZPjJk0wXdSWa3kqxkou5/BH8zKvlJXBmB0ljcLdG7efqYIgzA5nZfzvcvLjkL
	SY+RrkyB2rdRTdb0FC7cU7UnYNPtwiA3Tu4CSHY7SNkhQFGzmcM2gdh4RGbr5HLapu7gHH8fo9Q
	AvswrnLbt2ElS48f+xcZmI7lFW93ea3kohvlBOlRZS15XI71Igu38db6rgfvul1oa9oFn8S7aom
	syYTKD3GxGIyOeUBcaFsRDKd6wLGe8nMrGD8tu96kmXxlgAJBvbYEvtfq+C20JwUqAYPFAh3Ryl
	v9vfJiAr0equyaZjat8O6Gqjqf2GCPG9NZ4HTFploTGSeKk/UBsoHu2DhC5lLsFrZ6xgGmVdpBI
	dpBywrml22F34TTf97csWhQG3ZdlotshX+jx1bHJu93pihTP7j17xBmFYY0GB3LCsU7V0Ve8u9q
	w==
X-Received: by 2002:a17:903:22c5:b0:2d7:1f17:41f8 with SMTP id d9443c01a7336-2d726b17867mr192211225ad.15.1787932795656;
        Fri, 28 Aug 2026 08:59:55 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3286f95a160sm6524806eec.18.2026.08.28.08.59.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Aug 2026 08:59:55 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Fri, 28 Aug 2026 08:59:53 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Vishnu Razdan <vrazdan@openai.com>
Cc: linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org,
	vikash.chandola@linux.intel.com
Subject: Re: [PATCH] hwmon: (pmbus) Clear generic status alarms with
 CLEAR_FAULTS
Message-ID: <53d1d7d5-629e-48fa-8947-3a3c294ff16b@roeck-us.net>
References: <20260824-vrazdan-pmbus-status-word-b4-v1-1-2606ecd0c029@openai.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260824-vrazdan-pmbus-status-word-b4-v1-1-2606ecd0c029@openai.com>

On Mon, Aug 24, 2026 at 11:58:00PM -0700, Vishnu Razdan wrote:
> From: Vishnu Razdan <vrazdan@openai.com>
> 
> Some hwmon alarms fall back to STATUS_WORD summary bits when no
> individual limit alarm is available. On PMBus 1.2 and newer devices,
> pmbus_get_boolean() acknowledges these alarms with the same byte-data
> write used for detailed status registers. For example, PB_STATUS_INPUT
> is 0x2000, so it is truncated to zero when passed to
> _pmbus_write_byte_data(). The resulting write cannot acknowledge the
> input alarm.
> 
> PMBus 1.3 Part II, sections 10.2.4 and 10.2.5, excludes ordinary
> STATUS_BYTE and STATUS_WORD summary bits from individual clearing.
> Their summary bits clear when the underlying status bits clear, so
> changing this to a word-data write would not fix the generic input
> alarm either.
> 
> Use the existing page CLEAR_FAULTS path for generic STATUS_WORD
> alarms, including devices whose status accessor uses STATUS_BYTE.
> Keep individual byte writes for detailed status registers on PMBus
> 1.2 and newer devices. As with the existing older-device fallback,
> CLEAR_FAULTS can clear other latched status; an active condition can
> reassert its status.
> 
> Fixes: 35f165f08950 ("hwmon: (pmbus) Clear pmbus fault/warning bits after read")
> Cc: stable@vger.kernel.org
> Assisted-by: LLM
> Signed-off-by: Vishnu Razdan <vrazdan@openai.com>

Applied.

Thanks,
Guenter
