Received: from mail-vk1-f181.google.com (mail-vk1-f181.google.com [209.85.221.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB00A30DEB2
	for <linux-hwmon@vger.kernel.org>; Tue, 28 Jul 2026 03:07:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785208066; cv=none; b=l/0BWOo+wAb059LOtxfOKnnRM/OKgeiwe+egTfoNmZqu3ZLp2icrEXIp1b7OxwXiQrsyNDA3QlXouikfB4ZvN+nJfJ+SPILx43xMwriAHor9MvDAxISaixzBf62wTOXifFGKibdSWotzKHjCOT+/tBNrCEdG4S2dBcea7v83w1o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785208066; c=relaxed/simple;
	bh=BX7QAOofmDbVSjrT426QK7z8VWDtDhzJkXrvBic/mw0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=UpmxC8Y6pB6EEKCajocaKWbk9Rf4gQV/hug7ekKdoGURR1h4dzfBVElRNNw6CSa/ks6PXG434ip1zdCCOK/EKVEjtBfDFLOINXqr7t90eyt9H8w1OMWlQr6v1ptLVEp+3TESjvKZu1k4hKu342OQRvBv1BsYH9Ak7qlwSOjJohU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PPjuaqqF; arc=none smtp.client-ip=209.85.221.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PPjuaqqF"
Received: by mail-vk1-f181.google.com with SMTP id 71dfb90a1353d-5c106c38e99so1899832e0c.0
        for <linux-hwmon@vger.kernel.org>; Mon, 27 Jul 2026 20:07:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785208064; x=1785812864; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=hoekbLvx48+rjORuZnTpjcNVtRnI+7NWPDch8cj21zo=;
        b=PPjuaqqFWpHGsEnHD39oUYxr5Z/mQ/LfDV7febgWHuCluUpM3+c2p6waWd1oTZNHme
         kHNXzH4+ApgIylwTPOcyjP8asuebiKdq6MdBBxJO77sK3Pbj04yMmqgJdhfG5MsjeS6X
         dfuI1ryPbr3VC2tS8UFNxVOI5PZlNWnr3K6vKHJ+ajCXEhrA4TOJDk5cSaPQruoa1y8i
         G8TLT23o55kHBFdkEpKvnOMQzEW4csXOPcSg9wYub4ZGC97oFA7i0QioqObWLgN7Qza7
         QdkvyKojuqDtrJrnD/uPzkH1d469Nr5i0q87jVa/oP2G0ZbrVflBZYcWLGNLYMAIjrrj
         QLCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785208064; x=1785812864;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hoekbLvx48+rjORuZnTpjcNVtRnI+7NWPDch8cj21zo=;
        b=Sb/aMAhTBm+fQ3vpZbWgxWyEdVpGvKWPVRUxv7nffU41UnLyF45hKi0qynFh+A0NQm
         TrF0Sbx6sYDJyfn4lTRq/t2C2jBfa+SJw9ni7kn+B2obwyZXIC8CFLI70sr1+mK2RwZV
         JBCyICFaJCglahcYbcic7BuE2shIeyXErsyDFGhjhUsBKBfcGbt1Bnjgdo3d64vtTczq
         XoxWXR9x734ExugOmlf/l1ou0srGOJDcAG2jk+Suw074HFrH7zm7Z3C09WvHvLn2+a0t
         EWwUrYSZlvNiyVpecFFsYlX1Dl/wdneOviVOwiB7rO+fuzTCmcPNrPmnGMg7Nx2IWzhv
         iNkA==
X-Gm-Message-State: AOJu0YzwzaOil8Xkd2QeYrKzW7/nFIxJElzUARdHTy661F0LuAdWi12J
	FFoY7GTNJWyf/Gx1qH+sfN+Pt7SD/OHRE7y4uOZ1q/jESoRZOo8BRi/G
X-Gm-Gg: AR+sD11/8WZ2vgeYpJAQYEKuJfQiGQ0rZVz983IajTDTzaqbZlGnBcq6902TJXXyJzB
	V5ISSKJ6mPniU2f7qn45jfDz2cVtILUVIpMO9qwSLHP3EFYN7QFWAlYo6USq4HcXveQFAoLmlfF
	CYlE66wv1v/KCdEMJwf1MtuA8luFeyzGfiQLrSVeWL2j+Ih6zutbtvHVIdhHoSJdCWfyc02a7Y9
	Yo+X17wCOGASH4lrUS6F2295LXRZt95rHZ9MEf0SGM9aMwPJY9Mzu4ZgfOWcz1ZXvWNZAJ+USwo
	pITgOjqwKl3ZoMNBdoUbvRI2BsrLoEp6tpAMVGoVGPLkXJHeVn3erECONek8S6ghyP/43oSd/c7
	ViSphuR5HqflVny6JCiwfy8O+jbviznySHJDAbY4VgcUUznI+qPjg3qoRJGv27APCojqHr1F4k4
	s94Q3cCyV50vaJGgR3lw==
X-Received: by 2002:a05:6122:30e4:b0:5bf:8807:b154 with SMTP id 71dfb90a1353d-5c33fad04ddmr222788e0c.13.1785208063920;
        Mon, 27 Jul 2026 20:07:43 -0700 (PDT)
Received: from tresc054937.tre-sc.gov.br ([187.65.210.13])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5c305759d35sm8148812e0c.18.2026.07.27.20.07.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Jul 2026 20:07:42 -0700 (PDT)
From: Luiz Angelo Daros de Luca <luizluca@gmail.com>
Date: Tue, 28 Jul 2026 00:07:12 -0300
Subject: [hwmon-next PATCH v3 4/4] hwmon: (adt7470) Add thermal zone sensor
 support
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260728-adt7470_thermalzone-v3-4-d4586478cdba@gmail.com>
References: <20260728-adt7470_thermalzone-v3-0-d4586478cdba@gmail.com>
In-Reply-To: <20260728-adt7470_thermalzone-v3-0-d4586478cdba@gmail.com>
To: Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Chris Packham <chris.packham@alliedtelesis.co.nz>, 
 Andrew Morton <akpm@linux-foundation.org>, 
 "Darrick J. Wong" <djwong@us.ibm.com>, 
 =?utf-8?q?Uwe_Kleine-K=C3=B6nig?= <ukleinek@kernel.org>
Cc: linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Luiz Angelo Daros de Luca <luizluca@gmail.com>, linux-pwm@vger.kernel.org
X-Mailer: b4 0.15.2

Register the ADT7470 temperature channels as thermal zone sensors.

Signed-off-by: Luiz Angelo Daros de Luca <luizluca@gmail.com>
---
 drivers/hwmon/adt7470.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/hwmon/adt7470.c b/drivers/hwmon/adt7470.c
index 883838fdcd7d..6cc246aa1285 100644
--- a/drivers/hwmon/adt7470.c
+++ b/drivers/hwmon/adt7470.c
@@ -1349,6 +1349,8 @@ static const struct hwmon_ops adt7470_hwmon_ops = {
 };
 
 static const struct hwmon_channel_info * const adt7470_info[] = {
+	HWMON_CHANNEL_INFO(chip,
+			   HWMON_C_REGISTER_TZ),
 	HWMON_CHANNEL_INFO(temp,
 			   HWMON_T_INPUT | HWMON_T_MIN | HWMON_T_MAX | HWMON_T_ALARM,
 			   HWMON_T_INPUT | HWMON_T_MIN | HWMON_T_MAX | HWMON_T_ALARM,

-- 
2.55.0

