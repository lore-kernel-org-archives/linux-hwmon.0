Received: from mail-pj2-f43.google.com (mail-pj2-f43.google.com [74.125.227.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7877B3F9F26
	for <linux-hwmon@vger.kernel.org>; Fri, 18 Sep 2026 15:05:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789743946; cv=none; b=at5p9QVH09BJsOEvLg8+nePR1IwUVNeouaxUqEpawPoLSRwfl31ePv8xWYjcKZmXAUsn0cO1vp/UocutHX81yYO30OXYKl7Y67STtXLqcA5uTGXij1k5qKBBDYJGpH1O135aol41xZ6jqCsXKpG3PQodjr62LwjeHqYjF0224hA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789743946; c=relaxed/simple;
	bh=19iCNcCPJa6h7SqIFmaDcjUE7HtusVN2AYJvdBzM+C8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LfohOmf/VPfuJieMnl2SlVBFHC6ICz0D7HVIo8BVzv2h7f1mCNEBWPNXoNGsAr2/Qn8dv57dCG6DTE0ksssSKD9j5XaOb6BqTfU2lC6HSW9SxBm1XJE5x+9wDTdOGok4TWmrr5z1Pyju/7JGtvPOJ+yQmhSGMv+AOvVg/wCQffc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fuBPlzUB; arc=none smtp.client-ip=74.125.227.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fuBPlzUB"
Received: by mail-pj2-f43.google.com with SMTP id 98e67ed59e1d1-396ccafb752so749315a91.0
        for <linux-hwmon@vger.kernel.org>; Fri, 18 Sep 2026 08:05:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789743945; x=1790348745; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=BQGG8yXln03K6MK1Xes3T7st55EA/EQ+1R+tmJIGLy4=;
        b=fuBPlzUBwM7bob/ph3CPEw2jAKn7xgA7/bGDSFjo2SazIHVM/TXZjDcjv+uAkoDp+N
         xelSnxhgiEkgNgXMsSBEdnBj9oL/woSfcRAiE+qV5Dwy0jJ+YMqWTvWP0IKyoxOpD7U1
         f4BTF4QWdYLs0RBrmdUIPmEJgLK3X+EGX40hcS/p8J4iw70XRHInZ5V3AytSLcWy2p1E
         nzgYOzTBSY4GcNTDUw7bNWIbR60YODl0Cy18bmTi7Ugfz5aF+uVafctmCw+OqGN7UaI8
         9nQUhK46m1nL0ZuV8ZHBUABdd5dkMwEOLXH9zt2njpdD1UtBZnpEU1mop6/dZdE20ZTb
         OJBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789743945; x=1790348745;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=BQGG8yXln03K6MK1Xes3T7st55EA/EQ+1R+tmJIGLy4=;
        b=nuKimyiVUrSMILQq/k3HoBCuVDrTqSn/F1R0/2rZ8u62oA/B0+5uw8yKmZBSXllLEm
         HLxLJujpJRPLjvxR5gKWFTMKpCH0mzF41dpyKgDo+ULpYDE3MHMjQfEH4tq/n1WpDgUz
         kUsCczzPzDv9mzT51/NZ09sn2+l282XcrVLuj2ltcoJUmcYS51iMQMcWGZlmvir5yPg+
         i8hcyk1G2O2DC1eNfgvUrValqD9tY8izVmUEfG8bGtFsupx8qJfV/+H2OSGOU5mq9XsV
         B217LGCISRzR6U2NaNIz5Gw2uFg7efVAlcB7xWOhIyZn/isx3IDJ7utV3OmJsaYYmrPP
         fQHg==
X-Forwarded-Encrypted: i=1; AKwUvBzOGokIhXcVdDhn6i/1lqct/KryiRQK5n1MIa5FJmt/bglS5i8GH1nU6+IX4pWde9SaHwBon9hJ1QophA==@vger.kernel.org
X-Gm-Message-State: AFuF++nlv6+Eg5pLfFfGNbiKNLUtCTdVxrPMWmna+pug+8tS2wIfoq7H
	jXM+NYqePKR3/EUOsHO0ghuEJSo+cxAi7XE3/3iAxc3MQK1+8bLgHNRA
X-Gm-Gg: AYBFou3nlyTMjrTl0aajGBnBN5QCNcDn+ySN5UqVGCx6Ysn8IGBqV/hCJkYsaGGdIJD
	+3hxSbS7/b7X2ZCnTbmpgsQD5BAX5VfEtXyKNVsDTIJS1DJJarfy6UHsfpJErdrrbqHXCxS4ob+
	XvRgaryWCIK8iv041dYQuHTuG1rShukvbwM519fEQs5PAHv33tuBcGJlor6+vALFi1uzW6f5Ksb
	F9X9/kXl0vBkEwTb4v3UzLT5Rjf1AaB/sC5oHtfoldJCblUNAXS61nEzWIEbF91KQvvHkAL1NZT
	RFnRWitm3s5OFf1fvq1ape5xXg2qKHEKeEpHz8PTC/bBG0L0N7GucMeTtznq7Cvf/oX3jf0O3Ur
	5ZYg+tcnT2mqh1KRJ8FdOsU2C7uBXtwEamW/cgwLEe4l+ztsKa2Y2Zb858KbWfZrjwk00wcwuiB
	vuAOJpoQtsTTOegezsA6w/ugopfa22Mxx7IdGobAL+6CQvLyl/tuDFMtBqbfqFDTiucSOKrbDzf
	boGq1BlFctK
X-Received: by 2002:a17:90a:1050:b0:39e:6b01:f93c with SMTP id 98e67ed59e1d1-39e6b0213b1mr199530a91.13.1789743944523;
        Fri, 18 Sep 2026 08:05:44 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39e3617443asm13570529a91.9.2026.09.18.08.05.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Sep 2026 08:05:44 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Fri, 18 Sep 2026 08:05:43 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Kees Cook <kees@kernel.org>
Cc: Sudeep Holla <sudeep.holla@kernel.org>,
	Kees Cook <kees+treewide@kernel.org>,
	Cristian Marussi <cristian.marussi@arm.com>,
	arm-scmi@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-hardening@vger.kernel.org
Subject: Re: [PATCH] hwmon: scmi: Fix info[] allocation type
Message-ID: <030736c4-ffa4-476e-beba-8dea4359cfba@roeck-us.net>
References: <20260917211344.i.911-kees@kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260917211344.i.911-kees@kernel.org>

On Thu, Sep 17, 2026 at 02:13:45PM -0700, Kees Cook wrote:
> From: Kees Cook <kees+treewide@kernel.org>
> 
> In preparation for making the devm_kmalloc family of allocators type
> aware, we need to make sure that the returned type from the allocation
> matches the type of the variable being assigned. (Before, the allocator
> would always return "void *", which can be implicitly cast to any
> pointer type.)
> 
> The assigned type of "scmi_sensors->info[type]" is
> "const struct scmi_sensor_info **", but the converted allocation type
> would be "const struct scmi_sensor_info ***", as the size was taken from
> "*scmi_sensors->info", which is one level of indirection too many.
> Luckily both element types are pointers of the same size. Take the size
> from the element type of the assignment target.
> 
> Build tested ARCH=x86_64 allmodconfig with GCC 16.2.0:
> drivers/hwmon/scmi-hwmon.o
> 
> Assisted-by: LLM coccinelle
> Signed-off-by: Kees Cook <kees+treewide@kernel.org>

Applied.

Thanks,
Guenter
