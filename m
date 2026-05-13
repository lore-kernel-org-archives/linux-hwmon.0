Received: from mail-dl1-f42.google.com (mail-dl1-f42.google.com [74.125.82.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07B643624DB
	for <linux-hwmon@vger.kernel.org>; Wed, 13 May 2026 14:25:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778682326; cv=none; b=tMLTJqduiP2qa2HHmqnrCrTCNabPqDIKtzPNquZmIx3ExnmCbhfiaTMmr0aPABg+T8lTDgOR5oCYLiNdF2qaZUORNh4nBKaDya+aOrfvh7R8xWMpzEawdr7zqhnxYp24fQjeZjT1ZKUWXbpvL/2EIH1wDoL7KsQpMaYAqiUL/ak=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778682326; c=relaxed/simple;
	bh=hl8gnuqHkdE1akbEtaVKew0r5vf4DZtKuWwu0nnxNZw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=HHdCHZb0SVrdFeJDAaAZ8i4yF0PMglakLf+ZEBfv3XwXajLgHFKWM2pWgO6AdRy+0YjBL3nZrBl9ny93L8sB0FyB8H4eWVJWQD8746TtqSo6WZuJeY/9XUxsjXjodAqDF33Q04Sq2kGduVvGRzYmrsu2sidR2ZxMksksNwv1vh8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LdvuYN5H; arc=none smtp.client-ip=74.125.82.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LdvuYN5H"
Received: by mail-dl1-f42.google.com with SMTP id a92af1059eb24-13317450f83so2982778c88.0
        for <linux-hwmon@vger.kernel.org>; Wed, 13 May 2026 07:25:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778682324; x=1779287124; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FHhLhMWyvo012pORJ+YnzTJvLRFn8WJeslnPjdteNd4=;
        b=LdvuYN5H3qCNRmSEPFufa7qoksgMtPx9vvB3ESoQoCNJdcVjojC5ojGtWWENiqTKTU
         LUAQI1zQQHnlquews1UvWwSUmyd2pl2Is8dDezxtMhHf/TW3+PGQJ5TV7DSABz3V6xwE
         t/sgicOYYLxLq559eBj5uHKjNWD6+Ydg/IoiSC8c5KOlt4d9eigqBdOUcB9puZ3Ob1kU
         5fCpPla+C9Ah47LZPM6otv6ctc6l8KN2avT79KwwP+q0gXaLM53g10ZcatY+lKtqll+m
         zZcIa/f4kzVFBYKRYHhxiTxXwEPvSsICwWkKXugROcChYKndws6kG3WAbAMmNycqGfrG
         FfrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778682324; x=1779287124;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=FHhLhMWyvo012pORJ+YnzTJvLRFn8WJeslnPjdteNd4=;
        b=RT5MLa/3CTRGBDx7MqSi6dvArS3YuqfA1s0lNdZcxU9vrpdGHBuH+v5I92X+7J/TCs
         v13jFipbNHfAmZeyXpguUPzazmuR0HrVydCyo/HtK1+jEdmCAoWRjutJB3LnClaZ9tnO
         lIhEnSq5DtfJs3agNBUG6l9j9Wdj6g01dCjloYOvuiQa77G1mH0/QNfSDVTou9Tv47Fq
         mlWuS/ox26C2Yg5ELQKs5Gx9RlYb111yhfD1v65/ywjzNYw3CiMymZPfmRMm0ivA8+td
         t1g+1Pq6Po0e4w0ymVFqulPWUVIsTFd5ZlkWfU1hHw2aoVk8EKpQGVty+q868KDuMzP6
         ++rQ==
X-Gm-Message-State: AOJu0YzBevGimFk5Yl/u1/dFgG/yj2S6vDU77z4EbY5DiT5gYfw4/Bi6
	o3gq70mTWHiSVpG7pGjHiiWSCxCZr/Rzda+C1ZvNAAdVkKctI1aiOti4c6bGhw==
X-Gm-Gg: Acq92OHHAeUr9nl6c0ORa1hSFPhnbzrspQ2XQPv8axbktnx73xYn11t71gATPOPU89t
	w/983Chd4R59ObCGgcDi781j+x+V/0jilIBoCw4AI48haBaP3WYW9Na8A5N8QLTTrhvaswUcRN5
	oxcrVAjSTV30/BPSHcC1vWVT4LRkgvo1zHQO6OFF92ft9tLdXXbR6vZa+DrKJZGxokRw0LZLOXd
	ckVfT6UXAAbgDzGfk8wa/aiVgmwCODE5yX7/GRgZZJmdb1vYeaFpVylUVsKQvRRTFQ3FveK3y/L
	ehAN9bJ9TTnPM3rarO0V7dMIBNHS62NmnS2JR3mXTj50LZr1loeOcNI4QsLEOQeNLPqR52s8UrZ
	vjFCh3H8v0o1lZFcH7r1JkKF1Fez20a7OZANRi3UxCL1XTJZomUmeSdflx8UgpvOUuRSialQtem
	4qOP/b+sKzEBgFqr09JonxzBY6nwIMiA6OazNSQLmVAhVpjQA=
X-Received: by 2002:a05:7022:ea2b:b0:133:1cfe:5120 with SMTP id a92af1059eb24-1342ee3a1f0mr2262231c88.7.1778682323425;
        Wed, 13 May 2026 07:25:23 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2f88847506fsm27177427eec.18.2026.05.13.07.25.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 May 2026 07:25:23 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
From: Guenter Roeck <linux@roeck-us.net>
To: Hardware Monitoring <linux-hwmon@vger.kernel.org>
Cc: Guenter Roeck <linux@roeck-us.net>
Subject: [PATCH 2/4] hwmon: (lm90) Use guard() to acquire subsystem lock
Date: Wed, 13 May 2026 07:25:12 -0700
Message-ID: <20260513142514.419345-3-linux@roeck-us.net>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20260513142514.419345-1-linux@roeck-us.net>
References: <20260513142514.419345-1-linux@roeck-us.net>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Use guard() instead of hwmon_lock() / hwmon_unlock() to acquire and release
the hardware monitoring subsystem lock.

Signed-off-by: Guenter Roeck <linux@roeck-us.net>
---
 drivers/hwmon/lm90.c | 9 ++-------
 1 file changed, 2 insertions(+), 7 deletions(-)

diff --git a/drivers/hwmon/lm90.c b/drivers/hwmon/lm90.c
index 3c10a5066b53..9ca49abc1a93 100644
--- a/drivers/hwmon/lm90.c
+++ b/drivers/hwmon/lm90.c
@@ -1222,13 +1222,8 @@ static int lm90_update_alarms_locked(struct lm90_data *data, bool force)
 
 static int lm90_update_alarms(struct lm90_data *data, bool force)
 {
-	int err;
-
-	hwmon_lock(data->hwmon_dev);
-	err = lm90_update_alarms_locked(data, force);
-	hwmon_unlock(data->hwmon_dev);
-
-	return err;
+	guard(hwmon_lock)(data->hwmon_dev);
+	return lm90_update_alarms_locked(data, force);
 }
 
 static void lm90_alert_work(struct work_struct *__work)
-- 
2.45.2

