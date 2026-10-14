Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD10656510E
	for <linux-hwmon@vger.kernel.org>; Wed, 14 Oct 2026 17:34:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791999263; cv=none; b=dQZyeV+n0UXQkutAnOj5+KVKEzc7K6uFwJ9zVxtmfAygiGrxZG6IRFM4fnkksApKMXzq4GbTnviKjBctlQRtPfs5Ts7s7au+4VBzdzU8FPX1lqX477UNojk3Uf6z79e8P8EKaOomKYpi2mD4NyVL3iIKssSqSRD7KGCAYicHU6c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791999263; c=relaxed/simple;
	bh=HCCwccNtMSECrm+qSwkwcmxAaGpiINoZ+NAiQVr2tpE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=bUw8zm8XFB8ZjUJaEAPENEFneKxRBL8nSHMHMikr+mFnTvCS+spcqrKc5szv94LLlWZ4C9T31AFhdx+IYn3rcXsnTf8nUg3HsBI6PWgIEjfjiw2XMs+yeffEhHs08xktmtphxjsuVz9vP6BwDtJJ4ayQ5fVJziAIlrtaip6Gw0I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BHtNqHWp; arc=none smtp.client-ip=209.85.218.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BHtNqHWp"
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-c3ee49054ecso10645966b.3
        for <linux-hwmon@vger.kernel.org>; Wed, 14 Oct 2026 10:34:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791999257; x=1792604057; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=NA2euEzeRdMqsgpTzmLVhgxwMW/bnldVdN9i+bZJu5Q=;
        b=BHtNqHWpGAe5rH0lbkmum0ZWkNmpqDGDmQ5K0PA53CP+pLwsPeLCSVHZNhGPfGQdNA
         7WkM/8mRRPDUlrJDxb0KAQ+eeFuk70vftn4izvQ0BlDLXwcPH5WpuIHFfllnYqN8rViM
         XzvvK8C9ETDxOHMWMM8s3W9ULbmhC1eWs5rqdzA35Mp+7bAa9kRg6WWhTTauxOtijEoE
         UeMiTeSvA1Rm7T/i2CE5uIoIRoKZbhYv1iRObBLTnmk8xUV8uQuk9HmGUrgsDGZtRPKi
         o3mjwGCu2DmaNAhS8aKWOFDeEpWn6IC1Q2b5g/DpgiJ6RPE08jvqinYq1Uw4Qm9LrkvH
         cFeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791999257; x=1792604057;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=NA2euEzeRdMqsgpTzmLVhgxwMW/bnldVdN9i+bZJu5Q=;
        b=LNjWCy6wqCkyofEuBnz55fdpIt2rU9hpLYl0Z01GkNKsq4vqdl5Vq1HDWwVmGt0Tfz
         DrJvB2GjDOt0NGPzs9RL+Jhzr9Ng/BmBlpVzCHH0/nIPSnAzQfx7+m9D1qCJU+5q1Qke
         4JhVfODvqzhIKEFI+PzJFdqMaowYueENfookyvkv53JzL7wxeMAMHmhfnYsitGOADNYn
         HZmjasotM/33XQQBuHxMv3m0oYZVDBb01y0TVAnKLq4JPXhZyD2LtzPr1YZGq3rhtSCj
         3Wltms5Z0tsmoSycUcRvfBTRuEsvgfmHnkc34OM3w6IhUYnsCkMXe7jEuUgs3VlSMmZI
         DmBg==
X-Gm-Message-State: AFq9FYJXRB72eaeqf8kOa9qzgEj+prsfQRU0IDDwhtYqWGNhbe2L1zHO
	0K+HKhiIUMGqxj4V9NMeuLu/AB+ZyS251zGEH6fil6Q6CL72VbmIwh5A
X-Gm-Gg: AYBFou2PnrKroEu32ohA+AcixlDPG623drYUeTzSPJNnEJ7b2RQZ1uQncxVbNh14sgt
	tda8fxHYDASQKZjdgrKy2HSe/4e8EgyJN2O+OUhUqUbvX7MoIyymf+0b7iq6gR+8gzDFShMIQS2
	5423XVVE+J/Olod/F/vZz1eCLyEM9wRoeblnofnW/tSADkdfQJpTAqQBJDYRu6jQiYN41D0hO3n
	hs0kw12OukAiJjTAtdKWmhxSxN0rfmxSYBXpHn9meiF6EmjW0WjKKBUWtMYamPm4O/EJ6GQHZPX
	xynLaECv88ZBMPMpOyA068/1iIradLXpLTqztr4VDlut1NaEV2PgW9RlKawpwdK/d2SNMYzVtqI
	uRqlBOLyq4dWYdVl1cSUiwS3oLX1pR+BtMrtrU/Zc1B77DA6UzTip3XLjp9MgWtx5aQKk80g6Xj
	Fwr+pvoyIZKX/EVqWfvZC+I/IV3AHsCtVC2J/hKtct5y43jNwutWyAHmJI8YyZuopXaldIjJ0mq
	pHwMPuIc+712LH1
X-Received: by 2002:a17:907:c613:20b0:c31:be58:5dde with SMTP id a640c23a62f3a-c31be5860ccmr996157966b.40.1791999256915;
        Wed, 14 Oct 2026 10:34:16 -0700 (PDT)
Received: from [127.0.1.1] ([2001:4bb8:148:f08c:65a8:f8e5:f310:5a71])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c3ed963cecesm9381366b.21.2026.10.14.10.34.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 10:34:16 -0700 (PDT)
From: Javier Carrasco <javier.carrasco.cruz@gmail.com>
Date: Wed, 14 Oct 2026 19:34:01 +0200
Subject: [PATCH v3 02/11] hwmon: chipcap2: fix off-by-one in command mode
 retry loop
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261014-chipcap2_locks-v3-2-27ebfc2c5b9e@gmail.com>
References: <20261014-chipcap2_locks-v3-0-27ebfc2c5b9e@gmail.com>
In-Reply-To: <20261014-chipcap2_locks-v3-0-27ebfc2c5b9e@gmail.com>
To: Guenter Roeck <linux@roeck-us.net>
Cc: linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Javier Carrasco <javier.carrasco.cruz@gmail.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1791999252; l=1031;
 i=javier.carrasco.cruz@gmail.com; s=20260924; h=from:subject:message-id;
 bh=HCCwccNtMSECrm+qSwkwcmxAaGpiINoZ+NAiQVr2tpE=;
 b=RsuuwGFjZjAk86aU3zR+Su6CJq9A+d9YVxs5nxpy2IuZ7mTpx8NWpC3NRaXYhm2iBTd/+HIra
 Ewht0SziE/dAF+3iSsIK6/BV12qi++CnXirSFkbLJhf/8FK4xAx4xx1
X-Developer-Key: i=javier.carrasco.cruz@gmail.com; a=ed25519;
 pk=VV+hcMoOj1Sx6xSiY0W/FZNAskGZe2AagSMVj0PsmAs=

i == CC2_CM_RETRIES can never be true inside the loop, since it
only runs while i < CC2_CM_RETRIES. Use CC2_CM_RETRIES - 1 so the
last failed retry breaks out immediately instead of doing a useless
disable + 80 ms power-cycle delay before the loop condition ends it
anyway.

Fixes: 3af350929e75 ("hwmon: Add support for Amphenol ChipCap 2")
Signed-off-by: Javier Carrasco <javier.carrasco.cruz@gmail.com>
---
 drivers/hwmon/chipcap2.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/hwmon/chipcap2.c b/drivers/hwmon/chipcap2.c
index 855057892852..8102b6851d3d 100644
--- a/drivers/hwmon/chipcap2.c
+++ b/drivers/hwmon/chipcap2.c
@@ -226,7 +226,7 @@ static int cc2_command_mode_start(struct cc2_data *data)
 				     2 * CC2_RESP_START_CM_US);
 		}
 		ret = cc2_read_command_status(data->client);
-		if (ret != -ETIMEDOUT || i == CC2_CM_RETRIES)
+		if (ret != -ETIMEDOUT || i == CC2_CM_RETRIES - 1)
 			break;
 
 		/* command window missed, prepare for a retry */

-- 
2.43.0

