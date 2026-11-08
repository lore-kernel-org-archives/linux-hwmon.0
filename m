Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794110413;
	b=1X8ksoa9nqeNSCFVPa7NDk3RyPxTBhGTWvHIRBgNtqZzZuSaNJ5tdEH76eVb3d4ZQsYJ
	 XMddsJeOUF2ESRR1Sb3z+GineqaZydp2/tVTT7mMstHmAVwBztn5beww0eJ1W0pQSugvZ
	 c4vQN5Nfif2Ohh7jbC2HcEmpveYryXsT0FrG/hY5qlRfRelBPYuNoNpzCKYs2+nH6DF4W
	 9WxzRoPWipDbuzsCm51q2yXrcJIDq+nWIjoViWhFPA5RaEBFxvDSPncZPFmkJGwB+o5Q6
	 sA5s0MfBmCyb5UGFD0G74K3eB9KL4G6l+j5Jtga+NamRL/s44I7UJwNxU3Ni82+To3w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794110413;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=Fm7dk54aTQ+ve82k3n7UjfY8j5o5QSbD2ilJ3czYZ9s=;
	b=eTd2WXa6BlBfuAFQAEid85nNLaAPkZkGnldDUWfyPAtOyQVLyN+vmt4AYVcDPU25s+MK
	 ikRG9hZhOSnXj+zWCNYeqtEKx/eSO1GVfkcG1PuJloeIiqfzXKQITMmrn4W3vejwAQJJC
	 jC3ynmkTrXMLfN8FxxVtsHgaLAI0mqHsVW4y1ugpNpoVbixdrLgYmudCpLGMFV+XKT8jR
	 TD0T0CXCBACyielHPpilkrbPV8wwa2UISI+QLrDac+tcaFltdVr7ts9PO9fukRZA7pV06
	 ZR4FLwp3FcctTVTxpN6d8H9HnwqrDtR1w2YeRmkZbdTjnIA4dhSJV3FnvaobzPbS0CQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="cevSR/Vk";
	arc=none smtp.remote-ip=209.85.221.41
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65D95606A33B
	for <linux-hwmon@vger.kernel.org>; Sun,  8 Nov 2026 04:00:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 65D95606A33B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=cevSR/Vk
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-492f6b7f70dso90831f8f.0
        for <linux-hwmon@vger.kernel.org>; Sat, 07 Nov 2026 20:00:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794110411; x=1794715211; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Fm7dk54aTQ+ve82k3n7UjfY8j5o5QSbD2ilJ3czYZ9s=;
        b=cevSR/VkliMogtQRW+YzMZulGqDey7G2dUNthfEZ/ilfXISo6heT0vscTZ3fsrQBpv
         xafQDz318vWiH6imAHOIPe9Io3MwLKNxBR5OudAKaNYqIeDzm6mwHDGaZWcbM5qRzbWd
         ma10rQMPPkaiF1GQIl+HU+y4C1z399JcjDJQ4AocXvSdy0193lbnKW5DHlkJh20/vAHw
         kNkcisbJ19StBODPcQ8ybEP8SsOT4upSJ0KzIO24Y/xHcHUVIKXJt4pMlDx5xlNih0P4
         OgpnaqvquuLJ67dLT7BBwErsRGctAOQoJK2N+wAWs3q3139fkz7A2SIW2aFHfEEiZFSq
         epaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794110411; x=1794715211;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Fm7dk54aTQ+ve82k3n7UjfY8j5o5QSbD2ilJ3czYZ9s=;
        b=2rN9h211PKhzbLGxDn3KH18BT6t6rsjD7dvzBSAYDrybUv7pcZLZlM58Oi+z5pot/h
         80jMpL2uXcnDicWHyqtUF01gNSmt6bZWTP8feS+pMd8O7Co589BycXnXsNjEe0qSi7rY
         lQGR2w8WBBejfMBLwA5Y2bkTwRZrI2/lgPw6a9Ip7ENNcrRI6mVoeQLJWwhy0p14x3nR
         8fEo+LPiQp+kg3Wea2npo6uxotpxZZFThqQF8Xt9FkEZsjTMMuhvCaj3zNFpkKYmWKRj
         PS6thTKmodc0iULUzJHVNn2FMlCKxBn6oUFr/0U0Tpg6Vh0ltIxeJReG99t0ddooVu7a
         PveA==
X-Forwarded-Encrypted: i=1; AL+hErGu0kEDo/430Lwm+uaCViS0AbCE4FNgeS6LQe62cM52qgPiW8OmRTmmJk+AcQ1egYgxlH/+LlbLVK8AOg==@vger.kernel.org
X-Gm-Message-State: APuU4Z++FIN6wOpopj3oDRtIkbDreI8iA3+JWbNRiHezHP6NqXJQcK8G
	vU9Un65nDFaQhGanbkJCFXh4CQu+jI8EWyVZfBWDDpHzXiF8lrBlWVdE
X-Gm-Gg: AYBFou09/yAtctJRk3ZnjHSFB+L3v77ZOF7Jdy/ky4zMfKztRmY70CY3fA7Aellhv57
	GAIPoM9xJhBXCBJxH2sby/mHIcluv6fzdkW2o3hO3yjrr35EcO0iBDnHxW9Rc7Lez5Wrv9Zi82k
	V241A2oOEo5rHQJB5zSw4sIBHsLzjbPJBFMPfvyg7HlgmF+biytti+fGbZKEQ5gP4cioqk4K/jG
	nwQhKExoqfbgLD2vLjdxdm1GBcfs3lOepsiQGh2VC9mBZ+s0c7iemQ5WRyqCZ3dh8w+k/fcSJSn
	+xHbnEpM95QMvN04KJ87unJ9EBfupRGJjmi/FMLubgNAk4DLJyQrvpRM7xAdwORt2FTFDeQE+nN
	8HVP8ZTk+CAOml/piFvjOFk9Psyw6mCZrT2PRaNN0gD6kZdu1Jow2uElLrLhOcVBPrWZ5gE9SHU
	TgEEd2rWfmFNMQCKgFPrwhLXjJTH0JEB1GlzU4z5NE+MNF9/2MqkKE+A7l/Ss7MnO9tmha7jXIB
	bkyHE+EoZiAtkcsJEcep+b7QsLJ8tMaM2Td7E4uRZoELTwGkU+w7Ab/UTaKWw/lGxeMjy9taMmL
	y+ofs+EuXArTL8hrHyL8+Uflev3zNBkBpfnyemJq
X-Received: by 2002:a05:6000:310e:b0:48e:68d5:81a6 with SMTP id ffacd0b85a97d-4958502c858mr1324688f8f.34.1794110411323;
        Sat, 07 Nov 2026 20:00:11 -0800 (PST)
Received: from [192.168.10.105] ([212.58.121.92])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-495966f3163sm1736310f8f.11.2026.11.07.20.00.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Nov 2026 20:00:09 -0800 (PST)
From: Stanislav Aleksandrov <lightofmysoul@gmail.com>
Date: Sun, 08 Nov 2026 03:59:53 +0000
Subject: [PATCH 1/3] hwmon: (max31760) Fix the local temperature limit
 registers
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Post: <mailto:linux-hwmon@vger.kernel.org>
List-Help: <mailto:linux-hwmon+help@vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-hwmon+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261108-max31760-fixes-v1-1-a61450463059@gmail.com>
References: <20261108-max31760-fixes-v1-0-a61450463059@gmail.com>
In-Reply-To: <20261108-max31760-fixes-v1-0-a61450463059@gmail.com>
To: Guenter Roeck <linux@roeck-us.net>
Cc: Nurettin Bolucu <Nurettin.Bolucu@analog.com>, 
 linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Stanislav Aleksandrov <lightofmysoul@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794110404; l=1123;
 i=lightofmysoul@gmail.com; s=20261108; h=from:subject:message-id;
 bh=WJExlUq5ujG6qQKDWF6XzEtTjL9CmUxpEncKbMZrTaQ=;
 b=7PBaY1x6zXFhU5famM+RU8tFWnND0XETbo0Ofb4N2FB/6ncUthuj+NWDSuVaNebMUeRee6+rC
 ueGNH53YyAXCjx3cJO7lmgktuK4aAVqPfTzk1LLTawkDVZEPXYyvXIc
X-Developer-Key: i=lightofmysoul@gmail.com; a=ed25519;
 pk=jeRUlfmkhE53CJPoeIIXgu7rTE0ybDRH0HQrEwbydzg=

temp2_max and temp2_crit use each other's registers, so reading them
shows the local limits swapped and writing temp2_max changes the
overtemperature (SHDN) threshold.

Use the high limit (0x0C) for temp2_max and the overtemperature limit
(0x08) for temp2_crit.

Fixes: 38b04ad02d0d ("drivers: hwmon: Add max31760 fan speed controller driver")
Signed-off-by: Stanislav Aleksandrov <lightofmysoul@gmail.com>
---
 drivers/hwmon/max31760.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/hwmon/max31760.c b/drivers/hwmon/max31760.c
index 8d3be064b025..e3d86dc4257e 100644
--- a/drivers/hwmon/max31760.c
+++ b/drivers/hwmon/max31760.c
@@ -27,8 +27,8 @@
 
 #define REG_TACH(ch)		(0x52 + (ch) * 2)
 #define REG_TEMP_INPUT(ch)	(0x56 + (ch) * 2)
-#define REG_TEMP_MAX(ch)	(0x06 + (ch) * 2)
-#define REG_TEMP_CRIT(ch)	(0x0A + (ch) * 2)
+#define REG_TEMP_MAX(ch)	((ch) ? 0x0C : 0x06)
+#define REG_TEMP_CRIT(ch)	((ch) ? 0x08 : 0x0A)
 
 #define TEMP11_FROM_REG(reg)	((reg) / 32 * 125)
 #define TEMP11_TO_REG(val)	(DIV_ROUND_CLOSEST(clamp_val((val), -128000, \

-- 
2.55.0

