Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E22EE86358
	for <linux-hwmon@vger.kernel.org>; Tue,  4 Feb 2025 04:59:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738645189; cv=none; b=c7nC8NF9YpQutQVh354eJo29nVdOtE2x1t4l3BbV2r+l9yI9kawc3cJg+P5TqjHmw1uQwWQznA4MXnzZaNXZd2C5XAVXpb5+h9RKygikwEO84lDP1U+Zv3wt9OlUShOPC9zt5D683E1sX8q5C/WK2ulM/7Ukhh8VgRdYwh8Q48E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738645189; c=relaxed/simple;
	bh=RJgkeCGKbmIcGF1bc1QIwWtKaALyiVdM+MeEMv0nsck=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Content-Type; b=WZLgNpxlvtYNkg1U7EojT+npycjYeapuZ4MzY0Q2hTfTS2wwdVS9clkAeRDq9QGvrdWslY/12hNrmgBacqYEStscPnzDlBzwzc0SLPThCS2ehd0qtrGSG5J7swXoJ+CRo/aK1y3Y+cBGsPa7sK1RHH56Zc12g2fmDiBmz6IOwD4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=inventec.com; spf=pass smtp.mailfrom=inventec.com; dkim=pass (2048-bit key) header.d=inventec.com header.i=@inventec.com header.b=Afu3H4AZ; arc=none smtp.client-ip=209.85.208.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=inventec.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=inventec.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=inventec.com header.i=@inventec.com header.b="Afu3H4AZ"
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-5d3d479b1e6so7232267a12.2
        for <linux-hwmon@vger.kernel.org>; Mon, 03 Feb 2025 20:59:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=inventec.com; s=google; t=1738645182; x=1739249982; darn=vger.kernel.org;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=eF6IYhPmigMUJM4y3Gm8mbYKvm2UZRCbim+q0USA4gs=;
        b=Afu3H4AZjJWh8OPsk17Cd0uuVS/CN+cenUKltftOltEW23G7VUs3J74m9Y7rVEQkDz
         75xvqjo6bfYnHDWK+NaYHr1a1ykOebtGhA3MaSaQJQuOquCZEaP7AJdjIGJ7ZPPEaDRg
         XeAyaOj9xP4Kdv/eKGC6JflI/BwnWvNAzZepwGMsIq5TOZ+KsgJEKQN7Fs7jeDG9ro00
         r3fJoD57PjfXwVQWMpcdeZAlMvJPYWhooEnlouKtm42bOAszuafAcTBwhmB38iJTFj0/
         xlMgXwSH2JWveRCattPoLsjQPKgu7fpkJLrqNMTke5DzdLDKo3mAXUd9rL3OaRjZtJr/
         oiPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738645182; x=1739249982;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=eF6IYhPmigMUJM4y3Gm8mbYKvm2UZRCbim+q0USA4gs=;
        b=nZfqixqWV/ReiU3VL02LnTUiNLcuRhe0tBbCz3NDY7U35X/GRFUfUrAYAOywWZgPQ7
         6IQ/qJm74Dao193pdMqa596Xgx1+A4Z5Va0eE5u48Mvd/SPAkAEOOnuIMpvtd/EK9xQv
         uil20Qz1HNss/Uwtmpexzhud5JHBx2wFpEtGp8JS8HjFRJyiNYCYV0wd4A6NamSn9/YB
         IZtBe22ulcL31QQ3hvVmUVBQVT4d+GASz/6i+aem0/5xwbXzDAB45ab20R/SBMgiQkUG
         3fvVAtu5zfhFmyaI/mszsMmgcuVSFutiwWSMKEDdyMxV13FR1cHCpCDIrPpulPS3lbsT
         aASQ==
X-Gm-Message-State: AOJu0YxA9iZJX31cltB0uBsVMT5Jxm33K5G8kpUQs6p8FCH051pb7IRH
	NisqsihjWeARELUrAdoAIRqQqQH9MDlY9dGIR37iGimChH6Sh0tFhdjnxOLxnhrHfkCAfiUBjQ+
	HocHzz053T8wnVPPLIYv5L+IwQXoU+iOvoTs8C6HfyxkdBZ5sGak=
X-Gm-Gg: ASbGncvdIJDleZSqRAwLhP/bHCGFQawGOgT+iFKtc+azIOOJvsYCy9+GDnTqNBPvWpY
	G+wU/lsnOBCHrD6D4FnOA8v/pqOWeO6PFHR7G1i33eathLUhjg+B2GXqPYxzW79T6c1eTR456
X-Google-Smtp-Source: AGHT+IH7CEaCbkjxFJcs1ngiDjlZiQCTNwLysxL1dUOuRg8L/keTGEmwXLm+cLwxOp/tun9mqxz3mH0W4MAZA1MWHZ0=
X-Received: by 2002:a05:6402:3511:b0:5d0:81f5:a398 with SMTP id
 4fb4d7f45d1cf-5dc5efa8b65mr61266283a12.1.1738645181637; Mon, 03 Feb 2025
 20:59:41 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: =?UTF-8?B?Q2hpYW5nQnJpYW4g5rGf5rOz57e7IFRBTw==?= <chiang.brian@inventec.com>
Date: Tue, 4 Feb 2025 12:59:29 +0800
X-Gm-Features: AWEUYZkTCQnYsW1hkYOx_yZ1MiH01xIxVYJevdyWRLDeIdFFbQNSml2VFdSvMoY
Message-ID: <CAJCfHmUteFM+nUZWBWvmwFjALg1QUL5r+=syU1HmYTL1ewQWqA@mail.gmail.com>
Subject: [PATCH v2] hwmon: (pmbus/tps53679) Add support for TPS53685
To: linux-hwmon@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

From: Brian Chiang<chiang.brian@inventec.com>

The TPS53685 is a fully AMD SVI3 compliant step down controller with
trans-inductor voltage regulator (TLVR) topology support, dual channels,
built-in non-volatile memory (NVM), PMBus=E2=84=A2 interface, and full
compatible with TI NexFET=E2=84=A2 smart power stages.

Add support for it to the tps53679 driver.

Signed-off-by: Chiang Brian <chiang.brian@inventec.com>
---
 drivers/hwmon/pmbus/tps53679.c | 35 ++++++++++++++++++++++++++--------
 1 file changed, 27 insertions(+), 8 deletions(-)

diff --git a/drivers/hwmon/pmbus/tps53679.c b/drivers/hwmon/pmbus/tps53679.=
c
index 63524dff5e75..b2b8b548fc00 100644
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

@@ -86,10 +87,10 @@ static int tps53679_identify_phases(struct
i2c_client *client,
 }

 static int tps53679_identify_chip(struct i2c_client *client,
-                 u8 revision, u16 id)
+                 u8 revision, char *id)
 {
    u8 buf[I2C_SMBUS_BLOCK_MAX];
-   int ret;
+   int ret, len;

    ret =3D pmbus_read_byte_data(client, 0, PMBUS_REVISION);
    if (ret < 0)
@@ -100,13 +101,14 @@ static int tps53679_identify_chip(struct
i2c_client *client,
    }

    ret =3D i2c_smbus_read_block_data(client, PMBUS_IC_DEVICE_ID, buf);
+   len =3D strlen(buf);
    if (ret < 0)
        return ret;
-   if (ret !=3D 1 || buf[0] !=3D id) {
-       dev_err(&client->dev, "Unexpected device ID 0x%x\n", buf[0]);
+   if (ret =3D=3D len && strncmp(id, buf, len)) {
+       dev_err(&client->dev, "Unexpected device ID: %*ph\n", buf);
        return -ENODEV;
    }
-   return 0;
+   return len;
 }

 /*
@@ -138,6 +140,14 @@ static int tps53679_identify(struct i2c_client *client=
,
    return tps53679_identify_mode(client, info);
 }

+static int tps53685_identify(struct i2c_client *client,
+                struct pmbus_driver_info *info)
+{
+   return tps53679_identify_multiphase(client, info,
+                       TPS53681_PMBUS_REVISION,
+                       TPS53685_DEVICE_ID);
+}
+
 static int tps53681_identify(struct i2c_client *client,
                 struct pmbus_driver_info *info)
 {
@@ -215,7 +225,9 @@ static struct pmbus_driver_info tps53679_info =3D {
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
@@ -263,6 +275,11 @@ static int tps53679_probe(struct i2c_client *client)
        info->identify =3D tps53681_identify;
        info->read_word_data =3D tps53681_read_word_data;
        break;
+   case tps53685:
+       info->pages =3D 2;
+       info->identify =3D tps53685_identify;
+       info->format[PSC_VOLTAGE_OUT] =3D linear;
+       break;
    default:
        return -ENODEV;
    }
@@ -277,6 +294,7 @@ static const struct i2c_device_id tps53679_id[] =3D {
    {"tps53676", tps53676},
    {"tps53679", tps53679},
    {"tps53681", tps53681},
+   {"tps53685", tps53685},
    {"tps53688", tps53688},
    {}
 };
@@ -289,6 +307,7 @@ static const struct of_device_id __maybe_unused
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
