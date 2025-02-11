Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E821A26BD8B
	for <linux-hwmon@vger.kernel.org>; Tue, 11 Feb 2025 06:22:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739254969; cv=none; b=PHbINREzLCu+0NfW8teoNHVUPdYuKgp7cKiJ93392hriQj/CJJzZKTyLAR6gu4yd9uMSpR3ByMa3/Wkg1EzeI5et6kBwRJmoTpf/oT2GRrCBaHDx6DNBRG2NSFy4dKFhfqmmCYT4IPYLI9UCTqMv72IKGycQDmZgyK0yUXMY8kQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739254969; c=relaxed/simple;
	bh=Rz8cKMJmyfIBVbct3YeroYQWw8MjBlN9Rxz0+YXdWaQ=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Content-Type; b=m1y32uDM0PWWch80GCb1qx2+iDNoiPGz8c4pxfDGx+szH5rgLXAnXUKLKJ95xvG5q7k2yopRjvyyQ1ep3DgyRUqAn7Xhaie/WNb4uetCj5Z5M7TTJTNNKVma5OiZePpBFp41CIX7/64em1rfJaDh6Jabb1BpatzaOeZ7REsFkag=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=inventec.com; spf=pass smtp.mailfrom=inventec.com; dkim=pass (2048-bit key) header.d=inventec.com header.i=@inventec.com header.b=HzVCcd6K; arc=none smtp.client-ip=209.85.208.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=inventec.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=inventec.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=inventec.com header.i=@inventec.com header.b="HzVCcd6K"
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-5dccaaca646so10156742a12.0
        for <linux-hwmon@vger.kernel.org>; Mon, 10 Feb 2025 22:22:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=inventec.com; s=google; t=1739254963; x=1739859763; darn=vger.kernel.org;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=UKFlG+Xw5/bBQRdIpY9O06mR8ZEMGb7en+mSelhwoVQ=;
        b=HzVCcd6KlRPNNclHt6SRpeUG0yFBN9ZK0ABz3U3PHBwZGRy2bEvRoEMXQbu3tE7BC7
         jxBQ2lTKH/rUPt53bivolG3cbGVwBUVRl4mlTL0AiTnNTjwef7dI4A2Mp51xOwcw0gjU
         VzUWB6xRlzNvYMVFdo6bi3ddciNPiJHvhIEjTdNSvU6ZNc2wO/LjwjvDdkio/QlwRkyy
         l7lHyBAh6GaMIlDfGNHZmmzCstYV1lccFbsKuMR2as25G3vLQ1SZR9FiWoR9BRNZtnbN
         /xCDIO82MROl8hv45Ij7sqMSf9PAuKcyMXwPamBsL/blHy2WmQ8uUAjvQFrPceiCSAZg
         guHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739254963; x=1739859763;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UKFlG+Xw5/bBQRdIpY9O06mR8ZEMGb7en+mSelhwoVQ=;
        b=Md5vTGiI77NcbPKzCb2P4tXbs7mM1AkGLgE3oWQkGdkNVQq7Q2DTgIDh1OK8luCf8P
         4LpBMKL8pmmRPjmFZ9QxD6Eox06Qi6NnrwG3/uLt7wmt63KkYW5kG4U772ZhYfOPTef3
         2HOrSnFDlDFEJQFFel111EYm86Ydxam8yVJ3JjjHvZ6hObTyez7e8fUM/cHlEBu9pypn
         Oi2UOioQp8NFTx6QKJVD9gRz29tZhmd+WvfK7ltgr5Splpl5EqyFYVFZniEff8kEdmWS
         /g5jn2YQStiWruEa673eIkGHMET/EN8nysrBsuAbZKr+78xnPjoJrztKvdVDBX0Uvx7m
         O8iQ==
X-Gm-Message-State: AOJu0YwnVCjwwIVhNlroSvx69o3phUISrT7X4lIZ++AEtPfGGRXnmcVt
	hLhqGDANSnejf9sV2vFmz/OdvhlNfML/1DqoR+UCSkOh7dte9eqCPaOb44UXE1e9dtVKUJCg3UO
	zjyG2FaMg44OuX6neWfm9UzQLcFi6LB2QQo54uzRS82/AOhiIWqY=
X-Gm-Gg: ASbGncvftutKHO5O0rInn8IccEfG2Hgtgsl3bKy5StMVSHzqP0f9sFRGb9kNJiDnyfN
	VkFC3nVIjhn92t0jtA/dND4VtpBSnVgyRIcAYjZVZWGDluMFf8VKcpi3wqdmQmOlqp1W84Jwm
X-Google-Smtp-Source: AGHT+IGRVykDbuuifEBOWt2Wd+cvZogOe/HZywwNLj25dKLW1e58pv4pU8WaWp448V6KtbGW3bez74T6+br5LNjOcVs=
X-Received: by 2002:a05:6402:268f:b0:5de:572c:72cf with SMTP id
 4fb4d7f45d1cf-5de9b9b6f48mr1931527a12.10.1739254962659; Mon, 10 Feb 2025
 22:22:42 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: =?UTF-8?B?Q2hpYW5nQnJpYW4g5rGf5rOz57e7IFRBTw==?= <chiang.brian@inventec.com>
Date: Tue, 11 Feb 2025 14:22:31 +0800
X-Gm-Features: AWEUYZm1Dl0ZPSUi-DHKUihjpWpULXvQFnU3ZyeLewtWCLEZYxQOVXFTx7PijtU
Message-ID: <CAJCfHmW61d2jd_tYpNEqBG_Z58bEnVKAmsvhrEP1zXQoXqrUVw@mail.gmail.com>
Subject: [PATCH v4] hwmon: (pmbus/tps53679) Add support for TPS53685
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
 drivers/hwmon/pmbus/tps53679.c | 29 +++++++++++++++++++++++------
 1 file changed, 23 insertions(+), 6 deletions(-)

diff --git a/drivers/hwmon/pmbus/tps53679.c b/drivers/hwmon/pmbus/tps53679.=
c
index 63524dff5e75..7b412f3fe86a 100644
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
@@ -102,8 +103,8 @@ static int tps53679_identify_chip(struct i2c_client *cl=
ient,
    ret =3D i2c_smbus_read_block_data(client, PMBUS_IC_DEVICE_ID, buf);
    if (ret < 0)
        return ret;
-   if (ret !=3D 1 || buf[0] !=3D id) {
-       dev_err(&client->dev, "Unexpected device ID 0x%x\n", buf[0]);
+   if (ret !=3D strlen(id) || strncmp(id, buf, ret)) {
+       dev_err(&client->dev, "Unexpected device ID: %*ph\n", buf);
        return -ENODEV;
    }
    return 0;
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
