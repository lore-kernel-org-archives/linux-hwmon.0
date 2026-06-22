Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82AAB363C6C
	for <linux-hwmon@vger.kernel.org>; Mon, 22 Jun 2026 09:07:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782119236; cv=none; b=G3kxQmKEsatk6G7qDdEZvjrWVL//rwNdVsfdxFoO5G4nFWWFZaoaGtujd18Lxp7LkURJA189PpKaXmHt0nNXriJVhtSm+4DING105scyDzJBECJkODwo9yff1/v3lCJsm13NH+v+OBh35+qwXuIwm9yarcZ1NHeCz3Lq19E8N/M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782119236; c=relaxed/simple;
	bh=NpHNaiRLNtNCkc5SPlHVRmlp8TrcZRVYKVSRt1U6y6g=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jx84pb+cRqzB5dk70x3f4XSgDw6plzgBlE8yD9Ziwuxaez5glwkWlI4kezZ95Xd9+EJXIWHeOUX96grdIRC7W+rur4dJFAvYT8sWLCy63YD1YFmJvPEDrDPbLyOzD7EH9V1rT3qH1bhOZESnBfLbBLg7s8nBmKPjWOuedGpw06A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HkdPnwvD; arc=none smtp.client-ip=209.85.221.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HkdPnwvD"
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-4631679f204so2488264f8f.0
        for <linux-hwmon@vger.kernel.org>; Mon, 22 Jun 2026 02:07:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782119234; x=1782724034; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=WpKYeM7Sadyd/Iym5bxCNYMlAD0KCXoNph0pgG1QDwo=;
        b=HkdPnwvDJZFGNzMRPznXSkttAGgMUlaDL9A0LNLfdqKw4OkgyrICrQtOKpJpJaU/NK
         pAGtBQ5bpWHuKmzAZxSNM5GHwAO9+v1FcrAFCsW3MOQ9FHWrNQtpHJMnbp6CpzP51XbA
         uMb73Lag3mTWEG2lpULUd01G5gmpKato2GU0JT8424lhvimi10n3uy84Ef7zAUgw1s+w
         ACZYR0eqUqzs2WHN6IsyicqO7ja3Tuk95CRyT54mP038LDiyGTNdY/ETlWHtmnb5q/DU
         F+w/nILLP77JsFI4gI5h/WRa9Y4ihqqHFavhcEtNaYJinDfHqUti/f7zCwiYOrlL933n
         WKQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782119234; x=1782724034;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=WpKYeM7Sadyd/Iym5bxCNYMlAD0KCXoNph0pgG1QDwo=;
        b=oFQnLf11tVDBAI4UJcp/31igMB8Qr4dTijhJ9p1nWX2P1OtC32N6zKwNqOhPCdqpz6
         w+p65Z2CafMZQgeto0U77fOmSAN6Z3cazU0xeSZoYDN9hbxezusMVGGW8T8Hrfkt4V34
         nVRepyD/t1TN1CZCElYzlLlaojJT22kT8qQ/PvYmS3tp54BSSbq3XcrcCE5KS3jxGsJO
         S2llRkCfQkXudjnHvXyd5xbWINFfFMQgKaE+XugqzuwR9xk6Kl1BDxafiK3KN+WUqEBw
         KPWSEec1T/xq8zC0Gpy3F57crncnLafp7JaIMShOVSEo5mRsgU7EgiL6Qeunpp+QQTPW
         JXpg==
X-Forwarded-Encrypted: i=1; AHgh+RqlrZag9RuiNvBPgMXByuMD5xiVIQS3wKBtqMmKH7jJiAq3qysXEw6so/nWME7fB7bCnXtdJcDTiGquqg==@vger.kernel.org
X-Gm-Message-State: AOJu0YxepRmiYcgLTd9UCg1Xtfs0cCypAK+PtM2Lv2k+dI6b31SXe41y
	nYgf9X4HQ+DRU9JlYjTE4UxopU2PfHVSsSlRcftaPaKpUJfFhx5JryMS
X-Gm-Gg: AfdE7cn6ckqNJPW0cU8RxIwE204X6/9GBWooes6WRel4VNK2++tE9XzsnmdL256IfE0
	Ey0dH90GuUdqqdf006ERTzpBWeYAW8G/nYK8gShYvvuzv3EYEW5NSShEGfmw+DWe8p+z7oa2zW6
	5rqyhXSYpXiWuQDrF1nqcC20/LhSeB490A8UibaedD6dV8c2XBJr0cZrYv0P3kqLGGTYCa1+euS
	T/QrCMnbfykQmkgQfmIy1zPVP432hHUuXD5i7Jt2Wgt7VkG8tfR8UF84sRtLmvZEIjbRoGBc/L7
	YWPszoHlEliBoeN4wiajKCSiL5J4XfeT62RqT9V4DEailf73QO4tnuTrEIuXP6nG2c/fzd9lcqX
	dxbjVEEtmXFTYWs7rtQWsdMDK7Fp9aJwIf1VtipHIsrPFKUg7rYN0tamCp4AqEsCZkZ9ZoSXE/K
	j90qXi
X-Received: by 2002:a5d:5f47:0:b0:464:fff6:489a with SMTP id ffacd0b85a97d-4651bf5b6f2mr18829588f8f.6.1782119233555;
        Mon, 22 Jun 2026 02:07:13 -0700 (PDT)
Received: from nsa ([148.63.225.166])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4666678828dsm24176331f8f.19.2026.06.22.02.07.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Jun 2026 02:07:13 -0700 (PDT)
Date: Mon, 22 Jun 2026 10:08:16 +0100
From: Nuno =?utf-8?B?U8Oh?= <noname.nuno@gmail.com>
To: Randy Dunlap <rdunlap@infradead.org>
Cc: linux-doc@vger.kernel.org, Nuno =?utf-8?B?U8Oh?= <nuno.sa@analog.com>, 
	Guenter Roeck <linux@roeck-us.net>, linux-hwmon@vger.kernel.org
Subject: Re: [PATCH] hwmon: ltc4283: fix malformed table docs build error
Message-ID: <ajj7aada43285zDR@nsa>
References: <20260620011833.3568693-1-rdunlap@infradead.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260620011833.3568693-1-rdunlap@infradead.org>

On Fri, Jun 19, 2026 at 06:18:30PM -0700, Randy Dunlap wrote:
> Expand the table borders (upper & lower) to prevent a documentation
> build error:
> 
> Documentation/hwmon/ltc4283.rst:261: ERROR: Malformed table.
> Text in column margin in table line 3.
> =======================         ==========================================
> power1_failed_fault_log         Set to 1 by a power1 fault occurring.
> power1_good_input_fault_log     Set to 1 by a power1 good input fault occurring at PGIO3.
> 
> Fixes: dd63353a0b5e ("hwmon: ltc4283: Add support for the LTC4283 Swap Controller")
> Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
> ---

Thanks!

Reviewed-by: Nuno Sá <nuno.sa@analog.com>

> Cc: Nuno Sá <nuno.sa@analog.com>
> Cc: Guenter Roeck <linux@roeck-us.net>
> Cc: linux-hwmon@vger.kernel.org
> 
>  Documentation/hwmon/ltc4283.rst |    4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> --- linux-next-20260619.orig/Documentation/hwmon/ltc4283.rst
> +++ linux-next-20260619/Documentation/hwmon/ltc4283.rst
> @@ -256,7 +256,7 @@ these logs can be cleared by writing in
>  ``/sys/kernel/debug/i2c/i2c-[X]/[X]-addr/``
>  contains the following attributes:
>  
> -=======================		==========================================
> +==============================  ==========================================================
>  power1_failed_fault_log		Set to 1 by a power1 fault occurring.
>  power1_good_input_fault_log	Set to 1 by a power1 good input fault occurring at PGIO3.
>  in11_fet_short_fault_log	Set to 1 when a FET-short fault occurs.
> @@ -264,4 +264,4 @@ in11_fet_bad_fault_log		Set to 1 when a
>  in0_lcrit_fault_log		Set to 1 by a VIN undervoltage fault occurring.
>  in0_crit_fault_log		Set to 1 by a VIN overvoltage fault occurring.
>  curr1_crit_fault_log		Set to 1 by an overcurrent fault occurring.
> -======================= 	==========================================
> +==============================  ==========================================================
