Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 381F1285045
	for <linux-hwmon@vger.kernel.org>; Wed, 12 Nov 2025 20:15:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762978549; cv=none; b=D2Cq27aKaA/QEwLoTs6byEDcV4QTF6lUKvJUAWivCQz3UPyQ4UJV+zgjj3sX/OR0zZuLLaEPScyLdPdQDY9aIwJKuU6hq7wuSsIRJVsjCT4jJdJHSxEcNvgDXlSQRC8QzHyijfqyJIBI3R517jECTf9vPzFc1MZh+SV5WOu9H7M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762978549; c=relaxed/simple;
	bh=b/+LHgWOgIQuiKCi0TXH65NYrcTwmWDQVaMJ5xM6n4I=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JlADRxaIRGAyf9oedkD8Yu6X6s9nkcMy8DtY/rwb51lx6uZtN3detNc1CgfaRnP7vnkRtjul4Zg0cPt/moOqtHqGJ+rouF1W8Aj3qgLEcdUsOKYcOfOOSGxKxaSStz3hMXvAa7v88/ihyQ5FOWRgvTz6evwT67KqX9cBN8TocKk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Rt6rMFQ0; arc=none smtp.client-ip=209.85.210.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Rt6rMFQ0"
Received: by mail-pf1-f179.google.com with SMTP id d2e1a72fcca58-7aab7623f42so27568b3a.2
        for <linux-hwmon@vger.kernel.org>; Wed, 12 Nov 2025 12:15:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762978546; x=1763583346; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LcOVe8CCkbVixId45FxTIMUeNaTNkX9tAL+H6oibRkA=;
        b=Rt6rMFQ09e6xwbIKCgBzN0xTzITBTisQz2sKFFpVixcFnuEqWsHpnAtkIZKYFssxIo
         aNPWy6JxRprGK8+WK2UzNPUASXk28GVy7mB116P1fPaik/Hu1vtkN6NDx6p1hmQ4LM5t
         vxKWNvsjK/0LTfC+kn3ULGIWhvzyFXrfXQD72ZO1rCpOmJRQebQMTezvYnNnbUA4m9W6
         ZeIDKs82GAN6Sn9iKxhrPaZr6JulfVusiaKRRvXEEPJTYTddpiWXYXZClxLAvradroOi
         tRiEemIiOKFIDEO5Ffpz8t6/kU6dpAPEaO5nB0M+vx/KmFxTqpxFtAehXoTSFDSD6+QR
         nJEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762978546; x=1763583346;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=LcOVe8CCkbVixId45FxTIMUeNaTNkX9tAL+H6oibRkA=;
        b=jykPqYI0Ewn4hdrKS3gomsk0EcFByBBGREw5RDYJgf30I1ttpXrloddsYnV16/NEOq
         etU3gSdRg40ReamTaca4IdxQsezX59SwvOn0kfnrFtyGbWCCL2j8T8FhugWG9BxTmi8W
         EZPTtLTGmqMhNBgiKwDa6szjarGPf07AOL1Hcq3bmn3WR+xq065MihADczMx3E6URI6w
         ExjwWAYMqUmYUsfv/aUiCxMVx0aKT1U9+e16tM847w35CtJ8QIMyypFrX1hxidTrzoHH
         cluEDBTfuNCngZUoc+IpozgszZaUkFLefWZcEM2K3SR7jHxmnQiV0Kwt7WL0E4hpkt9N
         LdQA==
X-Gm-Message-State: AOJu0YxhftKYPjapti/O7mdZdhPM8905hZ4665+kG4EdDr4WSKigZB3w
	WygqVBWf9Lqs1uCbOKU9lX0sSCFqTGj5tHodIustO9pqWQUkN71ykBeM
X-Gm-Gg: ASbGncvZmj3gPHy3CNl+S+1o1WUziTALWgv08zWda8lJ7WRDNtUHjK+QjwJO7t/IhLb
	DLctsuZyHcVEglU2Nowx381HQUk1CnBQB8Rj+Sq7B225VsLM1i3gDWYU3rgTyumEL9qKENqULAo
	cohC+k02F6zbTk5nOtlM3DeXwgyW5BRfCIaGqUQrT5eJsuQ31cMakH+3SBLHez3yNAsSSiqyqk4
	XdkL5iFMGCPTBFTLy5SO1hqbfD83v2jnWyajCYmCSV+IH5XtBqPoRlC24vgosp/W3RBvsUPh5CB
	whxdK/cbS1cqROp/NY93AsHpHM2O/2lQOUeoi25pD/MppN6s+hR8AOOKfZkzYZt7b4DiLEE6L6L
	TrlEorDxt4rvh/WtefBxruz97VoSoGLIbWn/yvUYRw/vfx4PJ4Xvf/qxtZaS52/Pi+nb67ZIFjW
	6pc824SGKg4oLx
X-Google-Smtp-Source: AGHT+IGDpmW2OFyTt0AExJhOr1pXz3yB3vqqvORgvHoBU6m6jddfpCeyCIdnOiAefOTQXrtnwy6leA==
X-Received: by 2002:a05:6a00:2d8b:b0:77c:6621:6168 with SMTP id d2e1a72fcca58-7b7a4fdc2ebmr4559665b3a.30.1762978546426;
        Wed, 12 Nov 2025 12:15:46 -0800 (PST)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7b841192ef0sm2426539b3a.29.2025.11.12.12.15.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Nov 2025 12:15:45 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Wed, 12 Nov 2025 12:15:45 -0800
From: Guenter Roeck <linux@roeck-us.net>
To: Bruno Thomsen <bruno.thomsen@gmail.com>
Cc: linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] hwmon: tmp421: remove duplicate return in switch-case
Message-ID: <1fbef22b-c9cd-46e8-8f45-fecef37dae70@roeck-us.net>
References: <20251111144406.7489-1-bruno.thomsen@gmail.com>
 <20251111144406.7489-2-bruno.thomsen@gmail.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251111144406.7489-2-bruno.thomsen@gmail.com>

On Tue, Nov 11, 2025 at 03:44:06PM +0100, Bruno Thomsen wrote:
> Use single read permission return in switch-case that handles
> attributes in tmp421_is_visible().
> 
> Signed-off-by: Bruno Thomsen <bruno.thomsen@gmail.com>

Applied.

Thanks,
Guenter
