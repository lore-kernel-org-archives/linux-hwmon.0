Received: from mail-pg1-f170.google.com (mail-pg1-f170.google.com [209.85.215.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB4B22EFDBA
	for <linux-hwmon@vger.kernel.org>; Sun, 12 Oct 2025 18:13:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760292792; cv=none; b=nKr/goGB+9Ut2FPXKKCZx646Qjl1xTeJMcBeLqNNhHBkcDBVFYoQ8w4zqZcgzXy6AHr84hURroahALIqGP8Z0CCqH0gr1QLxmXSG1rXhgmHD0z4MuQsNjZS4ju+NFymLrOBT7+mitChdsUp9LFpJbh6S8VjwuY8DE/A2/nfm8Xc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760292792; c=relaxed/simple;
	bh=q/N/f6HmcB2jX7e4IXefTOYn73Ai6P8q2POflYDeu5k=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MgFzfPYehxbY5EmHOFr5VyBJ+mDqDXVhL95h1PgTM1W7wQ90Kq9AJ3M6o06tcoNI5hX4i4xd54xXAdGq/mSVAJVt8oEknd8JKjFlYJMKIptNpurMum3JcxsaH5OLomeQISZ43NamCkDOpbAQir4NY7VH5prBTlxO2ExYC5ZqqrQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=M0XHL0p6; arc=none smtp.client-ip=209.85.215.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="M0XHL0p6"
Received: by mail-pg1-f170.google.com with SMTP id 41be03b00d2f7-b57bf560703so2266695a12.2
        for <linux-hwmon@vger.kernel.org>; Sun, 12 Oct 2025 11:13:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760292790; x=1760897590; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Ovw0jKQ6NyztYytq053H+NNFHTumfR3yxd0tQVKwQ8U=;
        b=M0XHL0p6iGHN7/377DueXqSoNCJv6t2+R5201ofHPTlcuazijIKySbd4MHNm6r7+DU
         hy9vTPdhiLf5l5rBlVcDh5U7tWJKdjmgfiWY3MegXkqG/Xojz9M6jGWcHCnAJJop9D6q
         zGvzmXN3wIKv3m82aNfu36bVt2vc5Q054f2XZ3CTuS4/ImjXVeCFMIt7DfXqjUo/Q31e
         e/V1M1l1vmq2uEbr3i04v6Pr7sLlgG/K6PKQmyaRitlrkljCjxVR0ZtXHa4d0gw2VcPF
         oeCQgKC98ix0+EvkMdYxbWHPQ0wIe5qEX8XN33VZ6/z6A4esCku4JMjhg1UeqM4owUXu
         uUJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760292790; x=1760897590;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Ovw0jKQ6NyztYytq053H+NNFHTumfR3yxd0tQVKwQ8U=;
        b=CHhOJrfQIdV5Vf20HACaotGCG7TogydBtPJCKKJNlWOSxZXbZP/seQpyTyh5+VdFOD
         XxA+NZMc5DgDgpREg2RCWT+ZhzjrrqX2pqMlfz17MuxwsJNKlCnIwgyRFprW7yY51IVO
         PzA0ezvhcq3zq+NikWBVduPHsZNuNU8OZ3Mhzg9it8T/uCHXRZe9YRof9EmDfDuozYiF
         bbBKordTnUHC4iMewKEilJdwOjQ6kI/OR7cFpMdaNi/qM3yUp0UMy/qd3yOt2MDqyOpN
         EDIj8Tre+Zs2D5wReaY+2npceHFwGhiIyUfyL4Bh9a9CN91pNpvIZBeVa8pTMwkT+Qvm
         t1rQ==
X-Forwarded-Encrypted: i=1; AJvYcCUbV0m0hrfmBY6RpwqVlD2h25Aa+TZzOsuY905dJlhmv6o/9xemvB8/L4PaTuajiMwhVaW70prqbg8eqg==@vger.kernel.org
X-Gm-Message-State: AOJu0YzsBrRsGvrotH0cSZTfSWJEng5rQaMtmXWsA4Y50oemLKKCEHpO
	+6wzadZJUTzlfECjzwEprMJEhszspi1PUOIQzCOKntfWqgJlnKHIcAXQGJCQKw==
X-Gm-Gg: ASbGncvhK/2WRMlgQ9etJI44WUQM4XWu6+dOusCkFAFS2wAZrku8MKCUt9ib/d9W2NU
	QZ3EfU4oqxJeZRIuLCXS8gzGW1nEdGoUs6ShKcFSY5tWhuV6Ipfqv/LDPe9DD5ggSwTLV5TKVAD
	Mn1PBuoyPfrMkFbcpikukPXuUh2wJWXzVWLvJrENqTURhTnQza5MejZ8pf7PpVdCJPUTE9nSa7z
	cAoYsLleqGMBzoBAITbEH0Pc1qmqn/Wt1TadU78em1iDl8YicvAFKrGh/VJCuPATbPg18kI0DI8
	tu0vWWsnFl7CML4in85bRTDYR2mKyb+bFLSpljJWDjtTksjiLNajuQtcGXkT+DnNX8lXu0HyBC8
	drlkvMS2mPKlCveNHoLiAT3KRgZHaguBqSV9wI81ME3Ha9jsoZcntbg==
X-Google-Smtp-Source: AGHT+IEmQxCkFFO7UZ24b+yxERi/IFGxEwxA34m8F4M0YMaCMHA36BPDMhCCaeMBaLNEhVfkRsdkgQ==
X-Received: by 2002:a17:903:15c3:b0:27e:e55f:c6c3 with SMTP id d9443c01a7336-2902741d01bmr231063125ad.55.1760292790123;
        Sun, 12 Oct 2025 11:13:10 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29034f8770dsm110734015ad.117.2025.10.12.11.13.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Oct 2025 11:13:09 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Sun, 12 Oct 2025 11:13:09 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Ivan Mikhaylov <fr0st61te@gmail.com>
Cc: Iwona Winiarska <iwona.winiarska@intel.com>,
	linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org,
	openbmc@lists.ozlabs.org
Subject: Re: [PATCH 3/3] hwmon: (peci/cputemp) add Intel Emerald Rapids
 support
Message-ID: <4afd6c92-887b-456d-a5e3-a615a595a834@roeck-us.net>
References: <20251006215321.5036-1-fr0st61te@gmail.com>
 <20251006215321.5036-4-fr0st61te@gmail.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251006215321.5036-4-fr0st61te@gmail.com>

On Tue, Oct 07, 2025 at 12:53:21AM +0300, Ivan Mikhaylov wrote:
> Add support to read DTS for reading Intel Emerald Rapids platform.
> 
> Signed-off-by: Ivan Mikhaylov <fr0st61te@gmail.com>
> Reviewed-by: Paul Menzel <pmenzel@molgen.mpg.de>

Applied to hwmon-next.

Thanks,
Guenter
