Received: from mail-pg1-f176.google.com (mail-pg1-f176.google.com [209.85.215.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1273A25B086
	for <linux-hwmon@vger.kernel.org>; Sun, 19 Jul 2026 14:30:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784471436; cv=none; b=OPBHM+EqBGQhE4y3KBcRndwO25lpMN7b6JWyqMrjk0I7qT+AEehHnrrUSXUNSOYxByjZ+XdEcrEUDzo/3rVCi1wzfyVMmv0llgQYsAuAiC29YHpXF/+hD1JoQVsjLkvFVc98XjA+70RZixfkus4GIfu+j+afgkF3WUq+rxCp4Kw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784471436; c=relaxed/simple;
	bh=kqy6PWsRSUOoKf1qZJt9Baw3XgbFJWnJR1MpV3hTDOY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hDMplcLmLAiwbizxcV1Y6HrmHYn3WjY63O6YlNIn+vVYd73UkZxoNztLL5GKIMgNy2adC2nodb2VeZ81EcWlNMG7vMY0WeAlbOuJfZ/mjUp89T5HhFDd26+39x2P5bfDUb2PvCWqtVqHpRtsaY7YLbrCTb4gE5hanoT0JxPVkGc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TX8WnPvA; arc=none smtp.client-ip=209.85.215.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TX8WnPvA"
Received: by mail-pg1-f176.google.com with SMTP id 41be03b00d2f7-c96c92c0980so3885555a12.3
        for <linux-hwmon@vger.kernel.org>; Sun, 19 Jul 2026 07:30:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784471434; x=1785076234; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=SR6wCTNUfe0mXl5GL7cInTf4KKBb+lgqlvUGfg/9Mwg=;
        b=TX8WnPvAMkG7Os3OZHOiTHvTY5i9KMI0Cgae+axxi5rglDCXhMTpLg565Sj9AX21aj
         oaHsUurYLRRd5+F2WJYk/3/1K7mN/u0GHBfKviX66a+FhUcgRVnFRSG0DYvGW8BgR68H
         PahRteoGAAEaBfWEAQ4OxZpdjeEG6RNNs1/XBFB1W+1AoIY+fbTXtt+9q+nEOmE/FhhI
         s1AWqPkK6bIDxiXMlORNzmhnRjKbil5hiYQMBz7sguA1n1prKkloCTJ2TVfx+hltxUfU
         +wuN3pnfMTT7v1XC5HLBWLgx5JWeY7ozKsqhLtuol96eaYVUxe3NxMPbZY4K55WQdXh8
         XJAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784471434; x=1785076234;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=SR6wCTNUfe0mXl5GL7cInTf4KKBb+lgqlvUGfg/9Mwg=;
        b=YcBuGV5qTymy+W+COKAMn1N1/esW6KPyevIm+ncyCMBA6PUs2oC+ABnqA7OQbQWzFf
         3sXgNfZlrFYKwA7ltL7g0HIobTIQ1h/qjDqiShOzxP6DnqjqOLfLnzeXp0Yt0begLoZp
         XxVIdYHzl0W8+DnmwJ7/MMvDJk4IeX4XRF6kt7EwJZc5+tPrTEzQO3QsWg08P8wWGOAg
         kZ3xuGHbLLZgeuXMRE1CclkijQ2Vn7IjIoZfQg9b+3VPg38VXslclCioZ+zvzBUsMCjj
         dK0W9DHqfPANCbwOyMiXSDrY9HFpKoG94XEAaNjXFdA6wJvz1twm/IRFo1Q1fOC8Lsc/
         SLZA==
X-Gm-Message-State: AOJu0YyLML16N3Rco4WzDCfT5us0L8+HiWoUop1hdJo9s/xBELRuaEHv
	DM6svhtcjAfzBWgn0Mcg+CEvdFb0ykRbE4PWKPio7G2qqIrF8sBNZO1q
X-Gm-Gg: AfdE7ck+xof4kVtXc5Pdv23mw3IR+CC4PrDI6ugAqzBzHeS6UIXESWy7buNDgXoXnwo
	hyI2f1kAT90UWk5aOVGJkXxjVzTpYU5V30kV9rPDauzErf8PBJqFxlKuEOlmzk8itv/EEYERxSZ
	yrO+W86zJplliW5b8RvZKBHOV378taKiryuIcfMLG3y2M7TxyLSwDx6t/zT6dMNBiPxcpGCfg2z
	QyD6+dwwiSot3GRIbCcYOoN4NQvhyo0q3XWSptXBBonJg5/hi23KvcrXzh6zYfKO0cudZCONkHL
	Up7aR6Cpti+F4Voaxtf7KP4Z5zwfEs1b7egaMzfZ/CG8O4IRbXFBRoZhMXDnesO2zl7hR9Ven8U
	JdcBnZEqhKkZZZuHJbwL7ZSd6n8kilVbfsivKG3UbjbmmoGQwOXo3pjZiGuVs+hD/56WjXQx0U/
	tsR4FwvVMr0jF2rOc=
X-Received: by 2002:a05:6a00:4505:b0:845:45b5:9825 with SMTP id d2e1a72fcca58-84c29501135mr10045519b3a.37.1784471434317;
        Sun, 19 Jul 2026 07:30:34 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cb517ba3222sm3145165a12.5.2026.07.19.07.30.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 19 Jul 2026 07:30:33 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Sun, 19 Jul 2026 07:30:33 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Pengpeng Hou <pengpeng@iscas.ac.cn>
Cc: linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] hwmon: acbel-fsg032: add missing MODULE_DEVICE_TABLE()
Message-ID: <c0aa6cea-e51f-443a-b81c-2acee2588e0b@roeck-us.net>
References: <20260704151543.35069-1-pengpeng@iscas.ac.cn>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260704151543.35069-1-pengpeng@iscas.ac.cn>

On Sat, Jul 04, 2026 at 11:15:43PM +0800, Pengpeng Hou wrote:
> The driver has a match table for the i2c bus wired into its driver
> structure, but the table is not exported with MODULE_DEVICE_TABLE().
> 
> Add the missing MODULE_DEVICE_TABLE() entry so module alias information
> is generated for automatic module loading.
> 
> This is a source-level fix.  It does not claim dynamic hardware
> reproduction; the evidence is the driver-owned match table, its use by
> the driver registration structure, and the missing module alias
> publication.
> 
> Signed-off-by: Pengpeng Hou <pengpeng@iscas.ac.cn>

Applied.

Thanks,
Guenter
