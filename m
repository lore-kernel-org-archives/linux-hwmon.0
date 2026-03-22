Received: from mail-dy1-f174.google.com (mail-dy1-f174.google.com [74.125.82.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BFF9175A84
	for <linux-hwmon@vger.kernel.org>; Sun, 22 Mar 2026 00:46:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774140381; cv=none; b=c0Um8UWhLzWr0UA9AF+IBZg7KjDu0f3/Rivt03q5q+Gt+yRNYblimRLKOaIhkODQGW4lmUyKHhGVdHK/LG/Yj8b5Lsh8qKGXtkNjbAIuqWnR2ak+W6NaDnAyiyaFUUllIYk7KKpJT84uUmnAdf8nhO4r0i/Ixweeu3o+OdllJK4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774140381; c=relaxed/simple;
	bh=eFBuWevXIkOM7KlfwmmzSA31JWvCwZAYOT0nUKaku40=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=T8Y/lK81GAUbNZrOjeIlX8Oo3FoBtuZGLK5OdXYXgI4uuIu4xwWAZ+QBpGi9XLlbtxnN3is5Vs0w9sRoiC29Mxpo5gmXNYVrRb9CQBgUYv4iJxNPPGCrW07TBvqEFcLGFCEqGUlf4KOrPgI2H//RhqrXumKHaFMG4XulMBJH+Cs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gVJqyBAI; arc=none smtp.client-ip=74.125.82.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gVJqyBAI"
Received: by mail-dy1-f174.google.com with SMTP id 5a478bee46e88-2c0ecaae7dfso5254542eec.1
        for <linux-hwmon@vger.kernel.org>; Sat, 21 Mar 2026 17:46:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1774140378; x=1774745178; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Mp2d4eHd+kGNL1tPdL/2MoliS5wKUaGJYpYgX6m6ans=;
        b=gVJqyBAIqfV3OmYUtDLJJ7NVcQ0iNIup/kl6c0NqjDoPjDknvcflWyhbRrTHdwsvNj
         QAMijvm/wi+jybMtgi32F9c5rpcS6bwt46oz+pAUU2AISpfVkjGp1+AbCIQZTx6/sUmb
         GdrKagMdBT9BkiNT2t+6tdAbA8aXYCHfegorKFxXvwNBPgHDQTxKzUb8jhYUPnEDiQag
         05JOGtwzPXY9ho422/FhJsXuA53abFlFl1Tkp+B/9kDUyBn2iB6t6Ek93rJS/8aWcLpj
         YbNkVKBwZSIcMM179Zjstk9KQkVzLa7k1S6Lyxa+r94WYqzqDP7If6jR4KxFqHoRw0wP
         ZqgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774140378; x=1774745178;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Mp2d4eHd+kGNL1tPdL/2MoliS5wKUaGJYpYgX6m6ans=;
        b=I42Ou7nw01R3z8rP546hcglJlPXhdz2Jl0XjE69fVal1YiT91dX+FdNNXnBIqV/wBP
         p6+edlYsUqdXM8zf9mFFVShJHffDVI+wqdv3kzwxMNzrJHdCqKmnnZ5RlVK/C23EKprm
         59QJKdfEsbgLeGhls9ZAxt/IRKZK1eLXjdKKoALwRsR2CSaQkVbixLSZLo6hBuEOqA8c
         xVfQRmbRChvf25tLzMO/bSEBb7u5NgzQGpeVrQx55FxX/MfJbILUVplvcefFXPjGtIhb
         6vYtG8yuI8NmP6sutjo2EB3AahG9ObsHHB9etOL3dXVmZotwtyU1J8GEYX65LdL7vxor
         91sA==
X-Gm-Message-State: AOJu0YxhuSWkwmpfzEN1zChJsr06No5LvehRvE2LMU2YpnVDhUGtnKBb
	YFkROdl7irN1gx21TN7W/Azcun9YtTCjm+FrM5WGoFayIbie6xB/pDsw
X-Gm-Gg: ATEYQzxBTmORIxaNW/VF9nAPHlt48x5yl1rK9mcmToqZ34gZD+1I37YVZ2mvwOBkbDW
	tAskSYCX+nqDZQloindkH3sBi+xPEsG3jDFzr9LTlAnHk+mu6lCSIH1rUP2ok+1zB9SzS9nbXpH
	b0NGXB3Za9wBN94Jff/1+5S6yzLw1pbn3whXhVEAr3BMNFMqb9+gpe7g5dk8/uRb99WpBjS3dC9
	9Fzpm0gEJU0KLvO8YB9z2ID5vjcj1ByvmA7nkrk8SU33OaL3Czc/rmhK3Kw5mS4X5IrHmSpMjeI
	oKb1Ds38fX7bRLUDwtDS196Dhp3/s79e3OXAhVc+WG0l60SuOSn9RsWJS5kY82Pazv+r5xbQZMm
	4fzQyKOjGzZyvUdXvhJ2RHslJ0U6XWbeWP+4miEzKgCPRVci2RD+1nHViUUWbygMG8lsW6casWY
	nzyQAJCl53oEjVN4mpeL0OHMEbMFMBaBZO6QFH
X-Received: by 2002:a05:7300:641d:b0:2c1:7ca:ced4 with SMTP id 5a478bee46e88-2c1097b363cmr4234631eec.32.1774140378148;
        Sat, 21 Mar 2026 17:46:18 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2c10b29c74bsm8572264eec.17.2026.03.21.17.46.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 Mar 2026 17:46:17 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Sat, 21 Mar 2026 17:46:15 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: "Pradhan, Sanman" <sanman.pradhan@hpe.com>
Cc: "linux-hwmon@vger.kernel.org" <linux-hwmon@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	Sanman Pradhan <psanman@juniper.net>
Subject: Re: [PATCH v6 1/3] hwmon: (pmbus) export pmbus_wait and
 pmbus_update_ts
Message-ID: <593ad43f-9dd1-4b77-a9d9-b7081321a57b@roeck-us.net>
References: <20260321181052.27129-1-sanman.pradhan@hpe.com>
 <20260321181052.27129-2-sanman.pradhan@hpe.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260321181052.27129-2-sanman.pradhan@hpe.com>

On Sat, Mar 21, 2026 at 06:11:30PM +0000, Pradhan, Sanman wrote:
> From: Sanman Pradhan <psanman@juniper.net>
> 
> Export pmbus_wait() and pmbus_update_ts() so that PMBus device
> drivers which perform raw I2C transfers outside the core helpers
> can keep the PMBus core delay bookkeeping in sync.
> 
> Move PMBUS_OP_WRITE and PMBUS_OP_PAGE_CHANGE from pmbus_core.c to
> pmbus.h so device drivers can pass the correct operation type flags
> to pmbus_update_ts().
> 
> This is needed by the max31785 driver, which performs raw
> i2c_transfer() calls for its 4-byte extended fan speed reads that
> cannot use the standard PMBus word read path.
> 
> Signed-off-by: Sanman Pradhan <psanman@juniper.net>

Applied.

Thanks,
Guenter
