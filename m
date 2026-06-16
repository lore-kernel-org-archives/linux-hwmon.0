Received: from mail-dy1-f173.google.com (mail-dy1-f173.google.com [74.125.82.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BCCF4480942
	for <linux-hwmon@vger.kernel.org>; Tue, 16 Jun 2026 23:00:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781650845; cv=none; b=u7StItzDH8WHfK1IGFAKoRY+aDBot+RGWg5qMzBVIRzqJdf3h/mIdR+xovKZ6LJZExjiMmIhp6MGxXO9XCapjVimMluPLehjOBctH6PKwalaTtA0cMH9SRVm4xrXKMquU8HtuuxrPkFG2AZ5uIyfLDab0+5doB1K+vQ57RN/dSk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781650845; c=relaxed/simple;
	bh=EsTNQNJ6xulISWSHukl4UhNepFpKtq8TEgj/Rg91wPA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GVAcTk/XZwnku2T93KtpW5hqZFMml2qihztgP7abzQsePgcEhImD/j+Rb7OcwCuFd0V0QDW9aGAhYyU2dA8KgkPqyy6yGBygy4YRJKCd5pTd7qAOYoE2jaGjbB05T14cjn/Tdp7pqshkLvkH0GfW49LcVQWjrDuEc9+nH3DzbQY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fOXv0Ej4; arc=none smtp.client-ip=74.125.82.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fOXv0Ej4"
Received: by mail-dy1-f173.google.com with SMTP id 5a478bee46e88-30bd47b9f0fso2407eec.0
        for <linux-hwmon@vger.kernel.org>; Tue, 16 Jun 2026 16:00:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781650843; x=1782255643; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+z1Aq8dxsHXzBCGPTidUDTNTbbBh2EFvHkYYccsTrRY=;
        b=fOXv0Ej4kwoMvjxPEGR79ieUnyK8x6m3kArIhWu6+N7AFygUnfB4D7xOJKv+drkvv/
         Ec6JYxuEcQ8HT0LRSb0kmcL4/8NeXKteNpbMZOGsu49E8PQKs7UC+zruYudTkYxls8uE
         HUKPs6ynqEXWesqPm/LZTSOisNdxLuOaENFXvwVWtx4+4U8F8FyaJiy/xklezJZL4njE
         whRupSN32ZCXjORdToWX6CMo8FO4fKZJDpMSSeFlp5lKBVpJQZa6/7sWdOBLf/65AqB4
         frcWbB4kvqKIQfnl0uleB2epg5qDnrqaeI8qoRhjQw46pPBJaGBk3Gfs3brZJJiUm99j
         WY5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781650843; x=1782255643;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=+z1Aq8dxsHXzBCGPTidUDTNTbbBh2EFvHkYYccsTrRY=;
        b=NbUBuaNrOoT/xUns3W5jHXsx5a1aTB4B7Q69MmkEGqmJKZLTwGqSQytjoUMVsztoxP
         DbjyNHWQUE3T8KnIZLBpXJ6XsiQylCZ6f5BqE3MAgvuXXBTbcCW6+Bu3u3f533WL8GF9
         kpAJAmfzrJHxZk0fMNhjb72+59eHwZOfIrZVCdPkYLzCLpkmU1/AZC1VD0McVz/EtCWx
         WgZPxe4KxLNkDnWL4ADOI4F4kpqvl3uS0kTy09xbNxCBdLGamy7hmARdyFUGGB43W9jL
         UHPgX79m97UKcKKHU4sowtgxuMRjh+DI82IvlU625m4a4RIBcsouU/vid9fpEPvUNhke
         YZbg==
X-Gm-Message-State: AOJu0YzChxk7NaX3+yUF6h7ngOwiYoePKPzsVZRFRijtkbGWjuxuxr+p
	1ZR9yjSdNi6dLlZAJ5CUoy543ZoSMBudTCKelYnsAxTTPRSzcKEXT/P+Kt7Pni6D
X-Gm-Gg: AfdE7cnumxJ6AuVaBe+UvCGlBZyrleY/wIKlg5W1WvHWYI8ROg5QDgxkXXmDdmULEB2
	Zk2BY0fPuz5YyjurN9KS5s0E8ADrqnMcQyUtPugl/ngsy92TVShkql4ohuffV/D7foSGyGj44nA
	3GZqBM+OpMt8rHJ77h5UG/7AxL3H7Z2aQQYJ0CxW552qf87om0DbdazmxNzmaGvFchOU/MC/je4
	FWWkh6qON6oYq4UlvfaG6SDpWaffigbpA1a+CE8NBbthhpmZ32RxomS0okjKAQbwKFIObF3fPte
	NXsrxQ8/UTU30t7n4DUMRZUCE+euvqd7KeA1W4l0Cbvw4Z699ETWl0W5hyFyf5vVoItexRDEEGk
	siUFOhKYvWylokjOFn71v+46Sq7ZEghxMBrSwF5/i4kb6RxtfRbPOlzqeYins9Eoxs9mbwmY4Bd
	emoPz1KJ3RwDHa8yW+aJq/hYOVKH8eN1q+M3Y4
X-Received: by 2002:a05:7301:7c0e:b0:303:f295:4db2 with SMTP id 5a478bee46e88-30bc91d96d0mr768837eec.0.1781650842776;
        Tue, 16 Jun 2026 16:00:42 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30bc7d77f90sm1329186eec.6.2026.06.16.16.00.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Jun 2026 16:00:42 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Tue, 16 Jun 2026 16:00:40 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Pengpeng Hou <pengpeng@iscas.ac.cn>
Cc: linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] hwmon: (w83627hf) remove VID sysfs files on error and
 remove
Message-ID: <811b9fd5-50ad-4630-9b78-6c6a8e0605ab@roeck-us.net>
References: <20260615064732.48113-1-pengpeng@iscas.ac.cn>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260615064732.48113-1-pengpeng@iscas.ac.cn>

On Mon, Jun 15, 2026 at 02:47:31PM +0800, Pengpeng Hou wrote:
> w83627hf_probe() creates cpu0_vid and vrm with device_create_file() when
> VID information is available.
> 
> The error path and remove callback only remove the common and optional
> attribute groups.  Those groups do not contain cpu0_vid or vrm, so the
> files can remain after a later probe failure or after device removal
> while their callbacks still expect live driver data.
> 
> Remove the standalone VID sysfs files from both the probe error path and
> the remove callback.
> 
> Signed-off-by: Pengpeng Hou <pengpeng@iscas.ac.cn>

Applied to hwmon-next.

Thanks,
Guenter
