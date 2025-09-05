Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0682E2C3248;
	Fri,  5 Sep 2025 20:42:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757104936; cv=none; b=P2GmIDHMqyennSTEOs4hiM7f9ptQU/9eKeDHUZoEk21nkPozY710jpMPAt74wWpP6bOD7/2PlMs1n8wj1tiPok7/8hcwINLyC8kYX6XR+gCl/GzwGkl0aiP+cz7SWN4yQr9Gtwt4cx35+YcNtR79YKjbLApP+zBGNQoOgRTH0B0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757104936; c=relaxed/simple;
	bh=0Qn6AsYAdh0v32mgj8ilaL3tp+oWkFOBUZlK+gaqiF8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=IUPHeu1It8lIZsinOZAoWKtROGt677l/YvQEbLYj+CiUYlf/yV18Xpe8Ccmkyqo4idf9Ko/hGUM8bHRp22Qh/mbq1PYLJSMd4m16s5O24pVW9dXxGPwdXv3kd5DAxp4m+mTYx72jRkYV9cMGK3bRM7QjUSuBgIPBOvUBKgXMQNU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SrG7Pvj5; arc=none smtp.client-ip=209.85.214.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SrG7Pvj5"
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-24cbd9d9f09so33768635ad.2;
        Fri, 05 Sep 2025 13:42:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757104934; x=1757709734; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HRk3s58OUHSBgsPnCxa/6BVsssq/LXmkX68syE9srrs=;
        b=SrG7Pvj5F4YpW2lk1KiIgIUA54+Pc2KkyEfmqWEp4JGJ1azfhDJhKWn8iTXmvJJLbm
         s+59gf9CiNgxLYWf4OYZsTBoVIv7QaSUKk7Mx+YVTcDh0mP2aMd56xGM8ba7jiCQSKoB
         Ym+VRsn43XN3Gs2R+//lFA6gHKRQD98GUuk3qdj1Z5K/o37d0SnLHi0HE8rDH6HwC2Dl
         s6H6Lliarf+utBhLGRvvSqJvrC/UuTqCy80225qe3x4OOwoxPxbxCQVP2TZbdVkmRlZZ
         kFxppjb9SlaffHfkEsNeqH935vwrBNK9bm77r9N81jxAdpeCAwObp5B42yMNYXlf6AX9
         Bgjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757104934; x=1757709734;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=HRk3s58OUHSBgsPnCxa/6BVsssq/LXmkX68syE9srrs=;
        b=rff8+DHe8Uq/qjE81HcWv4gfYVyklUUMNjmjJegPZV5XMUN1RBp+5ukk2nub0U0BfU
         9RyIAB4105Mnx/7ZewJz9OXU33LpR1dhxbbX99uVVKSJzC0oTgf9iHmEn9AHY2kegv3B
         Vyc1jseOUScMkldH7Ij1du/pWVJNwP/9pciWiKFFY2WHwppxCvglLGc69REJUebajvTU
         +6aJqiGwRXwQtE6oq2eSVfM3aHT2WhxyJ9AxMYhQvewAVOCLDigpLVjlrYPZFRSghYtm
         PmyCADtMXPfC0LcjgJ0AIhnyeoWYrEjgoaNxuj0qOF08fPEB/S3yf4c0u2zvr/NjWE/c
         zxNA==
X-Forwarded-Encrypted: i=1; AJvYcCXjFK/RHerPM/jbLMGBvV7UkYXOOgpfGDmpms2JSxoV7Y2j0QCzflbmyi5a8GdcVr9E+VApeb9VL31e@vger.kernel.org
X-Gm-Message-State: AOJu0Yx1MDKwAhrPS2g5tG/vnZN/HN6O+iv1ndMU98ZmnUwwj+nJlkoc
	CLah4oEKZU31ClSHIMZrPEkv7lscxDFQMxqLVTugeI72ggEfEAPnXAJdnlwOZA9G
X-Gm-Gg: ASbGnct7uyeCMGij8zX9XLFrHEfFmiOiXLK/xx7AqKE+HSdDkcfNJzYOV1DFYuUhv3/
	yIlhpk76uTSKDd03vEhRtbof6hdntrEr3SejU77HfV/kpC5OnYm6U6jQC0y7DuxKpL7CoIHAf8b
	iohHrQ2fRZCUh2zpLmeoJ3y+nLSk74Z/UnEKvmRZBPkdgcdykPqGROfUiEwgHuJiN1Rn3fgaoLB
	YjQ6Td3gAMGDLxbEXLoI5bAGa8LowLUveLg9Ci0Udcjzx0gjCwYu8wmfh6NhpqZ1EneLQiA8JLJ
	z0MU1u74d/Zh+S0GEu8PCqvq8GdsqIZq6vTMxOvgfNECX34XphspGnJ9crVvLZDaygK03/n/KAz
	6RLzYb3nTBm7tovrgMPGI+xa8nPgiQSUTAgw=
X-Google-Smtp-Source: AGHT+IFHhyESGMwZVeIaDgxWLses8mPKw/tLYXJRsDaIn0GlVWvlvTIxSZIGPnLh+TngstytRJo37w==
X-Received: by 2002:a17:903:1b64:b0:24b:2b07:5f72 with SMTP id d9443c01a7336-251736df041mr153595ad.28.1757104934079;
        Fri, 05 Sep 2025 13:42:14 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-249037022d9sm223088905ad.23.2025.09.05.13.42.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Sep 2025 13:42:13 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
From: Guenter Roeck <linux@roeck-us.net>
To: linux-hwmon@vger.kernel.org
Cc: Christian Kahr <christian.kahr@sie.at>,
	devicetree@vger.kernel.org,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Chris Packham <chris.packham@alliedtelesis.co.nz>,
	Guenter Roeck <linux@roeck-us.net>
Subject: [PATCH 08/17] hwmon: (ina238) Stop using the shunt voltage register
Date: Fri,  5 Sep 2025 13:41:50 -0700
Message-ID: <20250905204159.2618403-9-linux@roeck-us.net>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250905204159.2618403-1-linux@roeck-us.net>
References: <20250905204159.2618403-1-linux@roeck-us.net>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Since the value of the current register and the value of the shunt register
now match each other, it is no longer necessary to read the shunt voltage
register in the first place. Read the current register instead and use it
to calculate the shunt voltage.

Signed-off-by: Guenter Roeck <linux@roeck-us.net>
---
 drivers/hwmon/ina238.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/hwmon/ina238.c b/drivers/hwmon/ina238.c
index c04481a8c643..9dc94eccb750 100644
--- a/drivers/hwmon/ina238.c
+++ b/drivers/hwmon/ina238.c
@@ -218,7 +218,7 @@ static int ina238_read_field_s20(const struct i2c_client *client, u8 reg, s32 *v
 
 static int ina228_read_voltage(struct ina238_data *data, int channel, long *val)
 {
-	int reg = channel ? INA238_BUS_VOLTAGE : INA238_SHUNT_VOLTAGE;
+	int reg = channel ? INA238_BUS_VOLTAGE : INA238_CURRENT;
 	u32 lsb = data->voltage_lsb[channel];
 	u32 factor = NUNIT_PER_MUNIT;
 	int err, regval;
-- 
2.45.2

