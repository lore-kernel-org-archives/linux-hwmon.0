Received: from mail-dy1-f178.google.com (mail-dy1-f178.google.com [74.125.82.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6105330656
	for <linux-hwmon@vger.kernel.org>; Fri, 20 Feb 2026 14:49:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771598985; cv=none; b=ed1ybfvfaQaT+oHkWK2vVvcp78DK32kdTwk0lAHM77UaV+GRxjtQVRVV5jjGd7bv5WDpt/Ruv2nkwGzH8KLYg83bUe2iZZJZcSUnLVfNKgS5kUFS6N0+clekBlDMYwDbZLvFQaJ+yNT2UR1PchYr6f/ED1yAUU4zzwNVB2mYP0o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771598985; c=relaxed/simple;
	bh=jj6uJqAcAXdCpmcxOJYN0K8NpKv/inusoEu4giTBmDY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YDXdsrHEF4ly6nZLsFaxDSCZ35p+GbK5e9fo7yozERshYk2CwZxyNIKFB5OM9Ga/wtLGKwfI/+f0whY6YK4fWAP6H4LGsfqtc8BW6u/mDYYOYA5N9NV1Q2cUMUKMfeM6rNGwXaIbVzil8P5oXCGEAFZqTzs8GTBW3jZyOuSon3U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=h/4XgAPr; arc=none smtp.client-ip=74.125.82.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="h/4XgAPr"
Received: by mail-dy1-f178.google.com with SMTP id 5a478bee46e88-2baa6ec5638so1001340eec.0
        for <linux-hwmon@vger.kernel.org>; Fri, 20 Feb 2026 06:49:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771598984; x=1772203784; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RkGJI3clYxjZSfmR9ZzEQDqXGVlybnHQnZkENd5c2QY=;
        b=h/4XgAPruawUoEZxjmbKIoBZrkdwOcG0v95oM4M3stYUm8C/xYdQChi52tdDH28yQQ
         Ck7f02Rf0hYhet7Yk9jUynnSFTzF0J92Zpln9UmzhtZxP3BUqE99mnwJkAndIhac6J59
         2OCQjSZfn0wvGzv1hNby/UpDEyKPYlaO4nH4yKuRW2AYFw93HiL4tTKxTaJQAo97nrq1
         Smaz5QZQNVaF0mL45CZPMJtT8SQxr3MzT/BqU0R8IyGWkVgEXci0Rzo3FHuxxPrszziE
         uDBDtmb72q08hFcdQTq+GFE57SmWi98sdYMCjSsV1IndL+a8tTG6F//SvulBmTIMvW6O
         r/JQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771598984; x=1772203784;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=RkGJI3clYxjZSfmR9ZzEQDqXGVlybnHQnZkENd5c2QY=;
        b=suUTinqwPDGgI6RixkfK5oOae0C5st5m+Hpx6N4rMNxFGorc6wupPvvVAT/cCmC5By
         4LxWyf+Z2wqXRIvwWj3stdC26NlbdFKbSeHbgWMAM37FLpz8BSCC3PExlcyuzyjkO4j7
         9SlHJ4sNbvZN6MvtbzTRF8FIpjeDctHsCEzjyB98pXt0opLOjb24YIaDP5u3TicAnMD9
         HtYXTPxW1MLW9ut1OfwFnMYCDyIO9sWYnd9JvAGN7YrdBF8fTDfS/0cS2lU4ydwN9+ZR
         PGq8FUdQqL+5kwxCsA3xUQJMxgjQyTlrm5Pe1hhDAG05dhW0R5dZZBgLwLeT44E8pU5J
         f9lA==
X-Gm-Message-State: AOJu0YxQLmnJCRgd9rlPpZoi9/xXOO6VIBI5/uUj97iZDiQF+LpJy3bT
	UIEuNBZkHA9eVSHranP0xOaj4+mZCABD3cZSpHoRWKbud2qdHj/bScAL
X-Gm-Gg: AZuq6aL9r48fUjNGYb4x+e2Rx4bB5LvTPT+AFIphsWD/3IZKaj0FJfMV+6masaln+AG
	Z5+oSojiWEBlwrhgokKAY/7Pl6ws0u4yqzp2OmaH3+p8Jlh8LNIYkqSnhIFketdgk4OUjPdrI4B
	UZMNLdJhEwdovyHf+ACvA+Y7JiFngjPs1zLYYsm+aBEPe9eBLB4w9ijoG00Hfzsxs0IaG5ARtW0
	wiOWF3fpd91whIfmRzTZV0ScghFR9nuUmNy4C/Nc0k3VrUJ+AGRqErYCBxnmAumE1WxLGBOOArt
	nr42V3w2BACx1jRrQdgNosrlBXtjp9tWlinMPqcGdkPmlK6Ud8F1lf9ZlHVli9YEd8eN35a6c1C
	oMkb08LwVmG1yznDrtmGzTNqT/PanZxLPeO8dsfK9Unh71Wn7a7HfA9aQedp6oUMEH6nSQNCCj6
	ga72Bsfas9rP8JO7O77MYocfiMHq4lYEbPEC4M
X-Received: by 2002:a05:7300:dc04:b0:2b7:bc31:11ff with SMTP id 5a478bee46e88-2bd72e43e13mr744294eec.8.1771598983758;
        Fri, 20 Feb 2026 06:49:43 -0800 (PST)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2bacb66bb08sm23507287eec.26.2026.02.20.06.49.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Feb 2026 06:49:43 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Fri, 20 Feb 2026 06:49:41 -0800
From: Guenter Roeck <linux@roeck-us.net>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>
Subject: Re: [PATCH v1 1/1] hwmon (bt1-pvt) Remove not-going-to-be-supported
 code for Baikal SoC
Message-ID: <33af2428-38de-4589-8f62-0ab05b0522d3@roeck-us.net>
References: <20260220143500.2401057-1-andriy.shevchenko@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260220143500.2401057-1-andriy.shevchenko@linux.intel.com>

On Fri, Feb 20, 2026 at 03:35:00PM +0100, Andy Shevchenko wrote:
> As noticed in the discussion [1] the Baikal SoC and platforms
> are not going to be finalized, hence remove stale code.
> 
> Link: https://lore.kernel.org/lkml/22b92ddf-6321-41b5-8073-f9c7064d3432@infradead.org/ [1]
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

Applied.

Guenter
