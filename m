Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F9713B2FD4
	for <linux-hwmon@vger.kernel.org>; Wed,  8 Jul 2026 01:58:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783475896; cv=none; b=WXH3khfWaw+sGcfJdEqfvKoZKZlVEcZ0pru19Au4KNUg9UNTEaUhWnhc00x9PbwcGbXnDP5YFz3V6KPfR4qf7ACw5pdeI0a2gaTUqQ7VcMIAiFlCPoksmRYWWL+cRZ+znzQfEJEXrrCF4UrhAwkDu5T+pYpFASB3+/jfrd/TEC8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783475896; c=relaxed/simple;
	bh=CEJX+4ntFblyyaxLpql/tFUSsyN1E7QF0bF+0FYOf1M=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Hb8J7avK5cZWk/Kf4sKF8evrPtSiVoMNRjv9Fx63APv7AYRgAo/t1ap2XpCZ2YL0TuhdesDmRyH6jX0GmWuzKroVI/WplRSvodWNLx83U+tfd/CvIlE+cAiaM+9ZIrp6ojFlc8KLqqGajlqZ3ma1HguhgoEbfGCP6dIOpSzlcYQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=rJBii5Ky; arc=none smtp.client-ip=209.85.216.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="rJBii5Ky"
Received: by mail-pj1-f46.google.com with SMTP id 98e67ed59e1d1-37df72c9984so180008a91.3
        for <linux-hwmon@vger.kernel.org>; Tue, 07 Jul 2026 18:58:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783475894; x=1784080694; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zf9s6NyicixVx8zmvvdmSEZzOsFuop7nbA27Sq6axy0=;
        b=rJBii5Kyd4VM7k5LS6VQyX4Fu6ehE0iY9uhWUeSb4oMOBLwkEYyqbrd7JuIDrt0pM3
         n/KQu+jSFZUeWe0ZRISPate5aCPG7MPD4lVyRCWWdEtpNfd89cx00Qf/HJJ3KQEbAYTv
         i4XaH8HUUE38hv45cuJZWO7ENhzir6/FRAYbOGtKuWLgd+6IygVDZk6quSXeuwZGDpFP
         iLumFjMN0ofwSXfkO5pDuQKhUCMMvlliycgOduHOtkDQePQJhEo4n02OsdOk1TPbbz+6
         6anuIMsIX18XzvflFKaF6GtOx4jQKEfIrUjLijljtuJo0vsXzrntaeyn21wuzHc1zNv3
         sSHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783475894; x=1784080694;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=zf9s6NyicixVx8zmvvdmSEZzOsFuop7nbA27Sq6axy0=;
        b=EocGPsdpL4QDxPF2Qt90AQJg2WGb7hVVnVVMbQK7ytZ8whZSKSD/HIotnvYfhhP37s
         EIMaw4Cqgdh38z9Vi9uHWiXpbiYJBbaQI9ekLRRd5AXeYrT3ryx02SUVExaL+tnWVMPW
         58iQb6vNr/Z7foTs0g0d6qFTmAB8eDhBBAExe6BrP3SnN9MxbELYuCbW8PL2m7mual/i
         qdwShp4Vb+Vq8NKARAqnqD31gDPKIZZMoFY/XJUvX5NurVBPZ8nbYc/7u/aTYN2urFRM
         9JNhDOcysXaknURoBWd1xAuqxY916ClkRM+MrHvnu2lWGwBLrstGYulLtcANssPi6MhR
         7T3Q==
X-Gm-Message-State: AOJu0YxKWFF3+HrcXTirwhbKZZ+aGqTNdZt62qhYR2kiWzbuQ+e4YuIM
	Bka3ENSIizXgoEVuECMos+5bdYUXwPku5oUkP82DtrNYJ8YVn1BloY2/Lo0pRw==
X-Gm-Gg: AfdE7ck5net9iLfLEztpKQS21zcHGmZvgtdgpu8/KudgY95DXc/qrfOublC5042GCTl
	UebWIm11xMm+i4se715YPrkQO4UoW74g+pp2f3YSZo8L59wsAidSP6nwf5qwa9Y5FATY+oDoqxT
	fLc1S3DV4V2tq0w0PCRNnn2x4++jArM7JM4i0Eob5qWwQ3EN3yCAU2iyNf+vJb0KLTyrcv5Yhfv
	lwXmvEsdG/7rC/eW7W1YNFCZPiX2iS8XCUSLVAxSg8fGR/VlWlgy2otKURzSlO6o7oYZ78Zv4Xv
	9MMY5S4dMF2P5Tj4yf3g7dSKKtTmgUwkOZvbZPbQ7HNZL86U/SCTz/18Go1bxwIkgrXbvDKWknk
	NoCrUgFrI4b/GlMzhg//9+du/Lgi6W8e92g2G7F/L8kushI+anJtacXGQaVglaR7arSnYWEFhY8
	WA4cDqZg78/l20VwtOrutxJCEdwA==
X-Received: by 2002:a05:6a21:7a44:b0:398:9379:d04d with SMTP id adf61e73a8af0-3c0bc958b5dmr360420637.24.1783475894302;
        Tue, 07 Jul 2026 18:58:14 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-31174ae6cd9sm14502935eec.31.2026.07.07.18.58.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jul 2026 18:58:13 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
From: Guenter Roeck <linux@roeck-us.net>
To: Hardware Monitoring <linux-hwmon@vger.kernel.org>
Cc: Guenter Roeck <linux@roeck-us.net>
Subject: [PATCH 2/4] hwmon: (gigabyte_waterforce) Stop device IO before calling hid_hw_stop
Date: Tue,  7 Jul 2026 18:58:04 -0700
Message-ID: <20260708015806.213790-3-linux@roeck-us.net>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20260708015806.213790-1-linux@roeck-us.net>
References: <20260708015806.213790-1-linux@roeck-us.net>
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
Fixes: 42ac68e3d4ba0 ("hwmon: Add driver for Gigabyte AORUS Waterforce AIO coolers")
Signed-off-by: Guenter Roeck <linux@roeck-us.net>
---
 drivers/hwmon/gigabyte_waterforce.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/hwmon/gigabyte_waterforce.c b/drivers/hwmon/gigabyte_waterforce.c
index 27487e215bdd..d5b27751147b 100644
--- a/drivers/hwmon/gigabyte_waterforce.c
+++ b/drivers/hwmon/gigabyte_waterforce.c
@@ -381,6 +381,7 @@ static int waterforce_probe(struct hid_device *hdev, const struct hid_device_id
 fail_and_close:
 	hid_hw_close(hdev);
 fail_and_stop:
+	hid_device_io_stop(hdev);
 	hid_hw_stop(hdev);
 	return ret;
 }
-- 
2.45.2

