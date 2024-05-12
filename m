Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8EAAC2576E
	for <linux-hwmon@vger.kernel.org>; Sun, 12 May 2024 16:19:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715530767; cv=none; b=VWl6QfiecLafaf8mgUPFeXpkYUj839T+ZlJ5+ULuujLQOeEAK68N+DzcY8rTQzYlcqqJuY1izrViBm383OOrSeYF9SroLuEFYb9v8uaivknVr/5ZtClgIz1s4QnyR3BJax52Y/+zudWKZ7aAGj2qPEFOYctVEbidY9VoDkJgZdo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715530767; c=relaxed/simple;
	bh=E0zCnt/pbddKHWfrkmT7Ib1ylLTxHA/ZMYNsBPOFx9A=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=Qrao+Xhq9JmxUD9+1XNmO67IXKd46oEOrY7nKH4ljCwRrdgbWU9EJvZw6nL+OsScTXRNnzkkw6+D9Fl7yMqsN8uiECky/PJm1tNATrelhfFtwUhT1pVfZ36xYVgBKMfsv/FNAPdj80Qpjl2VWji6FZhUfUDQbpmw/tPLOi5i9jk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=huV49cNu; arc=none smtp.client-ip=209.85.216.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="huV49cNu"
Received: by mail-pj1-f50.google.com with SMTP id 98e67ed59e1d1-2b4348fa971so2553998a91.1
        for <linux-hwmon@vger.kernel.org>; Sun, 12 May 2024 09:19:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1715530764; x=1716135564; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=bgQ9uIu7VTRRFfI/BcBBz7d0aZXeo4/37HYZSj4Wocs=;
        b=huV49cNu/DW2RIyFrwdFKnYYcF+WT7n+5HkNqqZ22aiGqTANBLunbYIEyd4GIcfExd
         9gjBCzGDzMCFSDbokzxYC7ZxwR29eLHzjXXYHYtFvtnmz8TGw8IAbGcXpXstMdmD/oHB
         wPc/z2dEekiVZe61OvMTkCqtAZ9wqk7o6Lr/9tPxK5XBfDraOx+948GyvWsmP1NtZ/Om
         yHymyezYzPzuw45ViA7GzcYna/ah4GNan6fDhw7t2Immzbgx0CHhXzjz/c4AkvHdPV01
         gpD8DFSoomA068UQAeEeIP67HuZLannlOGKEuryWaG4Jcl6DrzWsxh57IBzNAFj7TSl3
         7KPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715530764; x=1716135564;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:sender:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bgQ9uIu7VTRRFfI/BcBBz7d0aZXeo4/37HYZSj4Wocs=;
        b=ZlZ3LK9EnMhH9s7cd2Bz0E2TrepqonE1VzzGlvygE6yJAwb/cw9Xk4VqZg3/7LDxnS
         9wG11+cSAfP4mJDAHlhkUXkR0iA0tcGx+J2OBy0WMXSlfpZOm0bZMqFUfm0IcUXOxR9Q
         hc48ltvBFfFgDDwytmEG3lqHE2nPgmiCWJdF8GqcLS6VZPrejoN32vil1dyNmP/HOFWK
         cpoorf+/NqL3Db/+3Eb4/ej5OOi4LqwWE8JHIGQ6hEt2Nk0ylMEF92HSpu00MzXLXkff
         Yk+3IGEcWHXTqsPoNEjLGnX0jE5NMv+Wu3UG/FdJ1LjizK4rinDyGydGCnyJlZS3AMZi
         0A5Q==
X-Gm-Message-State: AOJu0YxqybHqWi3MK1LPy/ZTyRtm/cOFJ5iVhqwHnlmhPCfLLkMj/ruM
	cUFIBw8LmfF/EvWjIjSDvWTgIsmzFvRywG/OlBxFG4ZM+rRNc6MkxwHfiA==
X-Google-Smtp-Source: AGHT+IGU3w/mtp2JBfdpclY8P+1xFB+3b7PPLzVfuq/Wz0SNd/KbWtjshSRBdMfZSutVkVAgWdjCoA==
X-Received: by 2002:a17:90a:4589:b0:2a5:2ef2:4ce4 with SMTP id 98e67ed59e1d1-2b6ccd85d1amr6754321a91.41.1715530764304;
        Sun, 12 May 2024 09:19:24 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2b6288498e2sm8271219a91.13.2024.05.12.09.19.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 May 2024 09:19:23 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
From: Guenter Roeck <linux@roeck-us.net>
To: Hardware Monitoring <linux-hwmon@vger.kernel.org>
Cc: Jean Delvare <jdelvare@suse.com>,
	Guenter Roeck <linux@roeck-us.net>,
	Dan Carpenter <dan.carpenter@linaro.org>,
	Jonas Malaco <jonas@protocubo.io>,
	Aleksa Savic <savicaleksa83@gmail.com>
Subject: [PATCH] hwmon: (nzxt-kraken3) Bail out for unsupported device variants
Date: Sun, 12 May 2024 09:19:21 -0700
Message-Id: <20240512161921.850683-1-linux@roeck-us.net>
X-Mailer: git-send-email 2.39.2
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Dan Carpenter reports:

Commit cbeb479ff4cd ("hwmon: (nzxt-kraken3) Decouple device names
from kinds") from Apr 28, 2024 (linux-next), leads to the following
Smatch static checker warning:

	drivers/hwmon/nzxt-kraken3.c:957 kraken3_probe()
	error: uninitialized symbol 'device_name'.

Indeed, 'device_name' will be uninitizalized if an unknown product is
encountered. In practice this should not matter because the driver
should not instantiate on unknown products, but lets play safe and
bail out if that happens.

Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
Closes: https://lore.kernel.org/linux-hwmon/b1738c50-db42-40f0-a899-9c027c131ffb@moroto.mountain/
Cc: Jonas Malaco <jonas@protocubo.io>
Cc: Aleksa Savic <savicaleksa83@gmail.com>
Fixes: cbeb479ff4cd ("hwmon: (nzxt-kraken3) Decouple device names from kinds")
Signed-off-by: Guenter Roeck <linux@roeck-us.net>
---
I updated the SHA in Dan's report; the branch has since been rebased.

 drivers/hwmon/nzxt-kraken3.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/hwmon/nzxt-kraken3.c b/drivers/hwmon/nzxt-kraken3.c
index 0b3f04c740b0..00f3ac90a290 100644
--- a/drivers/hwmon/nzxt-kraken3.c
+++ b/drivers/hwmon/nzxt-kraken3.c
@@ -928,7 +928,8 @@ static int kraken3_probe(struct hid_device *hdev, const struct hid_device_id *id
 		device_name = "kraken2023elite";
 		break;
 	default:
-		break;
+		ret = -ENODEV;
+		goto fail_and_close;
 	}
 
 	priv->buffer = devm_kzalloc(&hdev->dev, MAX_REPORT_LENGTH, GFP_KERNEL);
-- 
2.39.2

