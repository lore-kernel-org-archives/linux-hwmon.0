Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.49
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792585740;
	b=ZL8srDaSyiJnIPdytVwHv5DL9TMJ27BfEjw+jycK3oC/Bc14XUp2y3knJzGki15KvtWH
	 Fszrb0kUdRXX7djihTC/Dn+LR+FCJqDjT3XiSmy4SDBGmwtI1HhkvkuP4zcAlT4OFWsyZ
	 TQvElqgTrao/WaHq/HS2RXSwUf3ITr1yBatCTNWHwlHytdDc39AWNZQZh4Y2uUJfviZOc
	 xl6oc3D0Ha4RrQozdO9KgIgsh0YmAPLlRf8dGy0JD9cj1a0RH38yYdJKmKweGaij0tIxT
	 TvCezclK3J/h3724iEC5xQbTPgF3ND87xbtEyKDsIhpqTyLQnZYolRDkUDWXdC6+Ung==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792585740;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:MIME-Version:References:
	 In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:Cc:
	 Content-Type;
	bh=WYe1mgIsbtZAkiHfhqQLQbYjxMDJ6inx/P5LgKJJRk8=;
	b=UMcWKGXqB7XnwHNy5ZDEmhV+hhAcd+uTvuqSFBtfQl6jw41+hCsT3/HEmt3SUNTJGr2w
	 l0BZNoVcy0ft8lfgSW5kUl9SaJkkR0FfpEUXG2kL6IQ6CYnuHm9ATZt6vz08KiPi7YS5O
	 1jGIYT5MNyP+o7P8RlFbevD3six3IkWNMkAPIjRgFaGL8S/0TDYIFP02RkeE2A5zT+omt
	 1rSS3e/Zxidth/G8e8jFl/OSI0/YiW5RIOsL4RtOXUCWPJXGhUjQ1yjwFyxgU9O1bk8YZ
	 ZjFC8gROGgnSMM14JM8iK5lVx0+nXvdjucNt0tGgba/XgFk22orQwVShlbUwe0tMMaw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=Bpz6G8QZ;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.49
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69C79606A321
	for <linux-hwmon@vger.kernel.org>; Wed, 21 Oct 2026 12:29:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 69C79606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=Bpz6G8QZ
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-4a1cef0439aso6454355e9.0
        for <linux-hwmon@vger.kernel.org>; Wed, 21 Oct 2026 05:29:00 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792585739; cv=none;
        d=google.com; s=arc-20260327;
        b=aDbIV5LRgzHMWlB/XjYj7KUcC8l9RjRi6IS0ZnIjDr70zVfH1pQteGlOa67Zt80b57
         U1IXD5ETPZibx/bWN4Y5SAJ9g7Xowtaoe5AH4EX6J8CtQBo73UDHchrOGiPOovwxjIWz
         dXj5AHgOQQm/bd6Ycpp0O3buYES+ibKxlx9CZcvxQhn3YeD58kV/8k0lFaDI34Fu71ES
         NX288WiHOs795DAotSPaqliSzzntBV+AF/O+wpVGNSmm/xAMblzlMQ71gR2mCcGVloeB
         idglsSX5phuk+3VNrZBjGAEjHNXHlOqJbnGEbhZOSuYfbXaKoRCmB1AdkCRNd7I4xio5
         K98A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=WYe1mgIsbtZAkiHfhqQLQbYjxMDJ6inx/P5LgKJJRk8=;
        fh=mxBMF56Z/NY1jmM72F/q27Dz82sQ9/4J1IT2OEIMfhA=;
        b=ToRWSxcJ+NVBVSApghrMsdkkYJfYN8Cervz1ke4JdNeh7x3It3qb/2DaCy/pEqibbj
         qglpRFqodA9YcMMPrIfzn0o68lWpk+8NCiJOkVc0LBRvnG00ooxftXkRgBxLy2NSE27G
         OGilRmYaOmpNoVFtHufbm3JX65HRJAr78JxT+DZDEd0HNp/TevZkAUR+eH6B0y0QDvPq
         PEZM6haOevlu817VhDmdkuxEsv6s+ZT44byDaSIh6N3lXRYT6flAOKp6sPMRHs6An1eC
         xGwgQI2lvNblA9ijPXADuXFgVtrylWaloc9qpFDB4YprFfId9QQJOrAPZfNtv5kVMmXT
         SXQg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792585739; x=1793190539; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=WYe1mgIsbtZAkiHfhqQLQbYjxMDJ6inx/P5LgKJJRk8=;
        b=Bpz6G8QZmb/JGEgcjfwYuXE00RMfr7JbARsssfTOFZvsHr69zWAd04aGeL9wGUd1pZ
         kUTXyeMt0xIaLnG9FbkQAhKCZ6OfA+wdCpsO4GdcUL3nUZuYKFKcycoXBKL4jAF9QqZ9
         9UHbi2qsHP3kES7QIUqmVTHRFIf12Dmm+1t7A4oJKyAgk/ZHaf0XS5ZVZIDC2Mxo7COg
         3sqWeeLWgJKWS2YYXHC1g1peoEJSFbw/X3DfPoAvbXqBE/AV7ttWDaTWoGE39TAWqfan
         D+cL4iNFmc5+AqxJkCAzxZcGNVqoO4rlS5uKjtyNbPiVQ9SXgtZsUvXi2WCFyyUiysg6
         mwZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792585739; x=1793190539;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=WYe1mgIsbtZAkiHfhqQLQbYjxMDJ6inx/P5LgKJJRk8=;
        b=QfvkoWW0XLDUPcfxNx5Fmf8brEyPqW2fo0WcfUsC5ZUXoB9W4aZvg4oSarCCDmeQJc
         KXVVCPSqxLf7gsA/bD3FXjCQkUkAKVMcG0+88L2HUE7thpzeOzeK0yevH/nVxm4CoSnD
         TP6mB3sgeUiJGz3tUU/deZZKbzI5Rzf/qsLPEck/+FVN3vjTQsy/qE/851xgNFhQ0NqA
         dbZvvOqXTHlDPAa4qmjJC08Ntk7b5yUHZSpt6cWxKol79IQe9bWCWrt3QLGN3o4Ec1/z
         R0eFtT5Rjh0/yfAhdwMZ5IsNRCmgqkyLnz4RUTZdBMwzPcSsfpvoaW3chKjSIkkijZcr
         xhZw==
X-Gm-Message-State: AFq9FYK1AEJGsZoMxdqITqRVDebHPWTaVHA6KLF9n8e36VhTpzFnqhTh
	0nPmjNYlR/1gSbeswJAPx1OyWEf4wxpJ9J5gmQoniEWrPYfs6Ujh++bW9wFQowLizJeSj1htpa5
	YbZUJbLLhnsQR6atnnT4Rm+R/ICtmrtYRNwTY
X-Gm-Gg: AYBFou2k+Zr3fp+ogzdVljUujFPSEhyIJzX1KLJ+e6CfaCYqNcBvmTsvkFoSw+7bMVV
	Encr7XfnKZVlJLksLnVZmzd9zjYiLQfxeuHjENA161ZjPPkic9LW5+8N0vWZtL+I1XBvqf0fJf8
	snBSWve6ghBLk3YYO9c8T9+/30Er7P1YH9fVlRd+pGgXdzpMAC7Lf0+j1ylB4GodRLQE8zTgntU
	O+HcmEHTrlgQ+4Xlwhklaf3w04UTUB9kVyBMhr79k6WF0erkoOvnKtt3AhjC+JBZ+ZuNRbz2VLM
	at9oWi2AN4o4/cYt9X78nloXGXuyAxIeiwAEhf2S3o6JScE2hNyzW/VFt7iDiM80egIKze1Zfjy
	sV7uPNLPGyAIRofd9+IcuSB9TdCDUMGt+btmLJbo=
X-Received: by 2002:a05:600c:83c7:b0:4a1:d087:f6ab with SMTP id
 5b1f17b1804b1-4a1fdd22df7mr39936915e9.18.1792585738531; Wed, 21 Oct 2026
 05:28:58 -0700 (PDT)
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Post: <mailto:linux-hwmon@vger.kernel.org>
List-Help: <mailto:linux-hwmon+help@vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-hwmon+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261020-coretemp-retry-sensor-creation-v1-1-7dd4851a34dc@gmail.com>
 <42ee0ffb-c0f0-4426-a568-28be267e4a93@roeck-us.net>
In-Reply-To: <42ee0ffb-c0f0-4426-a568-28be267e4a93@roeck-us.net>
From: Ximing Zhang <xzhangjr@gmail.com>
Date: Wed, 21 Oct 2026 16:28:46 +0400
X-Gm-Features: AclHuK-iEbUqEIt_S5oAy6Zr908EnDTOfZaCdztoawpS9OjtMxpFrmIspAezEAM
Message-ID: <CALurWnHeNBKVdVbsrZ17OjZ09TM1bCseK=R6MDgjz4Sg0CiWYw@mail.gmail.com>
Subject: Re: [PATCH] hwmon: (coretemp) Retry failed sensor creation
To: Guenter Roeck <linux@roeck-us.net>
Cc: linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

> Is that a theoretic or a real problem ? "Test-only fault injection" very
> much suggests that it is a theoretic problem. Have you observed it on
> a real system (without artificial fault injection) ?

It is theoretical. I have not observed the failure on an unmodified
system. I found the unretried error path while auditing the driver and
used fault injection to verify the existing behavior and the proposed
recovery.

I agree that the fault-injection test establishes the behavior but not
real-world impact. Please disregard this patch.

Thanks,
Ximing
