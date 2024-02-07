Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5712C7C09D
	for <linux-hwmon@vger.kernel.org>; Wed,  7 Feb 2024 14:48:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707317338; cv=none; b=VQjX4MMNKbiEOwSmSfnIXgsfmLHi/J2qjmnTDMn2YZDgu9A3BHcksE3a/OJiKgNrqovBJoU73HRVDU6xqChQElldejGbE0o5TGQhs7QRkPqxvXN00TGHOt+xrsXFCajYV4ebzNZ+cj7CXWaCwVFj4AVFjfVZBRh78/4h9YAXQ/A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707317338; c=relaxed/simple;
	bh=HjEAJ9hB5pCJ9cFTPitLEx4F046WE7iJxZjLRrrvuE8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=uGRQXQE6hQkKOJa4xux4nvolVGpCygZdC05fLf0PMBd6Afgr1ZtL/NczbFxnd2lnmXOsg5hwB6QdzvmWJbeN6lu54apwL0AubUaTQ6m1v554KonLXLI6r+hyU5bkU/MOv0NPToyCg+H3nuo0eVIgjk/LUCxxNygmQy+N1NYzJIs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=SIg722Lx; arc=none smtp.client-ip=209.85.208.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="SIg722Lx"
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-55783b7b47aso979781a12.0
        for <linux-hwmon@vger.kernel.org>; Wed, 07 Feb 2024 06:48:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1707317334; x=1707922134; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=iO05JAWa48PuBrG3WAnJQnRQcJm3zZgrxOqvOSGlk5c=;
        b=SIg722LxR7dKjXL3wxg227Q5BLl7HhdWM37a6UBJ9hCGhB9Iwy2mUdjKRtR7EawEq0
         jB92GT4RRGfyrRfz4ikhdZDUrxcrVAtE7tqdxL+jcu4w0L17OgVgO347kdyTZKrBppkQ
         3vi8nYGVKuTGGYzAqj5LwRVBHNSN7gRJbEWG8HlM2/0YSKPqFrGyB5ewvIch8IQ+bd+l
         WU3hmW4PAwPDRGc4d4eaQK3doSgLTmayICmyPTHmV3Z+NZMBsWM76tgFlNPLr5wMsJi9
         Xdf5LWKvIJYH6FAbF49qtyKSuNCVBdMeXAgvR8Dg1eaTNWfgYrJ+YAfgDa2eWS7ausXt
         2Jww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707317334; x=1707922134;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iO05JAWa48PuBrG3WAnJQnRQcJm3zZgrxOqvOSGlk5c=;
        b=pFs4xt90VAdF51Sx7X9nGAPxszr550zPmjkJn13SPetC6Xbn70dp8O4U/4r4NAWIgq
         /sfr6GwhpcCkoRA1K1RPL1hwKSK8vXBiL6XVxiD+fyEh/VlmtsssuORZUAAHnekXbBq8
         DQ35ISVd4QGtYVKT7D740JGyh+mnA90f3mpQULDC9Rl1BySUM9UVllMWsQBIOeuOa3RI
         1HF55/R+Rs4jcqn+1hT/3NKX7uaYs/hc6WTX6fDNfnP9oF1ewG77ykTdpXC9Qhvili99
         KVroHp9BN+Jvo88VNE2F64ZThEfjg3LZEJffjcmk/wEsJBrt1TYVs4AsR1GQy8uhtcOV
         /fzA==
X-Gm-Message-State: AOJu0Yy0kLZhdWZkI4LluoAhq7i0qOZ8Tns/b5545evGPwdtgHZJCNFf
	jaAv+EXs60eQvGTguUNfjpL1VZhuonp0yvh/h/IqUuesRow7hm+cCBFiYL4K2l1hCDVF+FmEuCd
	C
X-Google-Smtp-Source: AGHT+IGy8p6jhobSFLfO/en9TSigEvjc4aHtOcv9WIOccoVdLybw5Y8LALGojEPpVTLV5wjAE5rO/Q==
X-Received: by 2002:a17:907:30c5:b0:a38:5cce:1bad with SMTP id vl5-20020a17090730c500b00a385cce1badmr2051961ejb.68.1707317334523;
        Wed, 07 Feb 2024 06:48:54 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUI9qZPcGrBH9bbMidgY+A355ZDpcj57004bm/8aZ8x+9wzjCwrGtXKiPnDhv0eZjaeDkMMYCbFovSsYNCT6BJZram1RYA3vOk=
Received: from localhost ([102.222.70.76])
        by smtp.gmail.com with ESMTPSA id w23-20020a17090633d700b00a3634a461f9sm822792eja.109.2024.02.07.06.48.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Feb 2024 06:48:54 -0800 (PST)
Date: Wed, 7 Feb 2024 17:48:50 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Javier Carrasco <javier.carrasco.cruz@gmail.com>
Cc: linux-hwmon@vger.kernel.org
Subject: Re: [bug report] hwmon: Add support for Amphenol ChipCap 2
Message-ID: <7eb0698e-e445-4f1f-aace-9136d6a049b5@moroto.mountain>
References: <c61a90ff-7f63-4181-96fd-ca5a5029386d@moroto.mountain>
 <0fda84bf-66f9-4edb-b282-388d47c2594c@gmail.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <0fda84bf-66f9-4edb-b282-388d47c2594c@gmail.com>

On Wed, Feb 07, 2024 at 03:38:43PM +0100, Javier Carrasco wrote:
> Hello again Dan,
> 
> On 07.02.24 10:51, Dan Carpenter wrote:
> > Hello Javier Carrasco,
> > 
> > The patch 33c41faa98f3: "hwmon: Add support for Amphenol ChipCap 2"
> > from Jan 30, 2024 (linux-next), leads to the following Smatch static
> > checker warning:
> > 
> > drivers/hwmon/chipcap2.c:327 cc2_get_reg_val() error: uninitialized symbol 'reg_val'.
> > drivers/hwmon/chipcap2.c:695 cc2_request_alarm_irqs() error: uninitialized symbol 'ret'.
> > 
> 
> may I ask you what Smatch configuration/arguments you used to find the
> first warning? I tried kchecker without arguments (with --sparse nothing
> was found), and only the second warning is reported:
> 
> ~/smatch/smatch_scripts/kchecker drivers/hwmon/chipcap2.c
> 
> CHECK   scripts/mod/empty.c
>   CALL    scripts/checksyscalls.sh
>   CC      drivers/hwmon/chipcap2.o
>   CHECK   drivers/hwmon/chipcap2.c
> drivers/hwmon/chipcap2.c:695 cc2_request_alarm_irqs() error:
> uninitialized symbol 'ret'.
> 
> I have checked out the current status of the master branch:
> 
> 7162b9ec99f71 double_fget: warn about re-using file descriptors
> 
> And of course, the first bug was not removed from the code.

The first warning requires the cross function database to work.  It's
a simple process but it takes probably 6 hours...

~/smatch/devel/smatch_scripts/build_kernel_data.sh

regards,
dan carpenter

