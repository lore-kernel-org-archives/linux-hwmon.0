Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD5FA2BDC2A
	for <linux-hwmon@vger.kernel.org>; Fri, 31 Oct 2025 04:41:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761885665; cv=none; b=I4N0HtXqIynLwqkI1OrqoEzV9a3PELF1lKPbx3Z08uwXIrmQEjf4wceJ46YBQkvuFeLq7uINlg9Utiz3lA9mWrLJU/kjAJXnY/HwZbg+X2w7IeqvJlMtYrMS0G3amzhu7yACLXalCd6G2P+Rfo2OY+jV566zFyEZZH7lfSMrhDE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761885665; c=relaxed/simple;
	bh=xm1kLLlZ8QYUI6qMFsmbQ2UeHqCoMYMXfw7ZjEhfXyM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=KJlFXf/ZdSA/FFJPm9ZqEw5pQuTb6DWlpBoTsEhefOHCQVCGuPs7NoA8p3zi0HuEX/t4iI2Ux/2Y1X2XO8dhCDq8NNbsa71ejcmj7fUeWLolEJPdtO2CRF2KWkk+hLc1FIw7d9yAknRidHmlYzI0ddV+fzi/GZoXxUzHetW7BEE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=reznichenko.net; spf=none smtp.mailfrom=dpplabs.com; dkim=pass (2048-bit key) header.d=reznichenko.net header.i=@reznichenko.net header.b=kKaC/5yd; arc=none smtp.client-ip=209.85.210.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=reznichenko.net
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=dpplabs.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=reznichenko.net header.i=@reznichenko.net header.b="kKaC/5yd"
Received: by mail-pf1-f174.google.com with SMTP id d2e1a72fcca58-7a27ab05a2dso1771638b3a.2
        for <linux-hwmon@vger.kernel.org>; Thu, 30 Oct 2025 21:41:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=reznichenko.net; s=google; t=1761885662; x=1762490462; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JdnadwcTawt/UEGEIma6luMK+Xpdo3yqchdI1J3A4DY=;
        b=kKaC/5ydquGRyFaMKZLA2hdpxOy5uSQVuoj5nyPPQIvGn09CdOb+g87iTv4C10zjsX
         zjgI02RZijDbsK2m7n0/HXcssHbVZWyPpkubRmw5+10WWsuAyf+kaKW7S5h3LAJOY8E5
         vfBLAq+loJ2DNFxyIiRogZZljJ6CHpkX7l1YzHtttH1qIfMavCwsqmzolQwXoeedO80z
         iB4S8iYdA0jJ/dgiwSMKm25k2WsSk/c1BOKuLjnrza0kkc1FJQc6SKWaLufttq1Hqbn3
         qZ4B6hDDwXg2Mel30elLgM2EOjaSjjd6Ur5+arnUmtb6S4Puq+eo4qlAdkX6YSAQmEvs
         eUGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761885662; x=1762490462;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JdnadwcTawt/UEGEIma6luMK+Xpdo3yqchdI1J3A4DY=;
        b=UAV2FqvEWzgpUkSIYs7Hf6a9TLUkATvlvXBGYUF/Rloonlzv/E3wggi2sjqLGkEBvL
         djfzPqPyOx0T2qfsEa7JTOpefXtcKZVL4ApXc614tw0oeqi1yFJCfbBupX7fKmImiJ5e
         WNq1WtXbt/gpHcDe/dfmaqV7bXcRv8ZWA8UPQ2pS6NTk7xTlW+B0d17NfvqMEaS+7JDG
         o/x1burcSwvHOgvBUWtKCPRkjwAeuO4nahJdGfo1/mZfx2zHS7QU/zI/oQ1aCl8Q8kkT
         WsK/cnR8MO8hohMBHaHI8gwA6dDNKfjp7JDWo4EFC65AfMMPrP5K7XZ1p5sXjE+twP16
         0dpA==
X-Forwarded-Encrypted: i=1; AJvYcCUuxnUO6AGcBUYpDxMFDyscjTcTEC9cj74oR1Ig7UdCNkTnRcRlqOBpqpH4b/NNnC3ljl/ZZwRDo9aX3w==@vger.kernel.org
X-Gm-Message-State: AOJu0YwbVSay6gJGMli8ccO4cMmFl7dnjTstAn+wURdMH7CcTbLvxn8D
	5Poc9Br6Nh4baRi/+bGnaWtH8jEqmqRNRqGH45T7CEcTve0eqqBDwYYsn69iJteMHoU=
X-Gm-Gg: ASbGncuowrOgR0/0OYDnfBCFe+vSeSjZAOvE9LVZDRQUDmrveY3L9SZLirmurQ3Adib
	T22ezpyUVSTRgmxtHFSy/3zOomDzCpQGCYS3/kHVEYyA04U+bhR8lrRSAbYnyL3bvTqa/JLSWQP
	PqindjnznvwIfNEccqdNFlHKAnF3MdDoeVGhhbq+lvi0z3JocHheOKQGkgwz9/DO/AlmcRf5Kkm
	M5X8zdOHiUYpxpqAcRj2VytAh/F9zWylP5pjJTE4fkQz4vQBOOyzE7nJOOasrEUkVU+irmc/cfE
	vOMHAMTI2aOQgsmHJQ4bgEKZFVTgmK/UXmFFOgSb27D/pNY2YZSuvtx2Kli+YGuewPwt9VeKaQr
	Lv0PSrQhN87aisn7A8jyQ39BlTYLfd6vRbNAjhy8Hlbjj81ShuwyyibXU4hnPEJLolwgwKk+eGE
	vsTNy6GQ==
X-Google-Smtp-Source: AGHT+IE01ibbxoTk4WwnS0PNINpOsBGL2W4lqWf8ORWbKUs1964WrFpG3w7OEqs1++R2JieyDQyk7g==
X-Received: by 2002:a05:6a00:1826:b0:7a2:8ac0:7ca2 with SMTP id d2e1a72fcca58-7a7799adc31mr2393559b3a.31.1761885662008;
        Thu, 30 Oct 2025 21:41:02 -0700 (PDT)
Received: from z440.. ([2601:1c0:4502:2d00:ae30:6f8:71b7:2e95])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7a7d8d7273fsm616450b3a.24.2025.10.30.21.41.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Oct 2025 21:41:01 -0700 (PDT)
From: Igor Reznichenko <igor@reznichenko.net>
To: robh@kernel.org,
	linux@roeck-us.net
Cc: conor+dt@kernel.org,
	corbet@lwn.net,
	david.hunter.linux@gmail.com,
	devicetree@vger.kernel.org,
	krzk+dt@kernel.org,
	krzk@kernel.org,
	linux-doc@vger.kernel.org,
	linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	skhan@linuxfoundation.org
Subject: Re: [PATCH v2 1/2] dt-bindings: hwmon: Add support for ST TSC1641 power monitor
Date: Thu, 30 Oct 2025 21:40:59 -0700
Message-ID: <20251031044059.714744-1-igor@reznichenko.net>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <85e83f3e-3509-484b-8cc8-110156d5a2ab@roeck-us.net>
References: <85e83f3e-3509-484b-8cc8-110156d5a2ab@roeck-us.net>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

>On 10/28/25 08:17, Igor Reznichenko wrote:
>> Understood. The bit in question controls the alert pin polarity on the device side,
>> independent of whether the pin is used as interrupt or not. I'll drop the property
>> for now and revisit if there's a board that actually uses an inverter or needs to
>> program the bit explicitly.
>> 
>
>This is kind of unusual. The requirement used to be that devicetree properties
>shall be complete. "Only if there is a known use case" is a significant policy
>change. Has the policy changed recently ?
>
>Thanks,
>Guenter

Rob, following up on Guenter's question above.
I'm not sure whether it's better to drop the property as discussed earlier or keep
it for binding completeness. 
Could you clarify what approach is preferred?

Thanks, Igor
