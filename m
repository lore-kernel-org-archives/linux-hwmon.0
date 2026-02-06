Received: from mail-oi1-f176.google.com (mail-oi1-f176.google.com [209.85.167.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D541B3033DD
	for <linux-hwmon@vger.kernel.org>; Fri,  6 Feb 2026 16:08:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770394132; cv=none; b=ISRtRLpUrOG0SlhZN7n8TBVfIvoJkHNwx+zpoRr+5HhCktWoO5tNK/a0bf82u9wc7UFB1MqjHPohOB5kBewGYftPGqSyMD5x5OunxbuCEKe2n6ddG+XS778RLFZ400bfac19WvP+YM/hZzzSYXmTFp6nZlAuukhi2MtOQdW7D9Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770394132; c=relaxed/simple;
	bh=Uqs+mtOZusE8Tmu6i+HWZhiMiB14vwiEy84r6G8yhxw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Qrch5sN5dj+VcbaqhF1vhy6b/fR0uqEZhiqI9n6tU9Lmf1MGnpjRESPgfkXiacBbUy9NtdfHZhNOrjEm7GjI0yvkOz9vJWyOBslnx5Ik1l1jOL4dEdrHHVUt/i5L7Me8/TIr5Q0B+FFMZu8G0Hsw9IABy9BSUlXOHRIUl61G8pM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=minyard.net; spf=pass smtp.mailfrom=minyard.net; dkim=pass (2048-bit key) header.d=minyard.net header.i=@minyard.net header.b=QRJciJ/4; arc=none smtp.client-ip=209.85.167.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=minyard.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=minyard.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=minyard.net header.i=@minyard.net header.b="QRJciJ/4"
Received: by mail-oi1-f176.google.com with SMTP id 5614622812f47-45f126d4794so1494557b6e.1
        for <linux-hwmon@vger.kernel.org>; Fri, 06 Feb 2026 08:08:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=minyard.net; s=google; t=1770394131; x=1770998931; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:reply-to:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=A7ouzXPawCJ+kcfApoQEXHW5et7PBTD2zyd+Y6A9AqQ=;
        b=QRJciJ/4pF8BJl5AFMNl7759acLWraozEURnptPoUo/vOWdkZFLXDC4rNEPYfCgt9y
         vLVvNUFQsJdONDZpNehm5Y4Xththr9g2DOLr8qL9ugRcmuPwbprfRkeSUGy6JDOoNtAZ
         mrKXuMRRidJd41fX+DoBdt9WTrBMnNGSjcBSUxTj3OFk6gUsBtXdHbFVQEMDE2UF6VEA
         TN64rL6Q3vikBr9Xpq/LfZDpujt7ZJNAzAlU2+ucZ5M019z0M8DbjnAEzoxRC+nybN99
         jGqC11/TKpT63xE7Be3SNkB6FOzYDFYM+yUeB3uYQ2xIEyljUJ44E+heD4tzipI2ODgh
         qmrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770394131; x=1770998931;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:reply-to:message-id:subject:cc:to:from:date
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=A7ouzXPawCJ+kcfApoQEXHW5et7PBTD2zyd+Y6A9AqQ=;
        b=htfigiCKchx62QN13NpdR2JaX5l60243mZdueNyKcejd/kXgnR6EIJt4IluirM5nVA
         V8LgKuHxfwvxQOga8XFIn+lim2cG3hFLhkXaG+j0VGQjOoEeNYunG9V0+925BVgDGPBv
         TUR0ZqsgoucrKuSwU863Y4dCceqe8Kxdv2b9CVJFT6Kx0wDUyb8g2Mg3KSvsW1y8IBwc
         s2F0aia3Qx9B7XkrTTy4muJIrz2L2pQngE47KGpKIeW9qrCfH0igpfF81F3IKwmaX10r
         yXuMXgx8d9u67WiVXkYis7JoOIfTtMbvz88R/4ALqfPow9HyZuvW8sjfdPLA5eb0jF4h
         9qTA==
X-Forwarded-Encrypted: i=1; AJvYcCXeroW9aaNwUXrLQhO8xhFGQNQN2MBBiMS+tBejw3fdtJPLDwmhIi7P4QDU4X8f/N1T5TXOaqp1uWZomg==@vger.kernel.org
X-Gm-Message-State: AOJu0YyIajqVSbUxmU7Ox+2T16N7zWuB3xzo0FIE2msGSCE7bd0e67D2
	xYb21OBBSDMsR6zPmmiTpofOax2wJTyoU2Hlgyxx/hCE+yEch6II1gLpGoqOkpj/eVQ=
X-Gm-Gg: AZuq6aITY4pSuk5LSeCsZNoHl1IxB7debZ3DvEj8Keh62rEzro5qepaFtj0Gr1x5NxP
	kuybBc7w+0u4NVsdYwlf09eu+kKqVmeheZU/g13SAV3sdIOdQNYiQo07l0r326ZhDG7mwX1sbez
	pVew/IYJyQ3T0WkIwL6toK6FDXNSUZCW/tEkmEesC9B4vcHCPPQPY4bQ96PUv9YuzfotClupPHZ
	0bhOr6b0qHUA3rO8QrFuRvr0KKmlaKmBu89I8gcKjx7IZdvcXTk3sTMJZQAzftz58PUiI1QIhaD
	XcLFX7LYBXImJgr3ZsgOkSk6DxaQzd8VyN8W7pXepse+sGiOAObJujLWiNPBrtF6DPcG0XVIRuu
	tddMhYjX41/O/3rcF3sNQInabMpO4kzKfl3f+5pTGLKh+DuIp7tDJGOJNt43iF5XBqm2dhUnHw+
	AnUXWe0t6Leq276cmvkvXbAfpxa2HgSbfqCGk0cyyccpyhYN6fhLKKtmZ6nHWvrecGrT6sfc0v7
	5IaQMiXqittA60=
X-Received: by 2002:a05:6808:17a7:b0:45e:bb87:872a with SMTP id 5614622812f47-462fcb46cb5mr1739338b6e.52.1770394130798;
        Fri, 06 Feb 2026 08:08:50 -0800 (PST)
Received: from mail.minyard.net ([2001:470:b8f6:1b:aed7:ea82:7abb:dd28])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-462feaf9410sm1511473b6e.13.2026.02.06.08.08.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Feb 2026 08:08:50 -0800 (PST)
Date: Fri, 6 Feb 2026 10:08:45 -0600
From: Corey Minyard <corey@minyard.net>
To: "Rafael J. Wysocki" <rafael@kernel.org>
Cc: Guenter Roeck <linux@roeck-us.net>, Igor Raits <igor@gooddata.com>,
	Jaroslav Pulchart <jaroslav.pulchart@gooddata.com>,
	linux-acpi@vger.kernel.org, linux-hwmon@vger.kernel.org,
	Daniel Secik <daniel.secik@gooddata.com>,
	Zdenek Pesek <zdenek.pesek@gooddata.com>,
	Jiri Jurica <jiri.jurica@gooddata.com>,
	Huisong Li <lihuisong@huawei.com>
Subject: Re: [BISECTED - impi related]: acpi_power_meter: power*_average
 sysfs read hangs, mutex deadlock in hwmon_attr_show since v6.18.y
Message-ID: <aYYSDWaeiCnkwqAF@mail.minyard.net>
Reply-To: corey@minyard.net
References: <CAK8fFZ65Vro5nQqJq_cvsY93hgDbfTdibWnNr5b0Bixzc-ESfg@mail.gmail.com>
 <CAK8fFZ6Vi4xayvdKh-_eLi-nDNMLuEoMsvwEnb33QqnwS7o4BA@mail.gmail.com>
 <1c8f748a-5c5d-4234-ae86-7bb12045a373@roeck-us.net>
 <CA+9S74i+BC3=E0opOPMff0cuC1OPYSecii0C8fVZ+NM7bptNcQ@mail.gmail.com>
 <fee01c19-2711-487e-91e9-d57f9be04b98@roeck-us.net>
 <CA+9S74jR9jRRE-DNMxNg=6Uv2uDAUar2n-RkVDJqzkDfNu3eog@mail.gmail.com>
 <39100538-a1f3-48dc-82d6-5e3314a43b4d@roeck-us.net>
 <CAJZ5v0jo4CV__AoUfqxuhVgkw6hA=hM_fBU+W=pTzqDLmNmytw@mail.gmail.com>
 <1642aec8-e8c1-4ad4-a5b7-556feeedfd93@roeck-us.net>
 <CAJZ5v0i_BmeGROzQFpUCyF5MkA7sFkP3y8jjqH0mD2r2Wqj_xA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAJZ5v0i_BmeGROzQFpUCyF5MkA7sFkP3y8jjqH0mD2r2Wqj_xA@mail.gmail.com>

On Fri, Feb 06, 2026 at 01:08:56PM +0100, Rafael J. Wysocki wrote:
> On Thu, Feb 5, 2026 at 11:34 PM Guenter Roeck <linux@roeck-us.net> wrote:
> >

snip..

> 
> > 2. Excessive Polling (Timer Overwrite):
> > In `smi_timeout()`, the timer is unconditionally reset to a short timeout (e.g., 10ms) at the end of the function, unless the state machine is IDLE. When the state machine returns `SI_SM_HOSED`, `smi_event_handler()` correctly sets the timer to a long backoff (1 second). However, `smi_timeout()` subsequently overwrites this with the short timeout. This causes the driver to poll the hosed BMC every 10ms instead of backing off for 1 second, resulting in unnecessary CPU overhead.
> 
> Well, that's not nice, but it doesn't seem to be related to the
> observed symptoms.

I have a fix for this, too.  Thanks for the report.

snip..

-corey
