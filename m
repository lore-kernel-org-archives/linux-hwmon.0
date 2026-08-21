Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D9E631194C
	for <linux-hwmon@vger.kernel.org>; Fri, 21 Aug 2026 14:49:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787323776; cv=none; b=OZIKSlW+oQH1/BTeNZ8Yk/nJmLif5sYovxl/EI/bVQDTMsd0THdm0aPyJf1mg5vu8/gdHmEu5QwcZLUfJWga7srSQgWmEB1hwOXRbKc7rqoNk4bwamAVx04WVgC4w6gaigoL0zYQZ95yvZQPB0VeNPrdzYYHieVsEfx32/qDdL0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787323776; c=relaxed/simple;
	bh=qf3pqix4Zs9vuO0VTY090LxIWdMBKreCBtVAmFbI8Lo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=GZspDzJGi4EDGR3/RjAPg5cDw32TwPPvDQIygbdU79mKDOnM/n+zIFO69O0/ZEwzMb1RU5A+OSNvx+MpPLT9V6gK8iwqQdZE6YFt6JVTtAUBN+35zK5xCEdNaiXCnquqeCvao2+mO3r12+sU9XS1gWeEVxvUl6Scqqc3eMHYV0s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JRPC+Llw; arc=none smtp.client-ip=209.85.216.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JRPC+Llw"
Received: by mail-pj1-f45.google.com with SMTP id 98e67ed59e1d1-381c51fde6bso1152583a91.2
        for <linux-hwmon@vger.kernel.org>; Fri, 21 Aug 2026 07:49:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787323774; x=1787928574; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Sm2AcJgrUerorwPLXZqjknGEkstSX42Qru9StWCTRBA=;
        b=JRPC+LlwQ4TJduZ15fLPrnG/XDzrQNkfi/t83eF8kEdZI4DBMAvaxXO7/JArB5caMy
         fXB9J44rSYNaXVLlOCPciBrGKJiwGjaltEASsmK8f2aPUJoVRp4n7un+9yc5mId1RBfV
         yod2XKYhcE2GRFMRDIYJ2THTg3SIS0UpjaS2TssaJN9IyundK01+jUNXspRExORQm+gA
         FbLccSm/q35aOZtjnFS/N3EwXk0WHoJrPIzDfP5UNtsUeUZA97QUWBqo/W+a5/Kh7bd0
         6jWnPn9Mgq7XScAhizrUtEA407stS4dKJytwElgTtFVIVWX/CqTB6Vv+zPJV0mUF55nU
         pozA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787323774; x=1787928574;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Sm2AcJgrUerorwPLXZqjknGEkstSX42Qru9StWCTRBA=;
        b=CpnI3iW1JpSZHw2aMQhzcGLWWQXjKowBZ4K4y9+AhRXFdcBMt3WxysmevQa3tnpQlQ
         dNuJ/0PBTaBiqlue3Lfwvo9rSmGvdE4vXA/T6EQlAQpByj0rLJfjFNrXxxZ7qtlk0JQj
         5Cwdgkqw2egFjK88EJq/9W4Gdicj7xMmwqKTDPUyfjlEKm8bhxmozwSrXc7lcH6Bl6r+
         hm5n8eBoim8KI8Fum6YuijKziKV8ASNWgzEVipYhUp+8Syog+aQXmXXwZYyBc2g/aUqN
         bloUtn2GGrB9C2ZybBTwqh0zdosnwIhzbC/jd4q/Eh0FaOvWf/Hp0PN+WrSForG3xEYV
         2YqA==
X-Gm-Message-State: AFuF++l17KJKwyEsBG+q8MGlPjT1hJmuxUAQKyEhxDbV26WXJy61Jd1T
	u5cadoRpDiU2Wr3/1n682VxOhIoFxpGWdvSkic6E+9T5aZNQIq/PL/thDa75Vg==
X-Gm-Gg: AR+sD10GXPWgJ1PIkFf33ihvvGnQXwlPtOmQk5FyBHy0Q5b0MFxPLPLyCauJaSxV/DF
	kPRXf/+5nad2IpKd0rjtTvT+5QhjYxCZba1sxAnxAbuuusqwkYFV9eyCTZ/u9WuK6tWU8wDdrOv
	EKoFiCOHi3Q67MuYdcB18e9KV6x9YwFiQgp+W41vVgR9pFeWypKoR8oTw4HhdlslFNlUUjptwsy
	yYO9MQMvkKyyqycC+9wh9BdBIYthypPcOWou4JEnO22Z6k2uTr+rbfKgbUCulXb/SZHA//TJwfW
	CJqJMu+QGpVymW41QcAdHxwOPJqA8ngrbffqUan4OAkKxwQ9IY53QvAJL8hAUV72uN2HC/3r/Rr
	fJTnTzts64hdXrfq9lnLTl5QeeJ+59siGNDTITVfES69cMSSQcr5BMt2km0lvsr2gavLxz21Pwz
	QDKznh0ub75icbsYuLrpCMWY8ittCgK7qasnKPqOsHy82Qso4GwbmJiCBUswpwqe2GNBbXMwYRs
	tnAMLpN0Rhf
X-Received: by 2002:a17:90b:314a:b0:37f:eafd:3505 with SMTP id 98e67ed59e1d1-395c3522213mr11600706a91.6.1787323774524;
        Fri, 21 Aug 2026 07:49:34 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1416ad6060asm44130884c88.6.2026.08.21.07.49.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Aug 2026 07:49:32 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
From: Guenter Roeck <linux@roeck-us.net>
To: Hardware Monitoring <linux-hwmon@vger.kernel.org>
Cc: Guenter Roeck <linux@roeck-us.net>,
	Antoni Pokusinski <apokusinski01@gmail.com>,
	Alessandro Zini <alessandro.zini@siemens.com>
Subject: [PATCH 2/2] hwmon: (sht4x) Fix return value from heater_enable_store()
Date: Fri, 21 Aug 2026 07:49:16 -0700
Message-ID: <20260821144916.2889031-2-linux@roeck-us.net>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20260821144916.2889031-1-linux@roeck-us.net>
References: <20260821144916.2889031-1-linux@roeck-us.net>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Sashiko reports:

The return value in heater_enable_store() causes an unexpected write
failure in user-space.

When the heater is successfully enabled, the function returns 0
instead of count:

drivers/hwmon/sht4x.c:heater_enable_store() {
    ...
    data->heating_complete = jiffies + msecs_to_jiffies(heating_time_bound);
    data->data_pending = true;
    return 0;
}

Returning 0 signals to VFS that no bytes were processed. Standard
user-space tools will retry the write with the remaining bytes. On the
retry, time_before(jiffies, data->heating_complete) evaluates to true,
and the function immediately fails with -EBUSY.

Return count as expected to fix the problem.

Fixes: 0eed6fc3d2b9e ("hwmon: (sht4x): add heater support")
Cc: Antoni Pokusinski <apokusinski01@gmail.com>
Cc: Alessandro Zini <alessandro.zini@siemens.com>
Signed-off-by: Guenter Roeck <linux@roeck-us.net>
---
 drivers/hwmon/sht4x.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/hwmon/sht4x.c b/drivers/hwmon/sht4x.c
index 7a0dc2ed723d..a97dda9e92dc 100644
--- a/drivers/hwmon/sht4x.c
+++ b/drivers/hwmon/sht4x.c
@@ -288,7 +288,7 @@ static ssize_t heater_enable_store(struct device *dev,
 
 	data->heating_complete = jiffies + msecs_to_jiffies(heating_time_bound);
 	data->data_pending = true;
-	return 0;
+	return count;
 }
 
 static ssize_t heater_power_show(struct device *dev,
-- 
2.45.2

