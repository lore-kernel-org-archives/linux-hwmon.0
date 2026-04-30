Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A285247A0B4
	for <linux-hwmon@vger.kernel.org>; Thu, 30 Apr 2026 18:18:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777573114; cv=none; b=kdTVSpPN9o9/g42ij4nAb6hdkMZjUooswrG6WUJiNhP9F/PeHIptHknJOD0DUuEnOkeqnjXcC45tQ3JqZWo9Dnv9h7rbgWamDFMZp/eAZRbmX2wBJNdsXTJoW/m+5cOimsw9yUHTeiNSusEjDaTp9Eueylb56HC6V1I+n1VUVH8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777573114; c=relaxed/simple;
	bh=r1xldGkskM1LoWG/eSEiuRbHYKyqMWnb+9qvWV8vW+o=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RROMRGwbZmftrUJibf7wqy7Z3DH3YhWc8Q3Q9MSV7c3ZgwoYINxDaGAFm7cSBxfMWfubQcP9BZalfRlkzIXn/RiCM4RsLFE4wUtnNCNk1uiNrCDjkMEcRtILa9Rnzm27Cox3GuEfjN6Y2AqpQ/sZisN3Nn29EJRsKcfmSJ7Iv1U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JV3/8xfo; arc=none smtp.client-ip=209.85.210.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JV3/8xfo"
Received: by mail-pf1-f179.google.com with SMTP id d2e1a72fcca58-82fbdd60b64so930569b3a.3
        for <linux-hwmon@vger.kernel.org>; Thu, 30 Apr 2026 11:18:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777573113; x=1778177913; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SKm1ZdQlx5hjZVefyBU7lA6ZzR4xQCcmrN+zV7mG1fg=;
        b=JV3/8xfoTgec5Wt52gaGXCR0bNLsZVLmAckC+6/gFM6lWXuruFnwajK0CBJ0Hm4xlb
         +pA1CnZX0gAWSv/9O7uLOeNIytKzFFCjSQIquHw1gJRJ2qEWf3JDPIHCyH6lJBUkr0zi
         DZPmAi1R502fNr3V0Nn5Wzk3cZlhV2C1lKiwAzYeiCsPzbdE60o3P4FxLuUB2ZrdTV9i
         ROPELSSK2fxcXvmOhxmH7SqxhiKJ7/lWwSU3+mXmHJRTfq0XhLbwDBaeh6IuwMbNVPGw
         cnWoLtcBuK/pCDL5yvaZiof3SttPSqQUhhR5P9KZ4VbbF3HndX0z8pRjGq9HSipyzLCO
         7Kyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777573113; x=1778177913;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=SKm1ZdQlx5hjZVefyBU7lA6ZzR4xQCcmrN+zV7mG1fg=;
        b=KuF5sxgpoO57ERpdpap7TiO/tmrx5m+rgyBsWj2pwe6MPmEkE1xGFFp6v7bgBdnxvI
         sQ852BmqJ5zA6eLod/pragO8GEybTR9A1yC1CK5aMvDkM9FprBQgpubyGD8b1vV4VAv6
         apwVRlZoycQqa2ceu1Xk6GkuXIs9igm+smIMakiLo+v6y7wWFaQsXC1SDv97MmZEzsQ2
         ZK7CI+vuEEsnAk8zR+VIopjRHc6d/O6601BPrkZEWfE1zNOBF/GCI9C1g87oZ4bQ/w7T
         TMvp5q/n5t40Mfc5Au7YXiwgtqnxVrjNO/oYvwPVyltAp2z50CHGDTYSbxd+XWKq2FpP
         6S6g==
X-Forwarded-Encrypted: i=1; AFNElJ/PF22jS5UZWwChzBBbaTRHT1VymCd8LpGnTc5NfOh/vPHevWAMuuOoN8ak1PsMiGz3Rvt0yZKNtAblkQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx/LhkqSJOe7248Ybxi3Co+AyPjp5cHsysxdCn5KVKpPVyu6S9z
	S0+hFz+nDdGg27lB4ogpGZFkvjGgvdSW7CgpBmLREBIOF+ewpnD93ZJc
X-Gm-Gg: AeBDieuzZ6chkUnOYCJER2BZj+kMMg/dIJHQDLvbzXErh2zXig9/QTMIwWwrzqOksH1
	spL+6jJVWqrNOJwnB/bpzT1AAcUajLRUKcGqIYWnNT8tq/91OklQGWO6PLXwh7jbI/kMa2luk5U
	Y11xrpm7Rzvz6PZ8RIG+blQaraG38Jf/DU0gTVcRoYLL7GA3JsAVxR71G5dECnwCtKsjFuRG8wg
	ZEmvRZMSuAm0xTQBgKJGXEcqLTZV/S91uXZ/i32m2emy9EPmHSOGVERfEgDZzbJAsE/27/bBIS6
	Il2J8YHtJ+v4gzz1F2VnoWK4PQrtgtnKyTig7xokI+gLQIV6yfLIIjvCnIdZO7PHq143ovRYQuZ
	3NFizseJY3M9+qxtdZohqyThKk3rn3oysYAgJcvx3Q93eQI63JV8Xy5IWou53vDnNozgOfcFjVG
	X0knitawiEPSqBPKt0Z73OwU/DjFeDp9j3Vq5ZxJSmjDiG9Bc=
X-Received: by 2002:a05:6a00:28c5:b0:82c:70a8:faee with SMTP id d2e1a72fcca58-834fdadf50amr5266501b3a.6.1777573112943;
        Thu, 30 Apr 2026 11:18:32 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-835158aa1ffsm311794b3a.22.2026.04.30.11.18.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Apr 2026 11:18:32 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Thu, 30 Apr 2026 11:18:31 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Brian Chiang <chiang.brian@inventec.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>, linux-hwmon@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org
Subject: Re: [PATCH v2 2/2] hwmon: (pmbus/lx1308) Add support for LX1308
Message-ID: <136527f6-5bcb-4cd1-b60c-ce7c80fd149b@roeck-us.net>
References: <20260428-add-support-lx1308-v2-0-90f115954143@inventec.com>
 <20260428-add-support-lx1308-v2-2-90f115954143@inventec.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260428-add-support-lx1308-v2-2-90f115954143@inventec.com>

On Tue, Apr 28, 2026 at 12:19:29PM +0000, Brian Chiang wrote:
> Add support for the Luxshare LX1308, a high-efficiency 12V 860W
> DC/DC power module. The module operates from 40-60V input voltage.
> 
> Signed-off-by: Brian Chiang <chiang.brian@inventec.com>

Applied.

Thanks,
Guenter
