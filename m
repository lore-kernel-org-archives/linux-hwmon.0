Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B030C407CEE
	for <linux-hwmon@vger.kernel.org>; Wed, 10 Jun 2026 13:15:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781097312; cv=none; b=GjCFvkI5uUu8cpuSXJicPNXX9t8vknocT3AAhGwQMxDAMwkVmKQhIK+s/+9CWxiquzJVWeFRoZMxsQ4BDgkRVpdPzrTsOeRy4WGpfT+iOESat+jUZf8myQ/aIsUKffiylXuHLOpjD6+kvcjM75XmJJtBvrVkC8KuhIkaCIxCUD0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781097312; c=relaxed/simple;
	bh=5szcsrRS/9oDK9S/0yqP13b8Jchbpe/HrWmZA3qZ9aE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LkGRylY1QqPw3HfBPVl7aTtvawcDh3o5OqkFl0dCTPfA3WPTKG76oLergvPk5dCZP6QuA+EF0EfXDhl76+gX/2hP53Lb40eMFMB/qjmCC/IMSU4MF9gdKXeoKHIfnJlLwayGu6yZ8pK/XOfM+O6sgYg0mP5G09oEw+avlYoa3uw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HRo4MEJJ; arc=none smtp.client-ip=209.85.216.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HRo4MEJJ"
Received: by mail-pj1-f42.google.com with SMTP id 98e67ed59e1d1-36dd65b95f2so4829329a91.0
        for <linux-hwmon@vger.kernel.org>; Wed, 10 Jun 2026 06:15:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781097311; x=1781702111; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=sviK+Z/HpW8HbkU/ZHZyMcWovg8cWiLHN/USvdpfv0k=;
        b=HRo4MEJJpAUW1v1B59NQgzK0iwTZo/2In5J5YP6IYaO81P49bKHcBmfR/DP3ftRlhZ
         kLr3ldRdU/qSnYMJlcQt3Nv3n63Ou2aUDWPPmV4vnWY/mOt0NaqB5ko5ZiRnlX9uxI8a
         7i10pfHmmobjfSn+ArtKxMuURR6uCtqtDvU3dXWPVrjKNQsOnwmKxcf2alojhHzz0Ozx
         Zd+pyQw2VNmtGv7DnHyysJZgEO16j3ZJhzTqx2mCiI6xY82TehFv+aBuaxrfy/Tmf4Dr
         fnYuCW5Hzr4wxoYtMVN7BfAGmb1tu5BQWW6U4HAviZ3OrLHvE/8D7tLkqA4BL0Akm/NT
         AeXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781097311; x=1781702111;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=sviK+Z/HpW8HbkU/ZHZyMcWovg8cWiLHN/USvdpfv0k=;
        b=k+GhugCt0UebiR1aDwgeOdpRwcHAePPSnqSzvUoMjSSjf+KETLcK+SN5FmmDjyTAQx
         MgXDfsvwuZ7r+Eep4Z1eqIK0HcgBK0rOjAuNQRZxoMs5KRSv4r7pCP7eYYevbpG0tqXn
         nhZkDG1PXS21O1AGeo64pHawLw3zFVkGqjsu0iR2dpGUsj6/N8vcqcIhZXXFqMxq0odf
         s9jlxxjIWt1SVFeMV62ocdZryfyeRpL7RD6GojA+8oUa/hI53uNu62uX5wQs4z4ODL48
         hYzfbDh9d4PKAytXqA6C8GhFQSujoaEJu7Y+5v5kpQ6fzCDBMgj+CK+xeqNiNlHS3dpr
         vPpg==
X-Gm-Message-State: AOJu0YwqJkQsPfmJStXpfNd/29V8TLunCSLQxlFs7AEHObHEGIsBBjnG
	T4BV2Q6NM8CbNzznGCQ3r7mE5JoyCBvm8xHWKmDiZZsrb+KdiLoXWQtx
X-Gm-Gg: Acq92OEM4gradsLEUVpUAS6Zrgm/JvoLfDx8qxIDXQg4JquwMhQRbH9aVtgkFYM+hJh
	5HXIF2PrmJVrbAB3Gu94YwC4q7W7qqXq2j3RBPcaXkigt8sQIu9DZ4oM0rjvb0pMzh8Aarv9kRG
	QW47q/OnZe/ncqiXBDo4UdUg0z+uI6GpJb29KcqR0LAps5JOF+mLYqlVTiu94WJJ7Jo2owKj9Xa
	SujJuL2td5dXlx46nRHwWzhTQmDK5X3YXKKU9wG6YW6ukRT6BUG4RvWiVNJRa35uS1hXnHNOYjs
	A6tK6RBtGvKl1dldk7MUbKdSnu5Hc5MJ1+M2mvsx9Ovnper437WA3c8NjpQy24JagRHASpmf4fk
	fnBcO7WYDJ08M4opxyH10SdhiOCQRSTIGHWDPgdyKHlNJ/a859zL/OQKL5sm9+WgDS4M1oBGSbo
	vlpQcPBQG6DYEGOS4LaY7HBEPpYhWZmM5f4nzv7dOIT+tT+1E=
X-Received: by 2002:a17:90b:3f46:b0:35f:b9f1:fded with SMTP id 98e67ed59e1d1-3713336f91fmr18965011a91.12.1781097310993;
        Wed, 10 Jun 2026 06:15:10 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-37621b3d04dsm3941434a91.7.2026.06.10.06.15.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Jun 2026 06:15:10 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Wed, 10 Jun 2026 06:15:09 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Pei Xiao <xiaopei01@kylinos.cn>
Cc: linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org,
	cryolitia@uniontech.com
Subject: Re: [PATCH v4 4/4] hwmon: (gpd-fan): fix race condition between
 device removal and sysfs access
Message-ID: <b5270ec6-0ccc-4b94-a38a-ff7038b676ce@roeck-us.net>
References: <cover.1781055639.git.xiaopei01@kylinos.cn>
 <4400828422cf3a88adad4db224d9efccdb1049d2.1781055639.git.xiaopei01@kylinos.cn>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <4400828422cf3a88adad4db224d9efccdb1049d2.1781055639.git.xiaopei01@kylinos.cn>

On Wed, Jun 10, 2026 at 09:49:12AM +0800, Pei Xiao wrote:
> Replace the manual gpd_fan_remove() callback with a devres-managed
> action using devm_add_action_or_reset(). The original remove hook
> resets the fan to AUTOMATIC mode, but the hwmon sysfs interface
> (registered with devm_hwmon_device_register_with_info()) remains
> active until after the remove callback completes. This creates a
> race window where a concurrent userspace sysfs access can interleave
> with the EC I/O sequence, potentially corrupting EC registers.
> 
> Using devm_add_action_or_reset() registers the reset function as a
> devres action. Due to the LIFO release order of devres, the hwmon
> device is unregistered (sysfs removed) before the reset action
> executes, eliminating the race condition.
> 
> Fixes: 0ab88e239439 ("hwmon: add GPD devices sensor driver")
> Signed-off-by: Pei Xiao <xiaopei01@kylinos.cn>

Applied.

Thanks,
Guenter
