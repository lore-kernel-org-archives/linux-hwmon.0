Received: from mail-ot1-f43.google.com (mail-ot1-f43.google.com [209.85.210.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B58B6277007
	for <linux-hwmon@vger.kernel.org>; Fri, 13 Feb 2026 06:55:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770965741; cv=none; b=UqUvfuaE8VCjAaYEEO1hTVe4o3S9gEBkeFIiKofJVqqq1ymg59Vvk5HaSHuevlh8mjy4gMOc5qJ72oW38UFJkJpAs7wDhD9LuYGNPpibpRhLa/4B3NIOeLQwhhi7zYJO7IjaAaN4LyCSy6zwjwBVGa9U+zNgq+1bWeihWj3JMrw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770965741; c=relaxed/simple;
	bh=sTMx8lEvcnLLY4zMCQI0Kt09CDIjF4lLt2+r+Wo/BiE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=cYJGpBOjKM8b3CLlnI8GGPvSV0KC0iefeeesA/nMzp32aygKrV4nweQEn62U8Aet7f6vG0ItMDR2B8hQhuJUztMkRIZp9Yn72SwalV/JA/x83ekGt0t/WT4B3oSY+/iI92ySazzpOgouRpTnyTm9DvMDfFYy3R7ie+rWVFiIv2w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=minyard.net; spf=pass smtp.mailfrom=minyard.net; dkim=pass (2048-bit key) header.d=minyard.net header.i=@minyard.net header.b=anVFES7Z; arc=none smtp.client-ip=209.85.210.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=minyard.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=minyard.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=minyard.net header.i=@minyard.net header.b="anVFES7Z"
Received: by mail-ot1-f43.google.com with SMTP id 46e09a7af769-7d15b8feca3so606844a34.3
        for <linux-hwmon@vger.kernel.org>; Thu, 12 Feb 2026 22:55:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=minyard.net; s=google; t=1770965738; x=1771570538; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pfTgoVpApawEGawOItUes0+2N5MzHA5wDtH4Hi4KESQ=;
        b=anVFES7ZbBbTHo9VfR43V0m9ZSwmiQBtgqFPQOr+n+VpV8a84SQjZJ15p7VkdoAfKa
         XdC63Kb9IGhoDznxIBsxHKHbxOStMcztgZ2DRqhcLB1+xjb3WjHi7h+KBrYjXc2ncBnl
         KcFnVJWKxS2uXizc4X7sXY7ATmuGAvNcC29EHEDYBkME0GxbprRBSEcxlh77g1ywr0ew
         0VQrN5ZC7OrcoWZi08uXA51osHxQZri88riwPe9MlUVGsTwOxZatlYr6n7sn/yPTPsGs
         2vAy+tTQvZpG8XQZG+F6EFvJ6cJVpNXBRbCW3fi/wv7C7nTIwuNohHxqO+pnlLnja+Lt
         laUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770965738; x=1771570538;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=pfTgoVpApawEGawOItUes0+2N5MzHA5wDtH4Hi4KESQ=;
        b=AE4C3qbhqaOeg+wHJOz8vixhXmtBYFDfWVFgzMWiNVj2HpnaB3ivWCJUGl9ffi3z5d
         hlRTAa041i3u+pYh0ZXKIR/5WhXvKt9mGwNM05smfZRmIGlwpL7sv3YKQ9LKVvBFoohB
         0Cg0WmBd9066eCHXwlOc+U67+fK2veqKX77vaSw5iN9iCSsjZrWaJIHgV53Dsa9f8dnu
         AfCzoRFAiKI2I0v8xxpnFjcJsmxCAxOJKSK40DIkHgkpO1PTK1VAz5Hj0kCZ/GjIGmtY
         2EmGq+TiFZkf6GQvXJSPKUawMBcZJyhDWScgRvt8Cr3osBr82TIiNiAhEustKxT2crVU
         xbiA==
X-Forwarded-Encrypted: i=1; AJvYcCUqlaPoLFHVP8KEP5H4EybONKMIT9+dzUbB/w2Qhp6WvXgXT2yKLcOnmtjCccHY/0ry6ICTZ++MrNK0iQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YycCgaunNUexcbE4U6pWI0DvlOhlSCCIzP0u0Ew+TJajHUcahpy
	Iu9Daf3hkKP4ANiCBIegxLBwjLQ25x2boMmG0zDe15ETo/RVOuK3BbJEEjqXmRROs8M=
X-Gm-Gg: AZuq6aLsR+vDoLdrccgQcm8wud8RYjmeC2rJDfuCXdMnFhoUZrtArNy9wTNlWJt2ch0
	pIZNhP5ef3VtbjAqGVcjkWg4MTM+6T06myz9NLMsGbXIdACk1cdnslDo4NBLUbjHq5/B2RFo9L7
	vph1D3OmQIu6tT/Xw8cptG/fyUbIDVXMZiaXx6WV04ZzSHWwmyhSHNsZAN2ISCr0aUHVsHgM/nZ
	xcebRQLOMJ05kRJp4kh8T5Fsff8TaFO8xNzsGKYKYH2auDAD5aLeXcUyt+a5/5kuN8QLfsl9OTg
	64S/FJTGggbT/DQsuizs37VyiNpZ8AK+YPtnEaehFFSB0ME+4Mb0N3di5XMR24BZCV2EaBnddUy
	/ssnJf/l8ZbBZTHolSiyTedOG/PJ/dUJ0wM+7UOEP+1LpbFK9iRPx/8yj7gLvBX5jaf858+FSyp
	ZXOszPbLVi9g1MSrxL5tv/faTKVRmNRRrgezKhdCacBZhY1irD0F/tjvqd1stCtcwFQLguLtda6
	X92gg==
X-Received: by 2002:a05:6830:6f49:b0:7bb:7a28:51ba with SMTP id 46e09a7af769-7d4c4acb069mr432548a34.26.1770965738665;
        Thu, 12 Feb 2026 22:55:38 -0800 (PST)
Received: from localhost ([2001:470:b8f6:1b:a3ab:7352:1dc1:6b46])
        by smtp.gmail.com with UTF8SMTPSA id 46e09a7af769-7d4a754b4bbsm5380680a34.11.2026.02.12.22.55.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 12 Feb 2026 22:55:37 -0800 (PST)
From: Corey Minyard <corey@minyard.net>
To: "Rafael J . Wysocki" <rafael@kernel.org>
Cc: Jaroslav Pulchart <jaroslav.pulchart@gooddata.com>,
	Guenter Roeck <linux@roeck-us.net>,
	Igor Raits <igor@gooddata.com>,
	linux-acpi@vger.kernel.org,
	linux-hwmon@vger.kernel.org,
	Daniel Secik <daniel.secik@gooddata.com>,
	Zdenek Pesek <zdenek.pesek@gooddata.com>,
	Jiri Jurica <jiri.jurica@gooddata.com>,
	Huisong Li <lihuisong@huawei.com>,
	Corey Minyard <corey@minyard.net>
Subject: [PATCH 1/3] ipmi:si: Don't block module unload if the BMC is messed up
Date: Fri, 13 Feb 2026 00:52:13 -0600
Message-ID: <20260213065351.915707-2-corey@minyard.net>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260213065351.915707-1-corey@minyard.net>
References: <20260213065351.915707-1-corey@minyard.net>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

If the BMC is in a bad state, don't bother waiting for queues messages
since there can't be any.  Otherwise the unload is blocked until the
BMC is back in a good state.

Reported-by: Rafael J. Wysocki <rafael@kernel.org>
Fixes: bc3a9d217755 ("ipmi:si: Gracefully handle if the BMC is non-functional")
Signed-off-by: Corey Minyard <corey@minyard.net>
---
 drivers/char/ipmi/ipmi_si_intf.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/char/ipmi/ipmi_si_intf.c b/drivers/char/ipmi/ipmi_si_intf.c
index 0049e3792ba1..3667033fcc51 100644
--- a/drivers/char/ipmi/ipmi_si_intf.c
+++ b/drivers/char/ipmi/ipmi_si_intf.c
@@ -2234,7 +2234,8 @@ static void wait_msg_processed(struct smi_info *smi_info)
 	unsigned long jiffies_now;
 	long time_diff;
 
-	while (smi_info->curr_msg || (smi_info->si_state != SI_NORMAL)) {
+	while (smi_info->si_state != SI_HOSED &&
+		    (smi_info->curr_msg || (smi_info->si_state != SI_NORMAL))) {
 		jiffies_now = jiffies;
 		time_diff = (((long)jiffies_now - (long)smi_info->last_timeout_jiffies)
 		     * SI_USEC_PER_JIFFY);
-- 
2.43.0

