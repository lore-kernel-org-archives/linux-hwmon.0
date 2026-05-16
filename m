Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4685126CE2C
	for <linux-hwmon@vger.kernel.org>; Sat, 16 May 2026 22:49:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778971775; cv=none; b=BmuVv+QqLTxt8O38fGqplaTNMdNAK6xMDHJN5CtFPhNy0nqwd+VD4AkFW/6EXBFTZBLhSrPwW57+GPxxvMx9oSoEmVDVUwDvVxWBRSSF45Zocyu1OVfHy2ckcB2UI0lWS5BavimTTmiIRN6oV6Ivx/cGSaUC7Pa3Qu9pGASceX8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778971775; c=relaxed/simple;
	bh=Av7zdXtF5p+HCOVJjCyLfUZtlenj5pfNAd3NkcXK6dg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ul9RSpT6AMVIemCPlDMLLtuHXLHVsmBwq0Yf0i4l0fL7EFjGNTt7E7PJxLzZZiBB0jdsGi0usyCRnB/xgKkZFFARNNCXOuwJu+zxHk319xzZqx7nAJnlBjdD4SzI5tuaLQbKyGtQu+c8GWbKa9FwIkjjNZ2nuUMlBTKHBxaBw78=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WmVxudE9; arc=none smtp.client-ip=209.85.214.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WmVxudE9"
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-2b941cd869cso5938795ad.1
        for <linux-hwmon@vger.kernel.org>; Sat, 16 May 2026 15:49:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778971774; x=1779576574; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KFDwTIfJFm85RBJSX/LdGicgX3hVihekpmSwBzvMduI=;
        b=WmVxudE9ZG/YYx89tkEPrhRHhJ3ArWY9ZJ7x8Fb1Cai593Wkxbh7kSKNHgLcgmWeil
         KfDpI+YdhbHVJdWjApl3oow5WPWmRaNXxrWKKPHpwifqn/LhCxpuRpWEi/41KVuhOZMD
         3xcBqFKikCCPjh4ys21wfzlTV8uggxYEbZU3DBMzFPMxgV4ejk25LY/tSuGveYcNCQQd
         BoW8vmnF6+jN6UEywBvJLdD7bsi5kw1qFfe/O9XXblD26pjpMInt4M9gx43gOY2i/LJd
         dC53sQOVdmUYq6zLfgmbuPk8+TnW8ICVY+SPs3weQ1Aa7Pf5b7C3tO6qQicfz9+z2gw8
         c+1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778971774; x=1779576574;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=KFDwTIfJFm85RBJSX/LdGicgX3hVihekpmSwBzvMduI=;
        b=hyxn4KbMU8XC8/mHVuNalUwzK/Yj0X+jvkylZKRYTQ8vhSIzFKXzPakft1+ljY5R37
         ziF3l2GgcmG90P0sRWSCDrojkuHLtG0BXyAc/owkxV14by/0IE6PGSluI+/9nijgH6WP
         4wxgqoB3Ke1be4B3nGCxZiXG8UIOhMCLOgiixdTdmIK8HYDkyoGp4jLIdy/Wsj22OKBZ
         Q4rqcJtio2OahEJWUiBsa6QevHiS8H/YyOlx+eZCbxtGNT+9NtcjHhlvnUcbWmKDrPpU
         iuxZZelgNm2AAdmpslAra42aL+w70buk5Hv1zXvLyziNYDvbl1Y3j316qViZSDvPX0Yz
         w0lw==
X-Forwarded-Encrypted: i=1; AFNElJ8wdTBv4uymGy2EKQtVrXtFAHdUt4hZkKR+GvKneZxYvwpEMKqB0Ebf9AxNfmnm7f1HpmnQABOfhDNM7Q==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy1zpTZ+SU0uvdTcvN+XfL83R7lCtiKwShvxw9NsPaBGlPl5/00
	z7fcoWCmNz8h/szu1CMyYnfdzpS+6N28dGPQbxksOCYowWbsZfdimJrS
X-Gm-Gg: Acq92OEGW5KGFeb0LlyQfdmwX9t+FLo89fteFfoZZ4wcJ8vx+uwDD2w0lZ1ed2y9hQN
	wCgrWai4oomprNDytpVRceWzBxD7F/jABWWGYvusaNWjnOv4oPLY+3wBPSx3H1BAqF3n1mAZmdS
	Id/mtow0z7TaQfett7dL2WJuDqz1JXiUxu9BjVQr+wJ0d7IuXRJHO5kHEqA5+kBOWUY4WdyY2DZ
	C18SLBIngjhvgkxMT0mWJ2SUS5i80ldKaURoMF23QXQwFGbDqr7NLksbvqxLP48gntp3V4BN1dQ
	Rn7Ev0g6d7fbXZGr5Z3lyGns5rw/r0m6mwWJSDlDiX62NatIQDRJ+C2E6gy+cLhIp6Y3SO2cHoP
	3jDRkp30EM++Fd70QaisJjzAok/YB7P46EmOgZ/+d+DKCltr+dFuzyBYDgG4XY85UEcXcHuo+ja
	CESvCXyH9ZxwYmGlMUj1p+9iR8tYkGCIWNmfSF
X-Received: by 2002:a17:902:f647:b0:2b2:4fe3:7b89 with SMTP id d9443c01a7336-2bd7e9e2622mr101161715ad.38.1778971773598;
        Sat, 16 May 2026 15:49:33 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2bd791e0b11sm77330475ad.18.2026.05.16.15.49.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 16 May 2026 15:49:33 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Sat, 16 May 2026 15:49:32 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Hassan Maazu <maazudev@proton.me>
Cc: "skhan@linuxfoundation.org" <skhan@linuxfoundation.org>,
	"corbet@lwn.net" <corbet@lwn.net>,
	"linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>,
	"linux-hwmon@vger.kernel.org" <linux-hwmon@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	Randy Dunlap <rdunlap@infradead.org>
Subject: Re: [PATCH RESEND 2] Documentation: hwmon: fix typo in heading for
 max31730
Message-ID: <4044c5d9-b0ac-4411-a669-ed0f876d5587@roeck-us.net>
References: <hGgiFItk4iaav9-zfXL4hA_EVmxAaZYRbYviXz8aKKzOVAqduObTpd-PvRy1-9Ksuziam1HIXZNEkXbw3znqWX86Lplbq-Axo3fImYbtNZA=@proton.me>
 <ce11a8ba-8ebc-4c09-b6d0-7e98febeae6b@roeck-us.net>
 <6-vpIVJnccYzmznZMj4zfXmOKnHhtaXdeyJqyqTm3KJwLIEj3iSiWzBVxHnBhkNZHZ8E3KfHn7pYQSt3xrfQOQeN5RCJNnBVwmgyJcaw_zM=@proton.me>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <6-vpIVJnccYzmznZMj4zfXmOKnHhtaXdeyJqyqTm3KJwLIEj3iSiWzBVxHnBhkNZHZ8E3KfHn7pYQSt3xrfQOQeN5RCJNnBVwmgyJcaw_zM=@proton.me>

On Sat, May 16, 2026 at 10:09:26PM +0000, Hassan Maazu wrote:
> Generated heading & link to driver doc for max31730 wrongly named
> max31790 under hwmon docs. This patch fixes typo so link to max31730
> is easily identifiable without confusion with max31790.
> 
> Signed-off-by: Hassan Maazu <maazudev@proton.me>
> Acked-by: Randy Dunlap <rdunlap@infradead.org>

Applied.

Thanks,
Guenter
