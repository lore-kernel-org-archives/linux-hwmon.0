Received: from mail-dy1-f177.google.com (mail-dy1-f177.google.com [74.125.82.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 963FB3E1203
	for <linux-hwmon@vger.kernel.org>; Mon, 29 Jun 2026 15:40:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782747647; cv=none; b=fBKQhIAVQW5loV6eWFIV9Dmk8tL92mNu2bsjJF8fRS4fsNCl3t8h96oiqRx9hokGxub+g+BydKuS/JLDmSnd5gkPObnAhCP+Lm+Czea5SLGhzBtXzqlHAwR1mHxJOzEDYe3LCbMt3n99F6tsRk+Q+2NxdhW2FSe5S6+hYwxJOv0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782747647; c=relaxed/simple;
	bh=EFwE5ooeukEnnEc43GuxbMkaqRCOSt5EXwI+fuMAuQg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=eHMQTTN9X5YWYGptfnib+F6OFf4Hrcl65ESC++WF+DvG18VhsOc5NioLKeuLLkdjJWd/wCmKU04q+ILe+v3amUHkImH50ZK09P2Pk22Xuvn9X8c+Gr1HGYl9OQhkL1hoejjowgF3D341V5aoKfMZAU05GEtuhpJex8bP4+jxzZk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=X7KAUloB; arc=none smtp.client-ip=74.125.82.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="X7KAUloB"
Received: by mail-dy1-f177.google.com with SMTP id 5a478bee46e88-30bc871ecdfso4609069eec.1
        for <linux-hwmon@vger.kernel.org>; Mon, 29 Jun 2026 08:40:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782747643; x=1783352443; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8QToOEeOU/UyYphWJrDQxnYbVsLkFGV+L+v/I8ajcB8=;
        b=X7KAUloBk4wBFIhQjB+Z3wKOoBa3PjdtyBFul9mJlgZWR/daB6yyQ2rx9vrPzv8z5k
         XoD7mto5mD/Zh8ATvNdi5Ii6KKVtwIxFTQZzKat5x514wAocBuCrwt8M667SATF7xU2N
         816dY3im2CR+ua4bjMFvGSvcOILdyImuxMI/psNCt8VH18wZjzClyPl5CNDAzq45U9wk
         C7X23swU758DdLwjNmaaz3UGJSI5tFLBygI90k3RjlROe4PbfYPCAyLp8yzf73X8WtNq
         KwcHgChMda4VwapuiVvclRY8nq9OvqWOWZGu9tqAYCr/vAqOPZjNcVvsy1+bmCPJ/zoi
         LxmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782747643; x=1783352443;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=8QToOEeOU/UyYphWJrDQxnYbVsLkFGV+L+v/I8ajcB8=;
        b=pINlFhAc4tcTDcvPLfZ2jYTHHDNZl48dNCwyZalf1rfJuh0yYzZW7IPmlIgk9GxDIP
         dI6vFr2g8EzHh1/o92vd78SATBSKyA3wursNw5tjx1EvjHSpTy8tgYRvmpTwHnJW+veA
         pqN2ywkaFq21XiKF9vL3A5IMn3NsNDnRbPl/ysTrzWCJYmET7jKxH0i5iTh4C+mswyS3
         bw6cvmWYL7Kmq00xj4rkgOZ8ETktVnJm38VPJLjHlSz2hWW8Ns8ATBeQZU6sgtus1NfU
         69in9Hg2qv4yx6Wub+60bje1n5nrmTAGeqdVXwpTFlH/rLJud6eUlDafluXIJDN0OegH
         5dSg==
X-Forwarded-Encrypted: i=1; AHgh+Roo5YGy4+qCjVtD6lTaArAQxjwZ/uf27oTckEtBAKdYToke2evmKqs+su+hLzBFvi+SCXeXCD0RG0ncOQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx85GfUyOJHStTuURCBZXRJibssJ86+kcokWoU3CIxSqKvktMxp
	FdYszPq5GVDEJmpsq9r7/FYPNTvFad4GMqJKbAvzWs+3VXQBDQLmqD4v
X-Gm-Gg: AfdE7cnfTrrV5BE0/iF7z2oBnxdQadAij1kbVAdjY6fZ4O/SVBUxGuVtwRiWJINT9dv
	k6cNcqEesseJ83J2b8HPGCkR1DGzJjqaOaRWZYIQTVrgMFgmk9UIgqx1XNy/5vfRF8ZwZ3tluwT
	ywz7d5Xz1oJJIulp8nQow5eDfv274y010XZn3r2ecfF1R/QQ5VJoRZX7fA/WtjeOc+7RPo8KukQ
	sh9Z9sswEEHSMUoOQH9WDzCRUEK3nLnSYOtn5lOmbrtoBZRt9y5ggvhUfW7ifToLTDnI8YqZ8cI
	79jcNzLJV4xPPk4WH1y9lqYZCJvdMYUeV9Xbmx1kvL6Fo/ALRXP1vYhdc0ejsAfXMo5E3FQ+Rv0
	nRNG8XfUAdQ4KxkpMY/84KYB1fWGnjdRDU8n7GIFEbFU1z4A1SMmC+P7DHkULUyvkD5XkXWsyBv
	wZOSHe7eKFM/yWUCvXfQLi7OTvwA==
X-Received: by 2002:a05:7300:8c15:b0:30c:1147:ccc3 with SMTP id 5a478bee46e88-30c84fdbbaemr16973902eec.33.1782747643093;
        Mon, 29 Jun 2026 08:40:43 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30ec3e400a2sm19162263eec.28.2026.06.29.08.40.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Jun 2026 08:40:42 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Mon, 29 Jun 2026 08:40:41 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Runyu Xiao <runyu.xiao@seu.edu.cn>
Cc: Eddie James <eajames@linux.ibm.com>, Arnd Bergmann <arnd@arndb.de>,
	Sasha Levin <sashal@kernel.org>, linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org, jianhao.xu@seu.edu.cn,
	stable@vger.kernel.org
Subject: Re: [PATCH v2] hwmon: (occ) unregister sysfs devices outside occ lock
Message-ID: <09e5f291-eb8f-4c56-8d61-45b38c81fa2d@roeck-us.net>
References: <20260617150859.741453-1-runyu.xiao@seu.edu.cn>
 <20260619015938.494464-1-runyu.xiao@seu.edu.cn>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260619015938.494464-1-runyu.xiao@seu.edu.cn>

On Fri, Jun 19, 2026 at 09:59:38AM +0800, Runyu Xiao wrote:
> occ_active(false) and occ_shutdown() unregister sysfs-backed devices while
> occ->lock is held.  hwmon_device_unregister() and sysfs_remove_group() can
> wait for active sysfs callbacks to drain, and those callbacks can enter the
> OCC update path and try to take occ->lock again.  That gives the unregister
> paths the lock ordering occ->lock -> sysfs callback drain, while a callback
> has the opposite edge sysfs callback -> occ->lock.
> 
> This issue was found by our static analysis tool and then manually
> reviewed against the current tree.
> 
> The grounded PoC kept the real unregister and callback carrier:
> 
>   occ_shutdown()
>   hwmon_device_unregister()
>   occ_show_temp_1()
>   occ_update_response()
> 
> Lockdep reported the circular dependency with occ_shutdown() already
> holding the OCC mutex and hwmon_device_unregister() waiting on the sysfs
> side:
> 
>   WARNING: possible circular locking dependency detected
>   ... (sysfs_lock) ... at: hwmon_device_unregister+0x12/0x30 [vuln_msv]
>   ... (&test_occ.lock) ... at: occ_shutdown.constprop.0+0xe/0x40 [vuln_msv]
>   occ_update_response.isra.0+0xb/0x20 [vuln_msv]
>   occ_show_temp_1.constprop.0.isra.0+0x23/0x40 [vuln_msv]
>   *** DEADLOCK ***
> 
> Serialize hwmon registration and removal with a separate hwmon_lock.
> Under that lock, detach occ->hwmon and update occ->active while occ->lock
> is held so concurrent OCC state changes still see a stable state, then
> drop occ->lock before calling hwmon_device_unregister().  Remove the
> driver sysfs group before taking occ->lock in occ_shutdown(), so draining
> the driver attributes cannot wait while the OCC mutex is held.  Also make
> OCC update callbacks return -ENODEV after deactivation, so callbacks that
> already passed sysfs active protection do not poll the hardware after
> teardown has detached the hwmon device.
> 
> Fixes: 849b0156d996 ("hwmon: (occ) Delay hwmon registration until user request")
> Fixes: ac6888ac5a11 ("hwmon: (occ) Lock mutex in shutdown to prevent race with occ_active")
> Cc: stable@vger.kernel.org
> Signed-off-by: Runyu Xiao <runyu.xiao@seu.edu.cn>

Applied.

Thanks,
Guenter
