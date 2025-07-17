Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E6141E3769
	for <linux-hwmon@vger.kernel.org>; Thu, 17 Jul 2025 15:28:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752766091; cv=none; b=UJr8SAf1IQm0nZB4zkXwe3+EVp0T5YHISRkG17mAH7FyBjDabNNcREmlUN37BnCqQLuUHrxxSaVdqVtpnltulIXZG0BRdqBJbfLnCEKViULX4NHzVF0pLaX2T49sSdou2glCBrL3ojQvs/UnihJaxVRU/wNPUwwT6uFaCOkHfsA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752766091; c=relaxed/simple;
	bh=zBZOYzsIU6/MVRi3wRWnA7bCEs0hv4qA6Yd1pcLHXug=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LNuS47OcOcQRIUDNjVlsPRpzk56bIWRjP0XYh3uji6FyDprzvPdSC8yP/b8jbl+adbFWo/Gmp2PqiX4Q2kAn3mqD1bss6KWtVhOimYtQxtUeofe+q++D/fGTBd6G7Hx19aM3zfrMiZk8yeKn03hpYcJqQMcRDFPvQnWsQEEudok=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HWijwaDO; arc=none smtp.client-ip=209.85.210.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HWijwaDO"
Received: by mail-pf1-f181.google.com with SMTP id d2e1a72fcca58-7426c44e014so1200011b3a.3
        for <linux-hwmon@vger.kernel.org>; Thu, 17 Jul 2025 08:28:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752766089; x=1753370889; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=OZOhhHFX+eTXaUBbTO9sjS8Dl4W5x9QB8pd2Y680EXg=;
        b=HWijwaDOfYUKKtTdOItXJXODhdRE762PysqRVbM/WwFJ/2tvotfU3B2ASGNMzujqpj
         /omI5ZpZmDV8WNMDdI5KWMwXRvF8+19KZH21wtRnzim2U/cD2JIsDuSeAIBtvMx5XCjM
         s/ZqZMlSlIZgPWJRHCbSxh/v82mq36jnKGeB9L+fBXna/FDZLSEkcILMPMp56FSnPMe7
         Q1NWBzdz2IeRRy1DBzrNvyUy1JuYCpVLrKTVhXLTiDblPur1LJ1PcIIMZIpftDeOIJg7
         2gJRXieM6MA4Oq2Zz1saD+rc1knUhlf9l52dsshxXu+IDy/dlgJINd2gzD6i1un/Mjbu
         PhVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752766089; x=1753370889;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OZOhhHFX+eTXaUBbTO9sjS8Dl4W5x9QB8pd2Y680EXg=;
        b=NZDn+RSDY/LuC6Eh39YAs29gaEvUiZMLdrtnHTp0avhxPLPlMhPd8feBEn81tP840r
         ZnuTOSXtfNYca1PfBOCerQ9XvzCMPHvL183L+iD0bCAOtB9aWa0UnItIL3BOJYkc7mC3
         ohJkL9gRSTm1ZbSpALIpFNaBwY82J5OMFKe3PCep/PklITawUvsWgY36v8yoxmayFm4p
         +DUaIcgYDDqct5TurySOiqGUK4SFLGAe97kAPx0qBVU0eDoLc37cqJXZK/bBYeEjNemP
         q/Ucv54cpoQwZHpLPiXijRs6fpCv1GzYsm5HmUnIjkrLQ8mmvHBqKNJ9NFwsgWMCstf0
         BKFg==
X-Gm-Message-State: AOJu0YwQWFFVHWl/hewd2Zg0J32UlMZgnfdOGlRFHqsoKy4/8gqstlxQ
	Ay9yoRkeNbd1udIYSZzmbZTlr553RDcV3OlvImlGe1aQlk4p3GqUYUVS
X-Gm-Gg: ASbGnctAU7kFCB7bFPtb0u5pqt2Qemt6pxfqCUxrLJ66lEjRGcooV57ZHIGpoavducv
	jG8ektBeRbKHdqJUIDizI6BjaPSlyyhfl7pwcG01r041brWxSgmwOmvJwpd70GE4HHA3GDQMAsX
	VcCfO3LQN68nujqfe/JFEyu5XF7+TWU43Julfip4QYgEan4LS+q0frcGXcpw3uJACe+F3zetpEs
	AVXBmwPoutFb4faRObf3KI0cPtcJeWjCMEn1xY6rmvJ6oPrZoJ4eR5CL++eIGoId+36H5XVB85g
	lgL02bLKLro8kkb9PDT6JDF2dsL/LwrvkFJ4UvY0sLwIb6Vr0UMHNSEhErr0l7Ai0ra3157vVfk
	pIFiifdDX4KhJ4spR6xTq9s/KvwfRimTSrGg=
X-Google-Smtp-Source: AGHT+IEGbaDJhAc160bNZag/5VMuYEA5P1G0t3fsVNbRtIkm1t/o+tH6Ag5sXE9GuPDy26ZMzoCYOQ==
X-Received: by 2002:a17:90b:180f:b0:2fe:e9c6:689e with SMTP id 98e67ed59e1d1-31c9e6fb9b9mr11435334a91.8.1752766089426;
        Thu, 17 Jul 2025 08:28:09 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-31caf7aa70esm1749026a91.6.2025.07.17.08.28.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Jul 2025 08:28:08 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Thu, 17 Jul 2025 08:28:07 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Torben Nielsen <t8927095@gmail.com>
Cc: linux-hwmon@vger.kernel.org, Torben Nielsen <torben.nielsen@prevas.dk>
Subject: Re: [PATCH 1/1] hwmon:pmbus:ucd9000: Fix error in ucd9000_gpio_set
Message-ID: <0feeb1a5-3140-44e5-8498-6893cb69241d@roeck-us.net>
References: <20250717103646.4127833-1-torben.nielsen@prevas.dk>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250717103646.4127833-1-torben.nielsen@prevas.dk>

On Thu, Jul 17, 2025 at 12:36:46PM +0200, Torben Nielsen wrote:
> The GPIO output functionality does not work as intended.
> 
> The ucd9000_gpio_set function should set UCD9000_GPIO_CONFIG_OUT_VALUE
> (bit 2) in order to change the output value of the selected GPIO.
> Instead UCD9000_GPIO_CONFIG_STATUS (bit 3) is set, but this is a
> read-only value. This patch fixes the mistake and provides the intended
> functionality of the GPIOs.
> 
> See UCD90xxx Sequencer and System Health Controller PMBus Command SLVU352C
> section 10.43 for reference:
> 
> https://e2e.ti.com/cfs-file/__key/communityserver-discussions-components-files/184/slvu352c_5B00_1_5D00_.pdf
> 
> Signed-off-by: Torben Nielsen <torben.nielsen@prevas.dk>

Checkpatch says:

WARNING: Prefer a maximum 75 chars per line (possible unwrapped commit description?)
#107:
https://e2e.ti.com/cfs-file/__key/communityserver-discussions-components-files/184/slvu352c_5B00_1_5D00_.pdf

WARNING: From:/Signed-off-by: email address mismatch: 'From: Torben Nielsen <t8927095@gmail.com>' != 'Signed-off-by: Torben Nielsen <torben.nielsen@prevas.dk>'

Just drop the link (it can and will change, so it has little if any value),
and please fix the address mismatch.

Thanks,
Guenter
