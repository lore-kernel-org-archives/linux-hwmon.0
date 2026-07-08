Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6427132E692
	for <linux-hwmon@vger.kernel.org>; Wed,  8 Jul 2026 03:05:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783479917; cv=none; b=QOaLI8h6mvcLkk490qBOlEnxNvnVfTv2izMRczndYjilAiPaNv9sTh/MMqSGXQCvSIQH4DyVYnh5Oal2rLgpK8q/vqXDNIGYFB86nTXUMO/feOO38LxjHoE1loqGem+e1YLlBwiGSFyLb37Js6lDu2pfuC7M7slzyhsbhPnm9C4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783479917; c=relaxed/simple;
	bh=wH5QSSoAqPbX2tmMg0e5EFTbatz56LsjOi5InHTQUXA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=pBsxY+oK30Kpku0uu+o95fAG5poFBtuyRs8SRHDT2yL8EcN5wisWrj/W2PPic9XoFx4IdD0B+CfGzh3LezfbcG0hIpG+sZyMoS9PmEb80sG+S++SMJuTq3a9UyDNK9bD/jnBWqNA66JAFU5Ql6MggkT7veSRfHzlG7Q7ABF8/MM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nCw19g5m; arc=none smtp.client-ip=209.85.210.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nCw19g5m"
Received: by mail-pf1-f179.google.com with SMTP id d2e1a72fcca58-847a69ba83dso159189b3a.2
        for <linux-hwmon@vger.kernel.org>; Tue, 07 Jul 2026 20:05:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783479916; x=1784084716; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=GIl63poj7X/Nhh2L1dYOezNKQVt9zOylHR2k5r0pyvw=;
        b=nCw19g5mir70CWn4bh9C9ZAVs1ex2R9QQsnlrOL0uO0O1kL3nt3i0VPSVAvAFBTP32
         gct6NEMFkz+m6ygkRoSEtbDPnQMDbn2JpwXEeInlOtQEZJ1PI34Itq4xNbLoX7l/UlRB
         lunEAfgf5VMOrcSx/uY5UAcj2rtdmh6eVXIG130qlfQzNXe8Mdfkjb+2EwbKY+onnCJG
         zfGxqCCKVSU5TimpNnjNrgY0KBYKFPODaEwTSoEtmSJFhB0ZHv6jdI4PG0+fSZG4FY5W
         Xga4aDo4HzMpjA1TJh1ZCar6w8bYhRjxkqwE6dBb8TgF2kcmtyZ9l/rJKvTPb7TpWvHu
         Wezg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783479916; x=1784084716;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=GIl63poj7X/Nhh2L1dYOezNKQVt9zOylHR2k5r0pyvw=;
        b=nVgYBZI+M5D0RggsEdJCZhjoHMMn2tV52sOLjpHS/yyPxvIFfhtdmNryGzwPdRosHe
         5bWMHSmUy/7AAONsCu4+PGJHF6OybTSPZoT/j3p+Nu6tRD2tt6HcXeG7RDxS7Ca6qm4c
         5yWipyOnadtwk9HQPXwo+B6IQx1bW9ZbsET9wRzXaIdtu0nEDBI3rLDTgrkz/wMU+KFU
         uJO8KZHti4WTwdAsttyMmwhPJ+WNwFAX8iH/4Aj/2FylVWj2R+2NDeZtPZqn5iy2neQc
         w778wPCeH+qAvaHKc3KhJE0r000rMZ4jOWDUQBuesEau++A6vxkXYXyYkRfiPPEJ5cms
         xmoA==
X-Gm-Message-State: AOJu0YyeXB/7iQYPoIoZoV15C/++pGRtLj5J9nV+PJBgBnLZ8VSGM/Ln
	wWeQqQVWKyCEuMBO4Tp9SA0wuHxIaLmtE2T1T39jUw5wR2AZMMx72hx/1wehrQ==
X-Gm-Gg: AfdE7cm8o0DZfKbYPZevO6KlBrl8BQScwZGQzaCjvTeQomeWU7dFIc2HCtuUOrhU5Cq
	6ohmQ2Z6DEAorqyVBAOOw2NnkV9TeIin4yiVvN1561TNCRlzV/hJofzt9jlFNzrDj0FQ7JzGc3S
	1uyk7L8GXRsxnAII0t72Hp2PIln1YuTHBzfhoEkOpRl/AQl5/mgJjr0WAkLpj2rWVGzZRX9ASze
	3p6uZms1ET9Xj0oAMFefIGEXKnbCrezuGj13L+0nmh/6TFGPyxwTuNYaUQFlFyVfINEzcsdXurw
	bp3N9TQaOcSCrToixr2xnf2F+jG4X23QN55iUiPYS3ebnhd/u5AN6T7iYlEQhed/9zLCx+av/Q/
	/Bq7+kahpx1nmTPM06p9xyYQBptJ9Spl+a2qQGoW4lnWGmf0emifd86YqC8w/kXosEkb5QK6c0I
	A2i2PbY4+xkV112PLIJX8boP007w==
X-Received: by 2002:a05:6a20:6a27:b0:3ba:e5e2:73bf with SMTP id adf61e73a8af0-3c0bd0fa3e2mr509158637.43.1783479915757;
        Tue, 07 Jul 2026 20:05:15 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13b659c8572sm13891128c88.9.2026.07.07.20.05.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jul 2026 20:05:15 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
From: Guenter Roeck <linux@roeck-us.net>
To: Hardware Monitoring <linux-hwmon@vger.kernel.org>
Cc: Guenter Roeck <linux@roeck-us.net>
Subject: [PATCH v2 3/4] hwmon: (nzxt-smart2) Stop device IO before calling hid_hw_stop
Date: Tue,  7 Jul 2026 20:05:06 -0700
Message-ID: <20260708030507.227193-4-linux@roeck-us.net>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20260708030507.227193-1-linux@roeck-us.net>
References: <20260708030507.227193-1-linux@roeck-us.net>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Calling hid_hw_stop() does not stop the device IO.
This results in a race condition between hid_input_report() and the point
immediately following the execution of hid_device_io_start() within
the driver probe function. If the probe operation fails after "io start"
has been initiated, this race condition will result in a UAF vulnerability.

Fix the problem by calling hid_device_io_stop() before calling
hid_hw_stop().

Reported-by: Sashiko <sashiko-bot@kernel.org>
Fixes: 53e68c20aeb1e ("hwmon: add driver for NZXT RGB&Fan Controller/Smart Device v2")
Signed-off-by: Guenter Roeck <linux@roeck-us.net>
---
v2: Call hid_device_io_stop() only if hid_device_io_start() has been called

 drivers/hwmon/nzxt-smart2.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/hwmon/nzxt-smart2.c b/drivers/hwmon/nzxt-smart2.c
index 58ef9fa0184b..e2316c46629d 100644
--- a/drivers/hwmon/nzxt-smart2.c
+++ b/drivers/hwmon/nzxt-smart2.c
@@ -768,7 +768,7 @@ static int nzxt_smart2_hid_probe(struct hid_device *hdev,
 
 out_hw_close:
 	hid_hw_close(hdev);
-
+	hid_device_io_stop(hdev);
 out_hw_stop:
 	hid_hw_stop(hdev);
 	return ret;
-- 
2.45.2

