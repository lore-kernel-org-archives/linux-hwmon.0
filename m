Received: from mail-qt1-f174.google.com (mail-qt1-f174.google.com [209.85.160.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D25E36A011
	for <linux-hwmon@vger.kernel.org>; Thu, 29 Jan 2026 22:08:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.174
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769724497; cv=pass; b=kMJdr41kYCu1qUvfbsv9H2+TMKU0U9etBtib2sb5GOJ5Y4PJHk09WfoJcLgo8L+BWHPLlTehM7aFg6k/G6PaO02nqVSkBGyy181iZQPfGVCEb5OIShG/gDgg32XVcVo/XmHfT++sjVd0cedYuV7U9mJC0OEAjpbyig5NmWOuPII=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769724497; c=relaxed/simple;
	bh=QBU9yORRz70hrvVwskbJQIqVDQjeGD47kc0NHngLRNY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=fakfY0PAdWy4bj9+PvW3pyLu6M4kfGL8v+7HuBaEZug0zk9gKVW5PRnBg7N4rfKv2RyQYOxqCwCwHyk+EVL62nk0FXen/Zs+vS5CjV/z/i11thyqQ6EJXS8N/PfXYZrPg2J1x2ScCTFirMHuBrrwk9bDMDLLckiEtQCWgX6U9pk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TQpMx/xC; arc=pass smtp.client-ip=209.85.160.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TQpMx/xC"
Received: by mail-qt1-f174.google.com with SMTP id d75a77b69052e-5029901389dso11043671cf.2
        for <linux-hwmon@vger.kernel.org>; Thu, 29 Jan 2026 14:08:15 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1769724495; cv=none;
        d=google.com; s=arc-20240605;
        b=KOCh/vpPgnmeRYmIXUsdjxr/EDkuLbCeKvkyyQ58dLg1Px11RQJyX5FXArnVkII+Oq
         vCCM0lxjpJ6CWEc7tZjdUVwx6zzVw44MixIu1OxweMKpO1DhgiN8EiqGeNg6d1eHiWE3
         BnFhujbQfy8WfA+eFPT7lxf1XTv3H/Q5VdO0UXFuEdZ3Q4GN4ZKPJHFnvLtEAReufdLk
         mXWDLgX6MlAHuMRHOM/NoC3YxqDflq+NuaXNilSGykTLscZ7ozUqG4iaBE6WsS78tLtl
         bRUA4U+XYyYYlzOcGVykjgYt4XxqyhwiztVg5QV5dCRAMDuK7icS48jD0gOj8h2xqyPu
         WeJw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=QBU9yORRz70hrvVwskbJQIqVDQjeGD47kc0NHngLRNY=;
        fh=yoDSFCTQyDja5LQMYISNAueIvdUsM/BFiMkWyjk4+Zk=;
        b=E8qEZpnoIYjbaF5IOcnwUsB7QsKsXTrm89+3ttbnmZ4bQMO3Kk5bR32Q3EWbv6t3dz
         /lxBa9uFP0xI6y7ahj7zZ//7kEwjFGkn+3Goz+8WJlk1sUaf9JgFzA1NAPyEetuZQ/yC
         mQYSHBt9Ai3zESrZf/MyyYI09URkFH58ZoaQv+Z7F2oEtSyUNcSANkckH//M9iOUYjeO
         6PMEiTJsP8PtTKIYS0IbuXWR+zsgmi4obvnCxcbUQg1Kqx4jqZihvgeAbB0VfFsMaH6l
         bIsNA1W/o+R7ScD5SqNQiQAK4lvz3Ug4dc6kd0hZtDArXffa9hAvE07xgzMaZB7QgNtE
         s2WQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769724495; x=1770329295; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QBU9yORRz70hrvVwskbJQIqVDQjeGD47kc0NHngLRNY=;
        b=TQpMx/xC2zgxe40ebM3DVIZAzI2xUB8j5pFiyZwIS976c/FC7wadkKJMQLO+dX+zOU
         9dV3p3pgtFITxGr2XsRH9GEXYsDxG6RCJ8RlUXy/LLfIx4R5pxUqmw4Vn+wMbYIV0lL7
         TZQydlVf6cvz/SjasjEMgsBvLpk6Vxx4Zq8EO6eV5MXeOzLMsUALav0mlIIJEUwCpqyW
         WwLegoplcFAsVeM+hKoCtsO5vgGSOZ/9WU+tYlCtxZwsowGtrlt/cvHfmkPooYLvoQky
         g9XBdhYP8PCAVRveW4ixM+WiMqPDCt9NThfYW73uW5hFZh1yidor4mR36mNBXCnaa9KB
         YjJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769724495; x=1770329295;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=QBU9yORRz70hrvVwskbJQIqVDQjeGD47kc0NHngLRNY=;
        b=nRRUBP9BwyWrFDR3FgwbvEOHmZ8L3b4XodJ2Lp2d715P7if+xFQV3Zzb+8qZPUs5MM
         u5F6SeiuRpsTkOB5ojQ6WJpChV8huSlrqLwoMnp1HuAyzMbk2wam+2MTCJ4vrb7O/59q
         Qy7QwPLxRLbLs6oAEXv6mLHj3loDHw7Zos01TccPybcRvM3QKGehimtzjBaIdDgxpQl8
         H7w8wSs9FRU/iweHtwcSLjWYCZWi/BEXIUzJUl16YOe29oHI1J+VPId1AOYVZzeW1E7x
         mSGQ9d8nUqxQ1C0WEBkPT0C+jTR/Qeiy/O9MTeVpZXH9PR6xzrYlw6mTwLJroTi+NKzN
         4eEg==
X-Forwarded-Encrypted: i=1; AJvYcCUW5EK/kyMw7Tpu7KSxvJgIDltluqrPWhp+GbBCreKCbKQ90MdfXROVuaznIC201VLdP2iP10ylqwUGLQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YwVb7gFvJzuoaZdDymgwvhGR+vSF3YyJ+CwAS+ryU4D6FdGxEMb
	uwySlYNxGv7dMeSrVQKMD9ZubE8of02piMObw/scsZaEn95RR2GD/2aSjv8PzZ212CzwOfLO+Tf
	4fQBdkGXpuroN7iDyhEgX0hRmxSjSKbA=
X-Gm-Gg: AZuq6aIgfjUCmOVcPFyK7NfH0k3JaiB8WJ77Jum2T+IJ7fQyFppRzwq24NzDIqq9RTT
	vCcOId5mPf31lNujydaRMvDZ1QLaMKzcJDF+9gcTsMaSAJUxx06ZkoeQSwZlm+++Pk0TlewTOk0
	iyacUBT/k4iaW1rYMIe8ll/+f922MWAlQIpdCYQvcy4pUaZH9BO9EzEEHy8Zzz8dcu2d6Vbgc0M
	NF5j9iHz9Af889mTVA//tPYeYbmjAuVL+njCYRLxZxPT8aP4mGGeQzbTjYl1WpWtnfXtiomDT+F
	TiomNcPkjsp+YFb2sh8BEO83zVs9IvohltHt8fCIviy2l+hZ8fk/0SBY/nzEy9ZbDdkcour3fqE
	/3ap5b5TQTG4W2VLt7N4fG5rbZqXp1Jg27+E=
X-Received: by 2002:ac8:5f94:0:b0:4ed:67ea:1e5d with SMTP id
 d75a77b69052e-505d2262d40mr11673491cf.53.1769724495023; Thu, 29 Jan 2026
 14:08:15 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260119195817.GA1035354@ax162> <010a8554-6413-42ff-8d73-1811dffbb5dd@roeck-us.net>
 <56e7dcd2-2d09-439c-b8b6-82c2a1bd9c5d@roeck-us.net>
In-Reply-To: <56e7dcd2-2d09-439c-b8b6-82c2a1bd9c5d@roeck-us.net>
From: James Calligeros <jcalligeros99@gmail.com>
Date: Fri, 30 Jan 2026 08:08:04 +1000
X-Gm-Features: AZwV_QgxO67azIshucQeQd4QcXffKxnNSCmT2SZkxvrTw3PDTtWTVIBurrRwfAE
Message-ID: <CAHgNfTynZHNt3=JY82-WPR1b_1JyoJ=hnazcPwJtSStOZsA1=g@mail.gmail.com>
Subject: Re: FIELD_PREP failure in drivers/hwmon/macsmc-hwmon.c
To: Guenter Roeck <linux@roeck-us.net>
Cc: Nathan Chancellor <nathan@kernel.org>, Sven Peter <sven@kernel.org>, Janne Grunau <j@jannau.net>, 
	asahi@lists.linux.dev, linux-hwmon@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Justin Stitt <justinstitt@google.com>, 
	Neal Gompa <neal@gompa.dev>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi all,

On Fri, Jan 30, 2026 at 4:26=E2=80=AFAM Guenter Roeck <linux@roeck-us.net> =
wrote:
>
> I didn't get any response, so I submitted two patches which should
> fix at least some of the problems with the driver.

Apologies for getting to this last week. I have been both out of town for w=
ork
and extremely unwell for most of this month. Thank you for taking a look.

> Guenter
James
