Received: from mail-dl1-f51.google.com (mail-dl1-f51.google.com [74.125.82.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41278309F08
	for <linux-hwmon@vger.kernel.org>; Wed, 13 May 2026 14:25:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778682328; cv=none; b=O/w1gYTPbibq7VH0hLrBExbWrNjxf8R/nGurSECM45p4NDFwDB52kAADa7r29cF9terA5YTkSeWyyFWmVGyb8BAQpEoXVbx9xUzeuqrorf2CyWVj+zLsAQnOCjNQpzAgcp6LJDRDz1UjsKhn30qqJnKlI46LyEKz/5U+sq7sfS8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778682328; c=relaxed/simple;
	bh=3FBjadcYuHwo04+/ZyNEJv+WT7DPw1tZV6iRaHsrNsI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=OOtuG6C5XU9gVxlVdjiqP4K8mBe9Ia89SvmcxpVhFHc/zbygXffha7fa1bIgukIFnbP9Xwc59GZJO08qxfkQPQlMoSAg15rYMayfZh193Bkpg7mTQBasAWmldSdgEST5T4/3CZn+7cY4xC8q8totQkyASupy360NMDRwcgO7N1E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IKH/8W0R; arc=none smtp.client-ip=74.125.82.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IKH/8W0R"
Received: by mail-dl1-f51.google.com with SMTP id a92af1059eb24-1329fc4bf77so4199896c88.1
        for <linux-hwmon@vger.kernel.org>; Wed, 13 May 2026 07:25:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778682326; x=1779287126; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JcL2/UHao4PJgYxuK/aKLuSbh3fQDxot/rWAQUyvQs4=;
        b=IKH/8W0REMH9wlfU6zp7b4aUQWihqGF9A1B5hiOKrnphfmA46eDrFGOP2bkVGA7jev
         ATqVG8pBuS8NhwXdWOBtFaAj+dRDo26xnS+mVoMApqAADlu+n00v91ukeDZSaP2H7zi+
         fOl/RrFmiaMdbPJxoz0KVwhg/IUPSgWZIXtJ88OCtTHKEeV9n1gUfXZPSp35+99wmh3b
         ERYw43fYUWQg8Q5Qds/EmQNa54M0l1DKLrrQervqCElDVh/OOKhZ1VbL9xoOWN/iGq1r
         On/McXpH8D8W/TpMruEsn4SardK88ASrlbmWTahc3ih3n7dU6GdynixwLtcjg2x5PsGJ
         t5lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778682326; x=1779287126;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=JcL2/UHao4PJgYxuK/aKLuSbh3fQDxot/rWAQUyvQs4=;
        b=kfDE46WURL1h8NltWIgCLnQD/TjabBiK2kMbI9kyHig0a8R3gcdMWMQsg0bXn/iq/c
         kC1br/PLpKumeJCfs3cAE116IPqRTgiR1ZEC8dumfy1SuGap8u4z17L+yoSvIKHPQTT4
         AwDnIVJyjDDobjauaj8ldqOlf+ASVRn7DMu6D/hBBJ74N9O5K7N6U24dVa6yfm9xRXva
         ipsDFPPSV5qEsjQVUXLi6CZuLJFvpppbOcomyp1peOSx6Ptm79FSFq/Cm9xjbD74yWlw
         cKc8pjs6OnhXg+cmcCcjZJ2pjyw3ur8F9+LSNJOCYGEEHPRZzB2L7r4PLU6sPkBY1G47
         0OFg==
X-Gm-Message-State: AOJu0YxC7yCJFbD1p/A1pP8pjGby82NyjLjU0ZvkiexUal7PQEFlcTJ+
	ib9SFtqAXfzJ5Dwi14BvYMYtQqlTBD/TxpfgsoV8u1B8Q8l3WVLuZGO3prnajg==
X-Gm-Gg: Acq92OFmT36aJZmcyyNhN8o2egJpm8u56D+CNmztNUdPaJquXHE204ipVu54R63hJRv
	2VW9gc4KlwPB/COuTU2BFEWyVCExorgLxL76vc6UfgWegwsTGbn5bnLr/kfoTpf79gdrvdWb+Ae
	fafVHusHhAoVVmETwg7E78+64CiQsw0xMBbJhkKVxp4UfHc4kk8pF9cZk+UgNfToaKw6Qzl0Y1/
	3wfIQa1Os5p5GHI1lEJuaQXHLYNa0ZJDrOoDLtY8ElndJklkSV04Ld2KGoFxcmCtGvwf7gZ+WTz
	FEAy6tTkaiSxbgbk5/ur4Ujm0q+/di9ZmRGhGX/xtxiWYpt8Pi6q96WV8wXZNKDU+BBOrlbTG0u
	Y2R8BuD0p+fxcQXDHVmjqJPmyi8UZuORU9O7vLVzqG4Ah7LGmKQoO69tg7Gh3v7g/iB7LqvMAlS
	xhttldyjXe/F7z6JvLln+V+zT561x32RgRRCRz
X-Received: by 2002:a05:7022:1a85:b0:12d:de3e:cc01 with SMTP id a92af1059eb24-13436badc3bmr2247699c88.40.1778682325807;
        Wed, 13 May 2026 07:25:25 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13277bb2b14sm30301990c88.0.2026.05.13.07.25.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 May 2026 07:25:25 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
From: Guenter Roeck <linux@roeck-us.net>
To: Hardware Monitoring <linux-hwmon@vger.kernel.org>
Cc: Guenter Roeck <linux@roeck-us.net>
Subject: [PATCH 4/4] hwmon: (adt7411) Use scoped_guard() to acquire the subsystem lock
Date: Wed, 13 May 2026 07:25:14 -0700
Message-ID: <20260513142514.419345-5-linux@roeck-us.net>
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

Use scoped_guard() instead of hwmon_lock() / hwmon_unlock() to acquire
and release the hardware monitoring subsystem lock.

Signed-off-by: Guenter Roeck <linux@roeck-us.net>
---
 drivers/hwmon/adt7411.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/hwmon/adt7411.c b/drivers/hwmon/adt7411.c
index b9991a69e6c6..5bf3b3bd37da 100644
--- a/drivers/hwmon/adt7411.c
+++ b/drivers/hwmon/adt7411.c
@@ -169,11 +169,11 @@ static ssize_t adt7411_set_bit(struct device *dev,
 	if (ret || flag > 1)
 		return -EINVAL;
 
-	hwmon_lock(dev);
-	ret = adt7411_modify_bit(client, s_attr2->index, s_attr2->nr, flag);
-	/* force update */
-	data->next_update = jiffies;
-	hwmon_unlock(dev);
+	scoped_guard(hwmon_lock, dev) {
+		ret = adt7411_modify_bit(client, s_attr2->index, s_attr2->nr, flag);
+		/* force update */
+		data->next_update = jiffies;
+	}
 
 	return ret < 0 ? ret : count;
 }
-- 
2.45.2

