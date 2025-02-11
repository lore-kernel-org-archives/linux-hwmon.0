Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7D0126BD95
	for <linux-hwmon@vger.kernel.org>; Tue, 11 Feb 2025 03:20:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739244021; cv=none; b=aLgiT8w28IaqEm7EiJLqlG5dfslV36Df/vmmcuaP2Hec07w67HeMLQk5Vw2NEvSliIhybn+gK8bf1369gxTvLFxxLwlLmMpqxH9N/HUoMSZhU+pxDi8by3BsKsxvy/SNe63hxxBlOf56lCz1jpmKCsw0/RcbXZuTHXb8QnFe5c0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739244021; c=relaxed/simple;
	bh=/FlCpr2cJQsJYsCv62igwhA/A99vkaXaXAOcflcnkqg=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Content-Type; b=QeRWwbZW+d6M26o7qr3xHM8ho+GksOaxu4Xj4sxXCsQbzwtvLQ69LVtjbyGF1SavXUgeFr0N5JS0+uIyn1D9DVtBWCWw8LQ1p7nPzvvRsWFqyzmd3rsrE3/RFfgbLStwi31Nb96Eq4eEpG+rFGhEODevL9xv+hudmIqBLZPJ1Pc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=inventec.com; spf=pass smtp.mailfrom=inventec.com; dkim=pass (2048-bit key) header.d=inventec.com header.i=@inventec.com header.b=fia5y8FW; arc=none smtp.client-ip=209.85.208.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=inventec.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=inventec.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=inventec.com header.i=@inventec.com header.b="fia5y8FW"
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-5de64873d18so4396602a12.2
        for <linux-hwmon@vger.kernel.org>; Mon, 10 Feb 2025 19:20:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=inventec.com; s=google; t=1739244013; x=1739848813; darn=vger.kernel.org;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=CMKDec7N0R4YVAEaFnWm0quQp8Do82nC1ZzwLZh0to0=;
        b=fia5y8FW5LAJzYWPA0X3azkN93RSk1WQFhq5LZSdbTWik/5BS/VkR9UQu8/OyGk4ba
         1TEQ8qcNo2YaVmO0VOrxIwYf9tdzTBH38DXDzxZyexWaXFS+ufp9zxgOoLG4hoiAYxkp
         HR1CKjueFbjACdI6/aYyEdufMHPPwnNMC0LDG1j7ByTldrwgcvlKSINwhw27UsuEH/zg
         KU/Qczn8UCjvYGGUu/A0QGFGQ5zgcDbr4hLZeba4e12owsfjVB9VWXaH9RASAuz+hCmI
         5NJpa2NDhlRvs4vugqsM1S9KjqvPYaWTs7S/kHSUBXKpDJHOQQ7l3GuQYR9azME3etNc
         qQNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739244013; x=1739848813;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CMKDec7N0R4YVAEaFnWm0quQp8Do82nC1ZzwLZh0to0=;
        b=TQj9DpaM0kiO2uEQ0KOJESxRwMkrWh8jlVpCzKhEj9U2oMOOc4o/tbP4OWHF9SG/t2
         dmCkag9eXF5o5Wmho+IliRIoc7IjYaUkxLjpgP9Z5xfqaxuKzq4pe62M0ygAKSYhWXNG
         0AkM9IPcm3MtNhCm3E2SaYR6bSAID5zrqyHrITOS7UMkppezzHTtpsAQiLTrONBsxBF+
         sBq8qTrjFgMUZPeU4rL7LqIfiZzmUgAHg2yH+KxuAW3FY+zACrbf48KCcU8em+cKhL0Q
         OSaJzL/s4fPAiVSfS/kMUeChM+6uVO8XNgTQBcfgduNdUbkCoVidCHz9gsWGJ9+N4uQc
         b9zw==
X-Gm-Message-State: AOJu0YwC5iMXc+xlkcj2f+91zM3WWMgTDfNmwqWlV1wFCq7ftSVJY82W
	rmBP7daEDga9zrvNX85lpr+RwAx9quqOya/q5XG+dWBMf33VK3rnY7fHY/x6ZahDYFp4f9L+F5c
	CvJoaRQ6bVtlkDX4PiQcj1IggcsZPCw8zmFcs7NPGEEdhyvOplL0=
X-Gm-Gg: ASbGncvxM2s68oQORWQM96PS66EPD66n2jGk5LsQEbNERY+Kwn23oSVGtq4yvAt7P9Q
	FGTt12o7StoDn8aRyXujqK2orouT6Cmk1YiXNiVH+Ksa6R5p3OOchc+CITymuWaNpgwGtB9uvjQ
	==
X-Google-Smtp-Source: AGHT+IE8W4oLkmKNTFY8nv2cJv8+xdWVLRpTytx8XM18zTAapaevY6bUz56Km4n8dlyS02xZOE6wQG7HIEr1dfl684A=
X-Received: by 2002:a05:6402:2084:b0:5dc:7fbe:730a with SMTP id
 4fb4d7f45d1cf-5de44e5fdb7mr16853236a12.0.1739244013459; Mon, 10 Feb 2025
 19:20:13 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: =?UTF-8?B?Q2hpYW5nQnJpYW4g5rGf5rOz57e7IFRBTw==?= <chiang.brian@inventec.com>
Date: Tue, 11 Feb 2025 11:20:02 +0800
X-Gm-Features: AWEUYZlGgd3H_m725RDEtdBGve3Dh400lfxNB8_a7casBHys9N8t4a7xQNzagio
Message-ID: <CAJCfHmVyaDPh0_ThPjhBP0zMO1oE1AR=4=Zsa0cMPXU3J4v6dw@mail.gmail.com>
Subject: [PATCH v3] hwmon: (pmbus/tps53679) Add support for TPS53685
To: linux-hwmon@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

From: Brian Chiang<chiang.brian@inventec.com>

The TPS53685 is a fully AMD SVI3 compliant step down
controller with trans-inductor voltage regulator
(TLVR) topology support, dual channels, built-in
non-volatile memory (NVM), PMBus=E2=84=A2 interface, and
full compatible with TI NexFET=E2=84=A2 smart power
stages.
Add support for it to the tps53679 driver.

Signed-off-by: Chiang Brian <chiang.brian@inventec.com>
---
 drivers/hwmon/pmbus/tps53679.c | 31 ++++++++++++++++++++++++-------
 1 file changed, 24 insertions(+), 7 deletions(-)

diff --git a/drivers/hwmon/pmbus/tps53679.c b/drivers/hwmon/pmbus/tps53679.=
c
index 63524dff5e75..5b5125c67e55 100644
--- a/drivers/hwmon/pmbus/tps53679.c
+++ b/drivers/hwmon/pmbus/tps53679.c
@@ -16,7 +16,7 @@
 #include "pmbus.h"

 enum chips {
-   tps53647, tps53667, tps53676, tps53679, tps53681, tps53688
+   tps53647, tps53667, tps53676, tps53679, tps53681, tps53685, tps53688
 };

 #define TPS53647_PAGE_NUM      1
@@ -31,7 +31,8 @@ enum chips {
 #define TPS53679_PROT_VR13_5MV     0x07 /* VR13.0 mode, 5-mV DAC */
 #define TPS53679_PAGE_NUM      2

-#define TPS53681_DEVICE_ID     0x81
+#define TPS53681_DEVICE_ID     "\x81"
+#define TPS53685_DEVICE_ID     "TIShP"

 #define TPS53681_PMBUS_REVISION        0x33

@@ -86,7 +87,7 @@ static int tps53679_identify_phases(struct i2c_client *cl=
ient,
 }

 static int tps53679_identify_chip(struct i2c_client *client,
-                 u8 revision, u16 id)
+                 u8 revision, char *id)
 {
    u8 buf[I2C_SMBUS_BLOCK_MAX];
    int ret;
@@ -102,11 +103,11 @@ static int tps53679_identify_chip(struct
i2c_client *client,
    ret =3D i2c_smbus_read_block_data(client, PMBUS_IC_DEVICE_ID, buf);
    if (ret < 0)
        return ret;
-   if (ret !=3D 1 || buf[0] !=3D id) {
-       dev_err(&client->dev, "Unexpected device ID 0x%x\n", buf[0]);
+   if (strncmp(id, buf, ret)) {
+       dev_err(&client->dev, "Unexpected device ID: %*ph\n", buf);
        return -ENODEV;
    }
-   return 0;
+   return ret;
 }

 /*
@@ -138,6 +139,14 @@ static int tps53679_identify(struct i2c_client *client=
,
    return tps53679_identify_mode(client, info);
 }

+static int tps53685_identify(struct i2c_client *client,
+                struct pmbus_driver_info *info)
+{
+   info->format[PSC_VOLTAGE_OUT] =3D linear;
+   return tps53679_identify_chip(client, TPS53681_PMBUS_REVISION,
+                       TPS53685_DEVICE_ID);
+}
+
 static int tps53681_identify(struct i2c_client *client,
                 struct pmbus_driver_info *info)
 {
@@ -215,7 +224,9 @@ static struct pmbus_driver_info tps53679_info =3D {
        PMBUS_HAVE_IOUT | PMBUS_HAVE_STATUS_IOUT |
        PMBUS_HAVE_TEMP | PMBUS_HAVE_STATUS_TEMP |
        PMBUS_HAVE_POUT,
-   .func[1] =3D PMBUS_HAVE_VOUT | PMBUS_HAVE_STATUS_VOUT |
+   .func[1] =3D PMBUS_HAVE_VIN | PMBUS_HAVE_IIN | PMBUS_HAVE_PIN |
+       PMBUS_HAVE_STATUS_INPUT |
+       PMBUS_HAVE_VOUT | PMBUS_HAVE_STATUS_VOUT |
        PMBUS_HAVE_IOUT | PMBUS_HAVE_STATUS_IOUT |
        PMBUS_HAVE_TEMP | PMBUS_HAVE_STATUS_TEMP |
        PMBUS_HAVE_POUT,
@@ -263,6 +274,10 @@ static int tps53679_probe(struct i2c_client *client)
        info->identify =3D tps53681_identify;
        info->read_word_data =3D tps53681_read_word_data;
        break;
+   case tps53685:
+       info->pages =3D TPS53679_PAGE_NUM;
+       info->identify =3D tps53685_identify;
+       break;
    default:
        return -ENODEV;
    }
@@ -277,6 +292,7 @@ static const struct i2c_device_id tps53679_id[] =3D {
    {"tps53676", tps53676},
    {"tps53679", tps53679},
    {"tps53681", tps53681},
+   {"tps53685", tps53685},
    {"tps53688", tps53688},
    {}
 };
@@ -289,6 +305,7 @@ static const struct of_device_id __maybe_unused
tps53679_of_match[] =3D {
    {.compatible =3D "ti,tps53676", .data =3D (void *)tps53676},
    {.compatible =3D "ti,tps53679", .data =3D (void *)tps53679},
    {.compatible =3D "ti,tps53681", .data =3D (void *)tps53681},
+   {.compatible =3D "ti,tps53685", .data =3D (void *)tps53685},
    {.compatible =3D "ti,tps53688", .data =3D (void *)tps53688},
    {}
 };
--=20
2.25.1
