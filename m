Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 483F335E1A4
	for <linux-hwmon@vger.kernel.org>; Fri, 21 Aug 2026 19:47:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787341670; cv=none; b=bZbWirMB46A3A4htN9LdMPWT2vTwbVZPNfxrpQUwsfClMwYLGDjNiuR8RjRGIc8dy907hKzIX2oQM1l6l/4Qeu9OtSMDlfjLBrO7akUx9+xfPI0ivbnBPVVouoNtZ38BJw6ptwR8mHciJCkkVlfx4IMoyFJDjexZ6I3Dqzbh7gA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787341670; c=relaxed/simple;
	bh=bRWIazV+ymv8+U20yknxenaLSaulwdS+5GKnd7FTiNk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YV4Mox40A74QIuup1sMviGabI+bd0h5qNxG8cMejLxRsih1Y8p22W/9u208Bv+KjKdZMmrQyvRchbhSVEM0sIYvBd8MEwVHjpIcO9uXFbidlyX2rn0gKnNkn5kkXNsYQ676Pchp5PuE16Xvt42RNA+SmDHWddm5Fa8ERbIuZjUA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mx2cd7EH; arc=none smtp.client-ip=209.85.214.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mx2cd7EH"
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-2ceaf8a1265so16246855ad.2
        for <linux-hwmon@vger.kernel.org>; Fri, 21 Aug 2026 12:47:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787341668; x=1787946468; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=gLN5uxM7nwtRltN6fOsWcMDmnEMUIMPWUARQx4rNMtY=;
        b=mx2cd7EHjwxp5t920xwZPm91HWWRCnM50B9zSVTPz3HMFLT3tmtHOI93sGKYSMEE/Y
         MAQx9aOtOnkbXtxLxAJLk685cB8ppFQevsmZOdBwj+jAvZyEnJaiXWsnSpe0NWJ21X+d
         frJ3UVhcKIfkE8XNwyzoDcU2xY+AXhix7kKcv4nekDUfIbvLNu6BQ/9LXglNCYKkOAAr
         OmJ9WrXCJx2qLjLDhNBwtqzEvVEptQVK7/MN/s6pezDRlLXsEPn3YkwCa4mXoF2+Z2MJ
         x2kyd5Hyx01wwlpc8SvBM/FxC3oUuNWsCL+4YhmaBaPezEUiRYWIAwN+A0cgONfBDfsr
         JFmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787341668; x=1787946468;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=gLN5uxM7nwtRltN6fOsWcMDmnEMUIMPWUARQx4rNMtY=;
        b=epanrgN7D1cLJfuClfWIuyUCt0qLxvemUg0Dk/i6E3mprCCjgnBJYItt+8R/cz7XkT
         Fcm4YdWJmxSzWq0X8dXgyesY6YzO7oOLvDBo5+NZIhcw+DNjCbr+16aCztnEWd264W+n
         oPBtNKKTIgZgLY/S3OUXEwMYUCWaq3nvnwG6IjkP7CRdrTYYau3dCLzy/6XdAPpdcEfW
         yp3WX/XwB0uVwzPYQqLPmTw+VFltYg4zND8Nd5AUdnsQR6u13Md7Wc2goWub3a97+CvM
         j7WoJw0qd1blAjXoZuGCuFeFQwWPHZUDNlfFnNxT4XASoqaOAI6YnwPpeIvkea3SNUfC
         rMkQ==
X-Forwarded-Encrypted: i=1; AHgh+Rqeac+6wgUXFiTWJVlio03HIAsj7uZOiNFJz8ThoM5LT04A7c1lIuJfjk8jaDLeVTMBMwLLC8TEC91LwQ==@vger.kernel.org
X-Gm-Message-State: AFuF++leskqE7fwNWzynu6hNkTl+UTD8nmAsqo7we6T8z1a8syYXqibI
	IdC0CNcfyD5/bdyblczQ5vH8uUecOBdfhGIE2y66JYIM0SV2dCro7etQ
X-Gm-Gg: AR+sD13Z4vAyK6AWYfd6lbfzs/3GxtA8n1MtIMvqB5nbd37RsXoYkhWRGc2ZX39NweU
	dU4ex61xDNEki5Y7TyahMSZs/YN+l4rPLZuYuVm/HDAwBgGA39HgGoj3OxJsJiA3eX6lZlnGcR1
	A7cHqkzVhTe+UnxYrbOdvJyODNAQtF5B9SW9a2OC9xB0OfRNUCY4GgOTN3Rdg4n4vUJ2eoGtg0D
	rXYBxe7a+dHc/FW6EgHHIMb8FlamA6JuxYflf7R5zXXrGQ9mNZRwG7lGGW2KEjr0VjnbCrwkv7e
	gvXj+jaGXme8MMw+bNmrVxcYzmiLVoWmGkOr+ZaKGfHL3jAuzfzqgr/jgx30lgdTNL97qly9zCe
	nz2bYURgPiOFMqBZF+n1mFQGsHeMkPUer9OXIpSyjDmISPSqYfKOJI3YezsuwJW3st6g7d/9i8Q
	HbttkNMgmvtqRMvqpFQa18F84xY+j+nuI62N8HVgrAJ5xSYDhuCTep2CtL7eCChcv3D6xc1Yt2s
	g==
X-Received: by 2002:a17:902:e949:b0:2d6:3c2f:6a5 with SMTP id d9443c01a7336-2d64b1d68bemr181943065ad.14.1787341668589;
        Fri, 21 Aug 2026 12:47:48 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-327bef3bb46sm26595453eec.3.2026.08.21.12.47.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Aug 2026 12:47:48 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Fri, 21 Aug 2026 12:47:47 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Jared Kangas <jkangas@redhat.com>
Cc: Tzung-Bi Shih <tzungbi@kernel.org>,
	Lothar Felten <lothar.felten@gmail.com>,
	linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 3/4] hwmon: (ina2xx) Replace masks with enum in alert
 functions
Message-ID: <10808f27-9074-4378-82df-7f3578618506@roeck-us.net>
References: <20260820-upstream-ina2xx-in0-curr1-alarms-v2-0-fdce35abc41e@redhat.com>
 <20260820-upstream-ina2xx-in0-curr1-alarms-v2-3-fdce35abc41e@redhat.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260820-upstream-ina2xx-in0-curr1-alarms-v2-3-fdce35abc41e@redhat.com>

On Thu, Aug 20, 2026 at 06:09:23AM -0700, Jared Kangas wrote:
> Instead of passing an explicit mask to alert/limit functions like
> ina226_alert_read(), introduce an enum ina2xx_alert_type that can be
> converted to a mask internally. This semantically separates current from
> shunt voltage in helpers that use function masks, which previously saw
> the same mask for the two functions.
> 
> Signed-off-by: Jared Kangas <jkangas@redhat.com>

Applied.

Thanks,
Guenter
