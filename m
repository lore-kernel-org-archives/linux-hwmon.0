Received: from mail-qt1-f173.google.com (mail-qt1-f173.google.com [209.85.160.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F85B43BDCB
	for <linux-hwmon@vger.kernel.org>; Tue, 11 Aug 2026 23:40:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786491603; cv=none; b=GCnLcyK+TwNAwO6rBOu1q8EeaHfcpKPcb6uKrorAxjqvmFRGKdZeQy82ow7KqEXGSuoY/xsDoiPYT2VeYPuHsHw1qLxaJMnURVYESo6SgQxJGmoCcd8jK5CkQPfFJPXYiBJyuv3J7gABau88Ykcni9EtgJE4I88Y8ZTEG4LEtCk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786491603; c=relaxed/simple;
	bh=Y2tQ2LAFOFELFWmsRwpsf2BupcNmLOLP9gT8fTAeJFE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=TSGrRwuQ68PytWjIXHCgZOEOWZ50dK42Q28RTo+96LLHcdhLqM8wsjCQSUS85XhNQrj4Q/Q0wXSs3AHoEa4Zc3C5sceaxBLY4WaCdevZQDmSGw9FjREYn17pFhF/+cBJMt94/OMBcB7dA5IZNpKg30afSd2zqPe+to+M40Whidg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arimil.com; spf=pass smtp.mailfrom=arimil.com; dkim=pass (2048-bit key) header.d=arimil.com header.i=@arimil.com header.b=IIIWkKU0; arc=none smtp.client-ip=209.85.160.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arimil.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arimil.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=arimil.com header.i=@arimil.com header.b="IIIWkKU0"
Received: by mail-qt1-f173.google.com with SMTP id d75a77b69052e-51c08df8513so3510661cf.3
        for <linux-hwmon@vger.kernel.org>; Tue, 11 Aug 2026 16:40:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=arimil.com; s=google; t=1786491600; x=1787096400; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=w1MCsG0t2IBPjIoESimgRCobkxCGoq4GsTF16kiHXqA=;
        b=IIIWkKU04upV6ORd6gyrv4lqjoqmFEaJznbykpnr6Xoh3MCKtyEq6ei8gkgzVD5ZDM
         Nn1Y67UeBG/Jjf3Z6kV8tt9uQwqBY0lhc3Y0/XauucZKk4WCYQ0MCvoo/WDwsUbgeAqG
         HtOcZHgBp54RNC3hpkZ6vckVnEG5kweldarvVtK0p9B8DguMB80E7T3bxVMRBAJ/6qCZ
         YBwTlOB1IMNoZIlbNhIzMtOQrq1q7G2UuwMfq4hrTb0K5yAnYty0vlqOfa92LVdsQ/rW
         7rfQ4nBiiXUlzh/QCiFhzZ9bLNPwF4Da7w4s4aQrlLsgudW1hgAMCsyyrrUf/3c6168A
         8kOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786491600; x=1787096400;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=w1MCsG0t2IBPjIoESimgRCobkxCGoq4GsTF16kiHXqA=;
        b=d1bERpBWDIyvtu9kPxJVdyxZU6bPX+zPUwHU166BGoenyYzVyi1W5uRsYqt1RRIOah
         BN02Qcz6Qu5cThOR8/wYjAJESr37PfyIC5pf/KusuWoIK8QRMu2K7GSCyIXUCRSOTWRP
         nGc9nIhW4ul5fMseAkb3l4H+mzyG0bVjCLAqoseIMfDXXUls7VKgxPPUo6HdloEhNhl7
         jiqspmY9o8NU23ISd9TKI1xhYexSWRaLkz3SuMzDpbiKYE9tg7RvLYBdC62Som2A9Qsa
         pWqp/quOBSoqjNG+J3pYNi3QnkVlViy9MUIfDk1kx1l2vCXzni1x/ZCMV4zR0ThtYZxR
         7kXg==
X-Forwarded-Encrypted: i=1; AHgh+RoSvWP8DMrAMuloxbwhyHbjnoqhffeqSlFGNoo39+MwKmf1fCq17kyGmGagCirR82plLTlUdphw5+hOSA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz/aUqeN5UxgMDISEpVodO1k82XGZbBo6bI6iWU+PQE7OsoO+L7
	DNGfCuTtqBBQDjsSCULWc5fi7KPBNHCjgsqWagbdc9+d+3QjpjT1h1ZyKgZdCX2CbeE=
X-Gm-Gg: AR+sD12mwsofuBS1kQjWU8nI8KB6KqwVNN7exrdGPnGu/h6DiD1C8MSok4ux/KPQ2v3
	O17r1+tnDEHsCSgMYKEpMIazMrnY6m4wYv+WlarusLtFUUZV0K9OWQRemM83kOyeCvRV2WiD7Pv
	FSr9Lhuw99CdViwcJFm/rINPLNIJa2G88Dbh/9cVYwCCxGLwafiDRYkfTR6hiUR71Fkj2Uz0SFm
	HLLZL41LodAW3IXxcd5vfLepAKU1X0loqgr75gyXiNZSSWSe4Oda0Ac2OBFuyawEl3CVuu5STtX
	tmgnliPzhuZIz+2Sgo//4h/gftCXbo4B8uvClId/+B7dY1MyBaP0uXxnU63hbloa+vsGodPC+Do
	kBZXkWACmGD3wwZnINi2Yf9FAA3D2xtt+Ioawjwzj7kHTWffJASVNssNAU3OQPzRfoYWIz0LqBl
	UoYbNjfWrSwMPV79YZBRacbZvE8bWHi3Mu7JxydQR9jlt/njpLu1D59UWHybE+WBiFnS60g15d4
	Apca9OE/hBHdOSGoJ7r2lJx9b4/s46HgoU=
X-Received: by 2002:a05:622a:2d5:b0:51c:44c:6ad with SMTP id d75a77b69052e-52d647a38f0mr8792311cf.21.1786491600264;
        Tue, 11 Aug 2026 16:40:00 -0700 (PDT)
Received: from camelot.arimil.com (24.229.171.193.res-cmts.sm3.ptd.net. [24.229.171.193])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-90a6c3c1d73sm9607256d6.34.2026.08.11.16.39.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Aug 2026 16:39:59 -0700 (PDT)
From: Arie Miller <renari@arimil.com>
To: Guenter Roeck <linux@roeck-us.net>
Cc: Aleksa Savic <savicaleksa83@gmail.com>,
	Will Smith <github@notthatwillsmith.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	linux-hwmon@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Arie Miller <renari@arimil.com>
Subject: [PATCH v2 4/4] hwmon: (asus_rog_ryujin) Handle missing driver data
Date: Tue, 11 Aug 2026 19:39:43 -0400
Message-ID: <20260811233943.319729-5-renari@arimil.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260811233943.319729-1-renari@arimil.com>
References: <20260811233943.319729-1-renari@arimil.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Handles an issue reported by Sashiko where an id could
be missing driver_data.

Link: https://lore.kernel.org/r/5a817284-a9f4-48b2-9f0f-802c5dc6963c@roeck-us.net
Assisted-by: Codex:gpt-5.6-sol sparse
Signed-off-by: Arie Miller <renari@arimil.com>
---
 drivers/hwmon/asus_rog_ryujin.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/hwmon/asus_rog_ryujin.c b/drivers/hwmon/asus_rog_ryujin.c
index 9b34c6e06bf7..702edb831394 100644
--- a/drivers/hwmon/asus_rog_ryujin.c
+++ b/drivers/hwmon/asus_rog_ryujin.c
@@ -506,6 +506,9 @@ static int rog_ryujin_probe(struct hid_device *hdev, const struct hid_device_id
 	struct rog_ryujin_data *priv;
 	int ret;
 
+	if (!id->driver_data)
+		return -EINVAL;
+
 	priv = devm_kzalloc(&hdev->dev, sizeof(*priv), GFP_KERNEL);
 	if (!priv)
 		return -ENOMEM;
-- 
2.55.0

