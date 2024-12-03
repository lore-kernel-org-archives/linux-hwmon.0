Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34AEA1F8AD2
	for <linux-hwmon@vger.kernel.org>; Tue,  3 Dec 2024 17:39:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733247569; cv=none; b=AV1jQgcXOXEDjFTBWNa5kPHqueaAPbIabnPCnJqj7rays4o4cQIHwH/Md3CxtmUCY8IBi+lc7czExhfisUXTY/ovgLvoKuQ1Ibt6VcB1+dKXyzwlhxsrL6YDbXQWXCrghI1VwDBh0eLgDwV4qg1OBO1+amWxeC2ZorzcMAuWrTY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733247569; c=relaxed/simple;
	bh=1PmuiAckmChZLwXYJ2HaIkjhazGhdIeeSEN0C0qxWaE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KVCsAH+BpDGTatGF+PAM/uxXxS+MKh0joER7viBt6rlWfcN31D3fikZeUwALWCGYIG6RKpCLjMoRNLiFf8dPTaJpHEBc1gYI5qKAlPIUiKQio1+nNgiyk7ZYk0VR6nGZfX261MIns54u9KinzWxC3IhuAvyofeJoBm6HvESeQ/w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZxE69vLF; arc=none smtp.client-ip=209.85.214.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZxE69vLF"
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-215bd2c32a6so10737575ad.1
        for <linux-hwmon@vger.kernel.org>; Tue, 03 Dec 2024 09:39:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1733247566; x=1733852366; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:sender
         :from:to:cc:subject:date:message-id:reply-to;
        bh=TM860e0YLiK7hP4g6ESLtJUiccCeBiuFdKTZ9+P6Ylw=;
        b=ZxE69vLFPKpVukFtILZD5JloGGdE61IFfL39Fn5EEwtCHu5quUDfA1H0nRhHOLSiA6
         tX99IjEuT9N+jJUN07nOZjls6WuccrJPX7UqgbNpwSQs7SGbWr/XP3z2Ki6QOeZm/J0O
         wxfYoe9Yt2IXXKwei20/LPtqhn1f5YgOvgrHOhzezR7oGjhYIEnRVMYBozn5f1exvL+q
         pEoJLwlId+SUCnNxH5UfaiCYMVfdIuMcyaA14RKl3XXd4mxKxErxU1PI2EXmphq89PZh
         LxH+5cZdUWedclcWJbfoTG28gVkWsRfk8q2P1E2QUzPvcXU6Rt2RdPkAw/BA5fHl6yL5
         ecpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733247566; x=1733852366;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:sender
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=TM860e0YLiK7hP4g6ESLtJUiccCeBiuFdKTZ9+P6Ylw=;
        b=d7O7RVJ+Ugx7WaN79Apow7K122Y1qjW+cQwrSzWl+m3t9TJ7xSwHHTey8MJRpVLptF
         c8kES9V2L4WHhGs0039+nyN/D/WRIr+5gf4QGoVlqeOEbVLfA++2GY4NYNfQupm7y/E4
         RW0CI5IcoD+cL3wJ9cMPRyW5gZnfPVEWrI8vDS69ve+1FN/ZI6X6wzXCohobw6PiXsm2
         NaIqV3GikdUj/1kVEECnL/FtQLpjKIUAgG9KqB4kS1bzZznUpBPv1GTakPjTpmx/plJN
         ZFIyciOeD16a3bC8/R5kl0b/ptf5UxFwQSDU2JeVYGq3yPgHPjVoy37/l2orNPIHbRfU
         VYOA==
X-Forwarded-Encrypted: i=1; AJvYcCUlYoZ3p3QzUGRuYtA1GVmkAZkkggZ8J/+gv9rdw9wOVOBUZju/DXONtsiJm8X3A2YeoyW45uHqa5tgIw==@vger.kernel.org
X-Gm-Message-State: AOJu0YwrUdCdZigDvyHau27MrpO4slqLlT+F9wTXMsrY6Sx3fgsggaeC
	O7ZWJmsuyhLIpIWYSaYsmf0J8Z80Uvf22Giw8CxMENbAoowRW4cP
X-Gm-Gg: ASbGnctT++uANT29PgwBaUyyd//yTQaYZMp6qPG73cVbWc86+MCYxLacAUCJHE9HQU5
	qYRx4K0jSkdYog2o3UKf/hV8ApV8ojwZVphpwtW+BfA7yjIMxkfY9H4if1Km6AeWg7sUoHJYR9z
	NWLchGn+XwpxDuqNWQrWSWAcJ1I+9eZUIJ7CgL/LFGehIFd5MusiydQPd5TJ1jJ9VenNTucNjig
	T6pOnLEuVDAzF06KQYi6gechDvdlm30CasFfF9tzoUCeR3hjpcUh6ONmVznC1U=
X-Google-Smtp-Source: AGHT+IGsQzhu5R4XZOQZBC+mHcwfAVsoGbP/we5Bex7PUdxYkgQaNqeqgE75EMOpug5Q3A22vAq57g==
X-Received: by 2002:a17:903:2341:b0:215:810f:84db with SMTP id d9443c01a7336-215bd1242b5mr53182005ad.33.1733247566364;
        Tue, 03 Dec 2024 09:39:26 -0800 (PST)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-215898c3b7bsm44442655ad.173.2024.12.03.09.39.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Dec 2024 09:39:25 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Tue, 3 Dec 2024 09:39:24 -0800
From: Guenter Roeck <linux@roeck-us.net>
To: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@baylibre.com>
Cc: Jean Delvare <jdelvare@suse.com>, Zev Weiss <zev@bewilderbeest.net>,
	linux-hwmon@vger.kernel.org
Subject: Re: [PATCH] hwmon: (nct6775): Actually make use of the HWMON_NCT6775
 symbol namespace
Message-ID: <a303b784-c27a-490f-8b68-e9e145943c7b@roeck-us.net>
References: <20241203173149.1648456-2-u.kleine-koenig@baylibre.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20241203173149.1648456-2-u.kleine-koenig@baylibre.com>

On Tue, Dec 03, 2024 at 06:31:49PM +0100, Uwe Kleine-König wrote:
> DEFAULT_SYMBOL_NAMESPACE must already be defined when <linux/export.h>
> is included. So move the define above the include block.
> 
> Fixes: c3963bc0a0cf ("hwmon: (nct6775) Split core and platform driver")
> Signed-off-by: Uwe Kleine-König <u.kleine-koenig@baylibre.com>
> ---
> Hello,
> 
> this is based on current Linus Torvalds's master branch and depends on
> the topmost commit there.
> 

That API change is causing all kinds of trouble for me :-(.
Never mind, good catch. Applied.

Thanks,
Guenter
