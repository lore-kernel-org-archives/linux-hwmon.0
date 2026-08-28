Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82F523CB2E0
	for <linux-hwmon@vger.kernel.org>; Fri, 28 Aug 2026 10:56:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787914579; cv=none; b=j4DQWT2XZOmJDmJGjiyQwJBcwnIJN0+2KgMduKwqPVbWUOpR5zE3Blofoa1wCVkp/vzrcz5AnJ4rkIjWkqQ5/nxp+F3j7IQcXTCMw9a5HaKItPn2Zoh50GLd0dmOTQPYH6P4MaYReRhyp1SfC1mK6KVxRJE86APFXEYQhL14Z7Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787914579; c=relaxed/simple;
	bh=HolFjc1GFhcieQW3rZ3e6LIfMf9VWISSiWMAcCwB6WY=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=QFrlLQ5LtmTyKz4ncvGe7qWHW50+28Lf9RQfzbB6o4iwLShNdJVL+fv2bdOhwA/0xDdx3kOQbP/PPd5Jk9xnsWx3EnNVMO4knSUpfVioYYfghiQLf09BrH/vFWg8ksfxeV7IGeqOfFBR3kQhU/oyuvIJQLgUYz1bhbROB81X69g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=oWgcuBqI; arc=none smtp.client-ip=209.85.216.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="oWgcuBqI"
Received: by mail-pj1-f42.google.com with SMTP id 98e67ed59e1d1-38dfe910e9dso1060869a91.3
        for <linux-hwmon@vger.kernel.org>; Fri, 28 Aug 2026 03:56:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787914578; x=1788519378; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=tJKbqcLHnVm7Iv7oflxgTuIfOvA058unjZa7ApUbWEU=;
        b=oWgcuBqIuTcDFeITtNcRJB3EHg6JObhDFCVsLu/2S4EBvt4AIXP0r6LNX5Lx8nMHlS
         W49DEe1KdohJdM0EL/zw8CRnvPiPfieuw0+RLz5tg21EvPt22rXseI/cvcNtn+35DYVp
         u9GysJ3CAeRvmJZn8CR100xkaD9oR8TrHUoCrdMXKFHMfJjow5q1jkZGvpPgvKb5zY3y
         WhQWLPnRpZwkCkQawmb+Z7Z69fahyNslE9SjInm70u8AFLgVh6UFghkISpGYhSxKeZvD
         6NuLwIdPmUezn9Z6FDIXyrIfaKaicST0XdqqIIr+Yi+ZZM/4wOR6oIHCYr2Eps0vWqa2
         wnTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787914578; x=1788519378;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=tJKbqcLHnVm7Iv7oflxgTuIfOvA058unjZa7ApUbWEU=;
        b=B/T0Jgyb3e9cLTaA46SNo16BY050aeojTj0o8h6RzmVlNwbi69ZtXMFvcnc0J7HCFN
         cp7+OdxErKruTewHbDCqtFXBXAceAecKMf4hdOXTCX4Lkbsr5BfC7jO/hjNDWkUcRjEu
         oxjdXEUVp+/sfrq44SJ7PoyEUjXjLduRrhiOCo7XJ7p7/aAJkJKyHGlqCPTRvWFdjsyU
         QEBP5Td5ItRq7nzaOAm5M1wH2J6uMxOCW6PX0PwzuNFwMqRFEzM3aHv4WxDXs0wm37Zc
         LWzVx+GXhXL6xSbHjW7xqJR9+tMhZafDZFLzSeY9a5rfUxlZKVwraoRlNEpHO0VAWN6z
         blFw==
X-Gm-Message-State: AFuF++k7PYSrIXl0hvUw7veqkDFnH+6DvG/O1EwBF+VDkPlEwvuQy6Yi
	j9L0dgaAJqIGaN4MdAgt8Te3TW/CaNScJDDi1hvff/Tm4D7TRiuo/2z4ncEFSA==
X-Gm-Gg: AR+sD10AqcAEYpe2RQka0VPOZCtCbrJi0qIjYWtZp3go9x3gMdvG3PHZ1hEfgCJv2e3
	ch/mgvpjUD9JYkKlrp4ckm1Zgg5D13/ZhV6UC5Yn4n3BYpXoMQKGjMnaa/AGTPQvd4cTUv7Y6A7
	+I8AOZSq23DoVbuyz914mL8cTEvfEdf+mIBdnQBpRZ1m/MqQayvgTZp04TyqxMbt1fManNzwLtB
	Q5KyPd+dP5Q/RMIfQhppJ+cMu6hnTmIQHNasMgZS2VZlUkFcTdqGIUVKehD/7HN+NxaTIew0/K4
	U4cUwX+9MO1/LObScuIPIWVCAEa5CFBVnegkrCJaZtZFHj/GfmU2AqE4jajWdBtDkaYlnGDwPPE
	xdCv+LB8r5H2wtWiakQ9tPLRGz02mQYkU+xkBm1X0NBU8W/pJBKQToMuno6+VJFU/0POgZlzexo
	nOO2Y60JX/9fO9/9aIpgxzAB+tdCoohxYvKxrAaeXca4bRH+8UhUEHRXSeJceOEMBB87Ro376SE
	A==
X-Received: by 2002:a17:90b:3c05:b0:380:9f17:6df3 with SMTP id 98e67ed59e1d1-396d0e8325cmr13049209a91.4.1787914577812;
        Fri, 28 Aug 2026 03:56:17 -0700 (PDT)
Received: from SGN-LDSENG.tasernet.com ([42.116.29.172])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-396dda368e6sm2067288a91.4.2026.08.28.03.56.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Aug 2026 03:56:17 -0700 (PDT)
From: Cong Nguyen <congnt264@gmail.com>
To: Henrik Rydberg <rydberg@bitmath.org>,
	Guenter Roeck <linux@roeck-us.net>
Cc: linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] hwmon: (applesmc) fix key backlight workqueue leak on register failure
Date: Fri, 28 Aug 2026 17:54:13 +0700
Message-Id: <20260828105413.2401385-1-congnt264@gmail.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

applesmc_create_key_backlight() allocates applesmc_led_wq before calling
led_classdev_register(). When register fails, the error is returned to
applesmc_init(), which jumps to out_light_sysfs and skips
applesmc_release_key_backlight(), leaking the workqueue.

Destroy the workqueue on the register failure path. The bug was introduced
when the inline init block was refactored into a helper that returns errors
directly, dropping the old out_light_wq unwind label.

Fixes: 0b0b5dff8967 ("hwmon: (applesmc) Simplify feature sysfs handling")
Cc: stable@vger.kernel.org
Assisted-by: Claude:claude-opus-4
Signed-off-by: Cong Nguyen <congnt264@gmail.com>
---
 drivers/hwmon/applesmc.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/drivers/hwmon/applesmc.c b/drivers/hwmon/applesmc.c
index 90a14a7f2c4c..bfe9c5b0c4f1 100644
--- a/drivers/hwmon/applesmc.c
+++ b/drivers/hwmon/applesmc.c
@@ -1249,12 +1249,17 @@ static void applesmc_release_light_sensor(void)
 
 static int applesmc_create_key_backlight(void)
 {
+	int ret;
+
 	if (!smcreg.has_key_backlight)
 		return 0;
 	applesmc_led_wq = create_singlethread_workqueue("applesmc-led");
 	if (!applesmc_led_wq)
 		return -ENOMEM;
-	return led_classdev_register(&pdev->dev, &applesmc_backlight);
+	ret = led_classdev_register(&pdev->dev, &applesmc_backlight);
+	if (ret)
+		destroy_workqueue(applesmc_led_wq);
+	return ret;
 }
 
 static void applesmc_release_key_backlight(void)
-- 
2.25.1

