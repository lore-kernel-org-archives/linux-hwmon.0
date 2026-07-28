Received: from mail-yw1-f178.google.com (mail-yw1-f178.google.com [209.85.128.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBF4B3B2AA
	for <linux-hwmon@vger.kernel.org>; Tue, 28 Jul 2026 00:23:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785198202; cv=none; b=rBY0u5XF7GHpj7KQSU/F3KknRAAE1LC47XBbgJj8nGcCs1py+sssxRE9xjF/B2LjCgm29DsPEGvUZhGSUVWUw23rs4E4nC+ESezr1kJhWqkEDQ4hni6buOMvzBNaU5y5ij1WWuPd23MEbhFEe5RejbFeKfPuL6+a/2h+1d877OY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785198202; c=relaxed/simple;
	bh=Qs94MZCzv2SNHH3BXNOPJVwYeH+URwI1EsnWDik9Onc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=RRaqmd3tihGCEJ8YlVB2FYTPHBxDMXxQOSR5Ffns3Ek+EgWZ1H3WIKTFeTStauVqmNFtoe672GrvxU8xvDF/qRCANQK0/4dqY8yVXk5I5ErF3+mJaK9bV2lQS8wd39V6sRpEwz/vEfFUMKeHgqHx7WZcAhkKEwTtIb+/mgsCSrM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Ns3SXdEo; arc=none smtp.client-ip=209.85.128.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ns3SXdEo"
Received: by mail-yw1-f178.google.com with SMTP id 00721157ae682-8143daf89c7so29380817b3.1
        for <linux-hwmon@vger.kernel.org>; Mon, 27 Jul 2026 17:23:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785198200; x=1785803000; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Qxd8xdumCkIdLQd6RcY8Rhs0Ioggjo5TOmyZeN4hGe0=;
        b=Ns3SXdEofK6bUncM+LakbO5E98zEhkvdSHGH+ILf6AIfU+E4MX72zHj21e0+c7ZVu8
         ktW+OQAZmRLviPgMAPZ26p4/lCuRhsKqxFnzmhJ07KUenrMS+OgKbDM4BSYaARzUEdRB
         7fzKd4WvT7QtLw1g5ivqVT/6LfeT0PGXIRKCcTineF5VI47gSR2oTeihp1PblpxYx7KS
         8wBtUBqBKr/ZXEM7a/ktdLsBqjT7IjrQRbPCjJNOnBETWJSDKdczz/KjRnaI8XIh27Yf
         CG71q2w/J2KOsc5wfUoZhLAspqtWCMGoJLby7bX87qkDaoPLZW6C67gXLA2fG4eR97j+
         LEWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785198200; x=1785803000;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Qxd8xdumCkIdLQd6RcY8Rhs0Ioggjo5TOmyZeN4hGe0=;
        b=P7GffQVYqEu13bsK67EAg7rqb3C0nLsJUOYXlNU16zbO+mHad2mUeQsF/NCKFOdLD2
         z9hUKvgOMcmdDX/86rskp3c6MJNe+At7to+aHwNxoQ+yQhSbbSnhKmTYV06lx3XHiCRi
         hkmKvHiGaddwSCkZJFMXxfYMwCvFsMduucySauzVKmz9DAvNBnBQYjiJKZx97Gv2hcjq
         dTv82H45E162IAv7bsRHt/Qrt18QFLRTrlqiHt6MXA9LyT+F041x8HshIwTgWNBGjF5B
         vrBBbCXUvPQ28Wa1I5lQSbtLaq7LJkhxe/g+e/SkJ+Jl4Qc3IRQs1bayRO9EP/0v9ddb
         Csbw==
X-Gm-Message-State: AOJu0YzPk7LLDpujsWEWrzBy7XwTmnTOOwVDmqx618cSh+GDj/IrdnCZ
	X13f1dnH2pxh/lpA33MXxCluc5P2Zhnh67AvadOeWYF5EVa5ailuddqFV3VSLavr
X-Gm-Gg: AR+sD1051vrC+937sKpr+Yrq84hQvzzPzuaY7ymb+R7/F5RBc+GxienPL1hcl8b/S8i
	vZIpJV+xssQ3lnJGoWiVg7QItoFNmf4WxWeUSfJ5GRFECyLEC4WK8RAa/B+9e9f6MpuXC9wCiAV
	AFRBICsS7OdXoJxaVYQFxLXAYvDuTbP241ynDngxGyh5yU+SSJpXX1Ls4UXLZcsG8qX6rvm0Jqh
	hrSmc3DhNn/ZV5gyW75jiWIp8G/eNAO/GjWiCfWzXaD6lRbmRhmcs08pFbZoyVcN40hMb12GlzD
	mrQbcfwbK6mScyf5cquv0W1/Ir+CJAcL2Joy6qhkZz8LWod0PNQ1QknOEiNQ1X2Nq/mclvOxg81
	0SUZOOqOtcG5UIIRoG7aUwEUdk8ocnG+XTShHmJdoKEbF780ojo7ZbdlQSPMY+6APtdJrQUu8QJ
	DtXTLlxTDJqNfgWhb4CWfPsdnkyAwQHQw5jV9hU/1x6emoAzczDZEZPh+jlsfMdmwRPwlkApyPv
	jsl
X-Received: by 2002:a05:690c:9b0f:b0:80b:bc16:8a2a with SMTP id 00721157ae682-81f9936c594mr449737b3.36.1785198199831;
        Mon, 27 Jul 2026 17:23:19 -0700 (PDT)
Received: from tresc054937.tre-sc.gov.br ([187.65.210.13])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-81f655acc7csm39583707b3.0.2026.07.27.17.23.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Jul 2026 17:23:15 -0700 (PDT)
From: Luiz Angelo Daros de Luca <luizluca@gmail.com>
Date: Mon, 27 Jul 2026 21:22:24 -0300
Subject: [hwmon PATCH v2 8/8] hwmon: (adt7470) Fix PWM auto temp state
 array and bounds check
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260727-adt7470_fixes-v2-8-598e38a46ba6@gmail.com>
References: <20260727-adt7470_fixes-v2-0-598e38a46ba6@gmail.com>
In-Reply-To: <20260727-adt7470_fixes-v2-0-598e38a46ba6@gmail.com>
To: Guenter Roeck <linux@roeck-us.net>, 
 Chris Packham <chris.packham@alliedtelesis.co.nz>, 
 Andrew Morton <akpm@linux-foundation.org>, 
 "Darrick J. Wong" <djwong@us.ibm.com>, 
 "Mark M. Hoffman" <mhoffman@lightlink.com>
Cc: linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Luiz Angelo Daros de Luca <luizluca@gmail.com>, sashiko-bot@kernel.org
X-Mailer: b4 0.15.2

In pwm_auto_temp_store(), the parsed user input was missing bounds
checks, allowing values > 0xF to overflow into the adjacent channel's
bits. Furthermore, the value was being incorrectly written to the
pwm_automatic state array instead of pwm_auto_temp.

Fix this by rejecting values > 0xF with -EINVAL, and assigning the
value to the correct array only after a successful I2C write.

Reported-by: sashiko-bot@kernel.org
Closes: https://lore.kernel.org/all/20260727034932.0B7C41F000E9@smtp.kernel.org/#t
Fixes: 6f9703d0be16 ("hwmon: add support for adt7470")
Signed-off-by: Luiz Angelo Daros de Luca <luizluca@gmail.com>
---
 drivers/hwmon/adt7470.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/drivers/hwmon/adt7470.c b/drivers/hwmon/adt7470.c
index 772d2a409bb5..c45b984c02e6 100644
--- a/drivers/hwmon/adt7470.c
+++ b/drivers/hwmon/adt7470.c
@@ -1049,8 +1049,10 @@ static ssize_t pwm_auto_temp_store(struct device *dev,
 	if (temp < 0)
 		return temp;
 
+	if (temp > 0xF)
+		return -EINVAL;
+
 	mutex_lock(&data->lock);
-	data->pwm_automatic[attr->index] = temp;
 
 	if (!(attr->index % 2)) {
 		mask = 0xF0;
@@ -1061,6 +1063,9 @@ static ssize_t pwm_auto_temp_store(struct device *dev,
 	}
 
 	err = regmap_update_bits(data->regmap, pwm_auto_reg, mask, val);
+	if (!err)
+		data->pwm_auto_temp[attr->index] = temp;
+
 	mutex_unlock(&data->lock);
 
 	return err < 0 ? err : count;

-- 
2.55.0

