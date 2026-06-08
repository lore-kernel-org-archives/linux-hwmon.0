Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38BD03B5301
	for <linux-hwmon@vger.kernel.org>; Mon,  8 Jun 2026 09:15:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780910125; cv=none; b=i9BUk52U7rXj01Ko/M73qHP4L3T2Qy4aiEW9uJygT5/Fux8yRzY/CswRCTwyAU2glrRBlkscZG9waOFdNsMlrSFYOZBoV7W9tDvaxk2JhoCzWfTQNYF8pu7vVXjRQt5LDDWVLGtExpjTVL1aBBSLN2tREG7zOEzCDHfw+UN2GnY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780910125; c=relaxed/simple;
	bh=PQPtr/F9hO6/I6mTU1ywFkGCSpt1Lnp306XapzddxT4=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=dQabb/C186vOA4QlKE1VRYSsB6OQ7eQy84kavupdwgOGqkIDet+5AI9pnb6B9M6mrTTmDb7N35cr4yGVxpxZ9kgmzGv64uACn0rUAizgbt8MFJjciBGzh4gh35zCV1dJYqY4tL8rOUE9lMZ3+Bm4xavX0pecU9OjncUak+1LEFA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=E7z1IXbs; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="E7z1IXbs"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-490cdae130cso4572675e9.0
        for <linux-hwmon@vger.kernel.org>; Mon, 08 Jun 2026 02:15:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780910120; x=1781514920; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=U/IcbORDjKCGe6yNqeYpsStVUoKVADxbytljxxUkaAk=;
        b=E7z1IXbsV/5vGkGeL3Pu/XBH6AeKgdVvP9WX3SZlrQSL/LnDE/XNVR1cbXd5sjqFyS
         U5KlGL+Z3NKnCt+C8kRLTcllz7as4a+iqj/yBR89nkoOrEEccEO8v2xUGswufy4vXCKH
         hU7mjsmVuBSKLFxWZURU3Y5/TqzH5Mesi9qGdFurb1ZlCMft/LgOJaZwVQajjKnZGSwd
         mflA7LN51q4r3WybCbRQz8DjF70xnjrk0kUwtpL7T14CwGjzwxO18qk1GIo8POfw9sq5
         KIldkV4pN5k1rMFJarYuWx6euyE5Tis+ClR3UDdjDwv60UobfzquMNIQx4fqRdTUlVo6
         dlXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780910120; x=1781514920;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=U/IcbORDjKCGe6yNqeYpsStVUoKVADxbytljxxUkaAk=;
        b=B8eu46fkPIXn6VSLFFm+yGI6mIsAtj6PZaJDZN/zveFRN8kAzXdJDhXhyy9EI9Pzl4
         363kuQiX9JVA0kDWPv0ddwLVdQ2tDu0jVRf7Zwr8yo5ph9bc2cO3qSS/gNd8wFfK/wWo
         4VJ6OB2J5mmOmo/KSR+C3fSH6qsYufnwtsuoEZfvK2Va/o7gjj7BZDdQjCkmqHsi0Ed3
         cE0mUId1+c5wK+C6wHcQRtYpqaJFxUcYsmepLgljJqejwU1xCRjNw4Ysz4Ifp7ZU+Mlu
         XOELnTBEisLcSNPo9hRQ/oKB/VkgGj33VfNjwSB+K4TPxQY0z+UcR8vBh/gMdUoo5+Qx
         V83A==
X-Forwarded-Encrypted: i=1; AFNElJ94vxuLEqnVpz3+A1kgJYVQwYNTyeoW4z/uBLDXglIx9CF3FKyGwHtN9SpBqj/MDBU7VCVLhee0i96LFQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz4yhMI+xF2Ae0dLiePX51xdMkRkz16WLO+tQRxjQSG8Tgc6BwH
	0RGcTnljMdKtIeIzzFbLeh6gftBBtScAg1OdW/cRm/uUEKZxFuMRZUaJ
X-Gm-Gg: Acq92OEizXKt36X4YjYlFMBNPMza0lYtHuELqkArtlqv0pdseqtdWmENiDyZSAbskOC
	FPRun60vAVbBT2yt0h3qw9DAvk5+nDSmZ0vnEBnvjYkt202ZqyR4kXg0Pl5DzIEUN7MwKZBE51E
	QD2fU4x57Mtt7WZSfI7/Tc+6Ho95BeRH7pt5ZquA9U5xlWKD/xAPxoDp2EGzzGwNPYZZJwG+BM1
	APiSuaUdab1lFROpC/cV33/nWX9qItuIqQIpUDUvpPnn/zeYk6FsidxqZTcq64zMe8T44jAJKm5
	y1B/+WgeePXP9UmBvxmbk+t467j9hjW+HoKgkea4sSI4fIVK7MzWXt0FjHeR38zikwJQTh91u+k
	2QSaoijYG8y9yd88qdVlvuuIzB4rhmbc6CEd6aYQRF/Os105QE+23ChkXeDpuJdcuqnlCb+G1JX
	scpETATK+wI82erOW8TrhNI0lFzXlVYDs06xclR6uFne/VQ33rDGsxGsuW1JPh8F/1/E4SeSM=
X-Received: by 2002:a05:600c:1c1f:b0:490:b724:dbd6 with SMTP id 5b1f17b1804b1-490c2598382mr239116935e9.6.1780910120310;
        Mon, 08 Jun 2026 02:15:20 -0700 (PDT)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-490bc40716bsm396980915e9.12.2026.06.08.02.15.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Jun 2026 02:15:20 -0700 (PDT)
Date: Mon, 8 Jun 2026 10:15:18 +0100
From: David Laight <david.laight.linux@gmail.com>
To: Nikita Zhandarovich <n.zhandarovich@fintech.ru>
Cc: Jean Delvare <jdelvare@suse.com>, Guenter Roeck <linux@roeck-us.net>,
 <linux-hwmon@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <lvc-project@linuxtesting.org>
Subject: Re: [PATCH v2] hwmon: it87: Clamp negative values to zero in
 set_fan()
Message-ID: <20260608101518.3c58080c@pumpkin>
In-Reply-To: <20260529141839.1639287-1-n.zhandarovich@fintech.ru>
References: <20260529141839.1639287-1-n.zhandarovich@fintech.ru>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Fri, 29 May 2026 17:18:36 +0300
Nikita Zhandarovich <n.zhandarovich@fintech.ru> wrote:

> set_fan() parses user input with kstrtol() and passes the resulting
> value to FAN16_TO_REG() on chips with 16-bit fan support.
> 
> Negative fan speeds are not meaningful and should be rejected before
> conversion. Worst scenario, one may be able to abuse undefined
> behaviour of signed overflow to possibly induce rpm * 2 == 0 in
> FAN16_TO_REG(), thus causing a division by zero.

Wouldn't it be better to fix the bounds checks in FAN16_TO_REG()
and FAN_TO_REG()?
Both already treat 0 as special.

Oh - and just use clamp() not clamp_val().

-- David

> 
> Instead, clamp val < 0 to zero and keep the conversion in its valid
> input domain, avoiding unsafe arithmetic in the register conversion
> path.
> 
> Found by Linux Verification Center (linuxtesting.org) with static
> analysis tool SVACE.
> 
> Fixes: 17d648bf5786 ("it87: Add support for the IT8716F")
> Signed-off-by: Nikita Zhandarovich <n.zhandarovich@fintech.ru>
> ---
> v2: as pointed out by sashiko-bot, returning with -EINVAL
> goes against hwmon guidelines - therefore, just clamp the lower
> bound and keep going. Commit description is adjusted accordingly,
> as is the subject text.
> 
> v1: https://lore.kernel.org/all/20260529121141.1633588-1-n.zhandarovich@fintech.ru/
> Sashiko AI review: https://lore.kernel.org/all/20260529125335.A47011F00893@smtp.kernel.org/
> 
> P.S. I've deliberately NOT addressed the pre-existing issues highlighted
> by sashiko - that's for another time, I think.
> 
>  drivers/hwmon/it87.c | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/drivers/hwmon/it87.c b/drivers/hwmon/it87.c
> index 5fd310662ee4..87edb1b6048b 100644
> --- a/drivers/hwmon/it87.c
> +++ b/drivers/hwmon/it87.c
> @@ -1412,6 +1412,9 @@ static ssize_t set_fan(struct device *dev, struct device_attribute *attr,
>  	if (kstrtol(buf, 10, &val) < 0)
>  		return -EINVAL;
>  
> +	if (val < 0)
> +		val = 0;
> +
>  	err = it87_lock(data);
>  	if (err)
>  		return err;
> 

