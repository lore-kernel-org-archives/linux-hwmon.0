Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A2CF405C0
	for <linux-hwmon@vger.kernel.org>; Tue, 14 Nov 2023 13:53:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XVOGK0LZ"
Received: from mail-qv1-xf33.google.com (mail-qv1-xf33.google.com [IPv6:2607:f8b0:4864:20::f33])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2C4B01A1
	for <linux-hwmon@vger.kernel.org>; Tue, 14 Nov 2023 05:53:54 -0800 (PST)
Received: by mail-qv1-xf33.google.com with SMTP id 6a1803df08f44-66d87554434so35958506d6.2
        for <linux-hwmon@vger.kernel.org>; Tue, 14 Nov 2023 05:53:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1699970033; x=1700574833; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ddTTbjvU4erKqXMFnrTE4jkbkhMjNYZvCZdUyEAr3qY=;
        b=XVOGK0LZFOqXaj7Hl8/ZJCACOStrmVnKJNY4yc+Kx/vpgALlV96mNjNLol+3HxiLxs
         zaCXiy88rvrn/I1SL6DRQ43wVJryAzL/DlER6S4rAqoUCADsVZVlkNRChi6jPY6KebAg
         ut+UpmaRLptTgGPI856q7rwuxxnp+EFxmdogZGF0fjQnTsUSOI7AEbf0aoiyTWC6HSUh
         NbXaOGEV26G+5pRh569gFzm5wXL7SXOhtvM8w63dxog7CokbD9OIXlw9JV9aJFEyZhyu
         TmH7NY0i2qrlAAoPjoe7plrq7oFyYwLauqdm1eEW7QeCda5ZsISt+USTN4R9FthszInZ
         NF9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699970033; x=1700574833;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ddTTbjvU4erKqXMFnrTE4jkbkhMjNYZvCZdUyEAr3qY=;
        b=dnmWCq2QvGX4aeT5v1P0HyGVS1SowQK3E/7NlQIEmeWWFz8F0MTF+JV+e42b5TgJSm
         s4JJVkPpS56JyLqRtg2Oju+LSifYsBBSpQrt3UuBDhhv/fJoqTqnrQkAKxY100LdTtJY
         mDumg/9KC1aQSVE/2JZ60ZcSVi6Z5LpSs2v80OqO+eh2qnyHZ8O7OXcXsksUI3+kBwcb
         3Dfs2AM3gFRoMcqAyM8sHMt32tr0ugWHVi8qE2yC2CvUNNEvFOLdG+Jw2ge+2WxC5YHT
         iP1HiGL0pyXBXN/HpESAH2NJ8YELyln2+4EDex+P0/4iaKaw+bQD9BOfMnQaCzmQ7eX7
         TwQA==
X-Gm-Message-State: AOJu0YwT5uNdrLkDcTd8TNx0s2L9XhHJUDkOC05qnRceJfNmIeWDp3ca
	HCVwMcfDHVrAf83Y8sRb3jI=
X-Google-Smtp-Source: AGHT+IHL7rdCg3KXJ1k4lKfsA9J4te1MXqAH5P24l0p3efxYo5M9SdkAMz2ikcjpOzj0Ci1y0Pz8WQ==
X-Received: by 2002:a05:6214:560c:b0:66d:3723:294b with SMTP id mg12-20020a056214560c00b0066d3723294bmr1670169qvb.64.1699970033308;
        Tue, 14 Nov 2023 05:53:53 -0800 (PST)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id po10-20020a05620a384a00b00775afce4235sm2636799qkn.131.2023.11.14.05.53.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Nov 2023 05:53:52 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Tue, 14 Nov 2023 05:53:51 -0800
From: Guenter Roeck <linux@roeck-us.net>
To: Heiner Kallweit <hkallweit1@gmail.com>
Cc: Jean Delvare <jdelvare@suse.com>, linux-hwmon@vger.kernel.org
Subject: Re: [PATCH] hwmon: jc42: Simplify pm ops handling
Message-ID: <a9b99531-cd00-4d4c-b046-cdd2e8ef202d@roeck-us.net>
References: <23f24d6d-ae79-4014-b4df-dc19ddb88e3f@gmail.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <23f24d6d-ae79-4014-b4df-dc19ddb88e3f@gmail.com>

On Mon, Nov 13, 2023 at 08:20:49PM +0100, Heiner Kallweit wrote:
> Use pm_sleep_ptr/DEFINE_SIMPLE_DEV_PM_OPS to simplify the code.
> 
> Note: Apparently conditional compiling based on CONFIG_PM
> wasn't optimal, it should have been CONFIG_PM_SLEEP.

Maybe that is apparent to you, but not to me, and I assume it won't
be apparent to others either. That warrants a real explanation,
not just "apparently".

Guenter
