Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5861323BCEE
	for <linux-hwmon@vger.kernel.org>; Sat, 11 Jul 2026 05:39:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783748367; cv=none; b=iCzyOSCPR/tbLd/PRWOlu0iyLKwm3i37fwj6wfTBcULS6aDZMgQpbhQ84FFR8bBBl4tjrB641ji20kKMcZBBKKTjGrr9fgiOpO1UyzXpNcrZl9u2mGLH9T0DOx2gpge3+noAktdQG2EWEoQypNJClEOJTaG7Pifa87BVugg+seM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783748367; c=relaxed/simple;
	bh=6NB1ligMnhLaNdPPWtbqnzPbWmcoC0+mgUEzLs/JWfk=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=Jjkh4UaYJjBgGTw/jqBdKLMvsNj7jSQeS1fq3RW0t3IPGSh7oCImH95Q138AniMT938pGmxvu0kHntS5mZm09h6EZaWr/cPFA8k6c9RmuA62lOUCoGZLj+Ad9sI2ytytoJbmzFlCY7bTNm2PftsPAs6tX85j+MbXJvkn9pX9O8M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=debian.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.214.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=debian.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-2cace91f112so13175305ad.0
        for <linux-hwmon@vger.kernel.org>; Fri, 10 Jul 2026 22:39:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783748366; x=1784353166;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=iGN4+dQCsMeYqkRhsx/ElejEzpuXe2xoOuPYa2sMmgI=;
        b=CyFKEq/F54QLUDZ+fXFjp/OUYFefK7EKx8qKFP1VIclC43ar8DG2CPOnSdMYJucaj9
         yTbQjT9xPrhWLr8w2hrKWZ+L778JhUtjnQaHc060v2XrF8YOnRB/LLYf1RIzHVnctJPn
         WFhdO221YmQPD7mcv3JScvF2go5y19SHHW1EH5e0VSI1x67DLTrg3uhv2xpfwL/YrbIa
         CcyiR87Zfoo20TMfhR3qXkm0vs6+8udnpcKJlD5RA9igboLOLG5VxINfNQCGECH+s3IB
         0/P9nIvNMM0NrVxijL0WPfAH9yWMngF5cW8Az/0aiaKzXp18oqoBg3MuRiddn3PzXJ35
         /pww==
X-Forwarded-Encrypted: i=1; AHgh+RpZF3hYkQM2UVZi6ykSR2k/cg3HnsYjob/Aa5KZ5kEePOFSbAk2Men3q4Qa4QC34z7/jPzaN15GjZafVg==@vger.kernel.org
X-Gm-Message-State: AOJu0YwCYd1LKg3jVnsaSya3P2kqf1pDvVYK1Yz59z5wEuDz66WWGqny
	Dju7mbyYSRV80U6ewSyCYYI1oUNjaqcaUJj1GHPQVPF5JYA9h0iJ9nQ=
X-Gm-Gg: AfdE7cnkYitcp/oQV2y61i37LtbnfK/QuEzkLgMBG8lHld7GUnRUwYD/QJ+HtHJ1tGO
	PdbrVjQBedhzKlUZlubVNwdBac6a2ZrM4i2A2FqskhXiLucEhpZUMvYx5/PwsXnJyBd4N1a5+IM
	deVIx2ylmNgOLLMJrEDtW0EAc0ej7rKKfBXywN527uhyvC917G+yKtTRhx/hYyYUpzEqhV4UurP
	soSyrvIbz7CFW2DyOMq/vqXYTXfbX6//u5wZbAguFh1jAdtKJbMfpdrmL7/lrW0jbzd83QUK9NV
	1gYfm6yUPxhSRl8lqOQG0ZRjYGVho9nwl5XGLU+tn4UpEnojPgIcL12DeR6SsWzwQmIO+0s1Zhl
	1YvrFYcnPYoF/h35etNe9ME/rveJbnQg3aSfrlyF4TJjpshpGl26BAnY+YLAmgTYUh/OHPRo/XG
	pn8b5m92iJbHA0cOzIU6R1UeSPgNs90WREAGk0OmuER03FfZsJJvPwYxqAjElW9w0vLoCgzWi+7
	/eVB/Pa5ID19pNof36NFtpGFg==
X-Received: by 2002:a17:902:d546:b0:2c9:cf62:6f61 with SMTP id d9443c01a7336-2ce9eac212bmr21722115ad.17.1783748365698;
        Fri, 10 Jul 2026 22:39:25 -0700 (PDT)
Received: from penguin.tail0a1999.ts.net (61-228-52-13.dynamic-ip.hinet.net. [61.228.52.13])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ccc9d3bc1fsm69011255ad.55.2026.07.10.22.39.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Jul 2026 22:39:25 -0700 (PDT)
From: Shih-Yuan Lee <fourdollars@debian.org>
To: Henrik Rydberg <rydberg@bitmath.org>,
	Guenter Roeck <linux@roeck-us.net>
Cc: Armin Wolf <W_Armin@gmx.de>,
	linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Shih-Yuan Lee <fourdollars@debian.org>
Subject: [PATCH v3 0/1] hwmon: (applesmc) Convert to hwmon_device_register_with_info
Date: Sat, 11 Jul 2026 13:39:14 +0800
Message-Id: <20260711053915.4834-1-fourdollars@debian.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20260710123236.10508-1-fourdollars@debian.org>
References: <20260710123236.10508-1-fourdollars@debian.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi Guenter, Armin, and Henrik,

This is v3 of the patch series converting the applesmc driver from using
the deprecated hwmon_device_register() function to the modern
hwmon_device_register_with_info() API.

Changes in v3:
- Fix a recursive mutex deadlock in applesmc_hwmon_write() when writing
  to pwmX_enable by using applesmc_get_entry_by_key() to resolve the entry
  locklessly and then calling the underlying raw read_smc/write_smc
  functions directly under the mutex lock.
- Fix a fallback fan label truncation bug by pre-padding the generated fallback
  string with four spaces so that the "+ 4" pointer arithmetic offset yields the
  correct label "Fan %d".

Changes in v2:
- Abandon the minimal dummy registration approach in v1.
- Fully convert the driver to modern HWMON ABI standards by dynamically
  allocating temp and fan channels at initialization.
- Rename legacy non-standard attributes to comply with the standard HWMON ABI:
  - fanX_output -> fanX_target (HWMON_F_TARGET)
  - fanX_manual -> pwmX_enable (HWMON_PWM_ENABLE)
- Dynamically register the remaining non-standard fanX_safe attributes
  under HWMON class directory via extra_groups.
- Load and cache fan positions in smcreg.fan_positions to support returning
  labels by reference in .read_string.
- Clean up unused static attribute groups and show/store callback functions
  to avoid unused symbol compiler warnings.
- Verified compilation and successfully tested on real MacBook hardware.

We appreciate your review and comments on this refactoring.

Shih-Yuan Lee (1):
  hwmon: (applesmc) Convert to hwmon_device_register_with_info

 drivers/hwmon/applesmc.c | 464 ++++++++++++++++++++++++++-------------
 1 file changed, 315 insertions(+), 149 deletions(-)

-- 
2.39.5

