Received: from mail-oi1-f170.google.com (mail-oi1-f170.google.com [209.85.167.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED636277C88
	for <linux-hwmon@vger.kernel.org>; Fri, 13 Feb 2026 06:55:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770965747; cv=none; b=p+v8hKkPptm4+EWzPlJ3ta/NukIIm7Cv+IrQCSzyHQQ6HHaY/Q/sHUz5qYYlwd+8aC9KiCNa81kt1BPRgCsuYunguGhcfdU/tPlfAV9PgR0XgY+yBWykm8dHI/Ye+L/vBKWaJZOP0af7lW9mT3+k0JMbLj7bnUdW60X0HrlG1Zw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770965747; c=relaxed/simple;
	bh=lQbl8rYIfrG6wxU4E3tWWSxo4aRWKZ/dPc/QN30m1rE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=O4Mpf1qAtOOnUanYtkMkVltec5BaK3hxOvSG7ZiOpymOexQ+Fm5JZI/heNDpFGX/ZvAoqFI0yuLYUIeBNSFecvs7FedlNcXxGSKncGbDIin1qBccQOUlBJF+G4VQSs6cizy0+ZqUsQ83cUGhPX9iSeZefx5j//F+mlq79QYE1QU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=minyard.net; spf=pass smtp.mailfrom=minyard.net; dkim=pass (2048-bit key) header.d=minyard.net header.i=@minyard.net header.b=ZNbtDBtP; arc=none smtp.client-ip=209.85.167.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=minyard.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=minyard.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=minyard.net header.i=@minyard.net header.b="ZNbtDBtP"
Received: by mail-oi1-f170.google.com with SMTP id 5614622812f47-45f053b7b90so415276b6e.0
        for <linux-hwmon@vger.kernel.org>; Thu, 12 Feb 2026 22:55:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=minyard.net; s=google; t=1770965744; x=1771570544; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UWDi80vPYKTAc6upvJphSdvAtuHW5MV8Yc1eLb4RAzw=;
        b=ZNbtDBtPb0lSM6o2LcZ7iDkFi/n3hx/bsvxEuT+cl23EngTjBIEuYp9scehwqKOzvQ
         GKUGRZhn9VW8r+j4MvrFxDUZYuq55B+n/6+PKwSST4781ID0e+1LdmL9z9BWgMsEqWL3
         CbFPOAH7Drz0tRu7utXXsXSI28dsxmW5qGea9s5rW2HA1D6iIngQSMjd6My6LVA25Wv1
         uD+GYJMPpk7bbAvd0vTTU1Ii9eayMfqVR1TGRwOId5Ulo58a6M1sR6IcIYe+xkWhOCM2
         KMCouXmVDvv3Rfn2AMe0P9icQsHYz5pknu+BAgL0Ej8YNgr/QnhffK+tEnByhgeeRxMv
         JIwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770965744; x=1771570544;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=UWDi80vPYKTAc6upvJphSdvAtuHW5MV8Yc1eLb4RAzw=;
        b=kVrjvFK3zFQYabJqElvv3SAweri45Gv7iIWSGxpdvthssHYAfsES6OE95uAEVBfBrO
         5wKhtg5rjlEZxAQb9Fr7VjgYWhmOKecsIQygpefAj5R7w5v4Jns8bQM2g7/qgS/E4cc8
         Gw1OGpwcaGU8PCYmKFDZ2A9+7T2E1yi1iwNH7JWoRT8g/UbQaH2J7kmnL/dISMfc8woy
         +xa2rK5YRysjKbuC2v0V+DV9OePK+Fb+Tfe5F1OiO2FMG03utDjNQ70Bn5C4W7ArFnpP
         SlI5VSox39Z2EBL32BpfOv59Un6ueZW5iYBzE/ma6vQ45DR/j96yQc1rNSoJ4ahntuH+
         1n6w==
X-Forwarded-Encrypted: i=1; AJvYcCU0oc1FtlEjSJihCYUe5KYwVhVb1YKXjriBj59FD1blfqHXbJ1Xv0GKa/RUdjh1MdJnvAf0bygxAg7bPw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy9jZ6B4QI7YPjKTrTu8j89l7KKFHtUTlM8H+U+TsaMJCw/7wEe
	RpWPG1+S4LyN/w/Z1n2f75u93fNZp6Ate5XYyVsI6jgJoPnKMnlvcDmYsPT0Ql2Pn/s=
X-Gm-Gg: AZuq6aI/b7vMri7LPQ2+gLiuL2HPzH3SH4oEMOsopIV0/OJJvPh6u30/gjVbCOGQFIF
	YkXTDONO/0o01j+vLJdYNmKUgwnEun6mEpoAgp2RlA1qvl3TSA1LV6BHvW8mJAC2rHP18tl5mlV
	t854hfF6Y92Z/1AV78fnpiSPmWrqPDe/drSOPo2nvosjITF3O5xlhwNz/Br3AzeewLKS8YWCqmI
	wAf32YnDDv3QptzyqRx5bkgIvXNslKALMjO/OISmmwickdY4m8gnR5HT5zn4TqhLN3rOSlt6ys4
	IuS/svBD56J8TxQ+yWDGh9gO2nv0WLVebpj9AlBvVIhp/P92vayhJ5Ms3aoM7pcqM8fAR7z36j/
	Lj/DxVpeM0nMUx3Q3MtCe5+ryR38Wj+5uLpc49unwg7lXHDreqDXy/F5SkzLtIpamH2M3HfRXwH
	LpXL3lTwpJsMNACj2tq4cYdVmwLdfrKYWlSQrOvObsx/LRmwlUt6zaNy5RPPqaqOy7+i68Gaaz4
	yLOODKx0ky6kq54
X-Received: by 2002:a05:6808:c1e8:b0:45a:770c:d77b with SMTP id 5614622812f47-4639f1dcb8fmr563573b6e.35.1770965743932;
        Thu, 12 Feb 2026 22:55:43 -0800 (PST)
Received: from localhost ([2001:470:b8f6:1b:a3ab:7352:1dc1:6b46])
        by smtp.gmail.com with UTF8SMTPSA id 5614622812f47-4636b065d46sm4261406b6e.12.2026.02.12.22.55.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 12 Feb 2026 22:55:42 -0800 (PST)
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
Subject: [PATCH 3/3] ipmi:si: Fix check for a misbehaving BMC
Date: Fri, 13 Feb 2026 00:52:15 -0600
Message-ID: <20260213065351.915707-4-corey@minyard.net>
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

There is a race on checking the state in the sender, it needs to be
checked under a lock.  But you also need a check to avoid issues with
a misbehaving BMC for run to completion mode.  So leave the check at
the beginning for run to completion, and add a check under the lock
to avoid the race.

Reported-by: Rafael J. Wysocki <rafael@kernel.org>
Fixes: bc3a9d217755 ("ipmi:si: Gracefully handle if the BMC is non-functional")
Signed-off-by: Corey Minyard <corey@minyard.net>
---
 drivers/char/ipmi/ipmi_si_intf.c | 24 +++++++++++++-----------
 1 file changed, 13 insertions(+), 11 deletions(-)

diff --git a/drivers/char/ipmi/ipmi_si_intf.c b/drivers/char/ipmi/ipmi_si_intf.c
index 3667033fcc51..6eda61664aaa 100644
--- a/drivers/char/ipmi/ipmi_si_intf.c
+++ b/drivers/char/ipmi/ipmi_si_intf.c
@@ -924,9 +924,14 @@ static int sender(void *send_info, struct ipmi_smi_msg *msg)
 {
 	struct smi_info   *smi_info = send_info;
 	unsigned long     flags;
+	int rv = IPMI_CC_NO_ERROR;
 
 	debug_timestamp(smi_info, "Enqueue");
 
+	/*
+	 * Check here for run to completion mode.  A check under lock is
+	 * later.
+	 */
 	if (smi_info->si_state == SI_HOSED)
 		return IPMI_BUS_ERR;
 
@@ -940,18 +945,15 @@ static int sender(void *send_info, struct ipmi_smi_msg *msg)
 	}
 
 	spin_lock_irqsave(&smi_info->si_lock, flags);
-	/*
-	 * The following two lines don't need to be under the lock for
-	 * the lock's sake, but they do need SMP memory barriers to
-	 * avoid getting things out of order.  We are already claiming
-	 * the lock, anyway, so just do it under the lock to avoid the
-	 * ordering problem.
-	 */
-	BUG_ON(smi_info->waiting_msg);
-	smi_info->waiting_msg = msg;
-	check_start_timer_thread(smi_info);
+	if (smi_info->si_state == SI_HOSED) {
+		rv = IPMI_BUS_ERR;
+	} else {
+		BUG_ON(smi_info->waiting_msg);
+		smi_info->waiting_msg = msg;
+		check_start_timer_thread(smi_info);
+	}
 	spin_unlock_irqrestore(&smi_info->si_lock, flags);
-	return IPMI_CC_NO_ERROR;
+	return rv;
 }
 
 static void set_run_to_completion(void *send_info, bool i_run_to_completion)
-- 
2.43.0

