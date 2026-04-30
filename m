Received: from mail-pg1-f169.google.com (mail-pg1-f169.google.com [209.85.215.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0200E42B75C
	for <linux-hwmon@vger.kernel.org>; Thu, 30 Apr 2026 17:27:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777570072; cv=none; b=DzcHulumlt84QdXngJ8m7o6C0G8WS/lharky+t9iRxwPlJUnrh7WWH6mkLfRuiMQIWbrthzgmlivYF7zhy4Vf6JdVXs2OYgn0YYQAHEE6qboqx+RgHnrAfhCLFfKnfwb4kZwDmOQYEIPrnyfUWSBP0fWJrAeZpVr7H6USVLn1fo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777570072; c=relaxed/simple;
	bh=susE6MOja7BP1Q9EdbTtzCJnfds6IBeD/WReuC5MI/g=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KAWjUrxoKcD0guJI4JmjYWJMo7RauuusYaq8xIfkhdcG3aA+HA7APMu2AGQ89n137/9Z4103TumlNtin8bKAli/7vpmf4wac2t3jjOHShMBAboMpo+XUUG8TuTSBT71a8eJjxQO5JPo1XwJGr0GbJ3CI+LU2gX8jBaeTWLW2t0A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=c0D7f69I; arc=none smtp.client-ip=209.85.215.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="c0D7f69I"
Received: by mail-pg1-f169.google.com with SMTP id 41be03b00d2f7-c798fc1a28cso464177a12.3
        for <linux-hwmon@vger.kernel.org>; Thu, 30 Apr 2026 10:27:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777570070; x=1778174870; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xEd83NyKCm9pgW46R/MYZ/2L5q1vvRIlCgfeKbg8faQ=;
        b=c0D7f69I32wqYHxO2sds1MW+JS+SS9pIXtC0VNnPpEsToBxBHoFnDOwaESU/56iAzl
         55BEzURSq7cdo0N/Vzw75rgYlD7VRJZh0LGNynKJS05QtS0vdJZm0P6zrogLoGH5OKEu
         5z6g9jEHf9aZ0PFlFVGW0X+zVMBXSlA/RilWszfNZnuBTK2WifwoUV+aLUm4Hw+lWZyL
         7FHzSJJBDFWcY1BXfTkh6uunacq5eL+voM14aGMcrfVmPSJRN17Eq7qSlRN+PpilLdFG
         FFU1AjZwqFCr5F7dvADOfwHusoAwzDQ6Opn/GhENqbEFLw2jVtt9dzPAo9t4Vd0WSWtK
         2s4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777570070; x=1778174870;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=xEd83NyKCm9pgW46R/MYZ/2L5q1vvRIlCgfeKbg8faQ=;
        b=XSNdvF3su7Xn+WUv4SbQdDwJmymHCAtPhbYDE1HvxnrrbVKkbv4CnVgy/piLlVLgjx
         i48qz4inV0lue2cMJ9lDgAtfKSmlLzh0ZQJSqNL8gLWdzOgZ2WXW9j+4xlySybzQKRv/
         nozkGEvsygzW9IED3cDkY7jSP0BFnEUcFszg4GaAoOvOG9kIjh4H+1db/t0P+45QGVca
         XQYrwCbxIkJWzlDDlS5s7l3SGcIiy39aQMzFTrCh7jsTawicrgzKetlN1hmOM0vYlC6H
         qNakriN5JXZn96kC+XsOxr/ki7Upcwb6f5U65FLTk0D3ilZi/RBgtQuM+pXhf1YeJovL
         4mXg==
X-Gm-Message-State: AOJu0YzvyNHfQSR3bkaSDuCNyxxlYCReInefEVW8gh1JU+zLWh9Y5aB+
	JEvcsjeVz9eVwkLcd9Ua88wMj9jI4Tkw/0xtlYV7t5lfdbo9lESQuBVX
X-Gm-Gg: AeBDieub3fWysWIgc4dr0d+yk9B34vKO2OXqDI5WLNj2aHe2m/TUb77JAplbZDnCONr
	sLug1sieTwRnY9WjA0yqHnC/IYMtOMBPW++NkQTgToS+VAc+/0BHRZiJXPVVf7HUzonRSI/zMbJ
	tji90vOXQS5THqqIbYyIWrqAh2PtKQNAwi3XrC/EttfKoLCXyzXB/wsbLaa0WgItthMTmak5LSY
	3eACsbYWIhLj2ELpcDB7N8CHOJ9dyAZWpp3gmkZZTg829OdBsKll5UVdXquUxwm5imkQNnZkogn
	U9hVckYbRXerFSd0DnNF5L41CnvF/YxcVWEMZxJtG20MGNgkYp7rCwDRL/P93Q9wsDDetyHNyFX
	k7VRCfI3enM9K2YcSXnJiZ/ifYOxOHU57ZHutiJVk3tpgsjw0dZfryS2BD6TE5n4hyou2zwd9WZ
	bXZSMDlxIWwynSZC9ancCYNaFXWlDdO9PzY+tSAa84wLDYW6M=
X-Received: by 2002:a05:6300:210f:b0:3a1:5cce:caaa with SMTP id adf61e73a8af0-3a3cf9013d9mr4623025637.49.1777570070311;
        Thu, 30 Apr 2026 10:27:50 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c7ffbbbfb1esm220500a12.14.2026.04.30.10.27.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Apr 2026 10:27:49 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Thu, 30 Apr 2026 10:27:49 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Flaviu Nistor <flaviu.nistor@gmail.com>
Cc: linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] hwmon: (lm75) Add explicit default cases in
 lm75_is_visible()
Message-ID: <56aa35a4-adff-4c3a-9ba8-552b202f1da3@roeck-us.net>
References: <20260417055700.5739-1-flaviu.nistor@gmail.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260417055700.5739-1-flaviu.nistor@gmail.com>

On Fri, Apr 17, 2026 at 08:57:00AM +0300, Flaviu Nistor wrote:
> Add explicit default labels to switch statements in
> lm75_is_visible().
> 
> This makes the control flow explicit and improves
> readability, but also keeps consistency to other
> usage of the switch statement in the driver.
> 
> Signed-off-by: Flaviu Nistor <flaviu.nistor@gmail.com>

Applied.

Thanks,
Guenter
