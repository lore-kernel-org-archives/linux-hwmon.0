Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64DFD3A382B
	for <linux-hwmon@vger.kernel.org>; Thu,  6 Aug 2026 19:20:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786044017; cv=none; b=VgAfOkFUhMI1duYBAuW9GCqbSbDR3ACH5l4R1c91iST+5pABmN9s0gDRjspUJmTpJT1th82nHy97CVTS9Q0dyTuwEpjud0xq5Saee/46VjVyKRwXyVu6adyxu4jiAuEQBsVmJSEPuHPhSag9PE3oyCRZHVNwVOgmL7apyNua3Cc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786044017; c=relaxed/simple;
	bh=Qovqo7mAU272G/EUPnKMq4OASIHlbBt7MfHDqxWdtT8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=W/ouvICkDMcjBvlPcgmznCmCvFEBJMRzp3TDdJApohcUoBOiZw/xh4GMpJLW82gOOCGyPOFzTUzmv7qWlFzyiF2eIZTw8wWTGuTIgjUS15evcEGARYCNlRCtbxcp3Hy17aIRubzPzARijZuj+L7rciaY2poIA/9mFKBQC8kOA80=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=pT2779R+; arc=none smtp.client-ip=209.85.210.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="pT2779R+"
Received: by mail-pf1-f169.google.com with SMTP id d2e1a72fcca58-8485bd28dd0so3009720b3a.2
        for <linux-hwmon@vger.kernel.org>; Thu, 06 Aug 2026 12:20:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786044016; x=1786648816; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:sender:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=KvYRD+MOe+TawBpoRdbbmi01Sz5y4kJZSHjXI4LLTV8=;
        b=pT2779R+rdmEVua30qDpzZkGvcoTV24Y6PVFZfjyAvwnZcsb777dhl7Q0Fn+uU736k
         ODehWw4RuyaZl/9YOC+QjbwQpUz++u5bYIGJNFwEasFG+o/wDvUBq+HaqEZPY+vR0qbU
         58SKc8bkzv7dPtddd/cHiKzZ7mZlBo9mOuDZ9dF3LwNCqEd+tTIeN5nxs2VYF7+4x65y
         7zyKaGd83hwfYekALlR2QQcvK3E8/bxcVW38FJ0LKgHgcxODWkPzsKIwtKL5TOReY4/L
         Ezrobm/YSCFx7bcqAjGPoM1i1CWAslXZUSM4LrFARVxxQktTYClzeBhZX4jcSwx1JRiH
         FrBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786044016; x=1786648816;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:sender:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=KvYRD+MOe+TawBpoRdbbmi01Sz5y4kJZSHjXI4LLTV8=;
        b=Xc0Atvpd0EVWz1OE2Suml3welMRnlkHp0eMQ5NKmoobbUeO5qBdgMb2ptZrYwegB4/
         lTRWofpgUO7MYOJl4XT6yZLOkYbnNzZNwRl5bzuv4IwN0pUpNmh/5xZoSOZEvTK7NnfF
         hVZakASF5R7ZyW4JLaIA56nY6HBOr4TF+AEZIUwmExD+XIP/01n+3KiYxRdWIwfyykdn
         thwZuXRmcyJGUidbHwGCDrbEwUMDMjQRfwrFZyRYHR51i/cOC05sDHw4JMqdnBPi+6lv
         T9WcnHjpOftAH8ExgDfWOgrn5b+gLXJxneQx+jtlAfQK94ysCKYtmjcq7AdedoRGTzWR
         ZjWg==
X-Gm-Message-State: AOJu0Yz63liNgWKHJ5apEvzSKNHQTe01fES5gR+d9pEROIzcG9/54fe+
	/696pABoH2W0T+fo1DX+BjNagxTJ+nvpWU9MVQGh87apLCLwIf7azGLttLM5kg==
X-Gm-Gg: AR+sD104J9VLsvq+iZs0/fY9X4aBxm8GkUSO4LlTXOtBbR+JiydWsJDrk4Q8FddStAr
	nTU4O8TzAWmN3ZP7ClYzP//hHLwsXdaaEGRGG336cxTGPwnN0HfY92zm32yMyQUS0fe7vd99V7n
	EJZ93jvQCV6tOzJvADzdlaTt/E2ChbrtHcwA+gb52Jvn1vFChnmoNkmHQYxWL8HQmJemsoFimy0
	QNLViV3WbqkIeRV8bXRR0zcgJD0WIC6GAWWL+PWjkuB+xHLOmRicwj6Nfq9Oc1ZFzBGIrsqysAX
	XfZDpvRNlbFV83FMoycBll6GcaEbjhnpH25koIV9Z3CNHw5ySnbo8bW6tYq45dH2XZjwf5TBlvi
	ctF5vYAXEuW7EBKtxx/DfxQ8ImSNIqS/SZJNEoSU6S3TEyqAK3SOUwtNusjH8b9lajx0cCGs8B3
	2/CuVUCEkdYP+j4IC7nQjYFmPX/CC7hi775eCgk9RsdH/6Icc8y/gQFmgRsfmRTtKpw4qeNHGfX
	g==
X-Received: by 2002:a05:6a00:230a:b0:848:2e7e:353a with SMTP id d2e1a72fcca58-84f2dea7014mr18167606b3a.0.1786044015788;
        Thu, 06 Aug 2026 12:20:15 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84f453bb24csm1935152b3a.24.2026.08.06.12.20.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Aug 2026 12:20:15 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Thu, 6 Aug 2026 12:20:14 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Thomas =?iso-8859-1?Q?Wei=DFschuh?= <linux@weissschuh.net>
Cc: linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/3] hwmon: (core) Use const APIs for the dynamically
 allocated sysfs attributes
Message-ID: <5543c856-c00e-4482-a9c8-2e2cb940a267@roeck-us.net>
References: <20260806-sysfs-const-attr-hwmon-v2-0-22fee8b85509@weissschuh.net>
 <20260806-sysfs-const-attr-hwmon-v2-2-22fee8b85509@weissschuh.net>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260806-sysfs-const-attr-hwmon-v2-2-22fee8b85509@weissschuh.net>

On Thu, Aug 06, 2026 at 08:09:12AM +0200, Thomas Weiﬂschuh wrote:
> The non-const sysfs attribute APIs are going to go away at some point.
> 
> Switch to the const variants to prepare for that.
> 
> Signed-off-by: Thomas Weiﬂschuh <linux@weissschuh.net>

Applied.

Thanks,
Guenter
