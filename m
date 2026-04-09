Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB6951F91D6
	for <linux-hwmon@vger.kernel.org>; Thu,  9 Apr 2026 20:03:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775765033; cv=none; b=Q5TzDEfGKbxo9APOLySWftrs16DtWSPkGx3sxD/fI4w2ovou/gFA/SO0253NB/0rK7PytP/CUq9Rq91ljvAYwwWuYoucrtgVEavh08tzmSCk3Wf/IwnMW4iqcQwVOof0a/LlDcR7caC3xufxIFz9pDHvZnIkipv5O6vY0Ckkgbs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775765033; c=relaxed/simple;
	bh=S/eRgMAVCULkcgcmSEu4wp2EsJ5gH8110aHJL0OCpds=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=a6ROv8KoAVlyaXbbn1Woq6RsMCMVTScudWGcryo27d3MocwrF+nncpIyLkgcvu0zDaswRDygbJV5ZerhmuswvAa3Kk/lhJctO1SI5qIC7vewapwSCmY81kjGb1jGq91z8IkX6Uof1Bx3MGYHKG/QB5BEngTze9M2qdMn+4HoGGI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gEF8QxO0; arc=none smtp.client-ip=209.85.210.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gEF8QxO0"
Received: by mail-pf1-f169.google.com with SMTP id d2e1a72fcca58-823c56765fdso977426b3a.1
        for <linux-hwmon@vger.kernel.org>; Thu, 09 Apr 2026 13:03:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775765032; x=1776369832; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=bicdUeiIf3zypcJsoL2lS6shbZCW9oy8hZOfptrrOzc=;
        b=gEF8QxO0VX+sobyVkzBgTbWzmgpEMrAzox7uVGhxU66ClXmkPSXfitQgUYh/OrQUIA
         +lATgWejp3TzhZNu1jQD+3WgHzS9BmVMaSV6+ARzc+YTAEVdkYet1wVFLG7W5rop+ufl
         4wNknFRMLDxr7MZXkyF8zlTxjBNCDqG3VUyVeGAExucA86EeZxWrS4eOc/w7iQMkD2hT
         QJTwZiGjL7knCnNyuPds2uWiuuYRRx4ffYjEsInaJym0mscbwB76F0zpQchmRv/8SGw6
         HYVCFcBcrSiEh9qEHGKswdKuePjj1OOwVyvl6qsRZVygH75Z2qffBbcjqynxl5468nQN
         d7aQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775765032; x=1776369832;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bicdUeiIf3zypcJsoL2lS6shbZCW9oy8hZOfptrrOzc=;
        b=okng/nFJCf0CDHbL7dMzg4NwAy5S8kEVHSBuHfVGtHfS+A6i2YgoMs9bUok8DoL5Mu
         6O1R86eJ4FqIDO1gN+tauC689kTWDsI3ujzZq21DakSu+2fpeOBTaOmKYCMR5pMEqled
         43S7U6TNq/WxNJqeeI06erDNsn9mjGq+jhkgZIFYOP5ynTDIca+UrTxt1fbCDAAsgf73
         kNCf/lFR/RBrVZKz+AQWmQQ/nQ9N1z3SxXzjylmBKPa4KKn9lxPRuyvYKloCmpxc9XOJ
         JmPqy99KTNVOdaLmBeqfqmuP91Oh+VLZwXw3QdUJH+TuJ8nejEAAQXK1iDZf9WOLtAFm
         tBLw==
X-Gm-Message-State: AOJu0YwGcAvT/WOcmOc3zFmDjU4NGLxh//jeXaWmXgvTY+kwMe1Y+Ox6
	ibfjSg/obWLWqZf6hichUOrwHa4d6uLKhfscwMKiFD87mh21vyB4/zPR
X-Gm-Gg: AeBDievc6mlwk5SXf2LgXbQkx0pUXuRhe3ruCG5REMbaBlR3X3WF7r+n1cFB0lO7mc0
	v+JC1o9MD2wQvpnQ2gha1D4TA1QmepsSQQANW5QpD7zNy62q9C5HJEjD45a0M74E7zJ6bDBjejs
	QfT9jF5ZGZmCwwTJMwayHDtn+v5Ptf4GhXr+al4sMMwOQlb1KenS21aUO/MvmbDWopliPiJZuse
	HMeu4x36azr843z/pMz8+Jll+R5omyOMT2fVoTV6dPNg/a98lt9tioynY86mXcyIPC9lRqsTYri
	LROmOYzdZSlKQsiBCjXsuBBLKX0HIHlWIgc6TWzLeLuW11+G5KVkSFJ3ijrzBZbHqW1rBjSS7fs
	CtzJpzrW7Af9cGvx+ynMDMtstZ9+93l5LJInav5wNEkff8f+qXo89JCcA1euyK49FpTSK0ubN+t
	xJgzOe+lzxhJlKt9KUXOMvCwof4mqaLrazgUSiHI3O1is9THzQQDnTe1dL4oQ6WszvaoFR76qz
X-Received: by 2002:a05:6a00:f88:b0:82a:8163:4c00 with SMTP id d2e1a72fcca58-82f0c1ce8d1mr582305b3a.2.1775765031886;
        Thu, 09 Apr 2026 13:03:51 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82f0c339570sm279810b3a.16.2026.04.09.13.03.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 09 Apr 2026 13:03:51 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <2f1262c5-1c36-4256-b274-e756fcfb16ea@roeck-us.net>
Date: Thu, 9 Apr 2026 13:03:49 -0700
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] hwmon: asus-ec-sensors: remove braces from
 single-statement blocks
To: Josh Hesketh <josh.hesketh@gmail.com>, eugene.shalygin@gmail.com
Cc: linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260409192438.15383-1-josh.hesketh@gmail.com>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 np3900V20aS7eD9K8GTU0TGC1pyz6IVJwIE=
In-Reply-To: <20260409192438.15383-1-josh.hesketh@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 4/9/26 12:24, Josh Hesketh wrote:
> Remove unnecessary braces from single-statement if blocks
> to follow kernel style guidelines
> 
> Signed-off-by: Josh Hesketh <josh.hesketh@gmail.com>

Please refrain form making such trivial non-functional changes in the hardware
monitoring subsystem. I am buried in patches as it is, and I really do not need
to get buried even deeper with non-functional changes on top of that.

Guenter

