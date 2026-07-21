Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F9C845A28E
	for <linux-hwmon@vger.kernel.org>; Tue, 21 Jul 2026 22:15:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784672150; cv=none; b=U6yUGpnKBdZeubOE0KnoCTJC3VIYzJOda0N8spKUKy3jcTNlzW0HRG524F/xldEY/H8f+AgkdYhfM2I/KlKrz9pSutZqig1R1gn86kcO5nuTKee9/C0SPdaDs0rvkwJYk/uaIOYOEoT1/HlL9FzQ0ofyf5crrYy7KiSL6VcxMPk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784672150; c=relaxed/simple;
	bh=VylVE97urOnGo1fKhA1IwM8dNjVc6rVPycHxhapEvGA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=nVzN9VQawB4NBdQk0e1l4xvoyxYkI/672qHkgmdSl7N200yYjRvy25dwGeU7Joepp3dDuvhLycIyiLpbemW9S9aNNrMGCVz0Ke6vIsOjoQfr/ogS1u8oxFN2H02rxgrHO1BwV+vprvwEFi7fRwOgPI1zFrJ5szMD8FBxLn9R74Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WhMhKu1t; arc=none smtp.client-ip=209.85.216.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WhMhKu1t"
Received: by mail-pj1-f50.google.com with SMTP id 98e67ed59e1d1-38e071ed6aeso7683195a91.0
        for <linux-hwmon@vger.kernel.org>; Tue, 21 Jul 2026 15:15:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784672149; x=1785276949; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=5mP6wFrKPhYjd/5KHULwyWUdonzv0xy3jN9195/5g2U=;
        b=WhMhKu1tzHDSY/1mwMMhB10yCS21VcrNOG24xbGFP/TljIzjw3V+C8SD+v6CyxMlPR
         /GvxPSJFZsW6G5VH5FmHIiwekS0jpd9IADSz1IKxB9OvJB9PkvO76pJkI5RvNAGr4nlw
         WKNywSAM8Z7g/HLnCtJJojyyA/nAV+L1vfrIyP+BbGRn3bxT3Q2V7aJMBbOfmL/X9AU+
         +4cMuPCfkss4vMwsVqd/+s3S4+uIcxfAiOqz5HZnm9MvMf+2rZMlkyskEw+veFBlwjQ6
         ADugWw7ixYd/InKQdTpc4311w/7BAZINvrUbSF0Y6/mJ3vxxZUMtH7sRHih+1D5Nv7nx
         7jdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784672149; x=1785276949;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=5mP6wFrKPhYjd/5KHULwyWUdonzv0xy3jN9195/5g2U=;
        b=sZNpN49eBhiYyz4wPHSipaCdXrL4fPlkVE6B5lEmPaq/6CaZMB6+Tb0xd5X9ewboJo
         1Qi6WkJrA5RW0z7ToiaCqzBwvCt1PFGdecNaysbpbYaq4qUIsR4Q+/EZMkWhjGEhUhn7
         0JPR7tVvgvMJ7SXMkmITOkRtzpnCHpuOm0m+NKdDSpAtnpF3iwvCflRGeE+IoLc22AR5
         k8NFEPPlwM1oQgIYk/7HY3TkZREeSG0Z5vai7+I4r9fU+QTDE+ujsX+DcF7G3wQH5hrS
         us7p3S2XD9H7j22ICoSnA78lMkcqLgv2pHmDU3oBUD25vx25YMqRzX4kItTWb80CBNFX
         i83Q==
X-Forwarded-Encrypted: i=1; AHgh+RoPyRXzChR0NG4EQl2SK6uc7qcPzlw61Q9to/fSL/+jz8hgS62eSbXPIcWNoGI75rleS/1xplbwn06BVg==@vger.kernel.org
X-Gm-Message-State: AOJu0YxD6/0jhpSgKAGmGu4F5UE7RkBQpqBb9HEF2KD/uwk7dY4P8nKE
	wZgSlzN1IrY9BMqJvQBGoaC/zZoaC0JYqqAHzNuXTu/vG8od+zrKLzjN
X-Gm-Gg: AR+sD11/4pSXs8iGGceMYaleWUDTw+cVuPvBAkUNL8j5jQZvzYtm+bapminrSxN6KXP
	0OPIbli9qcr1jHRGcXeompVxWnW0TOZcciYUQn20GlOgN54Pjbd42v40PHgrphl5KJonxEjjVXC
	q/gtxkOE4VYbskVemNCRIBf6SHbFXZ5MY08EVKuXpP2w1QmI6AjvdrJUQ/qwMhk/Qkh2lt6cvon
	ZQxDhEZtA7U7Hwa7yoL0C9/w6kRo5gV7Z0Qqvg9Yg0SQjs9yTOFAUTqilXSz5AYjppAayTq8Pcv
	euGuBGojrqeokXPSWSg+Y7uAbDIkt0+y3L/TUf0tIsOTVEuK3JYKoO4cDlmPKWRXghH12MJTh2o
	fQNPp+DAjDrjoALb+Tm5uIPhTGts3lkYrIIwIMgZSIp/7lCwMBvulPMkjQWiBYNzH/mGFOveru8
	30TcBnqQ==
X-Received: by 2002:a05:6a20:549b:b0:3bf:9c93:ac44 with SMTP id adf61e73a8af0-3c3ad66b543mr23855336637.19.1784672148601;
        Tue, 21 Jul 2026 15:15:48 -0700 (PDT)
Received: from localhost ([2620:10d:c090:500::9edb])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3147e088d3fsm2093442eec.25.2026.07.21.15.15.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Jul 2026 15:15:48 -0700 (PDT)
From: Zinc Lim <limzhineng2@gmail.com>
To: Alexander Duyck <alexanderduyck@fb.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Paolo Abeni <pabeni@redhat.com>,
	Guenter Roeck <linux@roeck-us.net>,
	Simon Horman <horms@kernel.org>,
	Mohsin Bashir <mohsin.bashr@gmail.com>
Cc: kernel-team@meta.com,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-hwmon@vger.kernel.org,
	zinclim@meta.com,
	Zinc Lim <limzhineng2@gmail.com>
Subject: [PATCH net-next 2/6] eth: fbnic: expose all hwmon attributes unconditionally as read-only
Date: Tue, 21 Jul 2026 15:15:36 -0700
Message-ID: <20260721221540.648272-3-limzhineng2@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260721221540.648272-1-limzhineng2@gmail.com>
References: <20260721221540.648272-1-limzhineng2@gmail.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

All fbnic hwmon attributes are read-only and always present, so
fbnic_hwmon_is_visible() can simply return 0444 for everything
instead of matching on the sensor type and attribute. This also
prepares for the threshold and alarm attributes added in the
following patches: they are exposed unconditionally and reads
return attribute values.

Signed-off-by: Zinc Lim <limzhineng2@gmail.com>
---
 drivers/net/ethernet/meta/fbnic/fbnic_hwmon.c | 7 +------
 1 file changed, 1 insertion(+), 6 deletions(-)

diff --git a/drivers/net/ethernet/meta/fbnic/fbnic_hwmon.c b/drivers/net/ethernet/meta/fbnic/fbnic_hwmon.c
index 6c8c66ab86c1..38bb26cb8e6c 100644
--- a/drivers/net/ethernet/meta/fbnic/fbnic_hwmon.c
+++ b/drivers/net/ethernet/meta/fbnic/fbnic_hwmon.c
@@ -20,12 +20,7 @@ static umode_t fbnic_hwmon_is_visible(const void *drvdata,
 				      enum hwmon_sensor_types type,
 				      u32 attr, int channel)
 {
-	if (type == hwmon_temp && attr == hwmon_temp_input)
-		return 0444;
-	if (type == hwmon_in && attr == hwmon_in_input)
-		return 0444;
-
-	return 0;
+	return 0444;
 }
 
 static int fbnic_hwmon_sensor_read(struct fbnic_dev *fbd, int id, long *val)
-- 
2.53.0-Meta

