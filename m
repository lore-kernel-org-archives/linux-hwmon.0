Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B604728E3F
	for <linux-hwmon@vger.kernel.org>; Thu,  5 Jun 2025 03:59:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749095991; cv=none; b=cG973J3kkk3hWqJMJtxFWQbM27ow409scVIOsd/pI37Qs81Y19KdqO1Vi/+ZRiDh2JAPKbce1alko1MCEKe9bFpj1k03Jw8te0jRCSjgeIQ5UXvKKFGUAXPdmoEKAtB3yjZuAUOr6F3c/6PrVDUGJzVSk0WHRESP2GqE7XbpMbI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749095991; c=relaxed/simple;
	bh=a99DJB7kgqKr/Mq3XFCGHLdwCFggirioNhGpFPuOmrc=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=DqLhFsJmxBbZ8XQW+qd9fvumzTCicsW2PoSMTvtTTuAZ7zDQxR+3fGFGPan03dzUaExOFJ1Xf05Sr3j6WcKCwIJcA/RdzcK7Z5Vih9MDBsYm2Gg+zzC3QKMNbUCraRknyfFtpYG8YX63SM3GiOqAwMWhRJr7pvwlUPW811Io5cg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=inventec.com; spf=pass smtp.mailfrom=inventec.com; dkim=pass (2048-bit key) header.d=inventec.com header.i=@inventec.com header.b=GUoaivs9; arc=none smtp.client-ip=209.85.216.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=inventec.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=inventec.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=inventec.com header.i=@inventec.com header.b="GUoaivs9"
Received: by mail-pj1-f52.google.com with SMTP id 98e67ed59e1d1-311c95ddfb5so436874a91.2
        for <linux-hwmon@vger.kernel.org>; Wed, 04 Jun 2025 20:59:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=inventec.com; s=google; t=1749095988; x=1749700788; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SzkZstCCrPCWPsZ455Qf8TsSyXtheVsZkxKhV0y9aO4=;
        b=GUoaivs9kiZYpzwlYhipgAbl+2mUua5o1Bx68wK1PfOd7ujianyReMF6esYRs6UyXt
         phfbKOWiKiJhJv8eSneKtwh3fKAp9wC1yvo6Ir75cnqWk8X9mAuwNVNRiLfaiOeGOa9E
         yxPB/z9q25hVBcHrvcU8LoiTU0jKlr8ICGkeDKnjWTp+pH1gM0yiBadJqPVRrzYK6jzB
         DYACxj+sGvOME5fED7QuIO+sCrLppUd5IphfwgazXz24kJeHJh0JrWv/aGdIpcApsFl9
         2oYLknrAwLI5kbrEM2LXOJowH3zFNl5wzw85fqMN6TxJquLmS3WXBUGHGg4FUuKHQsgX
         Mh6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749095988; x=1749700788;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SzkZstCCrPCWPsZ455Qf8TsSyXtheVsZkxKhV0y9aO4=;
        b=w70jjCw9vMkVbWseR49Uo0u9oxUY82n971J1+5XWRf/OiWwsbqNYKUCIb+12k5nYgk
         Wiwo3310O4vuzAIK5qV22nOqsFjIqOCJLgatOh83efnhQkR6k2fLydTfyj0iVWw63jhF
         kZ8qOSYB6hCGeGhsRnHNDls+mNGD7x4PCJxZhnf+Xa/vJ/mzpVgdtTfkUtMbcfEuwVK+
         ZsfYSLT3lZPfjw2kvy0IGj1xJF5Rto6C/8ZvVhuQqvVZ4+ms7jim8OFGQJ31GWh0U+RT
         kD6iLeFK7SESeX0Uj9x0cXKC7XZIvIIOn5gadtGk5+aC/tuBcBOjcj24ZIQztH7PmSA0
         Y1gA==
X-Forwarded-Encrypted: i=1; AJvYcCXj4SkVmNsHzvlLm3imJ4hF1Sbl4c0e03U+r9fI8T3/ujn9i/6nigbaeuM5QJOPti7VdGhVBYW6SqsCZg==@vger.kernel.org
X-Gm-Message-State: AOJu0Ywum4/7cKlU1+wIUazjbm8uhfsCRHn/iBHR0qSa7cJHHYlFvvRy
	/a7oA99aFmLuTkkEG6sQ9UTAurWmKQwpH3pr6w5Uw78NOuOu2OIcCynPFI1t/awMJbE=
X-Gm-Gg: ASbGncus3OfYYbysBp+r69iv1fPgNm1Y+aM5eYPmoHXWtlZmG+hegvxdqDxYiLIWpCA
	lL9l7qMWVrVxsC524QPCQxmT6DZq08OPwopZosz5pQZD8R2b+8WVNmBwzEH7TKX0rxp7wqEusn8
	OouQG2fyJhBn4Acokm87dMFCO/0q60B6yr184csvztF+8bMcG5zPOk2ZWuOqkq7zppYVL6kvCvh
	KTtUu3j2kSR8DZ0gukk6oo2tLCwDU70EQTJCgyX69NICdPvkQSaayxMf16QorSG/cL15bZTUE24
	GiN1ANDC7n+weAGkWHyKcVqDehp0r7QpzmkkbjsyLtnlrEdOeel7sQiyPwXho9Ff3ix0f5tf
X-Google-Smtp-Source: AGHT+IHwOv1nfgRYxTOZRYlHLTPEDAVKxSayaPRlTfw7ratzj7blGucqQmZiYitkUOV/1EwZKzf8Ew==
X-Received: by 2002:a17:90b:55c8:b0:313:287e:f1e8 with SMTP id 98e67ed59e1d1-313287ef202mr2764388a91.8.1749095987904;
        Wed, 04 Jun 2025 20:59:47 -0700 (PDT)
Received: from localhost.localdomain ([123.51.235.216])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3132bff66d1sm495400a91.7.2025.06.04.20.59.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Jun 2025 20:59:47 -0700 (PDT)
From: Chiang Brian <chiang.brian@inventec.com>
To: krzk@kernel.org
Cc: chiang.brian@inventec.com,
	conor+dt@kernel.org,
	devicetree@vger.kernel.org,
	geert+renesas@glider.be,
	grant.peltier.jg@renesas.com,
	jdelvare@suse.com,
	krzk+dt@kernel.org,
	linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	linux@roeck-us.net,
	robh@kernel.org
Subject: Re: [PATCH v4 2/2] hwmon: (pmbus/isl68137) Add support for RAA229621
Date: Thu,  5 Jun 2025 11:52:33 +0800
Message-Id: <20250605035233.3394026-1-chiang.brian@inventec.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250602-elated-aspiring-squid-d27ee4@kuoka>
References: <20250602-elated-aspiring-squid-d27ee4@kuoka>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Mon, Jun 02, 2025 at 07:55:37PM GMT, Krzysztof Kozlowski wrote:
> 
> On Mon, Jun 02, 2025 at 01:04:15PM GMT, Chiang Brian wrote:
> > The RAA229621 is a digital dual output multiphase
> > (X+Y <= 8) PWM controller designed to be compliant
> > with AMD SVI3 specifications, targeting
> > VDDCR_CPU and VDDCR_SOC rails.
> > Add support for it to the isl68137 driver.
> 
> Please wrap commit message according to Linux coding style / submission
> process (neither too early nor over the limit):
> https://elixir.bootlin.com/linux/v6.4-rc1/source/Documentation/process/submitting-patches.rst#L597

I'll wrap the commit message body at 75 columns.
Thanks for the pointing out.

> > 
> > this patch depends on patch:
> > dt-bindings: hwmon: (pmbus/isl68137) Add RAA229621 support
> 
> No, it does not, please drop this sentence.
> 

I'll remove the incorrect sentence as well.
Thank you for the patient reviewing.

Best regards,
Brian Chiang
