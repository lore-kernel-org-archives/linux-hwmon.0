Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0BE5D27F198
	for <linux-hwmon@vger.kernel.org>; Thu, 10 Jul 2025 18:11:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752171066; cv=none; b=m5xV91A2faKJN4X209IXd0UT3U76+YFhEV8YGZEBxIlrcdzFOjLQz79HKdsL60/LJcDnllQfT2f/hatIp0dI+XXj5jS++cveJlFBLa1ckxJAPr/1YfJN10rYOPVid73p7QgaHhywq6q5SyctGRNd1XaNv4++WZmUHSwsvM2Qm1I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752171066; c=relaxed/simple;
	bh=kyRQoyVM2bzWbnGPxc1gi9+NEdvtsmR7MWvYL04wqOE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=q/HJxE69onEG+cnh0A+wvTi/eLfjRluDfEP9qLCAG7s++82URK1NB+VyzfpeX6XlyqaRUcnukXor1vJ/QLojSVT2YpmhopLGzrisQC7+KR1cQ9NJety7ZsUsaUcsD6XxqUSunO7ZskFUkEKvLv5OI3wi7YK1KWzvjt21S8acc0U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=MX7dmqd9; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="MX7dmqd9"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1752171063;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=UDaamw5XinBR9QkXrVlCRaMipACe0i/+L3o+AWfTDMU=;
	b=MX7dmqd9E4IBMZIpYOzdSqAlr1BEMMtW2g62ox1cWdA4T0VjDyQ8c1VTgbNMZ45eJdHU1X
	2q0bR2lWtPTlvMvfmMbp4llKtM8CeuVq61V+oeLx3NLiHouDAqPpk+zEnC99xMIJlAqkeE
	0wMDdXyHRnjGL5lHAdai0DDIHNTf56k=
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-159-VBvUeXcsOF6cq4pTlNrwWg-1; Thu, 10 Jul 2025 14:11:01 -0400
X-MC-Unique: VBvUeXcsOF6cq4pTlNrwWg-1
X-Mimecast-MFC-AGG-ID: VBvUeXcsOF6cq4pTlNrwWg_1752171061
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-7d413a10b4cso214007685a.1
        for <linux-hwmon@vger.kernel.org>; Thu, 10 Jul 2025 11:11:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752171061; x=1752775861;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UDaamw5XinBR9QkXrVlCRaMipACe0i/+L3o+AWfTDMU=;
        b=teHpGWq0KNES8J9CeZI/zFUSdXov9MpTcTpgSgnW01J/ILKjQV1Kkr8zPargvGL+eP
         nOFka7vre2ucUurM9oHFyziUNeALssNBHFJg7a7CAkK3+9mAAHvvj3yvX70KeYIpC7gy
         YX5mtGa5wAXUKeA5B2dCpKEbRXnUKXolDdaBdoimW0aiyo4eV1yClaW+HXlXmw4ha38z
         fa4LFlqoVZVkiQMBowFpzJY4QjwzoRUTQxjRzjdXL+UHLq3gB0i8iTWjgHgMGh5cfMbr
         lUrQ18o1ZhKJFqSvh2qyr3jsfdhZC9cwMM6TO4YPONTdyRsQJgIuGnvrxizDoa8ze1t+
         x28g==
X-Forwarded-Encrypted: i=1; AJvYcCVMoMjKrym6CwAewJFak2L/5d+2283F6ZZiqbtycD3dyGOi2whowOg39f5XpbCmSeXxh2f1IeA/jSJkzw==@vger.kernel.org
X-Gm-Message-State: AOJu0Ywnc9ETdsQugJ5ia5YgiVWHa09jV18RlcBqyIyw/A9JW69Jwloj
	q8aKU8M6RxHiGjy1xeCt+Vftx9d4rmnDUgVAwgiQxu9kfHu42qsyPJS5h1n53D7zx/TJ2RiRgzk
	4aiVOn9KzkacrzEeqac5Y04PPbFhJGGphdTTkleIrMd/3/CsGUMdefuwIiON9mK50
X-Gm-Gg: ASbGncvlrDSxyfBBdcvEhQBh6cHM/nGDTtaUAfT+q4oJBw+oZNLxmCNiEdcV3TBUTNe
	VVRPRv6YQb7nSebA2K+MRhG3uW6coR1Qt7C3fcKEET14yvJ8maDaVZ02k458C5jM78TnnqLkdTK
	zYnGvRFcZHABElF5tCfRKFk4UqauWQu/fqaJzRV2ftBDQbsPIIOQXl7hFvBl9HoPzMTEuw0hx6q
	LiirUrWSZzqfK5SEwb+tp/Jwji2g6Hsy5mLAkEfxz0VfcQJBI44dphlef7IA1TSVFFE/JCkLYAx
	AfdcLGvQTk7oPN+Kn9CrpattvZYnrXFpuX79G0oCa5mihf1PYUXLsLsoxxZZ
X-Received: by 2002:a05:620a:4726:b0:7d5:dcd9:57f4 with SMTP id af79cd13be357-7ddea818e2bmr78794585a.18.1752171061196;
        Thu, 10 Jul 2025 11:11:01 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEYWoqzrM13LlMP0WzQq6WZZk3qyqsWk5e4K0LKkki76ZGMrwuKyffsVmVRcU9EDW0/eLxBfw==
X-Received: by 2002:a05:620a:4726:b0:7d5:dcd9:57f4 with SMTP id af79cd13be357-7ddea818e2bmr78788985a.18.1752171060677;
        Thu, 10 Jul 2025 11:11:00 -0700 (PDT)
Received: from [192.168.1.3] (c-73-183-52-120.hsd1.pa.comcast.net. [73.183.52.120])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7dcde806289sm124403285a.78.2025.07.10.11.10.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Jul 2025 11:11:00 -0700 (PDT)
From: Brian Masney <bmasney@redhat.com>
Date: Thu, 10 Jul 2025 14:10:41 -0400
Subject: [PATCH] hwmon: ltc4282: convert from round_rate() to
 determine_rate()
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250710-hwmon-round-rate-v1-1-64fbe4bf3d05@redhat.com>
X-B4-Tracking: v=1; b=H4sIACACcGgC/x2MywqAIBAAfyX23IIaEvQr0cFqyz2ksfaC8N+TY
 C5zmHkhkTAl6KoXhC5OHEMRXVcweRdWQp6Lg1HGqlYr9PcWA0o8w4ziDkI9msK4WGcbKNkutPD
 zL/sh5w8hKVKwYgAAAA==
X-Change-ID: 20250710-hwmon-round-rate-1b21b2bf5a53
To: Nuno Sa <nuno.sa@analog.com>, Jean Delvare <jdelvare@suse.com>, 
 Guenter Roeck <linux@roeck-us.net>, Maxime Ripard <mripard@kernel.org>, 
 Stephen Boyd <sboyd@kernel.org>
Cc: linux-clk@vger.kernel.org, linux-hwmon@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Brian Masney <bmasney@redhat.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1752171059; l=5669;
 i=bmasney@redhat.com; s=20250528; h=from:subject:message-id;
 bh=kyRQoyVM2bzWbnGPxc1gi9+NEdvtsmR7MWvYL04wqOE=;
 b=6eQpeXc1h08bv2MtiVCAFjsSZrIXlAVycUsMGd5pLQ4KsDXNvjBRCIiUC0L5D2hdf/GXf0G8Y
 8Y30vGDGn/qB/i6oj2zQH7Ti/uRnt5rMGt6Znb6AwrL7fqIqUn6jpuy
X-Developer-Key: i=bmasney@redhat.com; a=ed25519;
 pk=x20f2BQYftANnik+wvlm4HqLqAlNs/npfVcbhHPOK2U=

The round_rate() clk ops is deprecated, so migrate this driver from
round_rate() to determine_rate() using the Coccinelle semantic patch
appended to the "under-the-cut" portion of the patch.

Signed-off-by: Brian Masney <bmasney@redhat.com>
---
Coccinelle semantic patch is below. It's large and I don't want to
pollute the kernel changelog with the same code hundreds of times,
so that's why it's included under the cut. For subsystems with more
than one patch, I've included it on the cover letter.

    virtual patch

    // Look up the current name of the round_rate function
    @ has_round_rate @
    identifier round_rate_name =~ ".*_round_rate";
    identifier hw_param, rate_param, parent_rate_param;
    @@

    long round_rate_name(struct clk_hw *hw_param, unsigned long rate_param,
                  unsigned long *parent_rate_param)
    {
    	...
    }

    // Rename the route_rate function name to determine_rate()
    @ script:python generate_name depends on has_round_rate @
    round_rate_name << has_round_rate.round_rate_name;
    new_name;
    @@

    coccinelle.new_name = round_rate_name.replace("_round_rate", "_determine_rate")

    // Change rate to req->rate; also change occurrences of 'return XXX'.
    @ chg_rate depends on generate_name @
    identifier has_round_rate.round_rate_name;
    identifier has_round_rate.hw_param;
    identifier has_round_rate.rate_param;
    identifier has_round_rate.parent_rate_param;
    identifier ERR =~ "E.*";
    expression E;
    @@

    long round_rate_name(struct clk_hw *hw_param, unsigned long rate_param,
                  unsigned long *parent_rate_param)
    {
    <...
    (
    -return -ERR;
    +return -ERR;
    |
    - return rate_param;
    + return 0;
    |
    - return E;
    + req->rate = E;
    +
    + return 0;
    |
    - rate_param
    + req->rate
    )
    ...>
    }

    // Coccinelle only transforms the first occurrence of the rate parameter
    // Run a second time. FIXME: Is there a better way to do this?
    @ chg_rate2 depends on generate_name @
    identifier has_round_rate.round_rate_name;
    identifier has_round_rate.hw_param;
    identifier has_round_rate.rate_param;
    identifier has_round_rate.parent_rate_param;
    @@

    long round_rate_name(struct clk_hw *hw_param, unsigned long rate_param,
                  unsigned long *parent_rate_param)
    {
    <...
    - rate_param
    + req->rate
    ...>
    }

    // Change parent_rate to req->best_parent_rate
    @ chg_parent_rate depends on generate_name @
    identifier has_round_rate.round_rate_name;
    identifier has_round_rate.hw_param;
    identifier has_round_rate.rate_param;
    identifier has_round_rate.parent_rate_param;
    @@

    long round_rate_name(struct clk_hw *hw_param, unsigned long rate_param,
                  unsigned long *parent_rate_param)
    {
    <...
    (
    - *parent_rate_param
    + req->best_parent_rate
    |
    - parent_rate_param
    + &req->best_parent_rate
    )
    ...>
    }

    // Convert the function definition from round_rate() to determine_rate()
    @ func_definition depends on chg_rate @
    identifier has_round_rate.round_rate_name;
    identifier has_round_rate.hw_param;
    identifier has_round_rate.rate_param;
    identifier has_round_rate.parent_rate_param;
    identifier generate_name.new_name;
    @@

    - long round_rate_name(struct clk_hw *hw_param, unsigned long rate_param,
    -               unsigned long *parent_rate_param)
    + int new_name(struct clk_hw *hw, struct clk_rate_request *req)
    {
        ...
    }

    // Update the ops from round_rate() to determine_rate()
    @ ops depends on func_definition @
    identifier has_round_rate.round_rate_name;
    identifier generate_name.new_name;
    @@

    {
        ...,
    -   .round_rate = round_rate_name,
    +   .determine_rate = new_name,
        ...,
    }

Note that I used coccinelle 1.2 instead of 1.3 since the newer version
adds unnecessary braces as described in this post.
https://lore.kernel.org/cocci/67642477-5f3e-4b2a-914d-579a54f48cbd@intel.com/
---
 drivers/hwmon/ltc4282.c | 12 +++++++-----
 1 file changed, 7 insertions(+), 5 deletions(-)

diff --git a/drivers/hwmon/ltc4282.c b/drivers/hwmon/ltc4282.c
index 424fa9e3a0993f74d7bd1b2e3c98acd954217a98..dbb30abcd343f3dac46bd87cc52638b75eb5b275 100644
--- a/drivers/hwmon/ltc4282.c
+++ b/drivers/hwmon/ltc4282.c
@@ -177,13 +177,15 @@ static const unsigned int ltc4282_out_rates[] = {
 	LTC4282_CLKOUT_CNV, LTC4282_CLKOUT_SYSTEM
 };
 
-static long ltc4282_round_rate(struct clk_hw *hw, unsigned long rate,
-			       unsigned long *parent_rate)
+static int ltc4282_determine_rate(struct clk_hw *hw,
+				  struct clk_rate_request *req)
 {
-	int idx = find_closest(rate, ltc4282_out_rates,
+	int idx = find_closest(req->rate, ltc4282_out_rates,
 			       ARRAY_SIZE(ltc4282_out_rates));
 
-	return ltc4282_out_rates[idx];
+	req->rate = ltc4282_out_rates[idx];
+
+	return 0;
 }
 
 static unsigned long ltc4282_recalc_rate(struct clk_hw *hw,
@@ -1124,7 +1126,7 @@ static ssize_t ltc4282_energy_show(struct device *dev,
 
 static const struct clk_ops ltc4282_ops = {
 	.recalc_rate = ltc4282_recalc_rate,
-	.round_rate = ltc4282_round_rate,
+	.determine_rate = ltc4282_determine_rate,
 	.set_rate = ltc4282_set_rate,
 	.disable = ltc4282_disable,
 };

---
base-commit: b551c4e2a98a177a06148cf16505643cd2108386
change-id: 20250710-hwmon-round-rate-1b21b2bf5a53

Best regards,
-- 
Brian Masney <bmasney@redhat.com>

