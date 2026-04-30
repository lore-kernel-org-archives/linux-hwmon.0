Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 048E647B429
	for <linux-hwmon@vger.kernel.org>; Thu, 30 Apr 2026 18:20:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777573239; cv=none; b=H4IwPpElDU0WfcgFXQ0yaIbGCpaNGkHgLcuutfPhFWrtsXSao1Mvhid8/0WtS0r8WJvNDlLVNxc6BqNIxWwl2yEV1Dvj5J6bBsgvf4f7DF367G9sNruL6ua8PQTCHV3eqUF/Cdu8GbVc0gWtkQLty3LkXobOWMIP/GUVhMmANfM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777573239; c=relaxed/simple;
	bh=tCw+g7/7gagsLPju3PCwMZhvzQy38+5YtWX9iaZdW2k=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=aM83yW3G22IE0ZZTE0d6JSfI6OY5cgL5UkT2m9RPYXTzi5RU2V2W0O5I3DT+jcXnDYcP8NCgQs+iNKzUOmb2csdky8iDKwJq77aHwSiY+BXek2ODzJASZJBkH/2acxTv/pSK8fs2bhDgNHcpkYswcF8hnVwfXwgb4ExnPyUwD2E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AposASQX; arc=none smtp.client-ip=209.85.210.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AposASQX"
Received: by mail-pf1-f174.google.com with SMTP id d2e1a72fcca58-82735a41920so536916b3a.2
        for <linux-hwmon@vger.kernel.org>; Thu, 30 Apr 2026 11:20:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777573237; x=1778178037; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=klUdmlVlpNVXegQCoO7cd9DXbhq3zKfW/7g8zOSk7s0=;
        b=AposASQXhasbW4RnAqaUf5272lIrXoO1do32DcX92I3jHT8jBuxANAGJfqZv2/Ftn5
         ssryFyxhReByinqmU5rabUvbXia43VJevIh3EbUBvmfkhHY5l3k9m6zX49FGFsJEr6OU
         x7CggiQLrEiTmjQJ3Y7KNvB1u7FIAYKoAXPqo5tjY9XvBTL3o3eXzu4rvv70GN+asNVW
         LAWyABwcg+oUEC6OWshsDMwJvFuS5/MB3huSZJCMJq1tWZDgUyWfM/ozIiQNEksdPOm/
         /o+SAeAKHfAW00oj+qId+byc2m/TQZ8tKV91r/qDC+7xUD/6I0fEYuAFcKpmhnp4UOAL
         m7PA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777573237; x=1778178037;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=klUdmlVlpNVXegQCoO7cd9DXbhq3zKfW/7g8zOSk7s0=;
        b=oKYyP1WzmAX51gXxpM4QQ8t+Jlh0tYGZDVswp1uH92Ks4n/fS+WovJoo+7ECVnmZYr
         Yc9iB71w0OERU9Ak8DGhtAmB7e0iTh07CSH++4hdQHPK2B4pS9RbtGLfTesrxtZRByui
         KaGRi1H4oPifRg+4p9CYLNofmdTeE8JXscnkgstRLjO4fLHybXPme897uDIFQcl8bspq
         w3BxG4l9i2UXSGXAsRI42DvkpMmZVm643m1pNB4xoWvC5x5ryOhH6OnVntQNshoeBWoL
         3Tf36HOW40pmyq5oog7wV/B1AG3JIhyZOb4Wf6fzrsrtPRUZPAx9CVrsCBj71qPzFj9W
         NRsg==
X-Forwarded-Encrypted: i=1; AFNElJ9rXk937+bRvQncMoBW7J3CKgecQJXG/BHYUw/NXbjobcK9ESmfZSmq3hqUfls7QQp5ziW07WVo7tO5QA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yzh6YKjfZAn4iCRAIR+uzSWle/yaaSnJ+zK2une1NJd/U8fcN9Y
	NpfsyBzzwd6jZfSd67dPVmM9Ecp9rMOkVELIgkbpoFTHSPGYM3TgADoc
X-Gm-Gg: AeBDiev1N4IW5O6QeMUqxRickaD5vMA1hYD7ixFW+IMFljQdhPv6+04o9mX7U+crxOQ
	uu1faaB2iS4g46zm9oS0OYE/WZMsEqS+ATW6PrsWQFG6874wBNthPoYMo/aOyO0h4glyVxHsJxc
	i4VvJHQ1BrR70C6VnVDdD8mM1uC7z5enI2K22/k3iJr5QLOPkEiAZM4xx4rZIaB1jm2J9WPTJxp
	JRLAxLVOzqgeusXqgpvodLQodfu69nh6wg3BcgSLHAAGAwYfTHERaWQkB2g1oOc/prp3C5nq2+G
	DVpS0utClY+bNNoQfRqKl29vjV+mLAC8cZQkmbi3Jz++AvJkShEE/SN8vwJg1li+bIWdwtXZIif
	KDuGkLetlqPZeOoKT/7JLEajLPgz8tMm3gHdoBITjDPHsmrC+B1ininvFdrH4AVthBgBU5C1bWT
	PRlEk9h3ZrR3zfWYo979zHu2ePTcmlQVrobTtici7YQKXT1XM1SWwUVNGVyA==
X-Received: by 2002:a05:6a00:174b:b0:82d:6310:2efc with SMTP id d2e1a72fcca58-834fdb874e8mr4549707b3a.17.1777573237278;
        Thu, 30 Apr 2026 11:20:37 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8351582e185sm330380b3a.3.2026.04.30.11.20.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Apr 2026 11:20:36 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Thu, 30 Apr 2026 11:20:36 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Myeonghun Pak <mhun512@gmail.com>
Cc: Wilken Gottwalt <wilken.gottwalt@posteo.net>,
	linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: Re: [PATCH] hwmon: (corsair-psu) Close HID device on probe errors
Message-ID: <083849bd-9229-4ade-b60e-08cbc4ff1cd4@roeck-us.net>
References: <20260424135107.13720-1-mhun512@gmail.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260424135107.13720-1-mhun512@gmail.com>

On Fri, Apr 24, 2026 at 10:50:51PM +0900, Myeonghun Pak wrote:
> corsairpsu_probe() opens the HID device before sending the device init
> and firmware-info commands. If either command fails, the error path jumps
> directly to fail_and_stop and skips hid_hw_close().
> 
> Use the existing fail_and_close label for those post-open failures so the
> open count and low-level close callback are balanced before hid_hw_stop().
> 
> Fixes: d115b51e0e56 ("hwmon: add Corsair PSU HID controller driver")
> Cc: stable@vger.kernel.org
> Signed-off-by: Myeonghun Pak <mhun512@gmail.com>
> Reviewed-by: Wilken Gottwalt <wilken.gottwalt@posteo.net>

Applied.

Thanks,
Guenter
