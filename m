Received: from mail-pj2-f12.google.com (mail-pj2-f12.google.com [74.125.227.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 804BA3E6DCA
	for <linux-hwmon@vger.kernel.org>; Wed,  9 Sep 2026 20:29:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788985771; cv=none; b=Ik8O9cldpkVHs/LwK1lAHclKsZOZH+BsNtOub9P6KqJQXNnJcmCfjSOVBAJE2i/pXISIFw6zf5S0JNem7Q9vBXmp5kWmbKNeCvRjlFeDF2YldJhe+0LhFGd+kjeiNbBJ5XslDuQIuOWoYS14cpMUb+lzHwFTM+nBPJKcDwrYa/g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788985771; c=relaxed/simple;
	bh=z+0tLgyCRJJAjKpetPBYp4AGbyWgzkXH+IurDgPiS78=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PXXbx1RUsqhVmI/kWoQvcU6oB+61SkZWqANR6lF0fITh0pb/ytBS5X3CoSy/JX+np874FZPrJluYT28jGP3Jc7dz9PjOc9N9AD06kA9CNLNsVhYxMBZ2G2KbkJIReTN02Lq9fQ0rWhdzWWGMb7EtaXcxJ6x6YoqY8wlC1H8WV3Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Gf870PZ2; arc=none smtp.client-ip=74.125.227.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Gf870PZ2"
Received: by mail-pj2-f12.google.com with SMTP id d9443c01a7336-2d747ee1f38so14403275ad.2
        for <linux-hwmon@vger.kernel.org>; Wed, 09 Sep 2026 13:29:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788985764; x=1789590564; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=QQ2gcX78zM5THDHJgEgcjT08beP/iAweGRJTqOXZ9/c=;
        b=Gf870PZ22XfKELmiVeXwwnlhYzjqtlrQXqQ9wBwHKGb8IHRo+KZeHFTaQ7GMirOi9y
         jLzq9swursocWRRd373GQMFM3dR8C9QAQyCzxnKydvS/g2Ja+424sJOuRwJbl97+4ELz
         Q8tJPE6kQJvgmWWXJUGgrsBurIykQorLwCTcvgP5VtAEIMxE3Kj8tL5PZCupavsKt2mO
         q635xqibpof/pRz2ktIHUgojQFOchFTx9fmMCHpnUL+gUWh5+g2cDyR2zniaDW5YQnAZ
         DXNFQ7ArNgz8OIGkOgxnsrITdLBT7TMz/Hgl5D5e258iPZ+Sc/TMqAq7YG/QKwSdwbaM
         mtvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788985764; x=1789590564;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=QQ2gcX78zM5THDHJgEgcjT08beP/iAweGRJTqOXZ9/c=;
        b=qAf6RlqD6d+Mqd3AwCxOM7nIC2WNKBp7DmJD+RK8B+V1w12kKhVK9Yv3hPFcxRMeAx
         2YiTvqfbKATDfG+kCp1OuyK1jw3/6FECgYVJHUpJHqyw0AUm8nxj5ztoaEnVIPtJyjC7
         moOPxsbbWvvIOrOQ+pxEQMvQUg1r3EaI4LuzJCTVl1s3setxegX2G7DCh0sXu4xUG0n0
         1ixMSypIBankmjGSgjfGSXlyK3eLDDw7fZh5U6Ew2aQPhKOLn4cNr58BzF+wIMcvhjot
         SNpt9VDVMMnc04xFNtPh7N5tcFe28VQaTnC4L+ANu1Y9ktCFEIcLlD8M47sJOZtUeQKA
         OuNw==
X-Gm-Message-State: AFuF++kQ3CULlDzNMII1w8VYVLEkJBd/stD5Lafb58blQzpQ98+f9ibx
	NEIczEQ7a77WOkKEaz+vy6kHjLOjixLniOeMUd9GtYyHa/bzRffPmic5
X-Gm-Gg: AYBFou1V7at7aYk5qhRTqFaHaUMyaOEtOMTuK20aAOE2igtBIEHHdZz+9AjxEHh6zN2
	g2AaUsDRA/izplNy+ESMin7Ed9+Et9FAit3UREr4Pt4pOGiLLOyHYz88w25RnokKz2H4wlHL5Ij
	mf8qBbw5X3rIrk+GinILuZF1bdFvQ2GVKSRK8Cc1/dzR7u6WC7Nadr1pcERAiCFPDlU39BgVYRa
	FfVWE4oTuDuoRg+BeKez5OAgLcJHVebIeJXQL0cK3FT5gIZHnCgUtfoL/cY3zMIn+GGiq7fKL/1
	mJtSmBcIsAfODrWC++aZUbkwTdqNnaZ4UX5taDyqHN/ZXIbjsogYA5cowbL3p0C9JqyNciZn9Du
	GeJt3AJVgqm6iN7GCaUXu6wo/Z62BnSGfHn0mZ1FSJCx5yooC0M2CQnjBVU/cSRDfOozISN/8ZY
	VFn4Y8aS6mw8A0UJA1h72DN8AmpNgiMtbE5H0DS8D1v0PVgTSaubWE2vGFtk7dMeug+h2iFvukl
	dXEQOBhKq1vpNv1u+uTaJE=
X-Received: by 2002:a17:90b:17c2:b0:398:9be8:ea6a with SMTP id 98e67ed59e1d1-39bac4571cfmr10334634a91.23.1788985764524;
        Wed, 09 Sep 2026 13:29:24 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39d7740383asm1159237a91.7.2026.09.09.13.29.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Sep 2026 13:29:23 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Wed, 9 Sep 2026 13:29:23 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Zac Lanzon <lanzonza@gmail.com>
Cc: linux-hwmon@vger.kernel.org, Jean Delvare <jdelvare@suse.com>,
	Aleksa Savic <savicaleksa83@gmail.com>, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] hwmon: (asus_rog_ryujin) Add ROG Ryujin III 360
Message-ID: <7e2e3c81-ac92-44ad-ad9f-19add2879be6@roeck-us.net>
References: <20260903004054.502171-1-lanzonza@gmail.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260903004054.502171-1-lanzonza@gmail.com>

On Wed, Sep 02, 2026 at 08:40:54PM -0400, Zac Lanzon wrote:
> Add the USB product ID of the base ASUS ROG RYUJIN III 360 (0b05:1aa2,
> USB product string "ROG RYUJIN III"). It uses the same status report
> layout and cooler duty channel as the RYUJIN III EXTREME, EVA and
> WHITE editions, so it can share rog_ryujin_iii_info.
> 
> Tested on a ROG RYUJIN III 360: coolant temperature, pump speed and
> internal fan speed report plausible values that track load, and the
> internal fan follows pwm2 (30% -> 870 RPM, 40% -> 1590 RPM).
> 
> Assisted-by: Claude:claude-fable-5-1
> Signed-off-by: Zac Lanzon <lanzonza@gmail.com>

Applied.

Thanks,
Guenter
