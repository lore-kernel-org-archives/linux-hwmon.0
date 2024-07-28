Received: from mail-oi1-f171.google.com (mail-oi1-f171.google.com [209.85.167.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D7E043ABC
	for <linux-hwmon@vger.kernel.org>; Sun, 28 Jul 2024 14:37:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722177447; cv=none; b=EIAunkQm5h2An7BbVxjz1p2CjMQIBp/NPX/vKIVgva3jqRi7GDgBsVPks8MN9Ms67SZ33Jzl3gHTNGytKk6+UZ4lb1JTEnJqpf/uYRXlWchCdTy8iwy7KoXcJKpQVZoiJXtq6O46O4BgKOt+KWygSrqp4YFM8iXfMPvW0eiPalc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722177447; c=relaxed/simple;
	bh=hWCVTIYujH3yiMCaJ+ud5Vu+AQBPJ5D8pUWj7vZZtYg=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=MmwkxCUEXmgcEBV/ELNJ6tuIjUp1mbq5H3pbOIazm4KVv+6Uv6VDHGCTMaTAGWlqg0NoXnnTpBmPEY6TUHOjPDbqQYHsbvaXELhbV9afwM3cm6lfUtvgr8mO00B1KC6SrN+0Gl9tVn6dRkzWqoAEaXRa2Q1GWZMoFCLhw4vjAdw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=U+LmryQx; arc=none smtp.client-ip=209.85.167.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="U+LmryQx"
Received: by mail-oi1-f171.google.com with SMTP id 5614622812f47-3db1d4dab7fso1546128b6e.1
        for <linux-hwmon@vger.kernel.org>; Sun, 28 Jul 2024 07:37:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1722177444; x=1722782244; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
         :message-id:reply-to;
        bh=41z9zLCcl8a9skX3iWLTkdfhL2LgJ8bQvmyC7i+go7k=;
        b=U+LmryQxiNXyEjms2hPaU+IHJJ1emkEUrGDlXgmuHlmc9J3+us9UsC9NrvvfhWqo40
         b8tv1IrqP+Lq1uqZqRXjSj4bcfYdfJ+cn9HD10qm9sgjIXVXwY72LXo7fCZuQJYFBgxU
         G87ZH960I/W0fRytR+cQ0wOS6SnWzj5GsyN+xgd626Bh+4Wx1KcYzxz+mvpf4TFTsyMo
         I6eDj7+l56ADlmhPgcXkmDRxDY0+BhioVgXUXRqrWXJEQx1tnZthcOczM2qeMzHf56xG
         Hyc+h3jW2/zgJJboDFeWmYKm1A1zC11OSIASCgVDGDaIP9SWvt9LflhEQTKPuD5qxvM3
         zD3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722177444; x=1722782244;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=41z9zLCcl8a9skX3iWLTkdfhL2LgJ8bQvmyC7i+go7k=;
        b=JS9G2IlVoGpTvb0qABLAoPXWDUshutT12hXvuHoCnFgkxhvWsJll7NavUP5RsdJgpl
         mDYMaB3h4NOL5IcpIWhRQQeAMj2y5fdEPOqNcbq6i8MyHCoZagph4imN/PJS2uc9RwOu
         EL/lJNxVxc5Dum7nb9btpjvNRdt7f71ZphcU+iL/6/qxb4g8yoYOI4vFNx6uQE4mJPME
         98QEgFLfISRGwGLJliPLoxmGzhXbXdpj3+olunMBbAWyNJ+DnprVWfNZ4uiRQ9HBtBTp
         WTM0tkiwxdpRWMytFz0N51Wj9fiIQjfPelEhoT57nBPeLzX4wA2Msg+RATd7c/kD7iOl
         eODw==
X-Gm-Message-State: AOJu0YyU07eL8yJC822WSAKaU9f4bYNrfGfOIi6h1Njpjs+QtbGUF8WG
	tJfgpvsA6VGGZH0xmRc0Eck5MDqWAvHInBGK8fHJMacvaBypw116rmxwTQ==
X-Google-Smtp-Source: AGHT+IE9hV1c7gM6Jo6w03p++G+radrcAHfKYUlnqmfvDhATJnXwT+upxgyZmfpJgV6uqbkk+M9rQg==
X-Received: by 2002:a05:6808:23c9:b0:3d9:2b24:5b2 with SMTP id 5614622812f47-3db2348e454mr7975006b6e.0.1722177444238;
        Sun, 28 Jul 2024 07:37:24 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1fed7cf1db4sm65881655ad.87.2024.07.28.07.37.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 28 Jul 2024 07:37:23 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
From: Guenter Roeck <linux@roeck-us.net>
To: Hardware Monitoring <linux-hwmon@vger.kernel.org>
Cc: Tzung-Bi Shih <tzungbi@kernel.org>,
	Guenter Roeck <linux@roeck-us.net>
Subject: [PATCH v2 3/7] hwmon: (max1619) Mask valid alarm bits
Date: Sun, 28 Jul 2024 07:37:11 -0700
Message-Id: <20240728143715.1585816-4-linux@roeck-us.net>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240728143715.1585816-1-linux@roeck-us.net>
References: <20240728143715.1585816-1-linux@roeck-us.net>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Bit 0, 5, and 6 in the status register are reserved and, if set, do not
indicate an alarm. Bit 7 is the 'busy' bit and also does not indicate
an alarm. Mask the non-alarm bits to avoid reporting them to userspace.

Cc: Tzung-Bi Shih <tzungbi@kernel.org>
Signed-off-by: Guenter Roeck <linux@roeck-us.net>
---
v2: Added patch

 drivers/hwmon/max1619.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/hwmon/max1619.c b/drivers/hwmon/max1619.c
index 8eb7d04bd2f5..5edc9bbbe299 100644
--- a/drivers/hwmon/max1619.c
+++ b/drivers/hwmon/max1619.c
@@ -112,6 +112,7 @@ static struct max1619_data *max1619_update_device(struct device *dev)
 		config = i2c_smbus_read_byte_data(client, MAX1619_REG_R_CONFIG);
 		if (!(config & 0x20))
 			data->alarms ^= 0x02;
+		data->alarms &= 0x1e;
 
 		data->last_updated = jiffies;
 		data->valid = true;
-- 
2.39.2

