Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A45113B14D4
	for <linux-hwmon@vger.kernel.org>; Wed,  8 Jul 2026 01:58:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783475894; cv=none; b=p5hvWyGA48oLo1sSTjz3+h7gRYQE6rcO7gUnIhoF8g1ByzxoprQIugIYGYKtXhgUJOD+tKT9cfdxxivfU6Py6Py3/Mf3DGeC9Xx2eJ/NVhAGNTcHoKraWR2CY1ggbWwEh4T3W1h/TeJHH7wgo9miAe3XG+PyCOc5N1sTb6k5myI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783475894; c=relaxed/simple;
	bh=7NFxiWr5ZN3AjknxmjRtQxT/ElDfTvq+YrKCbxqXoOo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=F/eoCKiizCQptx4/6F5mzGQ1/0vGwGz83SzoZG7mRGm/+JG6bWh0mZe2Y+JBfh8mJyhUoiiaUiRLN9DesTOKJuhdh3eQwoFwhSMg15HVeMkUrtvYuuozXynR/AGFL8fTaBh91UIRfy1qV7C4ptst34O+Q/2OQaOMO84x/4XppDg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MqCm7qCP; arc=none smtp.client-ip=209.85.210.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MqCm7qCP"
Received: by mail-pf1-f181.google.com with SMTP id d2e1a72fcca58-8453427d3f4so128346b3a.3
        for <linux-hwmon@vger.kernel.org>; Tue, 07 Jul 2026 18:58:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783475893; x=1784080693; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2PVf6t11fXOLXdZkmhUoZGxPDF2HUI+iTm+0OjdPILk=;
        b=MqCm7qCPY3LwbsXwVyHb/iZIVxnv0kWL/j0QIAkHecEwUA1+ri5aRaUXbYQtAEZrbk
         /TKb5Cxf7ctxCFqsXOpTvO9hvUF4RvZkGqJUJVOxpVLdtF171fAbnFGeTo+Tz+3Ei/sL
         w0NO9lmiF+Cuuef+LjjXKFAelu5Fz/0tXuT43XTv2PxU0a7nAG4m0E0k2TDdtdD2cfGI
         eNKcdwlK+0jNILwgrT19mYviAGwNYKPG3eqsk3N4B5g85VrfmbdD0Zb3cuTMGmlo2VzZ
         shW9nhkJP7SHp5bvHIZhxb73NHCbPCuhskw1c3eHXe3Go2JZMxJmYjHqR5F0sXGyQlFy
         iZAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783475893; x=1784080693;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=2PVf6t11fXOLXdZkmhUoZGxPDF2HUI+iTm+0OjdPILk=;
        b=DOcNqePbO/HFWdERvxYoXJZPNNNNFWumAL2Zdi+hW57SL4EeDBC52iTqm9zyH4WGkX
         02wdix/4HnUbJViUwXl2dz1APQAtElfIenCMAuTDDdaiQLvqior0Plmkejpy7AAH0d0Z
         2UN/iKoei7yTPiYHqF8F9nhc+fWh2ho3CAo6V/m14F2+xCHrSl3BAD2lM9i63rFJqjjj
         N6nfC8PYi2tdzf6Ht0DH4mL23bGSTk+vt6KldsdjP6H28ZIzxN6Z5wJmcFWIyphki129
         2hnAMYhvpRsFvE1CAKk2oG7BOLxT47F8hsZ3TRqiV95RZrjokOFSw+1snLyfGOeQZ7ph
         MF1Q==
X-Gm-Message-State: AOJu0Yy5asUIqkLot9mdycubNY9e6dmJLPr9ZuJg6qv5YRTn7cWGopNV
	mGuESa3BVdbMVtrAFI0TjEZIOW7UWhQr5EBJT/KCsJM4wOZSer4edfSjwePU/Q==
X-Gm-Gg: AfdE7cmVww1QMjTnTmvydG2BX+puIDxruQjZzS6bTrG/7hfTkxjGpho2Ib8D97OHJRK
	9raUYFvOCojRSb/J269/a+8H6Ng2hhnzeQYNmL+EJTxUVOgKS5wzOlHjeW3G66sqdBHOB+sL7wd
	Q35clsH44oSHQuSvydoY6iUkl5dVUAUPOfcLGzpSHS/amSSSfz1pnXnPA20KOVZuSWaXYnzDv28
	5EV92zqsMkMhG1IuRrxjzgje6hsAP9G38olsp9Oq/j85xq4YOcJXn47u7E4aR3jUZ2FX/zw9F3E
	aBAonSAcpJfT7ixm/y80PrUQgv6P4XvwzsMSZMHlhjKS8xslMNZZy1E1IHyGN1ptBPdBYsmu1Du
	1zrU76CRQxgozEUmP+mGsO/TlNeLKpa+qoJmCMc/W+CbuzXiX4/F1Nj5UDLhsZdJwXZ1z9aXRPt
	wI5uzSEDNdq0Tz6OBjB4D7aiMdfA==
X-Received: by 2002:a05:6a20:c98b:b0:3c0:9c19:65af with SMTP id adf61e73a8af0-3c0bd3a34e2mr210397637.71.1783475893032;
        Tue, 07 Jul 2026 18:58:13 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13b6593c76dsm13436865c88.3.2026.07.07.18.58.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jul 2026 18:58:12 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
From: Guenter Roeck <linux@roeck-us.net>
To: Hardware Monitoring <linux-hwmon@vger.kernel.org>
Cc: Guenter Roeck <linux@roeck-us.net>
Subject: [PATCH 1/4] hwmon: (corsair-cpro) Stop device IO before calling hid_hw_stop
Date: Tue,  7 Jul 2026 18:58:03 -0700
Message-ID: <20260708015806.213790-2-linux@roeck-us.net>
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
Fixes: 40c3a44542257 ("hwmon: add Corsair Commander Pro driver")
Signed-off-by: Guenter Roeck <linux@roeck-us.net>
---
 drivers/hwmon/corsair-cpro.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/hwmon/corsair-cpro.c b/drivers/hwmon/corsair-cpro.c
index b6e508e43fa1..89bd1ccb324c 100644
--- a/drivers/hwmon/corsair-cpro.c
+++ b/drivers/hwmon/corsair-cpro.c
@@ -646,6 +646,7 @@ static int ccp_probe(struct hid_device *hdev, const struct hid_device_id *id)
 out_hw_close:
 	hid_hw_close(hdev);
 out_hw_stop:
+	hid_device_io_stop(hdev);
 	hid_hw_stop(hdev);
 	return ret;
 }
-- 
2.45.2

