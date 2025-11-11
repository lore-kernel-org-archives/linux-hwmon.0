Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03F472F5339
	for <linux-hwmon@vger.kernel.org>; Tue, 11 Nov 2025 14:44:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762872272; cv=none; b=BHaqqTAWUIx6uy0N/XEkdo2OMI6jRofvl79GgPZTy7N3DpgKa5WScFZhfNmbXyjbDO38GZk/wAulCsIi6tr66l8ymAdWJP3ND7XSn/tSs5MEXqdQ/3tUxeNG37mUXofIZAUoZ9pJI4spt8E3S8ut26cUERLbATxD30R0rrd8Pzo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762872272; c=relaxed/simple;
	bh=7qZkm47msQiGC9wUZgC0Pw7Arnt/Pg1GJgT2faSx30g=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=axOdzV0VIKduNn7/CfJ73DiABbrt49vQ8VAGv+Bd5kxulygspsNIQZ5RCKXdMiRoZBm+EYu7r2/ZLIt4og3yLlRNEInCNCFerIyaV7KP5ewlsaDxmxqMUTeJD0V4jLHyF0+nypFIYc7ah3yFkEGxqNbnHAnnKYaKm4D8SRnCP8E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OfLER98K; arc=none smtp.client-ip=209.85.208.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OfLER98K"
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-640860f97b5so6978444a12.2
        for <linux-hwmon@vger.kernel.org>; Tue, 11 Nov 2025 06:44:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762872269; x=1763477069; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=bSOY/KYVq1l+ZTGny5QvJvbkB22lOvmxEJPXtWJ9/7s=;
        b=OfLER98Kku72VjtxBG2TiuqdF1tQgd4fcIv6dzrSNA8rR0m8JiKIQI6YuP5SrFpd4u
         wWD6iOixcUT30VbY688npB/sox+G8QsYY62H0xrFOBUU2ZIdPXRwtJQOP9XELcu7tayX
         KOK/fGcG8eQKPMBDrvUZRPjWK8DRZ2SL0siaOUXKEIb6y6WK6KGEokMkKbrZ1PbjagNM
         SowoVkB6XVuupO12Kl2E4AvE58mU1qQuDeuSytx0x5iU5dLBjwLgXBMfRGqaLYRzEQir
         YIoYzuqaDYFZk/lx6lKp1b6sQqrJjZbxz6Ck47RJzYRFnbXwrsjuh4lYsWWoR/5SagAN
         n8lA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762872269; x=1763477069;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bSOY/KYVq1l+ZTGny5QvJvbkB22lOvmxEJPXtWJ9/7s=;
        b=pyLzT5ILPIspkUO4mDkzeJeeew4OTmq51bFWHJaqF99bhM4ldZNUxLpHcbM7NxJJD8
         vrY5hXrLPrHeWS3aOL006CeqjWeB9FU6Ja7+MMd3VHLm60+YhbYoYHn8HQXST0g5RmRx
         PCWVai5oQCl+K0YprNnpO0vFnYJIbnzfWFMFJUVnpknr0B0cNQCkaf2s8ZcfvxtRQ9Od
         TAtfuCXHjfmPuWuBHDWePV3TBdazcm3HuJmn5zYXr51vpeFQKDSFP1peSTEn3n1SvaUH
         x0KLQ2Hi52bmOodUYA1iNXzmk/o56NdZBEZz1g3j0lYRktIkzQPdLT5bFZ1dxHSOq7Ux
         3xow==
X-Gm-Message-State: AOJu0YyJlSI+1aWFyr9WP38ddvqkp28KoQLr1n4UzY9Ii5vehSBcqdVJ
	pq8AdRWDan0fogtUl0iwi0UPRNLIM03/X6Z08f8KKry4vaM7EAPhLjlPTf2E8w==
X-Gm-Gg: ASbGncuv7FOWS7a4M10GG3eICpEPHMhVwsia4mhPIzRFJLycEUGpWNNGBcqKO4B+P3s
	GqRA3RVc6xV8tsEpQ3knmMNDKb7RVD0IzeYr6oVq6MUnLgPVF732USFvrqEPJ3hesQpyf4jTART
	au+jjFTd8q4zWxlAKwZ9u8wmGFDqV4sRde+UJ9XPZrU/gL56B5Rv1THncHrKdBoBGrhL4oSDFJd
	YEFJObBWybJdpGcp24ezQYr8JV96DCAg9mETctfsfnZLet7fPohIoXFY3L36eLpZBQWWamflh2N
	9ouHKpJi73q8W0soU7HAUxR3+Ubo4wKD7kjdoL2PNp5qSDdHVa4WWvR3gHkx7Ot3iU4Nnwrdnr8
	cjKrwVizlaS5kAM5t/fRpEuQCuoey/wyoEauWsRB0XrZxJpPqYLgAeeAIIQSCr7daAfcvtqTQNM
	BP6geIbxnke0mu3o1Cn7iGK31kHmfqM8OADNnoEMSZnurA9tm8TAa0M/zgLw==
X-Google-Smtp-Source: AGHT+IFLzfSIruVyhPseL6KcmAwxsMRRRVGHRvcttnUr4aeu2qzhk3FXByCABO44SZU6s6Hjteu1zA==
X-Received: by 2002:a17:907:96a6:b0:b4e:d6e3:1670 with SMTP id a640c23a62f3a-b72e028c900mr970809766b.11.1762872268878;
        Tue, 11 Nov 2025 06:44:28 -0800 (PST)
Received: from fedora.tux.internal (85.191.71.118.dynamic.dhcp.aura-net.dk. [85.191.71.118])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b72bf97ea95sm1377118366b.44.2025.11.11.06.44.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Nov 2025 06:44:28 -0800 (PST)
From: Bruno Thomsen <bruno.thomsen@gmail.com>
To: linux-hwmon@vger.kernel.org
Cc: Guenter Roeck <linux@roeck-us.net>,
	Bruno Thomsen <bruno.thomsen@gmail.com>,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/2] hwmon: tmp421: check error when loading label from dt
Date: Tue, 11 Nov 2025 15:44:05 +0100
Message-ID: <20251111144406.7489-1-bruno.thomsen@gmail.com>
X-Mailer: git-send-email 2.51.1
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add error checking when loading temperature channel label defined
in device tree. Handling of error from of_property_read_string()
is inspired by lm90 driver and therefor contain same error string.

Signed-off-by: Bruno Thomsen <bruno.thomsen@gmail.com>
---
 drivers/hwmon/tmp421.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/hwmon/tmp421.c b/drivers/hwmon/tmp421.c
index 9537727aad9a..1eded169e843 100644
--- a/drivers/hwmon/tmp421.c
+++ b/drivers/hwmon/tmp421.c
@@ -381,7 +381,11 @@ static int tmp421_probe_child_from_dt(struct i2c_client *client,
 		return -EINVAL;
 	}
 
-	of_property_read_string(child, "label", &data->channel[i].label);
+	err = of_property_read_string(child, "label", &data->channel[i].label);
+	if (err == -ENODATA || err == -EILSEQ) {
+		dev_err(dev, "invalid label property in %pOFn\n", child);
+		return err;
+	}
 	if (data->channel[i].label)
 		data->temp_config[i] |= HWMON_T_LABEL;
 

base-commit: 284922f4c563aa3a8558a00f2a05722133237fe8
-- 
2.51.1

