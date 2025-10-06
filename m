Received: from mail-qk1-f176.google.com (mail-qk1-f176.google.com [209.85.222.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03702266565
	for <linux-hwmon@vger.kernel.org>; Mon,  6 Oct 2025 21:54:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759787657; cv=none; b=gAf4R5WP4XJpJ8Kpla2X5dWeDmib5Mk3P6DzUA+ExSHbGMqsAlqBTt6PHVpvSYrG/noW85b6E0AHoKkmbbJpdVasTbQt/c6gBfJj/BVZ/Yu/nruCNs0oGqnZqSzrHNETeD9niBJgT+LUYVDVE0RSnnXH/hg9peTd1wu3djliIO4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759787657; c=relaxed/simple;
	bh=TN8DVVtOI0uVF0pVf3w3bAdjS3386PQdWfU2VmCuHTQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ezUMfUwn/VWB9WdvgnOYP4qa8eDtGnqRN69TVwhRCyq1x26Mgo0McQ5o7gYEUhHHHmTpvd9BX8+3U2W3dnKkEGgYRNwXAKOg6nOBof+6ZnoBsfSs6cD3/l1Z2dinMeMA6Mi1Jq++/sEihtvU/i8kgRlvBgf/TEaRWIBboFdZSt0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JI1Inr+F; arc=none smtp.client-ip=209.85.222.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JI1Inr+F"
Received: by mail-qk1-f176.google.com with SMTP id af79cd13be357-85a4ceb4c3dso528268485a.3
        for <linux-hwmon@vger.kernel.org>; Mon, 06 Oct 2025 14:54:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759787655; x=1760392455; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/2sIp4WFShfr4eCKdCALf03P/N949F7OBVMFA66z5UM=;
        b=JI1Inr+Fb9nlMSCVFZ4/9Gey825jgXgglAzX22S4ifTSYWMVEU0qXc4VT31hy8e71f
         BycTkvF5rPHtBomz/W8EdVlP3X0zrKqUEk0Z3j19yyYSXfzilbFJIUYgSZzmgvVct95C
         tDejA5TTLg2dW64jPh3sutopQznh+/7dGdCHJzQOcfsbOCtNOjCmG9L5lLgPamtSRF9y
         NdsnGR5EtJX9ac8UiBWkrxo3BGiIGBtTXdlJLdylMmCacFSrvifkqwVlqM0qoXerUIsI
         zZhvQge3J9FkMT4cc/jfvkmBJ7clSJaHlDK0DkUPCfdmCDi8FiM/dBKxVyi5xba1bCjG
         4aUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759787655; x=1760392455;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/2sIp4WFShfr4eCKdCALf03P/N949F7OBVMFA66z5UM=;
        b=MQQFZtFg4wfYApemVzLzlH4LZDOZzUtJZAi2yoUaUaRdOWemteNvWnhjaMwIcRrEg7
         3thf96IpNecVggaLhLWhCBay6KDBVzITm5mYhTwup8hxxpIIthyDsaD0qCNRYUY4tzZk
         8p7h44GpLcaHRT8Cv+ADgwe7WgPfL5Zjh7iYE9/y/gxD7bA89MsUn9yRogyqcfGXdWBK
         XK+63GfVNOMgSPo6ieLvgkISQbZU//kHVxCMzAnV+fIOwyMeBZORe+feGb9S0W1mYXTR
         xJRGJbARLu5rxI+S4WsBREkvewKcc8/eUI94zpKFvSBYLcJ7735UZM49eKrIgHbIT7K5
         WH/w==
X-Gm-Message-State: AOJu0YxZXYgPPZRdSMgxye9mq4U5Bo8UKOY7Ts0v4IiC56MeCP7XQXRm
	+N5/Tx5r9kS1kbWs3NHLg2TQoQJaLAV1oPIUB4DCyOMUoe1WfNw9f+QY
X-Gm-Gg: ASbGncuGnJUllk7YJ3OKU4IZXpWOkbbGh9oRKdHQ1B/ezRHWJn/uGU5C8tJ5FZCLuAV
	Res+fiRe9jCf13Xcda8MMLCzT4R0bZ4lTk/TfOD7RCmNlexU53nTg0f8mYtSAr62SlRJWMpezR4
	Jm9Lut08yeo6ijEpuLL/dEPU7vgELyDp7DBxfBi4+uYwnyR7e+CdhfuLjNunS7Mu0FImrg8l1nk
	Y5aCn0f5VzvYq6zmBIhGLBQMmObkH4iq2M4baxOxsY6pHAFJTI01l7SB7L2E4dUnFieI+QQthMX
	8MpIPeBLYHNph7F0TkBErlZg/TA3hXmmUMOTqv8nl8JDDbCeyoWqMLHcQUytYVWs/NEf52CQ+I7
	+6nn4aaFwxGiIzv1SzhNEUjbPx3KkqZGffzdRXEfeHGCHNN6d
X-Google-Smtp-Source: AGHT+IFqsWVnCpjYKU1itjoK+0G07oo7F31f4A0dLj7qpRKOEEW3bL5j0OvrFQf9Ro4ztA0Q1cj6GQ==
X-Received: by 2002:a05:620a:40d1:b0:85e:adef:a774 with SMTP id af79cd13be357-87a390f16b8mr1404131885a.82.1759787654780;
        Mon, 06 Oct 2025 14:54:14 -0700 (PDT)
Received: from fr.lan ([81.200.23.195])
        by smtp.googlemail.com with ESMTPSA id af79cd13be357-87771129478sm1314168585a.1.2025.10.06.14.54.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Oct 2025 14:54:14 -0700 (PDT)
From: Ivan Mikhaylov <fr0st61te@gmail.com>
To: Iwona Winiarska <iwona.winiarska@intel.com>,
	Guenter Roeck <linux@roeck-us.net>
Cc: linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	openbmc@lists.ozlabs.org,
	Ivan Mikhaylov <fr0st61te@gmail.com>
Subject: [PATCH 1/3] peci: cpu: add Intel Emerald Rapids support
Date: Tue,  7 Oct 2025 00:53:19 +0300
Message-ID: <20251006215321.5036-2-fr0st61te@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20251006215321.5036-1-fr0st61te@gmail.com>
References: <20251006215321.5036-1-fr0st61te@gmail.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add support for detection of Intel Emerald Rapids processor based on
CPU model.

Emerald Rapids Xeon processors with the model set to
INTEL_EMERALDRAPIDS_X. The data field for this entry is "emr".

Tested the patch series with AST2600 BMC with 5S Intel Emerald Rapids
processors & verified by reading cpu & dimm temperature which matches
host sensor values from lmsensors.

Signed-off-by: Ivan Mikhaylov <fr0st61te@gmail.com>
---
 drivers/peci/cpu.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/peci/cpu.c b/drivers/peci/cpu.c
index 2dac8ba82787..fbccc1d1b637 100644
--- a/drivers/peci/cpu.c
+++ b/drivers/peci/cpu.c
@@ -321,6 +321,10 @@ static const struct peci_device_id peci_cpu_device_ids[] = {
 		.x86_vfm = INTEL_SAPPHIRERAPIDS_X,
 		.data	= "spr",
 	},
+	{ /* Emerald Rapids Xeon */
+		.x86_vfm  = INTEL_EMERALDRAPIDS_X,
+		.data  = "emr",
+	},
 	{ }
 };
 MODULE_DEVICE_TABLE(peci, peci_cpu_device_ids);
-- 
2.49.0

