Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793367978;
	b=OpT506Ung/1DJYn8RJ9bPp9Q8IyawcrCvVeJsh8MMxb5Kvz5mYZ9yyHXfqgdvUM6l5uo
	 5Wu+1cUahu8Ajwt/txy0GmpBS7hhojZD813B9sv0OydX5q1/YwsDTXZ/vHbcx4AmmDiLg
	 GI7jL84tjv6Pj5qvSNE0r1m5pN6DQQ/B00O9GQgtV8+NIl2z2iGT06xjpiT5GqJ3j4wjR
	 xgVwR7fOFECkvWKYJ4U0N7JFMR0Fk5k+4GTERNGwZ1+0M0Kn1nqDUcxn4j86ZBlTG57Tv
	 4f6ro0F+PXKxwLCGq9DD3CpIO9Ce4mAR6Mu+cLgZJP174DljJxSW10Fp8WANG3q6nhQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793367978;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=Cel0vcm4G5w81qs6p/3zOaRkogZgkiMaq/fEg3zUQoI=;
	b=1vmOCrXxqUhAU6ELiK3f9CfRPInx9x8R5E8LyvGV+gyG60DnFIdpaK7CrcVo5tUPyage
	 8JjDqzNyaRUuaA2hcwdviW5wrcRN6L2N/39fdZ9XbsYipCdWPP06rBGtJLZ7HbNz7tdPN
	 pTeVY3ENTBgOAnXBIDOK2Qu3/DW46d2a/Vno/GjDVLeLZ+fwyRltNiwL50d4RUKiRTJjO
	 aRucRCJKSaNTP6Jdk4bxg2Rwi5g6ELPNPvuzqHjMNqiHbbxNlB4bTAaUar6zFHv8KjsFo
	 FHMdHLzozDy6DViWLCO3c0eiUEAtVJdZNDvC6czo6IbTgCGUMps4dRdNMzW3FiXqBLg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=ieee.org;
	spf=pass smtp.mailfrom=ieee.org;
	arc=none smtp.remote-ip=209.85.210.48
Received: from mail-ot1-f48.google.com (mail-ot1-f48.google.com [209.85.210.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8ED8A606A322
	for <linux-hwmon@vger.kernel.org>; Fri, 30 Oct 2026 13:46:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8ED8A606A322
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=ieee.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ieee.org
Received: by mail-ot1-f48.google.com with SMTP id 46e09a7af769-8451a619da7so526868a34.1
        for <linux-hwmon@vger.kernel.org>; Fri, 30 Oct 2026 06:46:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ieee.org; s=google; t=1793367971; x=1793972771; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Cel0vcm4G5w81qs6p/3zOaRkogZgkiMaq/fEg3zUQoI=;
        b=MHCzlPUZKMnE2kNo9yoyOWyk5iazVdyGZcGd3KBZgWLavn2s/MGurSTnlnGWrQcNlG
         Y4sRWrGUcDXFVzUpwSMONQl4Vvs8Jlm/MTkPIxqmO3Gw4v3nqb5eZnERYCNZ8TeSG9yQ
         lnRadBi21wkXJaAEkA/aq62Uy9tv+sDun8I24=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793367971; x=1793972771;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Cel0vcm4G5w81qs6p/3zOaRkogZgkiMaq/fEg3zUQoI=;
        b=uNltGPceI32AkxJpDdJMOe3DBoPrantkf57Rbsc/DdNGxkeK+ckgKWsRmXvdA1nxb1
         9jQXquH58xEfhkwZflBUCk7QVxGW8Fgm8F319yrAZP62sHuKtExF85tqN+RJTOAp2l54
         osmRrhP9bel4+D5EJFixOqP/ynIKfw/JO+40j2PWLSVdHnqdqUj0qBjOXy/UD592pMS1
         IhrUKji9wTdh6AApZD/7jRp2L98JrMYS8JPa0TnkWK+AZC/O/ZvLWofdZYFiEYtTU5Le
         u4p2HhCwDp/TfK1uTrkgAdaR+fEqQwXHursj0Nga3mJ6GT7OxQ2NLMVA3Dbq5XdRShOR
         LT5g==
X-Forwarded-Encrypted: i=1; AKwUvBzTb21Zm19AM3IgA4E+P17opfUaQFse09PGlYvHch2gFrSGeDy9VvvacWjjAL7JOmeSviNqGjr7CV0GbQ==@vger.kernel.org
X-Gm-Message-State: AFq9FYJnfNx+DehQ6q7AqBtNmWDkJLO/px2GaoGjSmqv7ICzy9CWfxez
	+dchhmQrdsAggMU+y3S2jvPsY9cLorNXph6zndzWyh09pkAzP560LfqC5ZnZfRkBzw==
X-Gm-Gg: AYBFou22RB18nIv4tSIdfUwJGdDI9hYM2kcH5wZF+G6qOd4bvMtE4nkTz4JTpNdBzcc
	XnBjd09pHtQsIbXYmoOfmi/uhp+ZHaKCZursSQNsoNj5OGRAWUnYOFXPejlKHep9ZlUQ7XBLIgc
	beOdsuPapmGE830Eux5RMvu5cET3V3L4RLlvkZk9uslIgEXfCfrfOkVWYb8JrM3MZZpvKWgcEDx
	Yril4sYOZWjaDhgK7I2r1wJ7aKvLQWLGvcxIiSJKDF1EEwBiVbjSRerKh5grMw7wcXXHnrvrYsR
	RPPFcfvI4bcaJgJ+12SId1sPSIq7B1XdlgN60WYPmL4LelJ3KUzjBoM6rhzcTB+kIiqZyRjlkjp
	0lMwT/GNDa4CqfhewCoQ+0GkHw6/dJoXjUtlA5Kp5IFeWVeKiYbtIqZG/gMQ6HR3V8ZIT1JA6Vn
	gaMC1PJUIxPJWQA8wdzbf/N8jVXfhNzAHsAKsZ+H5C5n2bhgpUaV/x0qAc+UTOKfhhqsR/6tK4B
	1833qsFfPXYba2qqE9F8R3cWgelrcyMyXYm8wgzWwU0Vn8QufmdGn6r/jfl1W0AY6WJQuLlfZdl
	MRAcWzM1vAJv4b5K/R/rLU1O
X-Received: by 2002:a05:6808:151f:b0:4c3:6d56:77c2 with SMTP id 5614622812f47-5640de7e3a9mr1613306b6e.41.1793367971178;
        Fri, 30 Oct 2026 06:46:11 -0700 (PDT)
Received: from [172.22.22.28] ([73.62.185.64])
        by smtp.googlemail.com with ESMTPSA id 5614622812f47-5640fdcef5asm1492922b6e.9.2026.10.30.06.46.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 30 Oct 2026 06:46:10 -0700 (PDT)
Message-ID: <9207a52e-2d42-4e10-b777-2988e84d7dbe@ieee.org>
Date: Fri, 30 Oct 2026 08:46:07 -0500
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Post: <mailto:linux-hwmon@vger.kernel.org>
List-Help: <mailto:linux-hwmon+help@vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-hwmon+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/1] PM: runtime: change stub pm_runtime_get_if_active()
 return 1 when !CONFIG_PM
To: Sakari Ailus <sakari.ailus@linux.intel.com>, Frank.Li@oss.nxp.com
Cc: Frank Li <Frank.Li@nxp.com>, "Rafael J. Wysocki" <rafael@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Andrzej Kacprowski <andrzej.kacprowski@linux.intel.com>,
 Karol Wachowski <karol.wachowski@linux.intel.com>,
 Oded Gabbay <ogabbay@kernel.org>, Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Tvrtko Ursulin
 <tursulin@ursulin.net>, Matthew Brost <matthew.brost@intel.com>,
 Thomas Hellstrom <thomas.hellstrom@linux.intel.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Alex Elder <elder@kernel.org>, Will Deacon <will@kernel.org>,
 Robin Murphy <robin.murphy@arm.com>, Joerg Roedel <joro@8bytes.org>,
 Rob Clark <robin.clark@oss.qualcomm.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Guenter Roeck <linux@roeck-us.net>, Guan-Yu Lin <guanyulin@google.com>,
 Mathias Nyman <mathias.nyman@linux.intel.com>, linux-pm@vger.kernel.org,
 linux-usb@vger.kernel.org, dri-devel@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 linux-hwmon@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 iommu@lists.linux.dev, linux-arm-msm@vger.kernel.org,
 linux-media@vger.kernel.org, linux-staging@lists.linux.dev,
 netdev@vger.kernel.org, imx@lists.linux.dev, Rob Herring <robh@kernel.org>
References: <20261029163044.3062958-1-Frank.Li@oss.nxp.com>
 <auRb_r8ZSSU-eHZA@kekkonen.localdomain>
Content-Language: en-US
From: Alex Elder <elder@ieee.org>
In-Reply-To: <auRb_r8ZSSU-eHZA@kekkonen.localdomain>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 10/30/26 3:57 AM, Sakari Ailus wrote:
> Hi Frank,
> 
> Thanks for the patch.
> 
> On Thu, Oct 29, 2026 at 12:30:37PM -0400, Frank.Li@oss.nxp.com wrote:
>> From: Frank Li <Frank.Li@nxp.com>
>>
>> When CONFIG_PM is not enabled, all devices runtime PM state should be
>> treated as active.
>>
>> __pm_runtime_resume() returns 1 (called by pm_runtime_get()).
>> pm_runtime_get_if_active() is the try-and-get version of pm_runtime_get().
>> stub pm_runtime_active() also returns true. So pm_runtime_get_if_active()
>> should return the same value as the stub pm_runtime_get(), which is 1.
> 
> Shouldn't the same change be done to pm_runtime_get_if_in_use()? It's
> otherwise the same, except that it requires also the use count to be
> non-zero.
I think "yes."

I think the logic for !CONFIG_PM should basically pretend runtime
PM is enabled for all devices, and they're all ACTIVE and effectively
in use.

That implies:
- disable_depth == 0, so usage accounting would (if enabled) be done
- runtime_status == RPM_ACTIVE (power is on, no delay)
- usage_count > 0
- runtime_error == 0
- Maybe ignore_children is false?

This might not be complete (and could be wrong!).

Some of the other dev_pm_info flags could probably be assumed false,
because they represent states in transition between ACTIVE and other
states.

					-Alex
