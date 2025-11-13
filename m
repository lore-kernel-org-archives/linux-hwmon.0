Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BDE3431986C
	for <linux-hwmon@vger.kernel.org>; Thu, 13 Nov 2025 20:34:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763066097; cv=none; b=nXxRiYC/uBt/wlfa1SHrgX6dIcTgg1QTDLY2HkKjKwD+ZFuxVv2UlsMhta5tcWHgctPLxd6zb7/+Ta8Aq5/7PL/eP68XfG/FGSUhmnpA9mDfZGamDNT6s9SMeqcKzR/2fylYImHHgLiGMYEViUL2d41C3V6DrYYFjorVeUI/+VM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763066097; c=relaxed/simple;
	bh=C/q4THcCj/cOEvDFvDH7hwwLTF56KyY2N8pDuj+NsXQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=U+G2o3B+ck/kLBjSugEmfBAAWr2BPcmOUYzb6UgvXWmcPRMLNBfSOOMWVc/UfdSprPLnfStXIaD9FqsSnfTgrp3wP/2Te18J7exMzllGuf0VSnQ/+46QgD0IJ4198AQPRqewEqyYvbtRDljX7sSM4xwyEJDUSC0j2L4w1/yulGA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kKdMevhV; arc=none smtp.client-ip=209.85.210.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kKdMevhV"
Received: by mail-pf1-f172.google.com with SMTP id d2e1a72fcca58-7a9fb6fccabso1014650b3a.0
        for <linux-hwmon@vger.kernel.org>; Thu, 13 Nov 2025 12:34:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763066095; x=1763670895; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=izWwtkfCgcwVG17e90l5CxJQX5H01BzSNgf7slZsgVY=;
        b=kKdMevhVzt7FC8kstoKQRYKaniMlQ5a9yEavjY3728vpI6YnjVD+E9ONHp1KG2ZV7z
         u66Pm84LHKPKNgPI24EuVv7ReKRXE5Uy9SkPYdCWvb4dgLuDnBB4C+ouoHwcVDsXe7VN
         /dXrTCY2zx8YH1XpZ5QUOabuniYR6EkqcVuSyBTD0rVo+A/rYlkDYn3yncL1/8HG8p6f
         Yi+V72pxNZwSINN7578Yth+dt9HSAwcg3X1XGA1t6qs6NsAYyPJc1xc9XxGtbvO4e91C
         1WntM4wUFrOZQaWDQW4c6wkoDgJ+T4+EZFVfW3yn5lu7kHlW86UNgZIgEhfqJ6s2ZgXC
         t6qQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763066095; x=1763670895;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=izWwtkfCgcwVG17e90l5CxJQX5H01BzSNgf7slZsgVY=;
        b=MMUnKLkOmUJsNnoK5b4aJMoQ/2dCLB68Tp6g3fvSfAp22Cr3ve/JVnKVvqMXF6itKh
         /SNqwStzGvPcxaZcKEQh0OeFos7CjFTFuPHAWJMYE/pm0vt+c8yNux/ZzG1ZXcrGBiCL
         H4sellhoyHXdhm0Ib/qvfGN99oLK48chX2W3bkxT2ktZS+4BblD3g0qf6aEXiUwn9fiN
         LRk7iKPgCRka67XwcLFuZ92r9hAxX+zj2useBPjgJ9GWjOsIyPMD4j2OGn8/nxzv28co
         jJxoB1fy4FZUaPQVWLzPYwB3nPDZPbQ14JPqNBfOsa44QuIMwmJs36tRj4BEy3709jV8
         GW8g==
X-Forwarded-Encrypted: i=1; AJvYcCXY9HqF5o19Ad2bm4tLOXdNNG8QSLYjYK8GV4oaUwKczCQt3f3heZvPoYF1t8/KMoN39RCV3O8yR5+zkA==@vger.kernel.org
X-Gm-Message-State: AOJu0YxMvvMvAPSqS0KCD2KAH8HQgBbZedLGQcrIwTXLdMtLHHf9Sb9E
	t5+9pDvK2q2g9Qw+sCBnK0FfohCrWVzQL+unznBZGI7TtbYvPjQgflal
X-Gm-Gg: ASbGncvGcMFYjl2XWWiytX6PYvo/hMLE56vRzVdsnNAkSD6heZrBKfDn6potmhCjARV
	iGJmaa04GTaVq2OEeyUG82hmPGICufKDFJcjEJAF9F1fk2a6qApc8LZXXpTSrIcB8Jo7U9ZnHAS
	CrQWwNxRkP0Uz6Wa8gGfIxWr66M1nQno2r4+XKiX2/aTIRmmokLKeu6Tx7uhzcQOYticaXKvbtk
	LGXyTvBA8SpgYOtcIMjMQCNvWbiv5ccVnKIunk2LGDi0ftfj0l5GrXds0PmCK0YaTW24+doZ0jh
	BX4doDyFEhnUKMVFKSdz4GXkWvfnNJrwM++0btEnHrZRdohrVvn1Xf64DoajlEF+65lAtBwlygN
	GT49RC7l86hFGVdmfQTkujvChX7cDcsQSrzrYIP7kO+s2fqZSNN/oAKUAI2CYsWKJOPXtWzKaOB
	gn2TyiSn2jYErP
X-Google-Smtp-Source: AGHT+IH/KuksxcV5TZ6+KZcifmdpRZGFqF2lYYaALmAodQZ95zFsFjg9dNuR+LaerTWyJv4euT+QqA==
X-Received: by 2002:a05:7022:6090:b0:119:e56b:98a9 with SMTP id a92af1059eb24-11b40f9bccbmr325525c88.16.1763066094885;
        Thu, 13 Nov 2025 12:34:54 -0800 (PST)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-11b060885eesm1436804c88.1.2025.11.13.12.34.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Nov 2025 12:34:54 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Thu, 13 Nov 2025 12:34:53 -0800
From: Guenter Roeck <linux@roeck-us.net>
To: Alexandr Sapozhnikov <alsp705@gmail.com>
Cc: Pali =?iso-8859-1?Q?Roh=E1r?= <pali@kernel.org>,
	Jean Delvare <jdelvare@suse.com>, linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] hwmon: (dell-smm) overflow check during multiplication
Message-ID: <bbbb4405-4b13-498a-a7c6-f15fee69903d@roeck-us.net>
References: <20251110152242.26-1-alsp705@gmail.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251110152242.26-1-alsp705@gmail.com>

On Mon, Nov 10, 2025 at 06:22:41PM +0300, Alexandr Sapozhnikov wrote:
> Added overflow checking when multiplying int by int and writing the result 
> to long to prevent data corruption due to overflow.
> 

So when / how would this ever overflow ? The nominal speed is guaranteed
to be <= 65,535, and the multiplier is either 1 or 30 or configured by a
module parameter. That means it must be set to an outrageous value on
purpose to trigger the overflow. This is not worth a runtime check.
Add a validation to the probe function instead, and refuse to load the
driver if the user specified an unreasonable value (such as anything
>= 65,536).

Thanks,
Guenter
